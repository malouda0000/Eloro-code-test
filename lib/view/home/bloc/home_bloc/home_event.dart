part of 'home_bloc.dart';

// Events
abstract class HomeEvent {}

class FetchOptions extends HomeEvent {}

class MainOptionSelected extends HomeEvent {
  final int mainOptionId;
  // final int mainSelectedOptionnnnGroupId;
  MainOptionSelected({required this.mainOptionId, 
  
  // required this.mainSelectedOptionnnnGroupId,
  });
}

class ColorOptionSelected extends HomeEvent {
  final int colorOptionId;
  ColorOptionSelected({required this.colorOptionId});
}

class SelectOption extends HomeEvent {
  final int groupId;
  final int optionId;
  final String? colorHash;
  SelectOption({required this.groupId, required this.optionId, this.colorHash});
}
