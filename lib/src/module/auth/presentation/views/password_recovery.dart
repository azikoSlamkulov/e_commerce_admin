import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/util/app_constants/colors/app_colors.dart';
import '../../../../config/util/app_constants/sized/spaces.dart';
import '../../../../config/util/app_constants/text_styles/app_text_styles.dart';
import '../../../../config/util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../config/util/app_widgets/inputs/custom_text_form_field.dart';
import '../logic/auth_bloc.dart';
import '../logic/auth_event.dart';

// class PasswordRecoveryView extends StatelessWidget {
//   const PasswordRecoveryView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

class PasswordRecoveryView extends StatelessWidget {
  PasswordRecoveryView({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 45,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   OpenSignInEvent(),
                          // );
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.chevron_left_sharp,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  AppSized.h15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Восстановление пароля',
                        style: AppTextStyles.black30Bold,
                        // style: TextStyle(
                        //   fontSize: 30,
                        //   fontWeight: FontWeight.bold,
                        //   //fontFamily:
                        // ),
                      ),
                    ],
                  ),
                  AppSized.h70,
                  Text(
                    'Пожалуйста, введите свой адрес электронной почты. Вы получите ссылку для создания нового пароля по электронной почте.',
                    style: AppTextStyles.black16,
                    // style: TextStyle(fontSize: 16),
                  ),
                  AppSized.h30,
                  _eMail(context),
                  AppSized.h70,
                  _button(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _eMail(BuildContext context) {
    return CustomTextFormField(
      controller: emailCont,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
      labelText: 'Эл. почта',
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Поле не должно быть пустым!';
        } else if (!isEmail(value!)) {
          return 'Пример: your@email.com';
        }
        return null;
      },
    );
  }

  _button(BuildContext context) {
    return CustomElevatedButton(
      bgColor: AppColors.mainColor,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
      //borderRadius: 30,
      text: Text(
        'Отправить',
        style: AppTextStyles.white18,
        // style: TextStyle(
        //   //color: AppColors.blue,
        //   fontSize: 18,
        //   //fontWeight: FontWeight.bold,
        //   //fontFamily:
        // ),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          log('reg');
          //TODO Добавить востановление пароля
          // BlocProvider.of<AuthBloc>(context).add(
          //   SignUpEvent(
          //     name: nameCont.text,
          //     email: emailCont.text,
          //     password: passwordCont.text,
          //   ),
          // );
        }
      },
    );
  }
}
