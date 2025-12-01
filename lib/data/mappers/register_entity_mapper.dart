import 'package:movies_app/data/models/register_response.dart';
import 'package:movies_app/domain/entity/register_response_entity.dart';

class RegisterEntityMapper {
  RegisterResponseEntity converterToRegisterEntity(RegisterResponse response) {
    String finalMessage = "";

    if (response.message is String) {
      finalMessage = response.message;
    } else if (response.message is List) {
      finalMessage = (response.message as List).join(", ");
    } else {
      finalMessage = "Something went wrong";
    }

    return RegisterResponseEntity(
      id: response.data?.id,
      name: response.data?.name,
      email: response.data?.email,
      phone: response.data?.phone,
      avatarId: response.data?.avaterId,
      message: finalMessage,
    );
  }
}
