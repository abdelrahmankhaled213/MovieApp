import 'package:equatable/equatable.dart';
 class AppError extends Equatable{
  final AppErrorType type;
  const AppError(this.type);
  @override
  List<Object> get props => [type];
}
enum AppErrorType{
  network,
  server,
  DataBase
}
