import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/router.dart' as router;
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/experience/experience_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobCategory/job_category_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobRequests/job_request_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobs/job_viewmodel.dart';
import 'package:trade_emp_mobile/viewmodels/tools/tool_viewmodel.dart';
import 'package:trade_emp_mobile/viewmodels/user/user_viewmodel.dart';
import 'package:trade_emp_mobile/viewmodels/validation/forget_passsword_validation.dart';
import 'package:trade_emp_mobile/viewmodels/validation/job_validation.dart';
import 'package:trade_emp_mobile/viewmodels/validation/reset_password_validation.dart';
import 'package:trade_emp_mobile/viewmodels/validation/signin_validation.dart';
import 'package:trade_emp_mobile/viewmodels/validation/signup_validation.dart';
import 'package:trade_emp_mobile/viewmodels/validation/user_profile_validation.dart';

import 'constants/theam_data.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() async {
  setupLocator();
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    // double screenWidth = window.physicalSize.width;
    double screenWidth = View.of(context).devicePixelRatio;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<JobCategoryViewModel>(
            create: (_) => JobCategoryViewModel()),
        ChangeNotifierProvider<SignupValidationViewModel>(
            create: (_) => SignupValidationViewModel()),
        ChangeNotifierProvider<SignInValidationViewModel>(
            create: (_) => SignInValidationViewModel()),
        ChangeNotifierProvider<ForgetPasswordValidationViewModel>(
            create: (_) => ForgetPasswordValidationViewModel()),
        ChangeNotifierProvider<ResetPasswordValidationViewModel>(
            create: (_) => ResetPasswordValidationViewModel()),
        ChangeNotifierProvider<UserProfileValidationViewModel>(
            create: (_) => UserProfileValidationViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
        ChangeNotifierProvider<ToolViewModel>(create: (_) => ToolViewModel()),
        ChangeNotifierProvider<ExperienceViewModel>(
            create: (_) => ExperienceViewModel()),
        ChangeNotifierProvider<JobViewModel>(create: (_) => JobViewModel()),
        ChangeNotifierProvider<JobRequestViewModel>(
            create: (_) => JobRequestViewModel()),
        ChangeNotifierProvider<JobValidationViewModel>(
            create: (_) => JobValidationViewModel()),
        // Provider<AnotherThing>(create: (_) => AnotherThing()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: COLOR_WHITE,
            textTheme:
                screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
            fontFamily: "Montserrat",
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE)),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: routes.initialRoute,
      ),
    );
  }
}
