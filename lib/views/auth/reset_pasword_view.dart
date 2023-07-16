import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/models/auth/reset_password.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/validation/reset_password_validation.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordRequestModel resetPasswordRequestModel =
        ResetPasswordRequestModel();
    // double screenWidth = window.physicalSize.width;
    double screenWidth = MediaQuery.of(context).size.width;
    return Consumer2<AuthViewModel, ResetPasswordValidationViewModel>(builder: (
      final BuildContext context,
      final AuthViewModel auth,
      final ResetPasswordValidationViewModel resetPasswordValidation,
      final Widget? child,
    ) {
      if (auth.hasError) {
        showErrorDialog(auth.error.errorMessage, context, auth);
      }
      return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Form(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification? overscroll) {
                    overscroll!.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          width: 142,
                          height: 142,
                          child: Image.asset(
                            'assets/images/logo_01.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          "Reset your password",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            onChanged: (String value) {
                              resetPasswordValidation.changeEmail(value);
                              resetPasswordRequestModel.email = value;
                              auth.setResetPasswordRequestModel(
                                  resetPasswordRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText: resetPasswordValidation.email.error,
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter email',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value) {
                              resetPasswordValidation
                                  .changeVarificationCode(value);
                              resetPasswordRequestModel.varificationCode =
                                  value;
                              auth.setResetPasswordRequestModel(
                                  resetPasswordRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText: resetPasswordValidation
                                    .varificationCode.error,
                                icon: const Icon(
                                  Icons.verified_user,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter varification code',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value) {
                              resetPasswordValidation.changePassword(value);
                              resetPasswordRequestModel.password = value;
                              auth.setResetPasswordRequestModel(
                                  resetPasswordRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText:
                                    resetPasswordValidation.password.error,
                                icon: const Icon(
                                  Icons.vpn_key,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter new password',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value) {
                              resetPasswordValidation
                                  .changeRetypedPassword(value);
                              resetPasswordRequestModel.retypedPassword = value;
                              auth.setResetPasswordRequestModel(
                                  resetPasswordRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText: resetPasswordValidation
                                    .retypedPassword.error,
                                icon: const Icon(
                                  Icons.vpn_key,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter password again',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.red))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              (screenWidth * 0.1324), 12, 12, 0),
                          child: SizedBox(
                            height: 50,
                            width: screenWidth * 0.95,
                            // child: FlatButton(
                            //     color: Colors.blue,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(30.0)),
                            //     onPressed: () {
                            //       auth.resetPassword(context);
                            //     },
                            //     child: setUpButtonChild(auth)),
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      resetPasswordValidation.isValid
                                          ? MaterialStateProperty.resolveWith(
                                              (state) => Colors.blue)
                                          : MaterialStateProperty.resolveWith(
                                              (state) => Colors.blue),
                                  shape: MaterialStateProperty.resolveWith(
                                    (state) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                  )),
                              onPressed: () {
                                if (resetPasswordValidation.isValid) {
                                  auth.resetPassword(context);
                                }
                              },
                              child: setUpButtonChild(auth),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Go back to ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, routes.signInRoute);
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget setUpButtonChild(AuthViewModel auth) {
    if (auth.loading) {
      return const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return const Text(
        "Submit",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}
