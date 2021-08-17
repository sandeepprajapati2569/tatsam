
/**
 *  [ValidationChecker] class contains all validation for better use.
 */

/// var maskTelephone = new MaskTextInputFormatter(mask: '+7 (ddd) ddd-dd-dd', filter: { "d": RegExp(r'[0-9]') });

class ValidationChecker
{
  /*NAME VALIDATOR*/
  static bool isValidUserName(String value)
  {
    Pattern pattern = r'^((?![_., ])[a-zA-ZА-Яа-я0-9_., ]+(?<![_., ])){2,}$';
    // Pattern pattern = r'^((?![0-9_. ])[a-zA-ZА-Яа-я0-9_. ]+(?<![_. 0-9])){2,}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }
  /*CARGO DESCRIPTION VALIDATOR*/
  static bool isValidCargoDesc(String value)
  {
    Pattern pattern = r'^((?![0-9_. ])[a-zA-ZА-Яа-я0-9]+)$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  /*EMAIL VALIDATOR*/
  static bool isValidEmail(String emailText) {
    if (emailText == null || emailText.length < 1)
      return false;

    // Pattern pattern = r'^(?![_,-. @^])[a-zA-ZА-Яа-я0-9.,-_]+[a-zA-ZА-Яа-я0-9]+@([a-zA-Z]{4,})+\.([a-zA-Z]{2,})$';
    Pattern pattern = r'^([a-zA-Z0-9_\-\.\,]+)@([a-zA-Z]{4,})\.([a-zA-Z]{2,})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(emailText);
  }

  /*PHONE VALIDATOR*/
  static bool isValidPhone(String phone) {
    phone=phone.replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "").replaceAll("-", "");
    Pattern pattern = r'(^(?:[+7])?[0-9]{10,12}$)';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(phone);
  }

  /*NUMBER VALIDATOR*/
  static bool isValidNumber(String number) {
    print(number);
    Pattern pattern = r'^([0-9.])+(?<![.])$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(number);
  }
}