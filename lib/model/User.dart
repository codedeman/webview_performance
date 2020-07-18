
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String title;
  final String thumbnailUrl;

  User({this.id,this.title,this.thumbnailUrl});

  factory User.fromJson(Map<String,dynamic> json) {
    return User(
      id: json["id"] as int,
      title: json["title"] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

