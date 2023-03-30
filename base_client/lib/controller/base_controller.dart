import 'package:base_client/helper/dialog_helper.dart';
import 'package:base_client/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
      final message = error.message;
      DialogHelper.showErroDialog(description: message);
    } 
    else if (error is FetchDataException) {
      final message = error.message;
      DialogHelper.showErroDialog(description: message);
    }
     else if (error is ApiNotRespondingException) {
      DialogHelper.showErroDialog(description: 'Oops! It took longer to respond');
    }
  }
}
