import 'package:pr2/core/exception/failure.dart';
import 'package:pr2/core/usercases/auth_user_case.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class Auth implements AuthUserCase<Failure, AuthParams> {
  final AuthRepositories authRepositories;

  Auth(this.authRepositories);

  @override
  Future<Either<Failure, bool>> signUp(AuthParams params) async {
    return await authRepositories.signUp(params.login, params.password);
  }

  @override
  Future<Either<Failure, RoleEnum>> signIn(AuthParams params) async {
    return await authRepositories.signIn(params.login, params.password);
  }
}

class AuthParams {
  final String login;
  final String password;

  AuthParams({
    required this.login,
    required this.password,
  });
}
