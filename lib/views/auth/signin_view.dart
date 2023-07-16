import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/viewmodels/validation/signin_validation.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenWidth = window.physicalSize.width;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    final NavigationService navigationService = locator<NavigationService>();
    return Consumer2<AuthViewModel, SignInValidationViewModel>(builder: (
      final BuildContext context,
      final AuthViewModel auth,
      final SignInValidationViewModel signinValidation,
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
                      // crossAxisAlignment: CrossAxisAlignment.center,
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
                          "Sign in to your account",
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
                            onChanged: (value) {
                              signinValidation.changeEmail(value);
                              auth.signInRequestModel.email = value;
                            },
                            decoration: InputDecoration(
                                errorText: signinValidation.email.error,
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter Email',
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
                              auth.signInRequestModel.password = value;
                              signinValidation.changePassword(value);
                            },
                            decoration: InputDecoration(
                                errorText: signinValidation.password.error,
                                icon: const Icon(
                                  Icons.vpn_key,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter Password',
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
                                  backgroundColor: signinValidation.isValid
                                      ? MaterialStateProperty.resolveWith(
                                          (state) => const Color.fromARGB(
                                              255, 0, 140, 255))
                                      : MaterialStateProperty.resolveWith(
                                          (state) => Colors.blue),
                                  shape: MaterialStateProperty.resolveWith(
                                    (state) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                  )),
                              onPressed: () {
                                if (signinValidation.isValid) {
                                  auth.signIn();
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
                                "Do not have an account? ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.pushReplacementNamed(
                                  //     context, routes.SignUpRoute);
                                  navigationService
                                      .navigateTo(routes.signUpRoute);
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, routes.forgetPasswordRoute);
                                },
                                child: const Text(
                                  "Forget your password",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
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
        "Sign in",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}

// class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   @override
//   Size get preferredSize => Size(0.0, 0.0);
// }
