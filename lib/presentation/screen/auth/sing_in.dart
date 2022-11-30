import 'package:pr2/data/repositories/auth_repository_impl.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/usercases/auth.dart';
import 'package:pr2/presentation/widgets/custom_button.dart';
import 'package:pr2/presentation/widgets/text_field_obscure.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;

  static final RegExp _loginRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 240, 212, 216),
              Color.fromARGB(255, 169, 171, 212)
            ],
          )),
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 230),
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                            key: _key,
                            child: Column(children: <Widget>[
                              const Text(
                                'Авторизация',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 26),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              TextFormField(
                                controller: _loginController,
                                validator: (value) {
                                  if (!_isValid) {
                                    return null;
                                  }
                                  if (value!.isEmpty) {
                                    return 'Поле логин пустое';
                                  }
                                  if (value.length < 3) {
                                    return 'Логин должен быть не менее 3 символов';
                                  }
                                  if (!_loginRegExp.hasMatch(value)) {
                                    return 'Логин должен содержать латинские символы, цифры, спецзнаки';
                                  }
                                  return null;
                                },
                                maxLength: 16,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  icon: Icon(Icons.person),
                                  labelText: "Логин",
                                ),
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                validator: (value) {
                                  if (!_isValid) {
                                    return null;
                                  }
                                  if (value!.isEmpty) {
                                    return 'Поле пароль пустое';
                                  }
                                  if (value.length < 8) {
                                    return 'Пароль должен быть длинной 8 символов';
                                  }
                                  if (!_passwordRegExp.hasMatch(value)) {
                                    return 'Пароль должен содержать латинские символы и цифры';
                                  }
                                  return null;
                                },
                                maxLength: 8,
                                obscureText: isObscure,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  icon: const Icon(Icons.lock),
                                  labelText: "Пароль",
                                  suffixIcon:
                                      TextFieldObscure(isObscure: (value) {
                                    setState(() {
                                      isObscure = value;
                                    });
                                  }),
                                ),
                                autocorrect: false,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: 170,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xfff2cbd0),
                                        Color(0xff8f93ea)
                                      ],
                                    ),
                                  ),
                                  child: MaterialButton(
                                      onPressed: () {
                                        _isValid = true;
                                        if (_key.currentState!.validate()) {
                                          signIn();
                                        } else {}
                                      },
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: const StadiumBorder(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const <Widget>[
                                            Text(
                                              'Войти',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ))),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 170,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xfff2cbd0),
                                        Color(0xff8f93ea)
                                      ],
                                    ),
                                  ),
                                  child: MaterialButton(
                                      onPressed: () {
                                        _loginController.clear();
                                        _passwordController.clear();
                                        _isValid = false;
                                        _key.currentState!.validate();
                                        Navigator.pushNamed(context, 'sign_up');
                                      },
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: const StadiumBorder(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const <Widget>[
                                            Text(
                                              'Создать аккаунт',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )))
                            ]))))
              ],
            ),
          ),
        ),
      ),
    );
  }

  //       child: Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Form(
  //           key: _key,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               const Expanded(child: SizedBox()),
  //               const Text(
  //                 'Книжный магазин',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(fontSize: 26),
  //               ),
  //               const Expanded(child: SizedBox()),
  //               TextFormField(
  //                 controller: _loginController,
  //                 validator: (value) {
  //                   if (!_isValid) {
  //                     return null;
  //                   }
  //                   if (value!.isEmpty) {
  //                     return 'Поле логин пустое';
  //                   }
  //                   if (value.length < 3) {
  //                     return 'Логин должен быть не менее 3 символов';
  //                   }
  //                   return null;
  //                 },
  //                 maxLength: 16,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Логин',
  //                   border: OutlineInputBorder(),
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               TextFormField(
  //                 controller: _passwordController,
  //                 validator: (value) {
  //                   if (!_isValid) {
  //                     return null;
  //                   }
  //                   if (value!.isEmpty) {
  //                     return 'Поле пароль пустое';
  //                   }
  //                   if (value.length < 8) {
  //                     return 'Пароль должен быть длинной 8 символов';
  //                   }
  //                   return null;
  //                 },
  //                 maxLength: 8,
  //                 obscureText: isObscure,
  //                 decoration: InputDecoration(
  //                   labelText: 'Пароль',
  //                   suffixIcon: TextFieldObscure(isObscure: (value) {
  //                     setState(() {
  //                       isObscure = value;
  //                     });
  //                   }),
  //                   border: const OutlineInputBorder(),
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               CustomButton(
  //                 content: 'Войти',
  //                 onPressed: () {
  //                   _isValid = true;
  //                   if (_key.currentState!.validate()) {
  //                     signIn();
  //                   } else {}
  //                 },
  //               ),
  //               // SizedBox(
  //               //   height: 35,
  //               //   child: ElevatedButton(
  //               //     onPressed: () {
  //               //       if (_key.currentState!.validate()) {
  //               //         signIn();
  //               //       } else {}
  //               //     },
  //               //     child: const Text(
  //               //       'Войти',
  //               //       style: TextStyle(fontSize: 18),
  //               //     ),
  //               //   ),
  //               // ),
  //               const Expanded(flex: 3, child: SizedBox()),
  //               InkWell(
  //                 borderRadius: BorderRadius.circular(4),
  //                 onTap: () {
  //                   _loginController.clear();
  //                   _passwordController.clear();
  //                   _isValid = false;
  //                   _key.currentState!.validate();
  //                   Navigator.pushNamed(context, 'sign_up');
  //                 },
  //                 child: const Padding(
  //                   padding: EdgeInsets.symmetric(vertical: 5),
  //                   child: Text(
  //                     'Регистрация в системе',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(fontSize: 20),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void signIn() async {
    final AuthRepositoryImlp auth = AuthRepositoryImlp();
    var result = await Auth(auth).signIn(AuthParams(
      login: _loginController.text,
      password: _passwordController.text,
    ));
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.errorMessage),
        ),
      );
    }, (r) {
      switch (r) {
        case RoleEnum.admin:
          {
            Navigator.pushReplacementNamed(context, 'admin');
            break;
          }
        case RoleEnum.user:
          Navigator.pushNamedAndRemoveUntil(
              context, 'client', (route) => false);
          break;
      }
    });
  }
}
