import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/countries.dart' as countries_data;
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/models/country.dart';
import 'package:trade_emp_mobile/models/users/single_user_model.dart'
    as single_user;
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/experience/experience_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobCategory/job_category_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/tools/tool_viewmodel.dart';
import 'package:trade_emp_mobile/viewmodels/user/user_viewmodel.dart';
import 'package:trade_emp_mobile/viewmodels/validation/user_profile_validation.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<UserViewModel, UserProfileValidationViewModel,
        AuthViewModel>(builder: (
      final BuildContext context,
      final UserViewModel user,
      final UserProfileValidationViewModel userProfileValidation,
      final AuthViewModel auth,
      final Widget? child,
    ) {
      if (user.hasError) {
        showErrorDialog(user.error.errorMessage, context, user);
      }
      single_user.Data? singleUser = single_user.Data();
      singleUser = user.getSingleUser;
      final Size size = MediaQuery.of(context).size;
      final ThemeData themeData = Theme.of(context);
      List<String> days = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
      ];
      List<Countries> countries =
          (countries_data.countries).map<Countries>((e) => Countries.fromJson(e)).toList();
      List<Step> employeeProfileEditSteps = [
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
                // TextFormField(
                //   readOnly: true,
                //   initialValue: "default test",
                //   style: TextStyle(color: Colors.transparent),
                //   decoration: InputDecoration(
                //       labelText: 'Country', border: InputBorder.none
                //       ),
                // ),
                // Container(
                //   width: size.width * 0.9,
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(4),
                //     border: Border.all(
                //       color: COLOR_BLACK.withAlpha(100),
                //       width: 1,
                //     ),
                //   ),
                //   child: DropdownButtonHideUnderline(
                //     child: DropdownButton<String>(
                //       isExpanded: true,
                //       icon: Icon(
                //         Icons.keyboard_arrow_down_outlined,
                //         color: COLOR_BLACK.withAlpha(100),
                //       ),
                //       hint: Text('Please Select a Country'),
                //       value: user.getSelectedCountry,
                //       isDense: true,
                //       items: countries.map((dynamic country) {
                //         return new DropdownMenuItem<String>(
                //           value: country.value,
                //           child: new Text(country.name),
                //         );
                //       }).toList(),
                //       onChanged: (country) {
                //         // user.setSelectedTool(tool);
                //         // equipment.equipmentName = tool;
                //         // signUpRequestModel.role = role;
                //         // auth.setSignupRequestModel(signUpRequestModel);
                //       },
                //     ),
                //   ),
                // ),
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
        Step(
          title: const Text("Availability"),
          content: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: MultiSelectDialogField(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: COLOR_BLACK.withAlpha(100),
                      width: 1,
                    ),
                  ),
                  buttonText: const Text('Available on'),
                  title: const Text('Select available days for working'),
                  buttonIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: COLOR_BLACK.withAlpha(100),
                  ),
                  items: days.map((e) => MultiSelectItem(e, e)).toList(),
                  listType: MultiSelectListType.CHIP,
                  chipDisplay: MultiSelectChipDisplay(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  initialValue: user.getSingleUser!.availability as List<dynamic>,
                  onConfirm: (values) {
                    singleUser!.availability = values as List<String>?;
                    user.setSingleUser(singleUser);
                  },
                ),
              ),
            ],
          ),
          isActive: true,
        ),
        Step(
          title: const Text("Freferred jobs"),
          content: Consumer<JobCategoryViewModel>(
            builder: (_, jobCategory, child) {
              if (jobCategory.getJobCategories.isEmpty) {
                jobCategory.getAllJobCategories();
              }
              return Column(
                children: [
                  MultiSelectDialogField(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: COLOR_BLACK.withAlpha(100),
                        width: 1,
                      ),
                    ),
                    buttonText: const Text('Job categories (maximum three)'),
                    title: const Text('Select job categories you wish to do'),
                    buttonIcon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: COLOR_BLACK.withAlpha(100),
                    ),
                    items: jobCategory.getJobCategories
                        .map((jobCategory) => MultiSelectItem(
                            jobCategory.id, jobCategory.category!))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    chipDisplay: MultiSelectChipDisplay(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    initialValue: user.getSingleUser!.preferredJobCategories as List<dynamic>,
                    onConfirm: (values) {
                      singleUser!.preferredJobCategories = values as List<String?>?;
                      user.setSingleUser(singleUser);
                    },
                  ),
                ],
              );
            },
          ),
          isActive: true,
        ),
        Step(
            title: const Text("Equipments familier with"),
            content: Column(
              children: [
                Consumer<ToolViewModel>(
                  builder: (bc, tool, child) {
                    if (tool.getTools.isEmpty) {
                      tool.getEquipmentList();
                    }
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  COLOR_WHITE,
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  COLOR_BLUE,
                                ),
                              ),
                              onPressed: () {
                                _addNewEquipmentModalBottomSheet(
                                    bc, size, null);
                              },
                              child: const Text('Add Equipment'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: user.getSingleUser!.equipments!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                tileColor: Colors.blue[100],
                                onTap: () {
                                  _addNewEquipmentModalBottomSheet(
                                      bc,
                                      size,
                                      user.getSingleUser!.equipments![index]
                                          .id);
                                },
                                leading:
                                    const Icon(Icons.fiber_manual_record_rounded),
                                trailing: IconButton(
                                  onPressed: () {
                                    singleUser!.equipments!.removeAt(index);
                                    user.setSingleUser(singleUser);
                                  },
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: Colors.red,
                                  ),
                                  iconSize: 20,
                                ),
                                title: Text(
                                  '${tool.getTools.firstWhere((e) => e.id == user.getSingleUser!.equipments![index].equipmentName).name} : ${user.getSingleUser!.equipments![index].yearsOfUsing} years',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            isActive: true),
        Step(
            title: const Text("Experiences"),
            content: Column(
              children: [
                Consumer<ExperienceViewModel>(
                  builder: (bc, experience, child) {
                    if (experience.getExperiences.isEmpty) {
                      experience.getExperienceList();
                    }
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  COLOR_WHITE,
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  COLOR_BLUE,
                                ),
                              ),
                              onPressed: () {
                                _addNewExperienceModalBottomSheet(
                                    bc, size, null);
                              },
                              child: const Text('Add Experience'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: user.getSingleUser!.experiences!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                tileColor: Colors.blue[100],
                                onTap: () {
                                  _addNewExperienceModalBottomSheet(
                                      bc,
                                      size,
                                      user.getSingleUser!.experiences![index]
                                          .id);
                                },
                                leading:
                                    const Icon(Icons.fiber_manual_record_rounded),
                                trailing: IconButton(
                                  onPressed: () {
                                    singleUser!.experiences!.removeAt(index);
                                    user.setSingleUser(singleUser);
                                  },
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: Colors.red,
                                  ),
                                  iconSize: 20,
                                ),
                                title: Text(
                                  '${experience.getExperiences.firstWhere((e) => e.id == user.getSingleUser!.experiences![index].experience).name} : ${user.getSingleUser!.experiences![index].timePeriod} years',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            isActive: true),
      ];

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
                // TextFormField(
                //   readOnly: true,
                //   initialValue: "default test",
                //   style: TextStyle(color: Colors.transparent),
                //   decoration: InputDecoration(
                //       labelText: 'Country', border: InputBorder.none
                //       ),
                // ),
                // Container(
                //   width: size.width * 0.9,
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(4),
                //     border: Border.all(
                //       color: COLOR_BLACK.withAlpha(100),
                //       width: 1,
                //     ),
                //   ),
                //   child: DropdownButtonHideUnderline(
                //     child: DropdownButton<String>(
                //       isExpanded: true,
                //       icon: Icon(
                //         Icons.keyboard_arrow_down_outlined,
                //         color: COLOR_BLACK.withAlpha(100),
                //       ),
                //       hint: Text('Please Select a Country'),
                //       value: user.getSelectedCountry,
                //       isDense: true,
                //       items: countries.map((dynamic country) {
                //         return new DropdownMenuItem<String>(
                //           value: country.value,
                //           child: new Text(country.name),
                //         );
                //       }).toList(),
                //       onChanged: (country) {
                //         // user.setSelectedTool(tool);
                //         // equipment.equipmentName = tool;
                //         // signUpRequestModel.role = role;
                //         // auth.setSignupRequestModel(signUpRequestModel);
                //       },
                //     ),
                //   ),
                // ),
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
              steps: employeeProfileEditSteps,
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
                if (user.currentStep < employeeProfileEditSteps.length - 1) {
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

void _addNewEquipmentModalBottomSheet(context, size, id) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Consumer2<ToolViewModel, UserViewModel>(
            builder: (_, tool, user, child) {
          single_user.Equipments equipment = single_user.Equipments();
          single_user.Data? singleUser = single_user.Data();
          singleUser = user.getSingleUser;
          if (tool.getTools.isEmpty) {
            tool.getEquipmentList();
          }

          return Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: <Widget>[
                          id != null
                              ? const Text('Edit equipment here')
                              : const Text('Add new equipment here'),
                        ],
                      ),
                    ),
                    // Divider(
                    //   height: 8.0,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: size.width * 0.9,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: COLOR_BLACK.withAlpha(100),
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: COLOR_BLACK.withAlpha(100),
                                ),
                                hint: const Text('Please Select an Equipment'),
                                value: user.getSelectedTool,
                                isDense: true,
                                items: tool.getTools.map((dynamic tool) {
                                  return DropdownMenuItem<String>(
                                    value: tool.id,
                                    child: Text(tool.name),
                                  );
                                }).toList(),
                                onChanged: (tool) {
                                  user.setSelectedTool(tool);
                                  equipment.equipmentName = tool;
                                  // signUpRequestModel.role = role;
                                  // auth.setSignupRequestModel(signUpRequestModel);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              initialValue: '0',
                              decoration: const InputDecoration(
                                labelText: 'Years of Using',
                              ),
                              onChanged: (String value) {
                                equipment.yearsOfUsing = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              COLOR_BLUE,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              COLOR_BLUE,
                            ),
                          ),
                          onPressed: () {
                            if (id != null) {
                              singleUser!.equipments!
                                  .removeWhere((item) => item.id == id);
                              // singleUser.equipments.remove(id);
                              user.setSingleUser(singleUser);
                              equipment.id = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              equipment.equipmentName = user.getSelectedTool;
                              singleUser.equipments!.add(equipment);
                              user.setSingleUser(singleUser);
                            } else {
                              equipment.id = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              equipment.equipmentName = user.getSelectedTool;
                              singleUser!.equipments!.add(equipment);
                              user.setSingleUser(singleUser);
                            }

                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ]),
                ),
              ));
        });
      });
}

