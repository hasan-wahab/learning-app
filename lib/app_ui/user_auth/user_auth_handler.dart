import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen_bloc/login_screen_bloc.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen_bloc/login_screen_events.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthHandler {
  UserAuthHandler._();

  static userSignUp({required BuildContext context}) async {
    var bloc = context.read<SignUpScreenBloc>();
    final state = context.read<SignUpScreenBloc>().state;
    FirebaseAuth auth = FirebaseAuth.instance;

    if (state.email == '' || state.password == '') {
      bloc.add(ErrorEvent(errorMsg: 'Enter required fields'));
    } else if (state.isAgree == false &&
        state.email != '' &&
        state.password != '') {
      bloc.add(
        ErrorEvent(
          errorMsg: 'Please agree to the Terms & Conditions before signing up.',
        ),
      );
    } else {
      try {
        bloc.add(LoadingEvent(isLoading: true));
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        await user.user!.sendEmailVerification().then((value) {
          bloc.add(LoadingEvent(isLoading: false));
          bloc.add(AgreeWithTermsAndConditionEvent(isAgree: false));
          bloc.add(
            ErrorEvent(
              errorMsg:
                  'Please check your email inbox to follow the link and verify you email.',
            ),
          );
          saveUserData(
            context: context,
            email: state.email,
            isAgree: state.isAgree,
          );
        });
      } on FirebaseAuthException catch (e) {
        bloc.add(LoadingEvent(isLoading: false));
        final String error = e.code.toString();
        if (error == 'invalid-email') {
          // The email address is badly formatted.
          bloc.add(
            ErrorEvent(errorMsg: 'The email address is badly formatted.'),
          );
        } else if (error == 'network-request-failed') {
          //
          return bloc.add(
            ErrorEvent(errorMsg: 'Check your internet connection'),
          );
        } else if (error == 'unknown') {
          // An internal error has occurred.
          return bloc.add(
            ErrorEvent(errorMsg: 'Please check internet connection'),
          );
        } else if (error == 'email-already-in-use') {
          // The email address is already in use by another account.
          bloc.add(
            ErrorEvent(
              errorMsg:
                  'The email address is already in use by another account.',
            ),
          );
        } else {
          return bloc.add(ErrorEvent(errorMsg: e.code.toString()));
        }
      }
    }
  }

  static saveUserData({
    String? email,
    bool isAgree = false,
    required BuildContext context,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final bloc = context.read<SignUpScreenBloc>();
    String userId = DateTime.now().millisecondsSinceEpoch.toString();
    if (email!.isNotEmpty) {
      try {
        await firestore
            .collection('User')
            .doc(userId)
            .set({
              'Email': email,
              'IsAgree': isAgree,
              'UserId': userId,
              'IsGoogleSignIn': false,
            })
            .then((value) {
              print(email + isAgree.toString());
            });
      } on FirebaseException catch (e) {
        bloc.add(ErrorEvent(errorMsg: e.message.toString()));
        print(e.message.toString());
      }
    }
  }

  static userLogIn({required BuildContext context}) async {
    final bloc = context.read<LoginScreenBloc>();
    final state = bloc.state;
    final String emailAddress = state.email;
    final String password = state.password;
    FirebaseAuth auth = FirebaseAuth.instance;
    if (emailAddress.isEmpty || password.isEmpty) {
      bloc.add(LoginErrorEvent(errorMsg: 'Please enter required field'));
    } else {
      try {
        bloc.add(LoginLoadingEvent(isLoading: true));
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        if (userCredential.user != null) {
          await userCredential.user!.reload();
          if (userCredential.user!.emailVerified) {
            // Navigate to home screen
            bloc.add(LoginLoadingEvent(isLoading: false));
            Navigator.pushReplacementNamed(context, AppRoutes.naveBar);
          } else {
            bloc.add(LoginLoadingEvent(isLoading: true));
            await userCredential.user!.sendEmailVerification().then((value) {
              bloc.add(LoginLoadingEvent(isLoading: false));
              bloc.add(
                LoginErrorEvent(
                  errorMsg: 'Please follow the link and verify to user',
                ),
              );
            });
          }
        }
      } on FirebaseAuthException catch (e) {
        bloc.add(LoginLoadingEvent(isLoading: false));
        if (e.code.toString() == 'invalid-credential') {
          bloc.add(LoginErrorEvent(errorMsg: 'No user found for that email.'));
        } else if (e.code.toString() == 'unknown') {
          bloc.add(LoginErrorEvent(errorMsg: 'Check your internet connection'));
        } else {
          bloc.add(LoginErrorEvent(errorMsg: e.message.toString()));
        }
      }
    }
  }

  static Future<UserCredential?> userSignInWithGoogle({
    required BuildContext context,
  }) async {
    final bloc = context.read<LoginScreenBloc>();
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      bloc.add(LoginLoadingEvent(isLoading: true));
      await googleSignIn.signOut();
      bloc.add(LoginLoadingEvent(isLoading: false));
      bloc.add(LoginLoadingEvent(isLoading: true));
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      bloc.add(LoginLoadingEvent(isLoading: false));
      if (googleUser == null) return null;
      bloc.add(LoginLoadingEvent(isLoading: true));
      final GoogleSignInAuthentication authentication =
          await googleUser.authentication;
      bloc.add(LoginLoadingEvent(isLoading: false));
      final credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final userCredential = FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      bloc.add(LoginLoadingEvent(isLoading: true));
      return await userCredential.then((onValue) {
        String userId = DateTime.now().millisecondsSinceEpoch.toString();
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection('User').doc(userId).set({
          'Email': googleUser.email,
          'IsAgree': true,
          'UserId': userId,
          'IsGoogleSignIn': true,
        });

        bloc.add(LoginLoadingEvent(isLoading: false));
        Navigator.pushReplacementNamed(context, AppRoutes.naveBar);
      });
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
