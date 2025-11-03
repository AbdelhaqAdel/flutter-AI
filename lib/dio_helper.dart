import 'dart:developer';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  /// Initialize Dio once (usually in main())
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.vyro.ai/v2/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  /// Generic POST method (supports both JSON and FormData)
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    bool isFormData = false,
  }) async {
    log("➡️ POST: $url");
    log("📦 Data: $data");

    try {
      // Fix Authorization header (add missing space)
      // dio.options.headers = {
      //   'Authorization':
      //       'Bearer vk-B5xy2T22fYYDqePoxSdaZZpB42P09eUeX3i3YoFYBO87DkM',
      // };

      final response = await dio.post(
        url,
        queryParameters: query,
        data: isFormData ? FormData.fromMap(data) : data,
        options: Options(
          headers: {
            'Authorization':
                'Bearer vk-B5xy2T22fYYDqePoxSdaZZpB42P09eUeX3i3YoFYBO87DkM',
            'Accept': 'application/json',
          },
          responseType: ResponseType.bytes, // 👈 important
        ),
      );

      log("✅ Status: ${response.statusCode}");
      log("✅ Response: ${response.data.runtimeType}");

      return response;
    } catch (error) {
      log("❌ Dio Error: $error");
      rethrow;
    }
  }
}

// import 'dart:developer';

// import 'package:dio/dio.dart';

// class DioHelper {
//   static Dio dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://api.vyro.ai/v2/',
//       receiveDataWhenStatusError: true,
//       // headers: {'X-Auth-Token': 'd781a50e6c8b4fe1a2e199099e43e365'},
//     ),
//   );
//   static init() {
//     //initialization for dio object
//   }

//   //  static Future<Response> GetData({
//   //     required String EndPoint,
//   //     //Map <String,dynamic>? query,
//   //   // String? token,
//   //  })async{
//   //    // dio.options.headers={
//   //    //   'Content-Type':'application/json',
//   //    //   'authorization':token??'',
//   //    // };
//   //     return await dio.get(
//   //       EndPoint,
//   //      // queryParameters: query??null,
//   //     );
//   //   }

//   static Future<Response> postData({
//     required var url,
//     Map<String, dynamic>? query,
//     required Map<String, dynamic> data,
//   }) async {
//     log("$url -- $data ---");
//     dio.options.headers = {
//       // 'Content-Type': 'application/json',
//       'Authorization':
//           "Bearervk-B5xy2T22fYYDqePoxSdaZZpB42P09eUeX3i3YoFYBO87DkM",
//     };
//     // log(dio.post(url, data: data).runtimeType.toString());
//     return await dio.post(url, data: data);
//   }
  // }

  // class DioHelper2{
  //   static Dio dio = Dio(
  //     BaseOptions(
  //       baseUrl: 'https://v3.football.api-sports.io/',
  //       receiveDataWhenStatusError: true,
  //       headers: {
  //         'x-rapidapi-key': '922039861dfb73027aa22aca9c985fef',
  //       },
  //     ),

  //   ) ;
  //   static init(){ //initialization for dio object.
  //   }

  //   static Future<Response> GetData({
  //     required String EndPoint,
  //   })async{
  //     return await dio.get(
  //       EndPoint ,
  //     );
  //   }

  // /*static Future<Response> PostData({
  //    required var url,
  //    Map <String,dynamic>? query,
  //    required Map <String,dynamic> data,
  //    String? token,
  //  })async
  //  {
  //    dio.options.headers={
  //      'Content-Type':'application/json',
  //      'authorizatio':token,
  //    };
  //    return dio.post(
  //      url,
  //      queryParameters: query??null,
  //      data: data,
  //    );
  //  }*/
  // }

  // class DioHelper3{
  //   static Dio dio= Dio(
  //     BaseOptions(
  //       baseUrl: 'https://student.valuxapps.com/api/',
  //       receiveDataWhenStatusError: true,
  //       // headers: {
  //       //   'Content-Type':'application/json',
  //       //   'lang':'en',
  //       // }
  //     ),

  //   ) ;
  //   static init(){ //initialization for dio object
  //   }

  //   static Future<Response> GetData({
  //     required var url,
  //     Map <String,dynamic>? query,
  //     String lang ='en',
  //     String? token,
  //   })async{
  //     dio.options.headers={
  //       'lang':lang,
  //       'authorization':token??'',
  //       'Content-Type':'application/json',
  //     };
  //     return await dio.get(url ,
  //       queryParameters: query??null,);
  //   }

  //   static Future<Response> PostData({
  //     required var url,
  //     Map <String,dynamic>? query,
  //     required Map <String,dynamic> data,
  //     String lang ='en',
  //     String? token,
  //   })async
  //   {
  //     dio.options.headers={
  //       'lang':lang,
  //       'authorizatio':token??'',
  //       'Content-Type':'application/json',
  //     };
  //     return dio.post(
  //       url,
  //       queryParameters: query??null,
  //       data: data,
  //     );
  //   }

  //   static Future<Response> PutData({
  //     required var url,
  //     Map <String,dynamic>? query,
  //     required Map <String,dynamic> data,
  //     String lang ='en',
  //     String? token,
  //   })async
  //   {
  //     dio.options.headers={
  //       'lang':lang,
  //       'authorizatio':token??'',
  //       'Content-Type':'application/json',
  //     };
  //     return dio.put(
  //       url,
  //       queryParameters: query??null,
  //       data: data,
  //     );
  //   }

