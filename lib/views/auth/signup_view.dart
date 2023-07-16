import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/models/auth/sign_up.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/validation/signup_validation.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService navigationService = locator<NavigationService>();
    SignUpRequestModel signUpRequestModel = SignUpRequestModel();
    // double screenWidth = window.physicalSize.width;
    double screenWidth = MediaQuery.of(context).size.width;
    return Consumer2<AuthViewModel, SignupValidationViewModel>(builder: (
      final BuildContext context,
      final AuthViewModel auth,
      final SignupValidationViewModel signupValidation,
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
                          "Create your new account here",
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
                              signupValidation.changeEmail(value);
                              signUpRequestModel.email = value;
                              auth.setSignupRequestModel(signUpRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText: signupValidation.email.error,
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
                              signupValidation.changePassword(value);
                              signUpRequestModel.password = value;
                              auth.setSignupRequestModel(signUpRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText: signupValidation.password.error,
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
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            onChanged: (value) {
                              signupValidation.changeFirstName(value);
                              signUpRequestModel.firstName = value;
                              auth.setSignupRequestModel(signUpRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText: signupValidation.firstName.error,
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter First Name',
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
                            onChanged: (value) {
                              signupValidation.changeLastName(value);
                              signUpRequestModel.lastName = value;
                              auth.setSignupRequestModel(signUpRequestModel);
                            },
                            decoration: InputDecoration(
                                errorText: signupValidation.lastName.error,
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter Last Name',
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
                        // Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: InputDecorator(
                        //     decoration: InputDecoration(
                        //       errorText: signupValidation.role.error,
                        //       icon: const Icon(
                        //         Icons.contact_page,
                        //         color: Colors.blue,
                        //       ),
                        //       errorStyle: const TextStyle(
                        //           color: Colors.redAccent, fontSize: 16.0),
                        //       enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(16),
                        //           borderSide:
                        //               const BorderSide(color: Colors.blue)),
                        //       focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(16),
                        //           borderSide:
                        //               const BorderSide(color: Colors.blue)),
                        //     ),
                        //     child: DropdownButtonHideUnderline(
                        //       child: DropdownButton<String>(
                        //         hint: const Text('Please Select a Role'),
                        //         value: auth.getSignUpRequestModel.role,
                        //         isDense: true,
                        //         items: <String>['Employee', 'Employer']
                        //             .map((String role) {
                        //           return DropdownMenuItem<String>(
                        //             value: role,
                        //             child: Text(role),
                        //           );
                        //         }).toList(),
                        //         onTap: () {
                        //           signupValidation.changeRole(null);
                        //         },
                        //         onChanged: (role) {
                        //           signupValidation.changeRole(role!);
                        //           signUpRequestModel.role = role;
                        //           auth.setSignupRequestModel(
                        //               signUpRequestModel);
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              (screenWidth * 0.1324), 12, 12, 0),
                          child: SizedBox(
                            height: 50,
                            width: screenWidth * 0.95,
                            // child: TextButton(
                            //     color: Colors.blue,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(30.0)),
                            //     onPressed: () {
                            //       auth.signUp();
                            //     },
                            //     child: setUpButtonChild(auth)),
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: signupValidation.isValid
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
                                if (signupValidation.isValid) {
                                  auth.signUp();
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
                                  "Already have an Account? ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.pushReplacementNamed(
                                    //     context, routes.SignInRoute);
                                    navigationService
                                        .navigateTo(routes.signInRoute);
                                  },
                                  child: const Text(
                                    "Sign in",
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
        "Sign up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}
