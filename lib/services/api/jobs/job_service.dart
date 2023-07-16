import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as error;
import 'package:trade_emp_mobile/models/common/image_upload_response.dart';
import 'package:trade_emp_mobile/models/job/job.dart' as jobs;
import 'package:trade_emp_mobile/models/job/job_create.dart';
import 'package:trade_emp_mobile/models/job/latest_job.dart' as recent_jobs;
import 'package:trade_emp_mobile/constants/config.dart' as config;
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobService {
  final String baseUrl = config.BASE_URL;
  String path = config.BASE_API_PATH;

  //constructor
  JobService();

  Future getAllJobs(
      jobs.JobListRequestModel requestModel, String? token) async {
    try {
      String url = '$baseUrl${path}jobs';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String?> queryParameters = {
        'page': requestModel.page,
        'pageSize': requestModel.pageSize,
        'category': requestModel.category,
        'status': requestModel.status,
        'title': requestModel.title,
        'location': requestModel.location,
        'employerId': requestModel.employerId,
      };
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.get(newURI, headers: headers);

      if (response.statusCode == 200) {
        return jobs.JobList.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return error.ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('error on getAllJobs');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future fetchRecentJobs(
      recent_jobs.RecentJobListRequestModel requestModel, String? token) async {
    try {
      String url = '$baseUrl${path}jobs/latest';
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
        return recent_jobs.RecentJobResponseModel.fromJson(
            json.decode(response.body));
      } else if (response.statusCode == 400) {
        return error.ErrorResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('error on getLatestJobs');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future createJob(JobCreateRequestModel job, String? token) async {
    try {
      String url = '$baseUrl${path}jobs';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Uri uri = Uri.parse(url);
      final data = json.encode(job);
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 201) {
        return JobCreateResponseModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return error.ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('error on create job');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // ignore: missing_return
  Future uploadJobImages(List<dynamic> files, String? token) async {
    try {
      String url = '$baseUrl${path}jobs/uploads';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'multipart/form-data',
      };
      var request = http.MultipartRequest("POST", Uri.parse(url));
      // List<MultipartFile> multipartImageList = <MultipartFile>[];
      for (int i = 0; i < files.length; i++) {
        // var multipartFileSign = http.MultipartFile.fromBytes("uploadedFiles", files[i]);
        // // add file to multipart
        // request.files.add(multipartFileSign);
        ByteData byteData = await files[i].getByteData();
        List<int> imageData = byteData.buffer.asUint8List();
        MultipartFile multipartFile = MultipartFile.fromBytes(
            "uploadedFiles", imageData,
            filename: 'load_image');
        request.files.add(multipartFile);
      }
      //add headers
      request.headers.addAll(headers);
      // var response = await request.send();
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        return ImageUploadResponseModel.fromJson(jsonDecode(response.body));
        // return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        error.ErrorResponseModel errors = error.ErrorResponseModel();
        errors.success = false;
        errors.data = error.Data();
        errors.data!.errorCode = '400';
        errors.data!.errorMessage = "error occered while uploading job images";
        return response.statusCode;
        // return ErrorResponseModel.fromJson(error);
      } else {
        return response.statusCode;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
