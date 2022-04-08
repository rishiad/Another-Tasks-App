// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/init_view.dart';
import '../ui/views/task_detail_view.dart';

class Routes {
  static const String initScreen = '/';
  static const String taskDetailScreen = '/task-detail-screen';
  static const all = <String>{
    initScreen,
    taskDetailScreen,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initScreen, page: InitScreen),
    RouteDef(Routes.taskDetailScreen, page: TaskDetailScreen),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    InitScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const InitScreen(),
        settings: data,
      );
    },
    TaskDetailScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) =>  TaskDetailScreen(),
        settings: data,
      );
    },
  };
}
