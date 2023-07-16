import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/views/auth/forget_password_view.dart';
import 'package:trade_emp_mobile/views/auth/reset_pasword_view.dart';
import 'package:trade_emp_mobile/views/auth/signin_view.dart';
import 'package:trade_emp_mobile/views/auth/signup_view.dart';
import 'package:trade_emp_mobile/views/error/page_not_implemented_yet.dart';
import 'package:trade_emp_mobile/views/error/route_not_found.dart';
import 'package:trade_emp_mobile/views/home_screen.dart';
import 'package:trade_emp_mobile/views/jobRequests/job_request.dart';
import 'package:trade_emp_mobile/views/jobs/job.dart';
import 'package:trade_emp_mobile/views/partial_views/google_map.dart';
import 'package:trade_emp_mobile/views/root.dart';
import 'package:trade_emp_mobile/views/user/create_job.dart';
import 'package:trade_emp_mobile/views/user/employer_full_profile.dart';
import 'package:trade_emp_mobile/views/user/employer_profile.dart';
import 'package:trade_emp_mobile/views/user/employee_profile.dart';
import 'package:trade_emp_mobile/views/user/job_request_view.dart';
import 'package:trade_emp_mobile/views/user/job_view.dart';
import 'package:trade_emp_mobile/views/user/settings.dart';
import 'package:trade_emp_mobile/views/user/employee_full_profile.dart';
import 'package:trade_emp_mobile/models/jobRequest/latest_job_request.dart'
    as latest_job_requests;
import 'package:trade_emp_mobile/models/job/latest_job.dart' as latest_jobs;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.initialRoute:
      return MaterialPageRoute(builder: (context) => const Root());
    case routes.signInRoute:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case routes.signUpRoute:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case routes.forgetPasswordRoute:
      return MaterialPageRoute(builder: (context) => const ForgetPasswordView());
    case routes.resetPasswordRoute:
      return MaterialPageRoute(builder: (context) => const ResetPasswordView());
    case routes.settingsRoute:
      return CupertinoPageRoute(builder: (context) => const SettingsScreen());
    case routes.pageNotImplementedYetRoute:
      return CupertinoPageRoute(builder: (context) => const PageNotImplementedYet());
    case routes.homeRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case routes.employeeProfileRoute:
      return CupertinoPageRoute(builder: (context) => const EmployeeProfile());
    case routes.employerProfileRoute:
      return CupertinoPageRoute(builder: (context) => const EmployerProfile());
    case routes.jobRoute:
      var job = settings.arguments;
      return CupertinoPageRoute(
          builder: (context) => JobScreen(job: job as latest_jobs.Items?));
    case routes.jobRequestRoute:
      var jobRequest = settings.arguments;
      return CupertinoPageRoute(
          builder: (context) => JobRequestScreen(
              jobRequest: jobRequest as latest_job_requests.Items?));
    case routes.employeeFullProfileRoute:
      var employeeId = settings.arguments;
      return CupertinoPageRoute(
          builder: (context) =>
              EmployeeFullProfileScreen(employeeId: employeeId as String?));
    case routes.employerFullProfileRoute:
      var employerId = settings.arguments;
      return CupertinoPageRoute(
          builder: (context) =>
              EmployerFullProfileScreen(employerId: employerId as String?));
    case routes.createJobPageRoute:
      return CupertinoPageRoute(builder: (context) => const CreateJob());
    case routes.viewJobPageRoute:
      return CupertinoPageRoute(builder: (context) => const JobView());
    case routes.viewJobRequestPageRoute:
      return CupertinoPageRoute(builder: (context) => const JobRequestView());
    case routes.googleMapPageRoute:
      return CupertinoPageRoute(builder: (context) => const GoogleMapScreen());
    // case routes.CreateJobRequestPageRoute:
    // return CupertinoPageRoute(builder: (context) => CreateJobRequest());

    default:
      return MaterialPageRoute(builder: (context) => const RouteNotFound());
  }
}
