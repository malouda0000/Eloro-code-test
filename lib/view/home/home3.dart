import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/func/hash_color_converter.dart';
import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
import 'package:eloro_shop_uae/view/shared/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchOptions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          "Eloro Shop UAE",
          style: TextStyle(
            color: AppColors.darkBgColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CustomLoadingScreen());
            } else if (state is HomeLoaded) {
              final optionsGroupName = state.optionGroups.firstWhere(
                (group) => group.isColor == true,
                orElse: () => state.optionGroups.first,
              );
              final sizeGroup = state.optionGroups.firstWhere(
                (group) => group.isColor == false,
                orElse: () => state.optionGroups.last,
              );

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  // primary: true,

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "The Active Option",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBgColor,
                          ),
                        ),

                        AppConstants.emptySpaceFifteenPixl,

                        const _ProductImageContainer(),

                        AppConstants.emptySpaceFifteenPixl,

                        ///
                        ///
                        ///
                        ///
                        ///
                        // property widget
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       // Proberte Name,
                        //       optionsGroupName.optionGroupNameEn ?? "Property",
                        //       style: const TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.bold,
                        //         color: AppColors.darkBgColor,
                        //       ),
                        //     ),
                        //     SingleChildScrollView(
                        //       // Property Row
                        //       padding: const EdgeInsets.symmetric(
                        //         horizontal:
                        //             AppConstants.theDefBaddingFifteenPixl,
                        //         vertical: AppConstants.theDefBaddingFifteenPixl,
                        //       ),
                        //       scrollDirection: Axis.horizontal,
                        //       physics: const BouncingScrollPhysics(),
                        //       child: Row(
                        //         children:
                        //             optionsGroupName.options.map((option) {
                        //           return Container(
                        //             clipBehavior: Clip.hardEdge,
                        //             margin: const EdgeInsets.symmetric(
                        //               horizontal: 8,
                        //             ),
                        //             alignment: Alignment.center,
                        //             height: 100,
                        //             width: 100,
                        //             decoration: BoxDecoration(
                        //               borderRadius:
                        //                   AppConstants.theNewBorderRadiusTenPX,
                        //               color: hexToColor(option.colorHash),
                        //               // border: Border.all(
                        //               //   color: AppColors.greyColor,
                        //               // ),
                        //             ),
                        //             child: SizedBox.expand(
                        //               child: InkWell(
                        //                 radius: 10,
                        //                 onTap: () {
                        //                   context
                        //                       .read<HomeBloc>()
                        //                       .add(SelectOption(
                        //                         groupId: optionsGroupName
                        //                             .optionGroupId!,
                        //                         optionId: option.optionId!,
                        //                       ));
                        //                 },
                        //                 child: Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: [
                        //                     Radio<int>(
                        //                       value: option.optionId!,
                        //                       groupValue: state.selectedOptions[
                        //                           optionsGroupName
                        //                               .optionGroupId],
                        //                       onChanged: (value) {
                        //                         // print("vvvvvvvvvvvvvvvv$value");
                        //                         context
                        //                             .read<HomeBloc>()
                        //                             .add(SelectOption(
                        //                               groupId: optionsGroupName
                        //                                   .optionGroupId!,
                        //                               optionId:
                        //                                   option.optionId!,
                        //                             ));
                        //                       },
                        //                       activeColor: AppColors.mainColor,
                        //                     ),
                        //                     Text(option.nameEn ?? "Option"),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           );
                        //         }).toList(),
                        //       ),
                        //     ),
                        //     const SizedBox(height: 16.0),
                        //   ],
                        // ),

