import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/tools/tools.dart';
import 'package:trade_emp_mobile/services/api/tools/tools_service.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'dart:convert';

import 'package:trade_emp_mobile/viewmodels/tools/tools_base_model.dart';

class ToolViewModel extends ToolsBaseModel {
  final Helper _helper = Helper();
  final ToolsService _toolsService = ToolsService();
  ToolListRequestModel toolsListRequestModel =
      ToolListRequestModel();

  Future getEquipmentList() async {
    setLoading(true);
    notifyListeners();

    String? token = await _helper.getIdToken();
    toolsListRequestModel.page = '1';
    toolsListRequestModel.pageSize = '16';

    var result = await _toolsService.getEquipmentList(
        toolsListRequestModel, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      setTools(result.data.items);
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
