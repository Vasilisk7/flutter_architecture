import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/service_provider.dart';
import 'package:flutter_architecture/ui/my_app.dart';

void main() {
  ServiceProvider().init();
  runApp(const MyApp());
}
