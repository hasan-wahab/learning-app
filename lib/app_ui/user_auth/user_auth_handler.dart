import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:foodi/app_routes/app_routes.dart';
import 'package:foodi/app_ui/user_auth/login_screen/forget_password/forget_passworod_bloc/forget_bloc.dart';
import 'package:foodi/app_ui/user_auth/login_screen/forget_password/forget_passworod_bloc/forget_event.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen_bloc/login_screen_bloc.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen_bloc/login_screen_events.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';
import 'package:foodi/local_storage_service/app_keys/app_keys.dart';
import 'package:foodi/local_storage_service/local_data/local_data.dart';
import 'package:foodi/models/student_auth_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthHandler {
  UserAuthHandler._();
  static Future saveUserData({
    required BuildContext context,
    required StudentAuthModel studentData,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      final existUser = await firestore
          .collection('User')
          .where('StudentEmailId', isEqualTo: studentData.studentEmailId)
          .get();
      if (existUser.docs.isNotEmpty) {
        await firestore
            .collection('User')
            .doc(existUser.docs.first.id)
            .update(
              StudentAuthModel(
                studentName: studentData.studentName,
                id: existUser.docs.first.id,
                studentEmailId: studentData.studentEmailId,
                createAt: studentData.createAt,
                isAgree: studentData.isAgree,
                isGoogleSignIn: studentData.isGoogleSignIn,
                updateAt: Timestamp.now(),
                profileImage: studentData.profileImage,
                isFacebookSignIn: studentData.isFacebookSignIn,
              ).toMap(),
            );
        print('Old user');
      } else {
        await firestore
            .collection('User')
            .doc(studentData.id)
            .set(studentData.toMap());
        print('New user');
      }
    } on FirebaseException catch (e) {
      print('Data save exception${e.message.toString()}');
    }
  }

  static userSignUp({required BuildContext context}) async {
    var bloc = context.read<SignUpScreenBloc>();
    final state = context.read<SignUpScreenBloc>().state;
    FirebaseAuth auth = FirebaseAuth.instance;

    if (state.email == '' || state.password == '' || state.username == '') {
      bloc.add(ErrorEvent(errorMsg: 'Enter required fields'));
    } else if (state.isAgree == false &&
        state.email != '' &&
        state.password != '' &&
        state.username != '') {
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
        await user.user!.sendEmailVerification().then((value) async {
          bloc.add(LoadingEvent(isLoading: false));
          bloc.add(AgreeWithTermsAndConditionEvent(isAgree: false));
          bloc.add(
            ErrorEvent(
              errorMsg:
                  'Please check your email inbox to follow the link and verify you email.',
            ),
          );
          // here we will save student data in firestore date base

          StudentAuthModel studentData = StudentAuthModel(
            studentName: state.username,
            id: user.user!.uid.toString(),
            studentEmailId: user.user!.email.toString(),
            createAt: Timestamp.now(),
            isAgree: state.isAgree,
            isGoogleSignIn: false,
            profileImage: user.user!.photoURL.toString(),
            isFacebookSignIn: false,
          );
          saveUserData(context: context, studentData: studentData).then((
            onValue,
          ) {
            Navigator.pushNamed(context, AppRoutes.loginScreen);
          });
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
                  errorMsg:
                      'Please check your email inbox to follow the link and verify you email.',
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
      // bloc.add(LoginLoadingEvent(isLoading: true));
      // await googleSignIn.signOut();
      // bloc.add(LoginLoadingEvent(isLoading: false));
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
        StudentAuthModel studentData = StudentAuthModel(
          studentName: googleUser.displayName.toString(),
          id: googleUser.id.toString(),
          studentEmailId: googleUser.email,
          createAt: Timestamp.now(),
          updateAt: null,
          isAgree: true,
          isGoogleSignIn: true,
          profileImage: googleUser.photoUrl,
          isFacebookSignIn: false,
        );

        // Save student data in firestore data base
        saveUserData(context: context, studentData: studentData);
        bloc.add(LoginLoadingEvent(isLoading: false));
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.naveBar, (route) => false);
      });
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  static Future<UserCredential?> userFacebookLogin(BuildContext context) async {
    final loginBloc = context.read<LoginScreenBloc>();
    try {
      loginBloc.add(LoginLoadingEvent(isLoading: true));

      final LoginResult result = await FacebookAuth.instance.login();
      loginBloc.add(LoginLoadingEvent(isLoading: false));
      if (result.status == LoginStatus.success) {
        final user = await FacebookAuth.instance.getUserData();
        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.tokenString,
        );
        // Once signed in, return the UserCredential
        loginBloc.add(LoginLoadingEvent(isLoading: true));

        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((onValue) {
              StudentAuthModel studentData = StudentAuthModel(
                studentName: user['name'].toString(),
                id: FirebaseAuth.instance.currentUser!.uid.toString(),
                studentEmailId: user['email'],
                createAt: Timestamp.now(),
                isAgree: true,
                isGoogleSignIn: false,
                isFacebookSignIn: true,
                profileImage: user['picture']['data']['url'],
              );
              saveUserData(context: context, studentData: studentData);
              loginBloc.add(LoginLoadingEvent(isLoading: false));
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.naveBar,
                (route) => false,
              );
              return;
            });
        return userCredential;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      loginBloc.add(LoginLoadingEvent(isLoading: false));
      loginBloc.add(
        LoginErrorEvent(
          errorMsg:
              e.code.toString() == 'account-exists-with-different-credential'
              ? 'This email is already linked with Google. Please sign in with Google.'
              : e.code.toString(),
        ),
      );
    }
    return null;
  }

  static userForgetPassword(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final forgetPasswordBloc = context.read<ForgetPasswordBloc>();

    FirebaseAuth auth = FirebaseAuth.instance;
    final email = forgetPasswordBloc.state.email;
    if (email.isEmpty) {
      forgetPasswordBloc.add(
        ForgetPasswordSendErrorEvent(
          error: 'Please enter your email to forget the password',
        ),
      );
    } else {
      try {
        forgetPasswordBloc.add(ForgetPasswordSendLoadingEvent(isLoading: true));
        await auth.sendPasswordResetEmail(email: email).then((onValue) {
          forgetPasswordBloc.add(
            ForgetPasswordSendLoadingEvent(isLoading: false),
          );
          forgetPasswordBloc.add(
            ForgetPasswordSendErrorEvent(
              error:
                  'Please check your email inbox to reset your password and sign in',
            ),
          );
          forgetPasswordBloc.add(ForgetPasswordSendEmailEvent(email: ''));
          Navigator.pop(context);
          controller.clear();
          // forgetPasswordBloc.add(
          //   ForgetPasswordSendEmailController(
          //     controller:controller,
          //   ),
          // );
        });
      } on FirebaseAuthException catch (e) {
        forgetPasswordBloc.add(
          ForgetPasswordSendLoadingEvent(isLoading: false),
        );
        forgetPasswordBloc.add(
          ForgetPasswordSendErrorEvent(error: e.message.toString()),
        );
        print(e.code.toString());
      }
    }
  }
}
