import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart' as geo_coding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/models/auth/sign_in.dart';
import 'package:trade_emp_mobile/models/auth/sign_up.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as error_model;
import 'package:trade_emp_mobile/models/users/current_user_model.dart';
import 'package:trade_emp_mobile/services/api/auth/auth_service.dart';
import 'package:trade_emp_mobile/services/api/auth/google_service.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_base_model.dart';
import 'package:trade_emp_mobile/viewmodels/user/user_base_model.dart';

class AuthViewModel extends AuthBaseModel {
  final NavigationService navigationService = locator<NavigationService>();
  final storage = const FlutterSecureStorage();
  Location location = Location();
  Helper helper = Helper();
  AuthService authService = AuthService();
  GoogleService googleService = GoogleService();
  UserBaseModel userBaseModel = UserBaseModel();
  SignInRequestModel signInRequestModel = SignInRequestModel();
  CurrentUserResponseModel currentUserResponseModel =
      CurrentUserResponseModel();
  Completer<GoogleMapController> controller = Completer();

  Future checkInternetConnection() async {
    setLoading(true);
    notifyListeners();

    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      setConnected(true);
      notifyListeners();
    } else {
      setConnected(false);
      notifyListeners();
    }
  }

  Future signUp() async {
    setLoading(true);
    notifyListeners();

    var result = await authService.signUp(signUpRequestModel);
    if (result.success) {
      setLoading(false);
      setError(null);
      notifyListeners();
      navigationService.navigateTo(routes.signInRoute);
    } else {
      setLoading(false);
      setError(result);
      notifyListeners();
    }
  }

  Future signIn() async {
    setLoading(true);
    notifyListeners();

    if (signInRequestModel.email != null &&
        signInRequestModel.password != null) {
      var result = await authService.signIn(signInRequestModel);
      if (result.success) {
        await storage.write(
            key: 'access-token', value: result.data.accessToken);
        await storage.write(
            key: 'refresh-token', value: result.data.refreshToken);
        await storage.write(key: 'userId', value: result.data.userId);
        await storage.write(key: 'email', value: result.data.email);
        await storage.write(key: 'user-type', value: 'employee');
        checkAuthStatus();
        setLoading(false);
        setError(null);
        setAuthStatus(AuthStatus.loggedIn);
        notifyListeners();
        navigationService.navigateTo(routes.homeRoute);
      } else {
        setLoading(false);
        setError(result);
        setAuthStatus(AuthStatus.notLoggedIn);
        notifyListeners();
      }
    } else {
      setLoading(false);
      showSuccessDialog('Invalied email or password', null);
      notifyListeners();
    }
  }

  Future signInGoogle() async {
    notifyListeners();

    final user = await googleService.login();
    print(user);
    if (user != null) {
      setLoading(false);
      navigationService.navigateTo(routes.homeRoute);
    }
    notifyListeners();
  }

  Future checkAuthStatus() async {
    String? token = await helper.getIdToken();

    if (token != null) {
      if (token.trim().isNotEmpty) {
        var res = await authService.getUserByToken(token);
        if (res.success) {
          await storage.write(key: 'email', value: res.data.email);
          await storage.write(key: 'userId', value: res.data.userId);
          setLoading(false);
          setAuthStatus(AuthStatus.loggedIn);
          setUserData(res.data);
          setError(null);

          notifyListeners();
        } else {
          setLoading(false);
          setAuthStatus(AuthStatus.notLoggedIn);
          setError(res);
          notifyListeners();
        }
      } else {
        setLoading(false);
        setAuthStatus(AuthStatus.notLoggedIn);
        setUserData(null);
        notifyListeners();
      }
    } else {
      setLoading(false);
      setAuthStatus(AuthStatus.notLoggedIn);
      setUserData(null);
      notifyListeners();
    }
  }

  Future signOut(BuildContext context) async {
    setLoading(true);
    notifyListeners();
    await storage.deleteAll();
    userBaseModel.setHasUser(false);
    userBaseModel.setCurrentStep(0);
    setSelectedIndex(0);
    setLoading(false);
    setAuthStatus(AuthStatus.notLoggedIn);
    setError(null);
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
    navigationService.navigateTo(routes.signInRoute);
    // Navigator.of(context).pushAndRemoveUntil(
    //   // the new route
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => LoginScreen(),
    //   ),

    //   // this function should return true when we're done removing routes
    //   // but because we want to remove all other screens, we make it
    //   // always return false
    //   (Route route) => false,
    // );
  }

  void setSignupRequestModel(SignUpRequestModel data) async {
    setSignUpRequestModel(data);
    notifyListeners();
  }

  Future forgetPassword(BuildContext context) async {
    setLoading(true);
    notifyListeners();

    var result = await authService.forgetPassword(varificationEmail);

    if (result == 200) {
      setLoading(false);
      setError(null);
      await showSuccessDialog(
          'Please check your email account, We have sent you a verification code to reset your password!',
          context);
      notifyListeners();
      navigationService.navigateTo(routes.resetPasswordRoute);
    } else {
      error_model.ErrorResponseModel error = error_model.ErrorResponseModel();
      error.success = false;
      error.data = error_model.Data();
      error.data!.errorCode = result;
      error.data!.errorMessage =
          "Error occered while processing the request, please try again!";
      setLoading(false);
      setError(error);
      notifyListeners();
    }
  }

  Future resetPassword(BuildContext context) async {
    setLoading(true);
    notifyListeners();

    var result = await authService.resetPassword(resetPasswordRequestModel);
    if (result == 200) {
      setLoading(false);
      setError(null);
      showSuccessDialog(
          'Your password reset successsfully, Please login with your new password!',
          context);
      notifyListeners();
      navigationService.navigateTo(routes.signInRoute);
    } else {
      error_model.ErrorResponseModel error = error_model.ErrorResponseModel();
      error.success = false;
      error.data = error_model.Data();
      error.data!.errorCode = result;
      error.data!.errorMessage =
          "Error occered while processing the request, please try again!";
      setLoading(false);
      setError(error);
      setAuthStatus(AuthStatus.notLoggedIn);
      notifyListeners();
    }
  }

  Future locateMe() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        setServiceEnabled(serviceEnabled);
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        setPermissionGranted(permissionGranted);
        return;
      }
    }
    await location.getLocation().then((res) async {
      // final GoogleMapController controller = await controller.future;
      final position = CameraPosition(
        target: LatLng(res.latitude!, res.longitude!),
        zoom: 12,
      );
      // controller.animateCamera(CameraUpdate.newCameraPosition(position));
      List<geo_coding.Placemark> placemarks = await geo_coding
          .placemarkFromCoordinates(res.latitude!, res.longitude!);
      String address = '';
      if ((placemarks[0].name!).toString().trim().isNotEmpty) {
        address += ("${placemarks[0].name!}, ").toString();
      }
      if ((placemarks[0].street!).toString().trim().isNotEmpty) {
        address += ("${placemarks[0].street!}, ").toString();
      }
      if ((placemarks[0].subLocality!).toString().trim().isNotEmpty) {
        address += ("${placemarks[0].subLocality!}, ").toString();
      }
      if (placemarks[0].locality!.trim().isNotEmpty) {
        address += ("${placemarks[0].locality!}, ").toString();
      }
      if (placemarks[0].subAdministrativeArea!.trim().isNotEmpty) {
        address += ("${placemarks[0].subAdministrativeArea!}, ").toString();
      }
      if (placemarks[0].administrativeArea!.trim().isNotEmpty) {
        address += ("${placemarks[0].administrativeArea!}, ").toString();
      }
      if (placemarks[0].postalCode!.trim().isNotEmpty) {
        address += ("${placemarks[0].postalCode!}, ").toString();
      }
      if (placemarks[0].country!.trim().isNotEmpty) {
        address += ("${placemarks[0].country!}, ").toString();
      }
      setAddress(address);
      setPosition(position);
      setLat(res.latitude);
      setLng(res.longitude);
    });
  }

  Future getGeoAddress(double? lat, double? lng) async {
    setLoading(true);
    notifyListeners();

    List<geo_coding.Placemark> placemarks =
        await geo_coding.placemarkFromCoordinates(lat!, lng!);
    String address = '';
    if ((placemarks[0].name!).toString().trim().isNotEmpty) {
      address += ("${placemarks[0].name!}, ").toString();
    }
    if ((placemarks[0].street!).toString().trim().isNotEmpty) {
      address += ("${placemarks[0].street!}, ").toString();
    }
    if ((placemarks[0].subLocality!).toString().trim().isNotEmpty) {
      address += ("${placemarks[0].subLocality!}, ").toString();
    }
    if (placemarks[0].locality!.trim().isNotEmpty) {
      address += ("${placemarks[0].locality!}, ").toString();
    }
    if (placemarks[0].subAdministrativeArea!.trim().isNotEmpty) {
      address += ("${placemarks[0].subAdministrativeArea!}, ").toString();
    }
    if (placemarks[0].administrativeArea!.trim().isNotEmpty) {
      address += ("${placemarks[0].administrativeArea!}, ").toString();
    }
    if (placemarks[0].postalCode!.trim().isNotEmpty) {
      address += ("${placemarks[0].postalCode!}, ").toString();
    }
    if (placemarks[0].country!.trim().isNotEmpty) {
      address += ("${placemarks[0].country!}, ").toString();
    }
    setAddress(address);
  }
}
