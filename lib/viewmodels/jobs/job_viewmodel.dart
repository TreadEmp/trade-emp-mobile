import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/job/job.dart' as jobs;
import 'package:trade_emp_mobile/models/job/latest_job.dart' as recent_jobs;
import 'package:trade_emp_mobile/services/api/jobs/job_service.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'dart:convert';
import 'package:trade_emp_mobile/viewmodels/jobs/job_base_model.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;

class JobViewModel extends JobBaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final storage = const FlutterSecureStorage();
  final Helper _helper = Helper();
  final JobService _jobService = JobService();
  jobs.JobListRequestModel jobListRequestModel = jobs.JobListRequestModel();
  recent_jobs.RecentJobListRequestModel recentJobListRequestModel =
      recent_jobs.RecentJobListRequestModel();

  Future getAllJobs() async {
    setLoading(true);
    notifyListeners();

    String? token = await _helper.getIdToken();
    String? currentUserId = await _helper.getCurrentUserId();
    jobListRequestModel.page = '1';
    jobListRequestModel.pageSize = '10';
    jobListRequestModel.employerId = currentUserId;

    var result = await _jobService.getAllJobs(jobListRequestModel, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      setJobs(result.data.items);
      notifyListeners();
    } else {
      ErrorResponseModel error =
          ErrorResponseModel.fromJson(jsonDecode(result));
      setLoading(false);
      setError(error);
      notifyListeners();
    }
  }

  Future fetchRecentJobs(pageNumber) async {
    setLoadingState(JobLoadMoreStatus.LOADING);
    notifyListeners();

    String? token = await _helper.getIdToken();
    recentJobListRequestModel.page = pageNumber.toString();
    recentJobListRequestModel.pageSize = pageSize.toString();

    if ((totalPages == 0) || pageNumber <= totalPages) {
      var result =
          await _jobService.fetchRecentJobs(recentJobListRequestModel, token);

      if (result.success) {
        setLoadingState(JobLoadMoreStatus.STABLE);
        setError(null);

        setDataFetcher(result.data.items!);
        setTotalPages(result.data.pagination.pages!);
      } else {
        ErrorResponseModel error =
            ErrorResponseModel.fromJson(jsonDecode(result));
        setLoadingState(JobLoadMoreStatus.STABLE);
        setError(error);
      }
      notifyListeners();
    }
    if (pageNumber > totalPages) {
      // One load more is done will make it status as stable.
      setLoadingState(JobLoadMoreStatus.STABLE);
      notifyListeners();
    }
  }

  Future createJob(BuildContext context) async {
    setLoading(true);
    notifyListeners();

    String? token = (await _helper.getIdToken());

    var result = await _jobService.createJob(getSingleJob, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      showSuccessDialog('Job created successfully', context);
      notifyListeners();
      getAllJobs();
      _navigationService.navigateTo(routes.viewJobPageRoute);
    } else {
      setLoading(false);
      setError(result);
      notifyListeners();
    }
  }

  Future<void> loadAssets(BuildContext context) async {
    resetAssetImages();
    setUploading(true);
    notifyListeners();
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      setImageError(error);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;
    setImages(resultList);
    uploadJobImages();
    setImageError(null);
  }

  Future uploadJobImages() async {
    String? token = await _helper.getIdToken();

    var result = await _jobService.uploadJobImages(getImages, token);
    if (result.success) {
      setUploading(false);
      setError(null);
      setJobImages(result.data);
      var singleJob = getSingleJob;
      singleJob.images = result.data;
      setSingleJob(singleJob);
      notifyListeners();
    } else {
      ErrorResponseModel error =
          ErrorResponseModel.fromJson(jsonDecode(result));
      setUploading(false);
      setError(error);
      notifyListeners();
    }
  }
}
