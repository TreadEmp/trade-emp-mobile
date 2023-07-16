import 'package:flutter/cupertino.dart';
import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as errors;
import 'package:trade_emp_mobile/models/jobCategory/job_category.dart'
    as job_category;

class JobCategoryBaseModel extends ChangeNotifier {
  bool _loading = false;
  bool _isError = false;
  final errors.Data _error = errors.Data();
  List<job_category.Items> jobCategories = [];
  List<job_category.Items> _dataFetcher = []; //Job categories for pagination

  int _totalPages = 0;
  final int _pageSize = 10;
  JobCategoryLoadMoreStatus _loadMoreStatus = JobCategoryLoadMoreStatus.STABLE;

  bool get loading => _loading;
  errors.Data get error => _error;
  bool get hasError => _isError;
  List<job_category.Items> get getJobCategories => jobCategories;
  List<job_category.Items> get getDataFetcher => _dataFetcher;
  getLoadMoreStatus() => _loadMoreStatus;
  int get pageSize => _pageSize;
  int get totalPages => _totalPages;

  JobCategoryBaseModel() {
    _initStreams();
  }

  void _initStreams() {
    _dataFetcher = [];
  }

  void resetStreams() {
    _initStreams();
  }

  setLoadingState(JobCategoryLoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  setTotalPages(int totalPages) {
    _totalPages = totalPages;
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

  void setJobCategories(List<job_category.Items> data) {
    if (data.isNotEmpty) {
      jobCategories = data;
    }
    notifyListeners();
  }

  void setDataFetcher(List<job_category.Items> data) {
    if (data.isNotEmpty) {
      _dataFetcher.addAll(data);
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
