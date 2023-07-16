import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/experience/experience.dart';
import 'package:trade_emp_mobile/services/api/experience/experience_service.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'package:trade_emp_mobile/viewmodels/experience/experience_base_model.dart';
import 'dart:convert';

class ExperienceViewModel extends ExperienceBaseModel {
  final Helper _helper = Helper();
  final ExperienceService _experienceService = ExperienceService();
  ExperienceListRequestModel experiencesListRequestModel =
      ExperienceListRequestModel();

  List<Items> experience = [];

  Future getExperienceList() async {
    setLoading(true);
    notifyListeners();

    String? token = await _helper.getIdToken();
    experiencesListRequestModel.page = '1';
    experiencesListRequestModel.pageSize = '50';

    var result = await _experienceService.getExperienceList(
        experiencesListRequestModel, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      setExperiences(result.data.items);
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
