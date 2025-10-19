import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_check_box.dart';
import 'package:foodi/app_ui/app_widgets/app_text_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_states.dart';
import 'package:foodi/common/app_style/app_colors.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

import '../../../app_routes/app_routes.dart';
import '../user_auth_handler.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var addEvent = context.read<SignUpScreenBloc>();
    return BlocConsumer<SignUpScreenBloc, SignUpStates>(
      listener: (context, listener) {
        if (listener.errorMsg.isNotEmpty && listener.isLoading == false) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Message'),
                content: Text(listener.errorMsg),
                actions: [
                  InkWell(
                    onTap: () {
                      if (listener.errorMsg ==
                          'Please check your email inbox to follow the link and verify you email.') {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.loginScreen,
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: ReuseableText(
                      text:
                          listener.errorMsg ==
                              'Please check your email inbox to follow the link and verify you email.'
                          ? 'Continue'
                          : 'Ok',
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          // appBar:
          //      AppBar(
          //         toolbarHeight: 66.h,
          //         backgroundColor: Colors.white,
          //         foregroundColor: Colors.white,
          //
          //         title: ReuseableText(
          //           text: 'Sign Up',
          //           textStyle: AppTStyleAndSize.secondTextStyle(),
          //         ),
          //       ),
          backgroundColor: AppColors.backgroundColor,
          body: ListView(
            // controller: scrollController,
            padding: AppSize.bodyPadding(horizontal: 24, vertical: 0),
            children: [
              AppSize.widgetGap(height: 86),

              ReuseableText(
                text: 'SignUp',
                textStyle: AppTStyleAndSize.firstTextStyle(),
              ),

              ReuseableText(
                text: 'Enter your details below & free sign up',
                textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
              ),

              AppSize.widgetGap(height: 43),
              ReuseableText(
                text: 'Your name',
                textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
                  fontSize: 14.sp,
                ),
              ),
              // Text Field
              AppTextField(
                onChange: (value) {
                  addEvent.add(NameEvent(username: value.toString()));
                },
                hintText: 'Enter your username',
              ),
              AppSize.widgetGap(height: 24),
              ReuseableText(
                text: 'Your email',
                textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
                  fontSize: 14.sp,
                ),
              ),
              // Text Field
              AppTextField(
                onChange: (value) {
                  addEvent.add(EmailEvent(email: value.toString()));
                },
                hintText: 'Enter your email',
              ),
              AppSize.widgetGap(height: 24),
              ReuseableText(
                text: 'Create password',
                textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
                  fontSize: 14.sp,
                ),
              ),
              AppTextField(
                obscureText: state.obscureText,
                onChange: (value) {
                  addEvent.add(PasswordEvent(password: value.toString()));
                },
                icon: InkWell(
                  onTap: () {
                    addEvent.add(
                      ObscureTextEvent(
                        obscureText: state.obscureText = !state.obscureText,
                      ),
                    );
                  },
                  child: state.obscureText == true
                      ? Icon(CupertinoIcons.eye_slash)
                      : Icon(CupertinoIcons.eye),
                ),
                hintText: 'Enter your Password',
              ),
              AppSize.widgetGap(height: 24),
              AppBtn(
                icon: state.isLoading == true
                    ? CircularProgressIndicator(color: Colors.white)
                    : null,
                width: 327,
                height: 50,
                text: state.isLoading == false ? 'Create account' : null,
                onTap: () async {
                  UserAuthHandler.userSignUp(context: context);
                },
              ),
              AppSize.widgetGap(height: 17),
              AppCheckBox(
                state: state,
                text:
                    'By creating an account you have to agree with our terms & condition.',
                onTap: () {
                  addEvent.add(
                    AgreeWithTermsAndConditionEvent(
                      isAgree: state.isAgree = !state.isAgree,
                    ),
                  );
                },
              ),
              AppSize.widgetGap(height: 25),
              SizedBox(
                width: 202.w,
                height: 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReuseableText(
                      text: 'Already have an account？',
                      // text: state.email,
                      textStyle: AppTStyleAndSize.fourthSmallTextStyle(),
                    ),
                    AppTextButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.loginScreen,
                        );
                      },
                      text: 'Log In',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
