import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as errors;
import 'package:trade_emp_mobile/models/job/job.dart' as job;
import 'package:trade_emp_mobile/models/job/job_create.dart';
import 'package:trade_emp_mobile/models/job/latest_job.dart' as latest_jobs;

class JobBaseModel extends ChangeNotifier {
  bool _loading = false;
  bool _uploading = false;
  bool _isError = false;
  final errors.Data _error = errors.Data();
  List<job.Items> jobs = [];
  List<latest_jobs.Items> _dataFetcher = []; //latest job for pagination 
  List<latest_jobs.Data> latestJobs = [];
  List<Asset> images = <Asset>[];
  List<job.Images> jobImages = <job.Images>[];
  String _imageError = '';
  bool _isImageError = false;
  JobCreateRequestModel _singleJob = JobCreateRequestModel();

  int _totalPages = 0;
  final int _pageSize = 10;
  JobLoadMoreStatus _loadMoreStatus = JobLoadMoreStatus.STABLE;

  bool get loading => _loading;
  bool get uploading => _uploading;
  errors.Data get error => _error;
  bool get hasError => _isError;
  List<job.Items> get getJobs => jobs;
  List<latest_jobs.Data> get getLatestJobs => latestJobs;
  List<Asset> get getImages => images;
  List<job.Images> get getJobImages => jobImages;
  String get getImageError => _imageError;
  bool get hasImageError => _isImageError;
  JobCreateRequestModel get getSingleJob => _singleJob;
  List<latest_jobs.Items> get getDataFetcher => _dataFetcher;
  getLoadMoreStatus() => _loadMoreStatus;
  int get pageSize => _pageSize;
  int get totalPages => _totalPages;    

  JobBaseModel() {
    _initStreams();
  }

  void _initStreams() {
    _dataFetcher = [];
  }

  void resetStreams() {
    _initStreams();
  }

  setLoadingState(JobLoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  setTotalPages(int totalPages) {
    _totalPages = totalPages;
    notifyListeners();
  }

  void setError(errors.ErrorResponseModel? errorResponse) {
    if (errorResponse == null) {
      _isError = false;
      _error.errorCode = null;
      _error.errorMessage = null;
    } else {
      _isError = true;
      _error.errorCode = errorResponse.data!.errorCode;
      _error.errorMessage = errorResponse.data!.errorMessage;
    }
    notifyListeners();
  }

  void setJobs(List<job.Items> data) {
    if (data.isNotEmpty) {
      jobs = data;
    }
    notifyListeners();
  }

  void setDataFetcher(List<latest_jobs.Items> data) {
    if (data.isNotEmpty) {
      _dataFetcher.addAll(data);
    }
    notifyListeners();
  }

  void setLatestJobs(List<latest_jobs.Data> data) {
    if (data.isNotEmpty) {
      latestJobs = data;
    }
    notifyListeners();
  }

  void setJobImages(List<job.Images>? data) {
    if (data!.isNotEmpty) {
      jobImages = data;
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setUploading(bool value) {
    _uploading = value;
    notifyListeners();
  }

  void setImages(List<Asset> selectedImages) {
    if (selectedImages.isNotEmpty) {
      images = selectedImages;
    }
    notifyListeners();
  }

  void resetAssetImages() {
    if (images.isNotEmpty) {
      images = [];
    }
    notifyListeners();
  }

  void setImageError(String? error) {
    if (error != null) {
      _isImageError = true;
      _imageError = error;
    }
    notifyListeners();
  }

  void setSingleJob(JobCreateRequestModel value) {
    _singleJob = value;
    notifyListeners();
  }

  void resetSingleJob() {
    _singleJob = JobCreateRequestModel();
    notifyListeners();
  }

  void resetJobImages() {
    if (jobImages.isNotEmpty) {
      jobImages = [];
    }
    notifyListeners();
  }
}
