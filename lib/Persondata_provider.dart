import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:login_db/Persondata.dart';



class PersonProvider extends ChangeNotifier {
  String status = ""; // idle | loading | data | error
  String errorMessage = "";

  //List<Persondata> PersonList=[];


  Persondata singlepersondata = Persondata(
      Username: "zawmoenaing",
      Email: "zawmoe71961@gmail.com",
      Password: "12345");

  // modifier
  void toggleFav(){
    status="";
    errorMessage="";
  }

  Future<bool> getLoginFromAPI(String user,String email, String password) async {
    status = "loading";
    errorMessage = "";
    notifyListeners();
    // TODO
    Dio client = Dio();
    // Bypass SSL certificate verification (for development only)
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final httpClient = HttpClient();
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return httpClient;
    };
    String endPoint = "http://www.zawmoemobileapp.somee.com/api/Login?username=$user&email=$email&password=$password";
    try {
      Response<dynamic> response = await client.post(endPoint);
      //print(status);
      Map<String, dynamic> dataList = response.data;
      singlepersondata.Username=  dataList['Username'];
      singlepersondata.Email=  dataList['Email'];
      singlepersondata.Password=  dataList['Password'];
      status = "data";
      notifyListeners();
      return true;
        }
    catch (exp, stackTrace) {
      print(exp);
      print(stackTrace);
      status = "error";
      print(status);
      // errorMessage = "တစ်ခုခု မှားနေပါသည်";
      errorMessage = exp.toString();
      notifyListeners();
      return false;
    }

  }

  Future<bool> getRegisterFromAPI(String user,String email, String password) async {
    status = "loading";
    errorMessage = "";
    notifyListeners();
    // TODO
    Dio client = Dio();
    // Bypass SSL certificate verification (for development only)
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final httpClient = HttpClient();
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return httpClient;
    };
    String endPoint = "http://www.zawmoemobileapp.somee.com/api/Register?username=$user&email=$email&password=$password";

    try {
      Response<dynamic> response = await client.post(endPoint);
      singlepersondata.Username=  user;
      singlepersondata.Email=  email;
      singlepersondata.Password= password;
      status = "data";
      notifyListeners();
      return true;
    }
    catch (exp, stackTrace) {
      print(exp);
      print(stackTrace);
      status = "error";
      print(status);
      // errorMessage = "တစ်ခုခု မှားနေပါသည်";
      errorMessage = exp.toString();
      notifyListeners();
      return false;
    }

  }

  Future<bool> getUpdateFromAPI(String username,String email, String password) async {
    status = "loading";
    errorMessage = "";
    notifyListeners();
    // TODO

    Dio client = Dio();
    // Bypass SSL certificate verification (for development only)
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final httpClient = HttpClient();
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return httpClient;
    };
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var data = {
      'oldusername': singlepersondata.Username,
      'oldemail': singlepersondata.Email,
      'oldpassword': singlepersondata.Password,
      'username': username,
      'email': email,
      'password': password
    };
    var dio = Dio();
    try {
      var response = await client.post(
        'http://www.zawmoemobileapp.somee.com/api/UpdateMobileData',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        singlepersondata.Username = username;
        singlepersondata.Email = email;
        singlepersondata.Password = password;
        status = "data";
        notifyListeners();
        return true;
      }
      else {
        print(response.statusMessage);
      }
      return true;
    }
    catch (exp, stackTrace) {
      print(exp);
      print(stackTrace);
      status = "error";
      print(status);
      // errorMessage = "တစ်ခုခု မှားနေပါသည်";
      errorMessage = exp.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getDeleteFromAPI(String username,String email, String password) async {
    status = "loading";
    errorMessage = "";
    notifyListeners();
    // TODO

    Dio client = Dio();
    // Bypass SSL certificate verification (for development only)
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final httpClient = HttpClient();
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return httpClient;
    };
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var data = {
      'oldusername': singlepersondata.Username,
      'oldemail': singlepersondata.Email,
      'oldpassword': singlepersondata.Password,
      'username': username,
      'email': email,
      'password': password
    };
    var dio = Dio();
    try {
      var response = await client.post(
        'http://www.zawmoemobileapp.somee.com/api/DeleteMobileData',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        singlepersondata.Username = username;
        singlepersondata.Email = email;
        singlepersondata.Password = password;
        status = "data";
        notifyListeners();
        return true;
      }
      else {
        print(response.statusMessage);
      }
      return true;
    }
    catch (exp, stackTrace) {
      print(exp);
      print(stackTrace);
      status = "error";
      print(status);
      // errorMessage = "တစ်ခုခု မှားနေပါသည်";
      errorMessage = exp.toString();
      notifyListeners();
      return false;
    }
  }
}
