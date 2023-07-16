import 'dart:core';
import 'dart:io';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/constants/config.dart' as config;
import 'package:http/http.dart' as http;
import 'package:trade_emp_mobile/models/jobRequest/job_request.dart' as job_requests;
import 'dart:convert';

import 'package:trade_emp_mobile/models/jobRequest/latest_job_request.dart' as recent_job_requests;

class JobRequestService {
  final String baseUrl = config.BASE_URL;
  String path = config.BASE_API_PATH;

  //constructor
  JobRequestService();

  Future getAllJobRequests(
      job_requests.JobRequestListRequestModel requestModel, String? token) async {
    try {
      String url = '$baseUrl${path}job-requests';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String?> queryParameters = {
        'page': requestModel.page,
        'pageSize': requestModel.pageSize,
        'category': requestModel.category,
        'title': requestModel.title,
        'employeeId': requestModel.employeeId,
        'isActive': requestModel.isActive,
      };
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.get(newURI, headers: headers);

      if (response.statusCode == 200) {
        return job_requests.JobRequestList.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on getAllJobRequests');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getRecentJobRequests(recent_job_requests.RecentJobRequestListRequestModel requestModel, String? token) async {
    try {
      String url = '$baseUrl${path}job-requests/latest';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String?> queryParameters = {
        'page': requestModel.page,
        'pageSize': requestModel.pageSize,
      };
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.get(newURI, headers: headers);

      if (response.statusCode == 200) {
        return recent_job_requests.LatestJobRequestResponseModel.fromJson(
            jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on getLatestJobRequests');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
