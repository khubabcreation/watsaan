

import 'package:mam_sana_afzal/Custome_Widget/reg_expressions.dart';

bool isValueEmpty(String value) {
  if (value.isEmpty) {
    return true;
  }
  return false;
}

mixin TextFormFieldValidationMixin {
  String? isPasswordValid(String? value) {
    if (isValueEmpty(value!)) {
      return 'Password can not be Empty';
    }
    if (value.length < 6) {
      return 'Password min length is 6 Chars';
    }
    return null;
  }

  String? isEmailValid(String? value) {
    if (isValueEmpty(value!)) {
      return 'Email can not be empty';
    }
    if (emailValid.hasMatch(value)) {
      return null;
    }
    return 'Email is not Valid';
  }

  String? isIdCardValid(String? value) {
    if (isValueEmpty(value!)) {
      return 'ID Card is Must';
    }
    if (value.length != 15) {
      return 'InValid ID Card Number';
    }
    return null;
  }

  String? isNameValid(String? value) {
    if (isValueEmpty(value!)) {
      return 'Name is required Field';
    }
    if (nameRegExp.hasMatch(value)) {
      return null;
    }
    return 'Invalid Name';
  }

  String? isMobileNoValid(String? value) {
    if (isValueEmpty(value!)) {
      return 'Mobile No is Mandatory';
    }
    if (value.length == 11) {
      return null;
    }
    return 'Not a Mobile No';
  }

  String? isUnitValid(String? value) {
    if (isValueEmpty(value!)) {
      return 'Unit Can not be null';
    }
    if (value.length == 15) {
      return null;
    }
    return 'Unit must be of 2 chars';
  }
}
