extension StatusCodeExtension on int? {
  /// Returns true if the status code is 200 (OK).
  bool get isOK => this == 200;

  /// Returns true if the status code is 201 (Created).
  bool get isCREATED => this == 201;

  /// Returns true if the status code is 202 (Accepted).
  bool get isACCEPTED => this == 202;

  /// Returns true if the status code is 204 (No Content).
  bool get isNoCONTENT => this == 204;

  /// Returns true if the status code is 400 (Bad Request).
  bool get isBadREQUEST => this == 400;

  /// Returns true if the status code is 401 (Unauthorized).
  bool get isUNAUTHORIZED => this == 401;

  /// Returns true if the status code is 403 (Forbidden).
  bool get isFORBIDDEN => this == 403;

  /// Returns true if the status code is 404 (Not Found).
  bool get isNotFOUND => this == 404;

  /// Returns true if the status code is 406 (Not Acceptable).
  bool get isNotACCEPTABLE => this == 406;
}
