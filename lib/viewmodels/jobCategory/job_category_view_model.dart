import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/jobCategory/job_category.dart';
import 'package:trade_emp_mobile/services/api/jobCategory/job_category_service.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'dart:convert';

import 'package:trade_emp_mobile/viewmodels/jobCategory/job_category_base_model.dart';

class JobCategoryViewModel extends JobCategoryBaseModel {
  final storage = const FlutterSecureStorage();
  final Helper _helper = Helper();
  final JobCategoryService _jobCategoryService = JobCategoryService();
  JobCategoryListRequestModel jobCategoryListRequestModel =
      JobCategoryListRequestModel();

  Future fetchAllJobCategories(pageNumber) async {
    setLoadingState(JobCategoryLoadMoreStatus.LOADING);
    notifyListeners();

    String? token = await _helper.getIdToken();
    jobCategoryListRequestModel.page = pageNumber.toString();
    jobCategoryListRequestModel.pageSize = pageSize.toString();

    if ((totalPages == 0) || pageNumber <= totalPages) {
      var result = await _jobCategoryService.getAllJobCategories(
          jobCategoryListRequestModel, token);

      if (result.success) {
        setLoadingState(JobCategoryLoadMoreStatus.STABLE);
        setError(null);

        setDataFetcher(result.data.items!);
        setTotalPages(result.data.pagination.pages!);
      } else {
        ErrorResponseModel error =
            ErrorResponseModel.fromJson(jsonDecode(result));
        setLoadingState(JobCategoryLoadMoreStatus.STABLE);
        setError(error);
      }
      notifyListeners();
    }
    if (pageNumber > totalPages) {
      // One load more is done will make it status as stable.
      setLoadingState(JobCategoryLoadMoreStatus.STABLE);
      notifyListeners();
    }
  }

  Future getAllJobCategories() async {
    setLoading(true);
    notifyListeners();

    String? token = await _helper.getIdToken();
    jobCategoryListRequestModel.page = '1';
    jobCategoryListRequestModel.pageSize = '100';

    var result = await _jobCategoryService.getAllJobCategories(
        jobCategoryListRequestModel, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      setJobCategories(result.data.items!);
      notifyListeners();
    } else {
      ErrorResponseModel error =
          ErrorResponseModel.fromJson(jsonDecode(result));
      setLoading(false);
      setError(error);
      notifyListeners();
    }
  }
}