////
                        ///
                        ///
                        ///
                        ///

                        // Column(
                        //   // dynamic options veiwing in the home page
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: state.optionGroups.map((optionsGroupName) {
                        //     return Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           optionsGroupName.optionGroupNameEn ??
                        //               "Property",
                        //           style: const TextStyle(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.bold,
                        //             color: AppColors.darkBgColor,
                        //           ),
                        //         ),
                        //         SingleChildScrollView(
                        //           padding: const EdgeInsets.symmetric(
                        //             horizontal:
                        //                 AppConstants.theDefBaddingFifteenPixl,
                        //             vertical:
                        //                 AppConstants.theDefBaddingFifteenPixl,
                        //           ),
                        //           scrollDirection: Axis.horizontal,
                        //           physics: const BouncingScrollPhysics(),
                        //           child: Row(
                        //             children:
                        //                 optionsGroupName.options.map((option) {
                        //               return Container(
                        //                 clipBehavior: Clip.hardEdge,
                        //                 margin: const EdgeInsets.symmetric(
                        //                     horizontal: 8),
                        //                 alignment: Alignment.center,
                        //                 height: 100,
                        //                 width: 100,
                        //                 decoration: BoxDecoration(
                        //                   borderRadius: AppConstants
                        //                       .theNewBorderRadiusTenPX,
                        //                   color: option.colorHash == null ||
                        //                           option.colorHash.isEmpty
                        //                       ? Colors.white
                        //                       : hexToColor(option.colorHash),
                        //                 ),
                        //                 child: SizedBox.expand(
                        //                   child: InkWell(
                        //                     radius: 10,
                        //                     onTap: () {
                        //                       context
                        //                           .read<HomeBloc>()
                        //                           .add(SelectOption(
                        //                             groupId: optionsGroupName
                        //                                 .optionGroupId!,
                        //                             optionId: option.optionId!,
                        //                           ));
                        //                     },
                        //                     child: Column(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.center,
                        //                       children: [
                        //                         Radio<int>(
                        //                           value: option.optionId!,
                        //                           groupValue:
                        //                               state.selectedOptions[
                        //                                   optionsGroupName
                        //                                       .optionGroupId],
                        //                           onChanged: (value) {
                        //                             context
                        //                                 .read<HomeBloc>()
                        //                                 .add(SelectOption(
                        //                                   groupId:
                        //                                       optionsGroupName
                        //                                           .optionGroupId,
                        //                                   optionId:
                        //                                       option.optionId,
                        //                                 ));
                        //                           },
                        //                           activeColor:
                        //                               AppColors.mainColor,
                        //                         ),
                        //                         Text(option.nameEn ?? "Option"),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //               );
                        //             }).toList(),
                        //           ),
                        //         ),
                        //         const SizedBox(height: 16.0),
                        //       ],
                        //     );
                        //   }).toList(),
                        // ),

                        ///
                        ///
                        ///
                        ///
                        ///

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: state.optionGroups.map((optionsGroupName) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  optionsGroupName.optionGroupNameEn ??
                                      "Property",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkBgColor,
                                  ),
                                ),
                                SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        AppConstants.theDefBaddingFifteenPixl,
                                    vertical:
                                        AppConstants.theDefBaddingFifteenPixl,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    children:
                                        optionsGroupName.options.map((option) {
                                      // just refresh
                                      // Check if the option is available
                                      // final isEnabled = state
                                      //     .filteredAvailableOptions
                                      //     .any((pg) =>
                                      //         pg.optionGroupId ==
                                      //             optionsGroupName
                                      //                 .optionGroupId &&
                                      //         pg.optionId == option.optionId);

                                      final isEnabled = state
                                              .filteredAvailableOptions
                                              .isEmpty ||
                                          state.filteredAvailableOptions.any(
                                              (pg) =>
                                                  pg.optionGroupId ==
                                                      optionsGroupName
                                                          .optionGroupId &&
                                                  pg.optionId ==
                                                      option.optionId);

                                      return Container(
                                        clipBehavior: Clip.hardEdge,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        alignment: Alignment.center,
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: AppConstants
                                              .theNewBorderRadiusTenPX,
                                          color: option.colorHash == null ||
                                                  option.colorHash.isEmpty
                                              ? Colors.white
                                              : hexToColor(option.colorHash),
                                        ),
                                        child: SizedBox.expand(
                                          child: InkWell(
                                            radius: 10,
                                            onTap: isEnabled
                                                ? () {
                                                    context
                                                        .read<HomeBloc>()
                                                        .add(SelectOption(
                                                          groupId:
                                                              optionsGroupName
                                                                  .optionGroupId!,
                                                          optionId:
                                                              option.optionId!,
                                                          colorHash:
                                                              option.colorHash,
                                                        ));
                                                  }
                                                : null, // Disable tap if not enabled
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Radio<int>(
                                                  value: option.optionId!,
                                                  groupValue:
                                                      state.selectedOptions[
                                                          optionsGroupName
                                                              .optionGroupId],
                                                  onChanged: isEnabled
                                                      ? (value) {
                                                          context
                                                              .read<HomeBloc>()
                                                              .add(SelectOption(
                                                                groupId:
                                                                    optionsGroupName
                                                                        .optionGroupId!,
                                                                optionId: option
                                                                    .optionId!,
                                                                colorHash: option
                                                                    .colorHash,
                                                              ));
                                                        }
                                                      : null, // Disable radio if not enabled
                                                  activeColor:
                                                      AppColors.mainColor,
                                                ),
                                                Text(option.nameEn ?? "Option"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                              ],
                            );
                          }).toList(),
                        ),

                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///

                        // Size Selection (Updated dynamically based on color selection)
                        // Text(
                        //   sizeGroup.optionGroupNameEn ?? "Sizes",
                        //   style: const TextStyle(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //     color: AppColors.darkBgColor,
                        //   ),
                        // ),
                        // SingleChildScrollView(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: AppConstants.theDefBaddingFifteenPixl,
                        //     vertical: AppConstants.theDefBaddingFifteenPixl,
                        //   ),
                        //   scrollDirection: Axis.horizontal,
                        //   physics: const BouncingScrollPhysics(),
                        //   child: Row(
                        //     children: sizeGroup.options!.map((option) {
                        //       final isEnabled = state.filteredAvailableOptions
                        //           .any((pg) =>
                        //               pg.optionGroupId ==
                        //                   sizeGroup.optionGroupId &&
                        //               pg.optionId == option.optionId);
                        //       return InkWell(
                        //         onTap: () {
                        //           if (isEnabled) {
                        //             context.read<HomeBloc>().add(SelectOption(
                        //                   groupId: sizeGroup.optionGroupId,
                        //                   optionId: option.optionId,
                        //                 ));
                        //           }
                        //         },
                        //         child: Container(
                        //           margin: const EdgeInsets.symmetric(
                        //             horizontal: 8,
                        //           ),
                        //           alignment: Alignment.center,
                        //           height: 100,
                        //           width: 100,
                        //           decoration: BoxDecoration(
                        //             borderRadius:
                        //                 AppConstants.theNewBorderRadiusTenPX,
                        //             boxShadow: AppConstants.theBoxShdow,
                        //             color: Theme.of(context).cardColor,
                        //             // border: Border.all(
                        //             //   color:   AppColors.greyColor,
                        //             // ),
                        //           ),
                        //           child: Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Radio<int>(
                        //                 value: option.optionId,
                        //                 groupValue: state.selectedOptions[
                        //                     sizeGroup.optionGroupId],
                        //                 onChanged: isEnabled
                        //                     ? (value) {
                        //                         context
                        //                             .read<HomeBloc>()
                        //                             .add(SelectOption(
                        //                               groupId: sizeGroup
                        //                                   .optionGroupId!,
                        //                               optionId:
                        //                                   option.optionId!,
                        //                             ));
                        //                       }
                        //                     : null,
                        //                 activeColor: AppColors.mainColor,
                        //               ),
                        //               Text(option.nameEn ?? "Option"),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   ),
                        // ),

                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Sorry no data available"));
          },
        ),
      ),
    );
  }
}

// class _ProductImageContainer extends StatelessWidget {
//   const _ProductImageContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 350,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: AppConstants.theNewBorderRadiusTenPX,
//         // boxShadow: AppConstants.theBoxShdow,
//         border: Border.all(
//           color: AppColors.greyColor,
//         ),
//         color: Theme.of(context).cardColor,
//       ),
//       child: Column(
//         children: [
//           Expanded(
//               child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               //  color: hexToColor(option.colorHash)  ,

//               // color: state.theMainColor ?? Colors.black,

//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//             ),
//           )),
//           const SizedBox(
//             height: 70,
//             width: double.infinity,
//             child: Center(
//               child: Text(
//                 "Colors name",
//                 // textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.darkBgColor,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

///
///
///
///
///
///

class _ProductImageContainer extends StatelessWidget {
  const _ProductImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Color containerColor = Colors.white;
        if (state is HomeLoaded) {
          containerColor = state.theMainColor ?? Colors.white;
        }

        return Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: AppConstants.theNewBorderRadiusTenPX,
            border: Border.all(
              color: AppColors.greyColor,
            ),
            color: containerColor,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                  )),
                  child: const SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Colors name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBgColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}



// #### home screen V2 #### //


