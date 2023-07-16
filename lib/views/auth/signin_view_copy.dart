import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/viewmodels/validation/signin_validation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trade_emp_mobile/services/api/auth/google_service.dart';

class SignInViewTest extends StatefulWidget {
  final Function? toggleView;

  const SignInViewTest({super.key, this.toggleView});

  @override
  State<SignInViewTest> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignInViewTest> {
  @override
  Widget build(BuildContext context) {
    return Consumer2(builder: (
      final BuildContext context,
      final AuthViewModel auth,
      final SignInValidationViewModel signinValidation,
      final Widget? child,
    ) {
      if (auth.hasError) {
        showErrorDialog(auth.error.errorMessage, context, auth);
      }
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              // ignore: prefer_const_literals_to_create_immutables
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/logo1_cropped.png'),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          onTap: () => {auth.signInGoogle()},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 32,
                                    height: 32,
                                    // decoration: BoxDecoration(color: Colors.blue),
                                    child: Image.network(
                                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                                        fit: BoxFit.cover)),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18.0,
                                      color: Colors.grey[500]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                            const Text(
                              'or',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              onChanged: (value) {
                                auth.signInRequestModel.email = value;
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              obscureText: true,
                              onChanged: (value) {
                                auth.signInRequestModel.password = value;
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          onTap: () {
                            auth.signIn();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(child: setUpButtonChild(auth)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const Text(
                            'Not a member?',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toggleView!();
                            },
                            child: const Text(
                              ' Register Now',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget setUpButtonChild(AuthViewModel auth) {
    if (auth.loading) {
      return const CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return const Text(
        'Sign in',
        style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      );
    }
  }
}
