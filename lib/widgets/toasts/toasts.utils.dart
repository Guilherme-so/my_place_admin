import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void showSuccessToast(String message) => showToastWidget(
      _getDefaultToastContainer(
        message,
        Colors.green,
        Colors.white,
      ),
      position: ToastPosition.bottom,
    );

void showWarningToast(String message) => showToastWidget(
      _getDefaultToastContainer(
        message,
        Colors.yellow,
        Colors.black,
      ),
      position: ToastPosition.bottom,
    );

void showErrorToast(String message) => showToastWidget(
      _getDefaultToastContainer(
        message,
        Colors.red,
        Colors.black,
      ),
      position: ToastPosition.bottom,
    );

Widget _getDefaultToastContainer(
        String message, Color color, Color textColor) =>
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 32,
        ),
        child: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
