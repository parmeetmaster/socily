import 'dart:async';
import 'dart:io';

import 'package:file_support/file_support.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socilybrand/constants/AppColors.dart';

import 'custom_route_builder.dart';

extension imgfile on File {
  Future<File?> get compressfile =>
      FileSupport().compressImage(this, quality: 30); //
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension m_string on String {
  bool get isvalidUrl {
    if (Uri.parse(this).isAbsolute) {
      return true;
    }
    return false;
  }

  String get camelCase1   => this == null || this.isEmpty
      ? ''
      : this.length > 0
          ? '${this[0].toUpperCase()}${this.substring(1)}'
          : '';

  String get capitalCase => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.camelCase1)
      .join(" ");

  bool get isCamelCase {
    if (this.characters.first == this.characters.first.toUpperCase()) {
      return true;
    } else {
      return false;
    }
  }

  dynamic fromMap(Map json) {
    return json['$this'];
  }

  showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(this),
        backgroundColor: AppColors.bluePrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  bool isEmail() {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return this != null && regExp.hasMatch(this);
  }

  bool isPhone() {
    String pattern =
        r'^(?:\(?)(\d{3})(?:[\).\s]?)(\d{3})(?:[-\.\s]?)(\d{4})(?!\d)$';
    RegExp regExp = RegExp(pattern);
    return this != null && regExp.hasMatch(this);
  }
}

extension mnavigator on Widget {
  Future push(BuildContext context, {RouteSettings? settings}) {
    return Navigator.of(context).push(CustomPageRouteBuilder(
        pageBuilder: (c, a, b) => this, settings: settings));
  }

  Future pushReplacement(BuildContext context) {
    return Navigator.of(context).pushReplacement(
        CustomPageRouteBuilder(pageBuilder: (c, a, b) => this));
  }

  Future pushAndPopAll(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        CustomPageRouteBuilder(pageBuilder: (c, a, b) => this), (r) => false);
  }

  Future pushAndPopTillFirst(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        CustomPageRouteBuilder(pageBuilder: (c, a, b) => this),
        (r) => r.isFirst);
  }

  Future pushDialog(BuildContext context) {
    return Navigator.of(context).push(CustomPageRouteBuilder(
        pageBuilder: (c, a, b) => this,
        opaque: false,
        barrierColor: Colors.black45));
  }
}

extension my_data on DateTime {
  String? get appDate => DateFormat("dd-MM-yyyy").format(this);
}
