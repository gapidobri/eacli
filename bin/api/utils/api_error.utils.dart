import 'package:dcli/dcli.dart';

import '../models/api_error.model.dart';

showApiError(Object? error) {
  try {
    if (error == null) {
      throw Error();
    }

    final json = error as Map<String, dynamic>;
    final apiError = ApiError.fromJson(json['error']);

    print(red(apiError.userMessage));
  } catch (e) {
    print('An unknown error occured');
  }
}
