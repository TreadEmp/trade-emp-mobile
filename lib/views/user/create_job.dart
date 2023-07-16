import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/models/job/job_create.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobCategory/job_category_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobs/job_viewmodel.dart';
import 'package:trade_emp_mobile/viewmodels/validation/job_validation.dart';

class CreateJob extends StatelessWidget {
  const CreateJob({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationService navigationService = locator<NavigationService>();
    final Size size = MediaQuery.of(context).size;
    const double padding = 2;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final ThemeData themeData = Theme.of(context);
    JobCreateRequestModel? singleJob = JobCreateRequestModel();
    final job = Provider.of<JobViewModel>(context, listen: true);
    final jobValidation =
        Provider.of<JobValidationViewModel>(context, listen: false);
    final auth = Provider.of<AuthViewModel>(context, listen: false);
    // singleJob.location!.latitude = auth.getLat.toString();
    // singleJob.location!.longitude = auth.getLng.toString();
    // job.setSingleJob(singleJob);
    if (job.hasError) {
      showErrorDialog(job.error.errorMessage, context, job);
    }
    singleJob = job.getSingleJob;
    if (auth.getLat.toString().trim().isNotEmpty) {
      jobValidation.changeLatitude(auth.getLat.toString());
      jobValidation.changeLongitude(auth.getLng.toString());
      singleJob.latitude = auth.getLat.toString();
      singleJob.longitude = auth.getLng.toString();
      job.setSingleJob(singleJob);
    }
    // job.resetSingleJob();
    return Theme(
      data: ThemeData(primaryColor: COLOR_BLUE),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: COLOR_WHITE,
          automaticallyImplyLeading: false,
          title: Text(
            'New job',
            style: themeData.textTheme.displaySmall,
          ),
        ),
        body: Stack(children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification? overscroll) {
              overscroll!.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 12.0, 12.0, 4.0),
                    child: Text(
                      "Add a title",
                      style: TextStyle(
                          color: COLOR_GREY,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 4.0, 12.0, 4.0),
                    child: Consumer2<JobValidationViewModel, JobViewModel>(
                      builder: (context, jobValidation, job, child) {
                        return TextFormField(
                          onChanged: (value) {
                            singleJob!.title = value;
                            job.setSingleJob(singleJob);
                            jobValidation.changeTitle(value);
                          },
                          style: const TextStyle(
                              color: COLOR_BLACK,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200),
                          minLines:
                              2, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          maxLength: 100,
                          decoration: InputDecoration(
                              errorText: jobValidation.title.error,
                              hintText: 'Max 100 Characters.',
                              hintStyle: const TextStyle(
                                  color: COLOR_GREY,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w200),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.transparent)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.red))),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 12.0, 12.0, 4.0),
                    child: Text(
                      "Add a description",
                      // style: themeData.textTheme.headline3,
                      style: TextStyle(
                          color: COLOR_GREY,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 4.0, 12.0, 4.0),
                    child: Consumer2<JobValidationViewModel, JobViewModel>(
                        builder: (context, jobValidation, job, child) {
                      return TextFormField(
                        onChanged: (value) {
                          singleJob!.description = value;
                          job.setSingleJob(singleJob);
                          jobValidation.changeDescription(value);
                        },
                        style: const TextStyle(
                            color: COLOR_BLACK,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w200),
                        minLines:
                            6, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 300,
                        decoration: InputDecoration(
                            errorText: jobValidation.description.error,
                            hintText: 'Max 300 Characters.',
                            hintStyle: const TextStyle(
                                color: COLOR_GREY,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w200),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Colors.red))),
                      );
                    }),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 12.0, 12.0, 4.0),
                    child: Text(
                      "Choose a category",
                      // style: themeData.textTheme.headline3,
                      style: TextStyle(
                          color: COLOR_GREY,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  Consumer3<JobCategoryViewModel, JobViewModel,
                      JobValidationViewModel>(
                    builder: (_, jobCategory, job, jobValidation, child) {
                      if (jobCategory.getJobCategories.isEmpty) {
                        jobCategory.getAllJobCategories();
                      }
                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(18.0, 4.0, 12.0, 4.0),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            // errorText: _signupValidation.role.error,
                            hintText: "tttt",
                            icon: const Icon(
                              Icons.contact_page,
                              color: Colors.blue,
                            ),
                            errorStyle: const TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.transparent)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              // hint: Text(
                              //     (job.getSIngleJob.category != null
                              //         ? job.getSIngleJob.category
                              //         : 'Category')!),
                              hint: const Text('Category'),
                              value: job.getSingleJob.category,
                              isDense: true,
                              items: jobCategory.getJobCategories
                                  .map((caregory) {
                                return DropdownMenuItem<String>(
                                  value: caregory.id,
                                  child: Text(caregory.category!),
                                );
                              }).toList(),
                              onChanged: (value) {
                                jobValidation.changeCategory(value!);
                                singleJob!.category = value;
                                job.setSingleJob(singleJob);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 12.0, 12.0, 4.0),
                    child: Text(
                      "Upload images",
                      style: TextStyle(
                          color: COLOR_GREY,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 4.0, 12.0, 4.0),
                    child: Consumer<JobViewModel>(builder: (_, job, child) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
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
                                    shape: MaterialStateProperty.resolveWith(
                                      (state) => RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                    )),
                                onPressed: () {
                                  _chooseImages(context);
                                },
                                child: setUpButtonUpload(job),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                  Consumer2<JobViewModel, JobValidationViewModel>(
                      builder: (_, job, jobValidation, child) {
                    return buildGridView(job, jobValidation, size);
                  }),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 12.0, 12.0, 4.0),
                    child: Text(
                      "Add a location for the job",
                      style: TextStyle(
                          color: COLOR_GREY,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 4.0, 12.0, 4.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.045,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (state) => COLOR_BLUE),
                                        shape:
                                            MaterialStateProperty.resolveWith(
                                          (state) => RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                        )),
                                    onPressed: () {
                                      navigationService
                                          .navigateTo(googleMapPageRoute);
                                    },
                                    child: const Text(
                                      "Select a location on map",
                                      style: TextStyle(
                                        color: COLOR_WHITE,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<AuthViewModel>(
                              builder: (context, auth, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                    Text(
                                      "Latitude ",
                                      style: TextStyle(
                                        color: COLOR_BLACK,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      ": ${auth.getLat}",
                                      style: const TextStyle(
                                        color: COLOR_GREY,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<AuthViewModel>(
                              builder: (context, auth, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                    Text(
                                      "Longitude ",
                                      style: TextStyle(
                                        color: COLOR_BLACK,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      ": ${auth.getLng}",
                                      style: const TextStyle(
                                        color: COLOR_GREY,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<AuthViewModel>(
                              builder: (context, auth, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                    Text(
                                      "Address ",
                                      style: TextStyle(
                                        color: COLOR_BLACK,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        ": ${auth.getAddress}",
                                        overflow: TextOverflow.visible,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: COLOR_GREY,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 16.0),
                    child: Consumer2<JobValidationViewModel, JobViewModel>(
                        builder: (context, jobValidation, job, child) {
                      return SizedBox(
                        height: 40.0,
                        width: size.width,
                        child: TextButton(
                          style: ButtonStyle(
                              // backgroundColor:
                              //     MaterialStateProperty.resolveWith(
                              //         (state) => COLOR_BLUE),
                              backgroundColor: jobValidation.isValid
                                  ? MaterialStateProperty.resolveWith(
                                      (state) => Colors.blue)
                                  : MaterialStateProperty.resolveWith(
                                      (state) => Colors.grey),
                              shape: MaterialStateProperty.resolveWith(
                                (state) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                              )),
                          onPressed: () {
                            if (jobValidation.isValid) {
                              job.createJob(context);
                            }
                          },
                          child: setUpButtonCreate(job),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget setUpButtonUpload(JobViewModel job) {
    if (job.uploading) {
      return const SizedBox(
        height: 8.0,
        width: 8.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return const Text(
        "Upload Images",
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }
  }

  Widget setUpButtonCreate(JobViewModel job) {
    if (job.loading) {
      return const SizedBox(
        height: 8.0,
        width: 8.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return const Text(
        'CREATE',
        style: TextStyle(
          color: COLOR_WHITE,
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
      );
    }
  }

  Widget buildGridView(
      JobViewModel job, JobValidationViewModel jobValidation, Size size) {
    if (job.jobImages.isNotEmpty) {
      jobValidation.changeImages(job.jobImages.length.toString());
      return Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 4.0, 12.0, 4.0),
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: List.generate(job.getSingleJob.images!.length, (index) {
            // Asset asset = job._jobImages[index];
            // return AssetThumb(
            //   asset: asset,
            //   width: 400,
            //   height: 400,
            // );
            return SizedBox(
              height: 400.0,
              width: size.width * 0.5,
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  job.getSingleJob.images![index].url!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            );
          }),
        ),
      );
    }
    return const Padding(
      padding: EdgeInsets.fromLTRB(26.0, 4.0, 12.0, 4.0),
      child: Text('no image selected'),
    );
  }
}

void _chooseImages(BuildContext context) async {
  final job = Provider.of<JobViewModel>(context, listen: false);
  job.resetJobImages();
  job.loadAssets(context);
}
