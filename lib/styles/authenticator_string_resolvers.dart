// import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/cupertino.dart';

class CustomButtonResolver extends ButtonResolver {
  const CustomButtonResolver();
  @override
  String signIn(BuildContext context) {
    return 'Увійти';
  }

  @override
  String backTo(BuildContext context, AuthenticatorStep previousStep) {
    return 'Повернутися';
  }

  @override
  String signUp(BuildContext context) {
    return 'Зареєструватися';
  }

  @override
  String forgotPassword(BuildContext context) {
    return 'Забули пароль?';
  }

  @override
  String submit(BuildContext context) {
    return 'Підтвердити';
  }
}

class CustomTitleResolver extends TitleResolver {
  const CustomTitleResolver();
  @override
  String resetPassword(BuildContext context) {
    return 'Відправити код';
  }

  @override
  String confirmResetPassword(BuildContext context) {
    return 'Cкинути пароль';
  }
}

class CustomInputResolver extends InputResolver {
  const CustomInputResolver();

  @override
  String confirmHint(BuildContext context, InputField field) {
    return 'Підтвердити пароль';
  }

  @override
  String hint(BuildContext context, InputField field) {
    final fieldName = title(context, field);
    final lowercasedFieldName = fieldName.toLowerCase();
    String modifiedName = lowercasedFieldName;
    switch (lowercasedFieldName) {
      case 'електронна пошта':
        modifiedName = 'електронну пошту';
        break;
      default:
        break;
    }
    return 'Введіть $modifiedName';
  }

  @override
  String title(BuildContext context, InputField field) {
    switch (field) {
      case InputField.username:
        return 'Імʼя користувача';
      case InputField.email:
        return 'Електронна пошта';
      case InputField.verificationCode:
        return 'Код підтвердження';
      case InputField.password:
        return 'Пароль';
      case InputField.passwordConfirmation:
        return 'Підтвердити пароль';
      case InputField.newPassword:
        return 'Новий пароль';
      case InputField.name:
        return 'Імʼя';
      case InputField.familyName:
        return 'Прізвище';
      default:
        return super.title(context, field);
    }
  }
}

class CustomMessageResolver extends MessageResolver {
  const CustomMessageResolver();

  @override
  String codeSent(BuildContext context, String destination) {
    return 'Код був відправлений на пошту $destination';
  }
}

const stringResolver = AuthStringResolver(
  buttons: CustomButtonResolver(),
  inputs: CustomInputResolver(),
  titles: CustomTitleResolver(),
  messages: CustomMessageResolver(),
);
