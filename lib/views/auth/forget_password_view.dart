import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/models/auth/forget_password.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/viewmodels/validation/forget_passsword_validation.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenWidth = window.physicalSize.width;
    double screenWidth = MediaQuery.of(context).size.width;
    PasswordResetCodeRequestModel passwordResetCodeRequestModel =
        PasswordResetCodeRequestModel();
    return Consumer2<AuthViewModel, ForgetPasswordValidationViewModel>(
        builder: (
      final BuildContext context,
      final AuthViewModel auth,
      final ForgetPasswordValidationViewModel forgetPasswordValidation,
      final Widget? child,
    ) {
      if (auth.hasError) {
        showErrorDialog(auth.error.errorMessage, context, auth);
      }
      return Scaffold(
        // primary: false,
        // appBar: EmptyAppBar(),
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
                          "Forget Password",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            onChanged: (value) {
                              forgetPasswordValidation.changeEmail(value);
                              passwordResetCodeRequestModel.email = value;
                              auth.setVarificationEmail(value);
                            },
                            decoration: InputDecoration(
                                errorText: forgetPasswordValidation.email.error,
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter your email',
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
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      forgetPasswordValidation.isValid
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
                                if (forgetPasswordValidation.isValid) {
                                  auth.forgetPassword(context);
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Go to ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, routes.resetPasswordRoute);
                                },
                                child: const Text(
                                  "Reset password",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
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
        "Reset Password",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
