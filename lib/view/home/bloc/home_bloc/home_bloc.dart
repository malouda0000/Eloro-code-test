import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:eloro_shop_uae/core/func/hash_color_converter.dart';
import 'package:eloro_shop_uae/core/helpers/dio_helper.dart';
import 'package:eloro_shop_uae/view/home/model/opetion_group_moudel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Color theMainColor = Colors.white;
  List<OptionGroupsLi> allOptionsGroupList = [];
  int? mainSelectedOptionnnnGroupId;
  OptionGroupsLi? mainOptionsGroupList;
  List<Option> filteredMainOptionsGroupList = [];
  OptionGroupsLi? colorsOptionsGroupList;
  OptionGroupsLi? sizeOptionsGroupList;
  num mainOptionsGroupValue = 0;
  num colorsOptionsGroupValue = 0;
  List<Possibility> allThePossibilitiesList = [];
  List<Possibility> filteredPossibilities = [];
  HomeBloc() : super(HomeInitial()) {
    on<FetchOptions>(_onFetchOptions);
    on<MainOptionSelected>(_onMainOptionSelected);
    on<ColorOptionSelected>(_onColorOptionSelected);
    // on<SelectOption>(_onSelectionEditing);
  }

  Future<void> _onFetchOptions(
      FetchOptions event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final response = await DioHelper.fetchOptions();
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        final optionGroupsModel = OptionGroupModel.fromJson(data);
        // final availableOptions =
        //     AvailableOptionLis.fromJson(data['data']['availableOptionLis']);
        allThePossibilitiesList =
            optionGroupsModel.data.availableOptionLis.possibilities;
        // print("✅ grrrrrrrorurourp id :  = ${mainSelectedOptionnnnGroupId}");

        // update the mainoptionsGroupList
        for (var item in optionGroupsModel.data.optionGroupsLis) {
          if (item.isMain == true) {
            mainOptionsGroupList = item;
            mainSelectedOptionnnnGroupId = item.optionGroupId.toInt();
            // print("✅ grrrrrrrorurourp id :  = ${mainSelectedOptionnnnGroupId}");
          }
        }

        for (var item in optionGroupsModel.data.optionGroupsLis) {
          if (item.isColor == true) {
            colorsOptionsGroupList = item;
          }
        }

        for (var item in optionGroupsModel.data.optionGroupsLis) {
          if (item.optionGroupNameEn == "size") {
            sizeOptionsGroupList = item;
          }
        }

// filter the main avalible options
        if (mainOptionsGroupList != null) {
          if (mainOptionsGroupList!.options != null &&
              mainOptionsGroupList!.options.isNotEmpty) {
            for (var item in mainOptionsGroupList!.options) {
              // if(item.optionId   )

              for (var possibility in allThePossibilitiesList) {
                for (int i = 0; i < possibility.possibilityGroups.length; i++) {
                  if (possibility.possibilityGroups[i].optionId == item.optionId
                      //      &&
                      // possibility.possibilityGroups[i].optionId == event.mainOptionId
                      ) {
                    // print("==45978========694759084=${filteredPossibilities.length}");
                    filteredMainOptionsGroupList.add(item);
                  }
                }
              }
            }
          }
        } else {
          null;
        }
        // print("Fetched Available Options: ${allThePossibilitiesList}");

        // Extract all possibilities
        // List<PossibilityGroup> allPossibilities = availableOptions
        //     .possibilities!
        //     .expand((possibility) => possibility.possibilityGroups!)
        //     .toList();

        // emit(HomeLoaded(
        //   optionGroups: optionGroupsModel.data!.optionGroupsLis,
        //   availableOptions: [availableOptions],
        //   selectedOptions: {},
        //   filteredAvailableOptions:
        //       allPossibilities, // Initialize filtered options
        //   theMainColor: theMainColor,
        // ));

        emit(HomeLoaded(
          allOptionsGroupList: allOptionsGroupList,
          mainOptionsGroupList: mainOptionsGroupList!,
          filteredMainOptionsGroupList: filteredMainOptionsGroupList,
          mainOptionsGroupValue: mainOptionsGroupValue,
          colorsOptionsGroupList: colorsOptionsGroupList,
          colorsOptionsGroupValue: colorsOptionsGroupValue,
          sizeOptionsGroupList: sizeOptionsGroupList,
          allThePossibilitiesList: allThePossibilitiesList,
          filteredPossibilities: allThePossibilitiesList,
          // theMainColor: theMainColor,
        ));
      } else {
        emit(HomeError("Failed to fetch data: ${response.statusMessage}"));
      }
    } catch (e) {
      emit(HomeError("An error occurred: $e"));
    }
  }

  _onMainOptionSelected(MainOptionSelected event, Emitter<HomeState> emit) {
    // print("==========mainOptionSelected$mainSelectedOptionnnnGroupId ");
    // print("==========mainOptionSelected${event.mainOptionId} ");

    // #### this line of code was making problem #### //
    // mainSelectedOptionnnnGroupId = event.mainOptionId;
    if (state is HomeLoaded) {
      // final currentState = state as HomeLoaded;
      mainOptionsGroupValue = event.mainOptionId;

      filteredPossibilities = [];
      for (var possibility in allThePossibilitiesList) {
        for (int i = 0; i < possibility.possibilityGroups.length; i++) {
          if (possibility.possibilityGroups[i].optionGroupId ==
                  mainSelectedOptionnnnGroupId
              //      &&
              // possibility.possibilityGroups[i].optionId == event.mainOptionId
              ) {
            print("==45978========694759084=${filteredPossibilities.length}");
            filteredPossibilities.add(possibility);
          }
        }
      }

      print("===========" + "$filteredPossibilities");

      emit(HomeLoaded(
        mainOptionsGroupList: mainOptionsGroupList!,
        filteredMainOptionsGroupList: filteredMainOptionsGroupList,
        mainOptionsGroupValue: mainOptionsGroupValue,
        colorsOptionsGroupList: colorsOptionsGroupList,
        colorsOptionsGroupValue: colorsOptionsGroupValue,
        sizeOptionsGroupList: sizeOptionsGroupList,
        allOptionsGroupList: allOptionsGroupList,
        allThePossibilitiesList: allThePossibilitiesList,
        filteredPossibilities: allThePossibilitiesList,
      ));
    }
  }

  // #### this function is with the help of chat gpt #### //
  // _onMainOptionSelected(MainOptionSelected event, Emitter<HomeState> emit) {
  //   print(
  //       "========== mainSelectedOptionnnnGroupId BEFORE: $mainSelectedOptionnnnGroupId ");
  //   print("========== event.mainOptionId: ${event.mainOptionId} ");

  //   // #### this line of code was making problem #### //
  //   // mainSelectedOptionnnnGroupId = event.mainOptionId;
  //   mainOptionsGroupValue = event.mainOptionId;

  //   filteredPossibilities = [];

  //   for (var possibility in allThePossibilitiesList) {
  //     if (possibility.possibilityGroups.isEmpty) {
  //       print("⚠️ Empty possibilityGroups for possibility: $possibility");
  //       continue;
  //     }

  //     for (int i = 0; i < possibility.possibilityGroups.length; i++) {
  //       var groupId = possibility.possibilityGroups[i].optionGroupId;
  //       if (groupId == mainSelectedOptionnnnGroupId) {
  //         print("✅ Match Found: groupId = $groupId");
  //         filteredPossibilities.add(possibility);
  //       } else {
  //         print(
  //             "❌ No Match: Expected $mainSelectedOptionnnnGroupId, but got $groupId");
  //       }
  //     }
  //   }

  //   print("✅ Filtered Possibilities Count: ${filteredPossibilities.length}");

  //   emit(HomeLoaded(
  //     mainOptionsGroupList: mainOptionsGroupList!,
  //     mainOptionsGroupValue: mainOptionsGroupValue,
  //     colorsOptionsGroupList: colorsOptionsGroupList,
  //     colorsOptionsGroupValue: colorsOptionsGroupValue,
  //     sizeOptionsGroupList: sizeOptionsGroupList,
  //     allOptionsGroupList: allOptionsGroupList,
  //     allThePossibilitiesList: allThePossibilitiesList,
  //     filteredPossibilities: filteredPossibilities, // ✅ Correctly filtered list
  //   ));
  // }

  // _onColorOptionSelected(ColorOptionSelected event, Emitter<HomeState> emit) {
  //   if (state is HomeLoaded) {
  //     // final currentState = state as HomeLoaded;
  //     colorsOptionsGroupValue = event.colorOptionId;

  //     emit(HomeLoaded(
  //       mainOptionsGroupList: mainOptionsGroupList!,
  //       filteredMainOptionsGroupList: filteredMainOptionsGroupList,
  //       mainOptionsGroupValue: mainOptionsGroupValue,
  //       colorsOptionsGroupList: colorsOptionsGroupList,
  //       colorsOptionsGroupValue: colorsOptionsGroupValue,
  //       sizeOptionsGroupList: sizeOptionsGroupList,
  //       allOptionsGroupList: allOptionsGroupList,
  //       allThePossibilitiesList: allThePossibilitiesList,
  //       filteredPossibilities: allThePossibilitiesList,
  //     ));
  //   }
  // }

  void _onColorOptionSelected(
      ColorOptionSelected event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      // Update the selected color ID
      colorsOptionsGroupValue = event.colorOptionId;


// ####  #### //
  filteredPossibilities = [];
      for (var possibility in allThePossibilitiesList) {
        for (int i = 0; i < possibility.possibilityGroups.length; i++) {
          if (possibility.possibilityGroups[i].optionGroupId ==
                  mainSelectedOptionnnnGroupId
              //      &&
              // possibility.possibilityGroups[i].optionId == event.mainOptionId
              ) {
            print("==45978========694759084=${filteredPossibilities.length}");
            filteredPossibilities.add(possibility);
          }
        }
      }

// ####  #### //



      // Filter the possibilities list to include only those with the selected color
      // List<Possibility> newFilteredPossibilities = filteredPossibilities
filteredPossibilities = filteredPossibilities

          .where((possibility) => possibility.possibilityGroups
              .any((pg) => pg.optionId == event.colorOptionId))
          .toList();

      print("====453454353463464365=46=4634${filteredPossibilities}");
      emit(HomeLoaded(
        mainOptionsGroupList: mainOptionsGroupList!,
        filteredMainOptionsGroupList: filteredMainOptionsGroupList,
        mainOptionsGroupValue: mainOptionsGroupValue,
        colorsOptionsGroupList: colorsOptionsGroupList,
        colorsOptionsGroupValue: colorsOptionsGroupValue,
        sizeOptionsGroupList: sizeOptionsGroupList,
        allOptionsGroupList: allOptionsGroupList,
        allThePossibilitiesList: allThePossibilitiesList,
        filteredPossibilities:
            filteredPossibilities, // ✅ Update with the new filtered list
      ));
    }
  }

  // void _onSelectionEditing(SelectOption event, Emitter<HomeState> emit) {
  //   print("tttttttjtjtjtjtjtjtjt");
  //   if (state is HomeLoaded) {
  //     final currentState = state as HomeLoaded;
  //     final newSelectedOptions =
  //         Map<int, int>.from(currentState.selectedOptions);
  //     newSelectedOptions[event.groupId] = event.optionId;

  //     // Update the main color if a color is selected
  //     if (event.colorHash != null) {
  //       theMainColor = hexToColor(event.colorHash!);
  //     }

  //     // Filter available options based on the selected color
  //     // List<PossibilityGroup> filteredAvailableOptions = [];
  //     List<PossibilityGroup> filteredAvailableOptions = currentState
  //         .availableOptions
  //         .expand((available) => available.possibilities!)
  //         .expand((possibility) => possibility.possibilityGroups!)
  //         .toList();

  //     final isColorSelected = currentState.optionGroups
  //         .firstWhere((group) => group.optionGroupId == event.groupId)
  //         .isColor;

  //     if (isColorSelected) {
  //       filteredAvailableOptions = currentState.availableOptions
  //           .expand((available) => available.possibilities!)
  //           .where((possibility) => possibility.possibilityGroups!.any((pg) =>
  //               pg.optionGroupId == event.groupId &&
  //               pg.optionId == event.optionId))
  //           .expand((possibility) => possibility.possibilityGroups!)
  //           .where((pg) => pg.optionGroupId != event.groupId)
  //           .toList();

  //       // Reset the selected size when changing color
  //       final sizeGroup = currentState.optionGroups.firstWhere(
  //           (g) => !g.isColor,
  //           orElse: () => currentState.optionGroups.last);
  //       newSelectedOptions.remove(sizeGroup.optionGroupId);
  //     }

  //     emit(HomeLoaded(
  //       optionGroups: currentState.optionGroups,
  //       availableOptions: currentState.availableOptions,
  //       selectedOptions: newSelectedOptions,
  //       filteredAvailableOptions: filteredAvailableOptions,
  //       theMainColor: theMainColor,
  //     ));
  //   }
  // }
}
