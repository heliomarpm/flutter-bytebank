import 'package:flutter_bloc/flutter_bloc.dart';

class NamedCubit extends Cubit<String> {
  NamedCubit(String name) : super(name);

  void changeName(String name) => emit(name);
}