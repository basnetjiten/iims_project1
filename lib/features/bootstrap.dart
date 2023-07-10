/*
* @Author:Jiten Basnet on 19/06/2023
* @Company: EB Pearls
*/

import 'package:dio/dio.dart';

Dio dioInstance = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    // receiveTimeout: const Duration(seconds: 60000),
    // connectTimeout: const Duration(seconds: 60000),
    // responseType: ResponseType.json,
    headers: <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZmJkMTQ3NWFjYWUwYzJhMjZjYjQxMWMyYjhjZTkzOCIsInN1YiI6IjVjNGQ5YzAwOTI1MTQxNTFhOTU2ZmQxNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-sIDZrutyzSweMqoBG2vfpGWznGRxhyaCLWRoXM3bvE'
    },
  ),
);
