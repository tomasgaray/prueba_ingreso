import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Helper {

  static String catchError(dynamic ex, {String errorText = ""}) {
    var errorType = ex.runtimeType;
    switch (errorType) {
      case WebSocketException:
        errorText = ex.message.length > 0 ? ex.message : errorText;
        break;
      case ClientException:
        errorText = ex.message.length > 0 ? ex.message : errorText;
        break;
      case SocketException:
        errorText = ex.osError.message.length > 0 ? ex.osError.message : errorText;
        errorText = errorText.toUpperCase().contains("NO ADDRESS ASSOCIA")? "No tiene conexión a internet": errorText;
        errorText = errorText.toUpperCase().contains("NODENAME NOR SER")? "No tiene conexión a internet": errorText;
        break;
      case JsonUnsupportedObjectError:
        errorText = ex.partialResult.length > 0 ? ex.partialResult : errorText;
        break;
      case NoSuchMethodError:
        errorText = ex.length > 0 ? ex.toString() : errorText;
        break;
      case Exception:
        errorText = ex.length > 0 ? ex.toString() : errorText;
        break;
      default:errorText = "El proceso no pudo ser completado";
    }
    return errorText;
  }

  static String validateHttpCode(Response res) {
    String error = "";
    switch (res.statusCode) {
      case 401:
        error = "No Autorizado";
        break;
      case 400:
        var errorFromService = jsonDecode(res.body);
          error = errorFromService["message"];
          error = res.body.contains("message")? errorFromService["message"] : errorFromService["Message"];
        break;
      case 500:
         var errorFromService = jsonDecode(res.body);
          error = errorFromService["message"];
        break;
      case 503:
         error = "No tiene conexión a internet";
        break;
      default:"Ocurrio un error al comunicarnos con el servidor";
    }
    return error;
  }

  static List encondeToJson(List<dynamic> list) {
    List jsonList = [];
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }

  static showToasError(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.red,
        duration:const Duration(seconds: 4),
      ),
    );
  }
}
