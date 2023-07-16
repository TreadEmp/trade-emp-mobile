import 'package:flutter/cupertino.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as errors;
import 'package:trade_emp_mobile/models/tools/tools.dart' as tool;


class ToolsBaseModel extends ChangeNotifier {
  bool _loading = false;
  bool _isError = false;
  final errors.Data _error = errors.Data();
  List<tool.Items> tools = [];

  bool get loading => _loading;
  errors.Data get error => _error;
  bool get hasError => _isError;
  List<tool.Items> get getTools => tools;

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

  void setTools(List<tool.Items> data) {
    if (data.isNotEmpty) {
      tools = data;
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
