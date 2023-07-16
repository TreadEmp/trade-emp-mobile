import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (
      final BuildContext context,
      final AuthViewModel auth,
      final Widget? child,
    ) {
      final Size size = MediaQuery.of(context).size;
      final ThemeData themeData = Theme.of(context);
      final NavigationService navigationService =
          locator<NavigationService>();

      /// google map
      Completer<GoogleMapController> controller = Completer();
      // CameraPosition _currentPosition;
      LatLng? newLocation;
      if (auth.getLat! <= 0) {
        auth.locateMe();
      }
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Container(
                              height: 50,
                              color: Colors.transparent,
                              alignment: Alignment.center, // This is needed
                              child: Text(
                                'User Details',
                                style: themeData.textTheme.displaySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigationService.goBack();
                              // print("lng = " + auth.getLng.toString());
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                height: 50,
                                color: Colors.transparent,
                                alignment: Alignment.center, // This is needed
                                child: const Text(
                                  'Save Location',
                                  style: TextStyle(
                                    color: COLOR_BLUE,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          body: Center(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        auth.getLat == 0.0 ? 7.291592 : auth.getLat!,
                        auth.getLng == 0.0 ? 80.634998 : auth.getLng!,
                      ),
                      zoom: 12.0),
                  onCameraMove: (position) {
                    newLocation = position.target;
                  },
                  onCameraIdle: () async {
                    auth.setLat(newLocation!.latitude);
                    auth.setLng(newLocation!.longitude);
                    auth.getGeoAddress(
                        newLocation!.latitude, newLocation!.longitude);
                  },
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.complete(googleMapController);
                  },
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.push_pin,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
