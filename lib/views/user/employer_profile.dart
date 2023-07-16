import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/countries.dart' as countries_list;
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/models/country.dart';
import 'package:trade_emp_mobile/models/users/single_user_model.dart'
    as single_user;
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/user/user_viewmodel.dart';
import 'package:trade_emp_mobile/viewmodels/validation/user_profile_validation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class EmployerProfile extends StatelessWidget {
  const EmployerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserViewModel, UserProfileValidationViewModel>(builder: (
      final BuildContext context,
      final UserViewModel user,
      final UserProfileValidationViewModel userProfileValidation,
      final Widget? child,
    ) {
      if (user.hasError) {
        showErrorDialog(user.error.errorMessage, context, user);
      }
      single_user.Data? singleUser = single_user.Data();
      singleUser = user.getSingleUser;
      // final Size size = MediaQuery.of(context).size;
      final ThemeData themeData = Theme.of(context);

      List<Countries> countries =
          (countries_list.countries).map<Countries>((e) => Countries.fromJson(e)).toList();
      List<Step> employerProfileEditSteps = [
        Step(
            // Title of the Step
            title: const Text("Basic user details"),
            content: Column(
              children: [
                TextFormField(
                  enabled: false,
                  initialValue: user.getSingleUser!.email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.firstName,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    errorText: userProfileValidation.firstName.error,
                  ),
                  onChanged: (value) {
                    singleUser!.firstName = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeFirstName(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.lastName,
                  decoration: InputDecoration(
                    errorText: userProfileValidation.lastName.error,
                    labelText: 'Last Name',
                  ),
                  onChanged: (value) {
                    singleUser!.lastName = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeLastName(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          COLOR_WHITE,
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          COLOR_BLUE,
                        ),
                      ),
                      onPressed: () {
                        _chooseImage(context);
                      },
                      child: const Text('Choose Image'),
                    ),
                    const SizedBox(width: 10.0),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          COLOR_WHITE,
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          COLOR_BLUE,
                        ),
                      ),
                      onPressed: () {
                        user.uploadUserProfileImage(context);
                      },
                      child: setUpButtonUpload(user),
                    ),
                  ],
                ),
                user.getSelectedImage == null &&
                        singleUser!.profileImage == null
                    ? const Text('No Image Selected')
                    // Image.file(File(user.getSelectedImage.path)),
                    : SizedBox(
                        height: 250.0,
                        width: 250.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: user.getSelectedImage != null
                              ? Image.asset(user.getSelectedImage!.path)
                              : Image.network(singleUser!.profileImage!.url!),
                        ),
                      ),
              ],
            ),
            isActive: true),
        Step(
            title: const Text("Address"),
            content: Column(
              children: [
                // TextFormField(
                //   initialValue: user.getSingleUser.address.addressName,
                //   decoration: InputDecoration(labelText: 'Address Name'),
                // ),
                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.addressLine1
                      : '',
                  decoration: InputDecoration(
                    errorText: userProfileValidation.addressLine1.error,
                    labelText: 'Address Line 1',
                  ),
                  onChanged: (value) {
                    singleUser!.address!.addressLine1 = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeAddressLine1(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.addressLine2
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Address Line 2',
                    errorText: userProfileValidation.addressLine2.error,
                  ),
                  onChanged: (value) {
                    singleUser!.address!.addressLine2 = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeAddressLine2(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.suburb
                      : "",
                  decoration: InputDecoration(
                    errorText: userProfileValidation.suburb.error,
                    labelText: 'Suburb',
                  ),
                  onChanged: (value) {
                    singleUser!.address!.suburb = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeSuburb(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.city
                      : "",
                  decoration: InputDecoration(
                    labelText: 'City',
                    errorText: userProfileValidation.city.error,
                  ),
                  onChanged: (value) {
                    singleUser!.address!.city = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeCity(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.state
                      : "",
                  decoration: InputDecoration(
                    labelText: 'State',
                    errorText: userProfileValidation.state.error,
                  ),
                  onChanged: (value) {
                    singleUser!.address!.state = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeState(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.postalCode
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Postcode',
                    errorText: userProfileValidation.postalCode.error,
                  ),
                  onChanged: (value) {
                    singleUser!.address!.postalCode = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changePostalCode(value);
                  },
                ),
                TypeAheadFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.country
                      : "",
                  textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                    labelText: 'Country',
                    errorText: userProfileValidation.country.error,
                  )),
                  suggestionsCallback: (pattern) {
                    List<Countries> countriesList = countries
                        .where((i) => i.name!.toLowerCase().contains(pattern))
                        .toList();
                    return countriesList;
                  },
                  itemBuilder: (context, dynamic suggestion) {
                    return ListTile(
                      title: Text(suggestion.name),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (dynamic suggestion) {
                    singleUser!.address!.country = suggestion.name;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeCountry(suggestion.name);
                  },
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Please select a city';
                  //   }
                  // },
                  // onSaved: (value) => this._selectedCity = value,
                ),

                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.latitude
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Latitude',
                    errorText: userProfileValidation.latitude.error,
                  ),
                  onChanged: (value) {
                    singleUser!.address!.latitude = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeLatitude(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.address != null
                      ? user.getSingleUser!.address!.longitude
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Longitude',
                    errorText: userProfileValidation.longitude.error,
                  ),
                  onChanged: (value) {
                    singleUser!.address!.longitude = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeLongitude(value);
                  },
                ),
              ],
            ),
            state: StepState.indexed,
            isActive: true),
        Step(
            title: const Text("Contacts"),
            content: Column(
              children: [
                TextFormField(
                  initialValue: user.getSingleUser!.contacts != null
                      ? user.getSingleUser!.contacts!.telephone
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Telephone',
                    errorText: userProfileValidation.telephone.error,
                  ),
                  onChanged: (value) {
                    singleUser!.contacts!.telephone = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeTelephone(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.contacts != null
                      ? user.getSingleUser!.contacts!.mobile
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    errorText: userProfileValidation.mobile.error,
                  ),
                  onChanged: (value) {
                    singleUser!.contacts!.mobile = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeMobile(value);
                  },
                ),
                TextFormField(
                  initialValue: user.getSingleUser!.contacts != null
                      ? user.getSingleUser!.contacts!.fax
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Fax',
                    errorText: userProfileValidation.fax.error,
                  ),
                  onChanged: (value) {
                    singleUser!.contacts!.fax = value;
                    user.setSingleUser(singleUser);
                    userProfileValidation.changeFax(value);
                  },
                )
              ],
            ),
            isActive: true),
      ];

      return Theme(
        data: ThemeData(primaryColor: COLOR_BLUE),
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: COLOR_WHITE,
              automaticallyImplyLeading: false,
              title: Text(
                'Edit User Profile',
                style: themeData.textTheme.displaySmall,
              ),
            ),
            body: Stepper(
              currentStep: user.currentStep,
              steps: employerProfileEditSteps,
              type: StepperType.vertical,
              onStepTapped: (step) {
                user.setCurrentStep(step);
              },
              onStepCancel: () {
                if (user.currentStep > 0) {
                  user.setCurrentStep(user.currentStep - 1);
                } else {
                  user.setCurrentStep(0);
                }
              },
              onStepContinue: () {
                if (user.currentStep < employerProfileEditSteps.length - 1) {
                  user.setCurrentStep(user.currentStep + 1);
                } else {
                  user.setCurrentStep(0);
                }
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: user.loading
                  ? const CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : const Text("UPDATE PROFILE"),
              elevation: 3,
              focusElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              onPressed: () {
                // if (userProfileValidation.isValid) {

                // }
                user.updateUser(context);
              },
            ),
          ),
        ),
      );
    });
  }

  Widget setUpButtonUpload(UserViewModel user) {
    if (user.uploading) {
      return const SizedBox(
        height: 10.0,
        width: 10.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return const Text(
        "Upload Image",
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }
  }
}

void _chooseImage(BuildContext context) async {
  final user = Provider.of<UserViewModel>(context, listen: false);
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  user.setSelectedImage(pickedFile);
  // file = await ImagePicker.pickImage(source: ImageSource.gallery);
}
