import 'package:flutter/cupertino.dart';
import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as errors;
import 'package:trade_emp_mobile/models/jobRequest/job_request.dart'
    as job_request;
import 'package:trade_emp_mobile/models/jobRequest/latest_job_request.dart'
    as latest_job_request;

class JobRequestBaseModel extends ChangeNotifier {
  bool _loading = false;
  bool _isError = false;
  int _jobRequestSelectedTabIndex = 0;
  final errors.Data _error = errors.Data();
  List<latest_job_request.Items> _dataFetcher =
      []; //Latest Job Request for pagination
  List<job_request.Items> _activeJobRequestDataFetcher =
      []; //Active Job Request for pagination
  List<job_request.Items> _inactiveJobRequestDataFetcher =
      []; //Inactive Job Request for pagination

  int _totalPages = 0;
  int _activeJobRequestTotalPages = 0;
  int _inactiveJobRequestTotalPages = 0;
  final int _pageSize = 10;
  JobRequestLoadMoreStatus _loadMoreStatus = JobRequestLoadMoreStatus.STABLE;

  bool get loading => _loading;
  errors.Data get error => _error;
  bool get hasError => _isError;
  List<latest_job_request.Items> get getDataFetcher => _dataFetcher;
  List<job_request.Items> get getActiveJobRequestDataFetcher =>
      _activeJobRequestDataFetcher;
  List<job_request.Items> get getInactiveJobRequestDataFetcher =>
      _inactiveJobRequestDataFetcher;
  getLoadMoreStatus() => _loadMoreStatus;
  int get pageSize => _pageSize;
  int get totalPages => _totalPages;
  int get activeJobRequestTotalPages => _activeJobRequestTotalPages;
  int get inactiveJobRequestTotalPages => _inactiveJobRequestTotalPages;
  int get jobRequestSelectedTabIndex => _jobRequestSelectedTabIndex;

  JobRequestBaseModel() {
    _initStreams();
    _activeJobRequestInitStreams();
    _inactiveJobRequestInitStreams();
  }

  void _initStreams() {
    _dataFetcher = [];
  }

  void resetActiveJobRequestStreams() {
    _initStreams();
  }

  void _activeJobRequestInitStreams() {
    _activeJobRequestDataFetcher = [];
  }

  void resetInactiveJobRequestStreams() {
    _activeJobRequestInitStreams();
  }

  void _inactiveJobRequestInitStreams() {
    _inactiveJobRequestDataFetcher = [];
  }

  void resetStreams() {
    _inactiveJobRequestInitStreams();
  }

  setLoadingState(JobRequestLoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  setTotalPages(int totalPages) {
    _totalPages = totalPages;
    notifyListeners();
  }

  setActiveJobRequestLoadingState(
      ActiveJobRequestLoadMoreStatus loadMoreStatus) {
    notifyListeners();
  }

  setActiveJobRequestTotalPages(int totalPages) {
    _activeJobRequestTotalPages = totalPages;
    notifyListeners();
  }

  setInactiveJobRequestLoadingState(
      InactiveJobRequestLoadMoreStatus loadMoreStatus) {
    notifyListeners();
  }

  setInactiveJobRequestTotalPages(int totalPages) {
    _inactiveJobRequestTotalPages = totalPages;
    notifyListeners();
  }

  setJobRequestSelectedTabIndex(int index) {
    _jobRequestSelectedTabIndex = index;
    notifyListeners();
  }

  void setError(errors.ErrorResponseModel? errorResponse) {
    if (errorResponse != null) {
      _isError = true;
      _error.errorCode = errorResponse.data!.errorCode;
      _error.errorMessage = errorResponse.data!.errorMessage;
    } else {
      _error.errorCode = '';
      _error.errorMessage = '';
    }
    notifyListeners();
  }

  void setDataFetcher(List<latest_job_request.Items> data) {
    if (data.isNotEmpty) {
      _dataFetcher.addAll(data);
    }
    notifyListeners();
  }

  void setActiveJobRequestDataFetcher(List<job_request.Items> data) {
    if (data.isNotEmpty) {
      _activeJobRequestDataFetcher.addAll(data);
    }
    notifyListeners();
  }

  void setInactiveJobRequestDataFetcher(List<job_request.Items> data) {
    if (data.isNotEmpty) {
      _inactiveJobRequestDataFetcher.addAll(data);
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
