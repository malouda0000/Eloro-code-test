part of 'home_bloc.dart';
abstract class HomeState {}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  // final List<OptionGroupsLi> optionGroups;
  // final List<AvailableOptionLis> availableOptions;
  // final Map<int, int> selectedOptions;
  // final List<PossibilityGroup> filteredAvailableOptions;
  // final Color? theMainColor;


  // Color? theMainColor = Colors.white;
  List<OptionGroupsLi> allOptionsGroupList = [];
  OptionGroupsLi mainOptionsGroupList ;
  List<Option> filteredMainOptionsGroupList ;
  OptionGroupsLi? colorsOptionsGroupList ;
  OptionGroupsLi? sizeOptionsGroupList ;
  num? mainOptionsGroupValue ;
  num? colorsOptionsGroupValue ;
  List<Possibility> allThePossibilitiesList = [];
  List<Possibility> filteredPossibilities = [];

  HomeLoaded({
    required this.allOptionsGroupList,
    required this.mainOptionsGroupList,
    required this.filteredMainOptionsGroupList,
    required this.mainOptionsGroupValue,
    required this.colorsOptionsGroupList,
    required this.colorsOptionsGroupValue,
    required this.sizeOptionsGroupList,
    required this.allThePossibilitiesList,
    required this.filteredPossibilities,
    // required this.theMainColor,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
class OptionSelectionUpdated extends HomeState {
  final Map<int, int> selectedOptions;
  OptionSelectionUpdated(this.selectedOptions);
}
