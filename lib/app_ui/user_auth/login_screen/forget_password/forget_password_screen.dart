import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/app_ui/app_widgets/app_button.dart';
import 'package:foodi/app_ui/app_widgets/app_text_field.dart';
import 'package:foodi/app_ui/app_widgets/reuseable_text.dart';
import 'package:foodi/app_ui/user_auth/login_screen/forget_password/forget_passworod_bloc/forget_bloc.dart';
import 'package:foodi/app_ui/user_auth/login_screen/forget_password/forget_passworod_bloc/forget_event.dart';
import 'package:foodi/app_ui/user_auth/login_screen/forget_password/forget_passworod_bloc/forget_state.dart';
import 'package:foodi/app_ui/user_auth/user_auth_handler.dart';
import 'package:foodi/common/app_style/app_size.dart';
import 'package:foodi/common/app_style/text_style.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state.error.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Message'),
              content: Text(state.error),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'),
                ),
              ],
            ),
          ).then((onValue) {
            context.read<ForgetPasswordBloc>().add(
              ForgetPasswordSendErrorEvent(error: ''),
            );
          });
        } else {}
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: AppSize.bodyPadding(horizontal: 20, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSize.widgetGap(height: 86, width: 0),
                ReuseableText(
                  text: 'Forget password',
                  textStyle: AppTStyleAndSize.firstTextStyle(),
                ),

                AppSize.widgetGap(height: 61, width: 0),
                ReuseableText(
                  text: 'Your email',
                  textStyle: AppTStyleAndSize.fourthSmallTextStyle().copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                AppTextField(
                  controller: controller,
                  onChange: (value) {
                    context.read<ForgetPasswordBloc>().add(
                      ForgetPasswordSendEmailEvent(email: value.toString()),
                    );
                  },
                  hintText: 'Enter your email',
                  width: 375,
                ),
                AppSize.widgetGap(height: 20, width: 0),
                AppBtn(
                  width: 375,
                  text: state.isLoading == false ? 'Send' : null,
                  icon: state.isLoading == true
                      ? CircularProgressIndicator(color: Colors.white)
                      : null,
                  onTap: () {
                    if (state.email != '') {
                      UserAuthHandler.forgetPassword(context, controller);
                    } else {
                      context.read<ForgetPasswordBloc>().add(
                        ForgetPasswordSendErrorEvent(
                          error: 'Please enter required',
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