void _addNewExperienceModalBottomSheet(context, size, id) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Consumer2<ExperienceViewModel, UserViewModel>(
            builder: (_, experience, user, child) {
          single_user.Experiences experienceModel = single_user.Experiences();
          single_user.Data? singleUser = single_user.Data();
          singleUser = user.getSingleUser;
          if (experience.getExperiences.isEmpty) {
            experience.getExperienceList();
          }

          return Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: <Widget>[
                          id != null
                              ? const Text('Edit experience here')
                              : const Text('Add new experience here'),
                        ],
                      ),
                    ),
                    // Divider(
                    //   height: 8.0,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: size.width * 0.9,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: COLOR_BLACK.withAlpha(100),
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: COLOR_BLACK.withAlpha(100),
                                ),
                                hint: const Text('Please Select an Experience'),
                                value: user.getSelectedExperience,
                                isDense: true,
                                items: experience.getExperiences
                                    .map((dynamic experience) {
                                  return DropdownMenuItem<String>(
                                    value: experience.id,
                                    child: Text(
                                      experience.name,
                                      overflow: TextOverflow.visible,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (experience) {
                                  user.setSelectedExperience(experience);
                                  experienceModel.experience = experience;
                                  // signUpRequestModel.role = role;
                                  // auth.setSignupRequestModel(signUpRequestModel);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              initialValue: '0',
                              decoration: const InputDecoration(
                                labelText: 'Years of Using',
                              ),
                              onChanged: (String value) {
                                experienceModel.timePeriod = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              COLOR_BLUE,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              COLOR_BLUE,
                            ),
                          ),
                          onPressed: () {
                            if (id != null) {
                              singleUser!.experiences!
                                  .removeWhere((item) => item.id == id);
                              // singleUser.equipments.remove(id);
                              user.setSingleUser(singleUser);
                              experienceModel.id = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              experienceModel.experience =
                                  user.getSelectedExperience;
                              singleUser.experiences!.add(experienceModel);
                              user.setSingleUser(singleUser);
                            } else {
                              experienceModel.id = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              experienceModel.experience =
                                  user.getSelectedExperience;
                              singleUser!.experiences!.add(experienceModel);
                              user.setSingleUser(singleUser);
                            }
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ]),
                ),
              ));
        });
      });
}

void _chooseImage(BuildContext context) async {
  final user = Provider.of<UserViewModel>(context, listen: false);
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  user.setSelectedImage(pickedFile);
  // file = await ImagePicker.pickImage(source: ImageSource.gallery);
}
