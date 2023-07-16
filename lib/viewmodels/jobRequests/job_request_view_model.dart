import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/jobRequest/job_request.dart'
    as job_request;
import 'package:trade_emp_mobile/models/jobRequest/latest_job_request.dart'
    as recent_job_request;
import 'package:trade_emp_mobile/services/api/jobRequests/job_request_service.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'dart:convert';
import 'package:trade_emp_mobile/viewmodels/jobRequests/job_request_base_model.dart';

class JobRequestViewModel extends JobRequestBaseModel {
  final Helper _helper = Helper();
  final JobRequestService _jobRequestService = JobRequestService();
  job_request.JobRequestListRequestModel jobRequestListRequestModel =
      job_request.JobRequestListRequestModel();
  recent_job_request.RecentJobRequestListRequestModel
      recentJobRequestListRequestModel =
      recent_job_request.RecentJobRequestListRequestModel();

  Future fetchAllActiveJobRequests(pageNumber) async {
    setActiveJobRequestLoadingState(ActiveJobRequestLoadMoreStatus.LOADING);
    notifyListeners();

    String? token = await _helper.getIdToken();
    String? currentUserId = await _helper.getCurrentUserId();
    jobRequestListRequestModel.page = pageNumber.toString();
    jobRequestListRequestModel.pageSize = pageSize.toString();
    jobRequestListRequestModel.employeeId = currentUserId;
    jobRequestListRequestModel.isActive = 'true';

    if ((totalPages == 0) || pageNumber <= totalPages) {
      var result = await _jobRequestService.getAllJobRequests(
          jobRequestListRequestModel, token);

      if (result.success) {
        setActiveJobRequestLoadingState(ActiveJobRequestLoadMoreStatus.STABLE);
        setError(null);
        setActiveJobRequestTotalPages(result.data.pagination.pages);
        setActiveJobRequestDataFetcher(result.data.items);
      } else {
        ErrorResponseModel error =
            ErrorResponseModel.fromJson(jsonDecode(result));
        setActiveJobRequestLoadingState(ActiveJobRequestLoadMoreStatus.STABLE);
        setError(error);
      }
      notifyListeners();
    }
    if (pageNumber > totalPages) {
      setActiveJobRequestLoadingState(ActiveJobRequestLoadMoreStatus.STABLE);
      notifyListeners();
    }
  }

  Future fetchAllInactiveJobRequests(pageNumber) async {
    setInactiveJobRequestLoadingState(InactiveJobRequestLoadMoreStatus.LOADING);
    notifyListeners();

    String? token = await _helper.getIdToken();
    String? currentUserId = await _helper.getCurrentUserId();
    jobRequestListRequestModel.page = pageNumber.toString();
    jobRequestListRequestModel.pageSize = pageSize.toString();
    jobRequestListRequestModel.employeeId = currentUserId;
    jobRequestListRequestModel.isActive = 'false';

    if ((totalPages == 0) || pageNumber <= totalPages) {
      var result = await _jobRequestService.getAllJobRequests(
          jobRequestListRequestModel, token);

      if (result.success) {
        setInactiveJobRequestLoadingState(
            InactiveJobRequestLoadMoreStatus.STABLE);
        setError(null);
        setInactiveJobRequestTotalPages(result.data.pagination.pages);
        setInactiveJobRequestDataFetcher(result.data.items);
      } else {
        ErrorResponseModel error =
            ErrorResponseModel.fromJson(jsonDecode(result));
        setInactiveJobRequestLoadingState(
            InactiveJobRequestLoadMoreStatus.STABLE);
        setError(error);
      }
      notifyListeners();
    }
    if (pageNumber > totalPages) {
      setInactiveJobRequestLoadingState(
          InactiveJobRequestLoadMoreStatus.STABLE);
      notifyListeners();
    }
  }

  Future fetchRecentJobRequests(pageNumber) async {
    setLoadingState(JobRequestLoadMoreStatus.LOADING);
    notifyListeners();

    String? token = await _helper.getIdToken();
    recentJobRequestListRequestModel.page = pageNumber.toString();
    recentJobRequestListRequestModel.pageSize = pageSize.toString();
    if ((totalPages == 0) || pageNumber <= totalPages) {
      var result = await _jobRequestService.getRecentJobRequests(
          recentJobRequestListRequestModel, token);

      if (result.success) {
        setLoadingState(JobRequestLoadMoreStatus.STABLE);
        setError(null);
        setTotalPages(result.data.pagination.pages);
        setDataFetcher(result.data.items);
      } else {
        ErrorResponseModel error =
            ErrorResponseModel.fromJson(jsonDecode(result));
        setLoadingState(JobRequestLoadMoreStatus.STABLE);
        setError(error);
      }
      notifyListeners();
    }
    if (pageNumber > totalPages) {
      setLoadingState(JobRequestLoadMoreStatus.STABLE);
      notifyListeners();
    }
  }
}
