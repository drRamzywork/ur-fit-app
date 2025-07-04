import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:urfit/core/style/colors.dart';
import 'package:urfit/core/utils/app_assets.dart';

import '../../../../../../../core/shared/widgets/custom_buttons.dart';
import '../../../../../../../core/style/fonts.dart';
import '../../../../../../../core/utils/enums.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../bloc/authentication_bloc.dart';
import '../../../../controller/cubit/setup_personal_info_cubit.dart';
import '../../../equipment_item.dart';
import '../../../shimmer_widgets/equipment_shimmer.dart';
import '../../../shimmer_widgets/values_gridview_shimmer.dart';
import '../../animated_value_container.dart';
import '../../values_gridview.dart';

class FinalStepWorkTypes extends StatelessWidget {
  const FinalStepWorkTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetupPersonalInfoCubit>();
    cubit.getWorkoutTypes();
    final user = context.read<AuthenticationBloc>().currentUser;

    return BlocBuilder<SetupPersonalInfoCubit, SetupPersonalInfoState>(
      buildWhen: (previous, current) => previous.userInfo.workoutTypesIds != current.userInfo.workoutTypesIds ,
      builder: (context, state) {
        bool canProssed = state.userInfo.workoutTypesIds.isNotEmpty;
        print("canProssed: ${state.userInfo.workoutTypesIds}");
        return SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width  - 32,
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.preferredEquipment.tr(),
                        style: CustomTextStyle.semiBold_16,
                        textAlign: TextAlign.start,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          print("showBottomSheet ${state.workoutTypes}");
          
                          showBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (ctx) {
                              final user = context.read<AuthenticationBloc>().currentUser;
          
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Center(
                                              child: Container(
                                                width: 62,
                                                height: 4,
                                                decoration: BoxDecoration(
                                                  color: AppColors.backGround,
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              )
                                            ),
                                          ),
          
                                          Align(
                                            alignment: AlignmentDirectional.centerEnd,
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: AppColors.greyColor)),
                                                  child: FittedBox(child: CloseButton(color: Colors.black,)))),
          
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: SvgPicture.asset(AppAssets.iconsMeals,colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),height: 32,),
                                    ),
                                    SizedBox(height: 12,),
                                    Text(
                                      LocaleKeys.preferredEquipment.tr(),
                                      style: CustomTextStyle.semiBold_16.copyWith(color: Theme.of(context).colorScheme.primary),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 16,),
          
                               BlocBuilder<SetupPersonalInfoCubit, SetupPersonalInfoState>(
                                buildWhen: (p, c) =>
                                p.userInfo.workoutTypesIds != c.userInfo.workoutTypesIds ||
                                    p.getWorkoutTypesState != c.getWorkoutTypesState,
                                builder: (context, state) {
                                  print("state liked meals ${state.userInfo.likedMealsIds}");
                                  if (state.getWorkoutTypesState == RequestState.loading ||
                                      state.getWorkoutTypesState == RequestState.failure) {
                                    return const ValuesGridviewShimmer();
                                  } else {
                                    return ValuesGridView(
                                      itemCount: state.workoutTypes.length,
                                      itemBuilder: (_, index) => ValueContainer(
                                        value: state.workoutTypes[index].name,
                                        onTap: () {
                                          cubit.updateSelectedWorkoutTypes(state.workoutTypes[index].id);
                                        },
                                        isSelected: state.userInfo.workoutTypesIds.contains(
                                          state.workoutTypes[index].id,
                                        ) ,
                                      ),
                                    );
                                  }
                                },
                              ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    CustomElevatedButton(
                                      text: LocaleKeys.confirm.tr(),
                                      padding: EdgeInsets.zero,
                                      onPressed: canProssed
                                          ? () {
                                        context.pop();
                                      }
                                          : null,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          LocaleKeys.seeMore.tr(),
                          style: CustomTextStyle.semiBold_16.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
              const SizedBox(height: 16),
              BlocBuilder<SetupPersonalInfoCubit, SetupPersonalInfoState>(
                buildWhen: (p, c) =>
                    (p.userInfo.workoutTypesIds != c.userInfo.workoutTypesIds) ||
                    (p.getWorkoutTypesState != c.getWorkoutTypesState),
                builder: (context, state) {
                  if (state.getWorkoutTypesState == RequestState.loading ||
                      state.getWorkoutTypesState == RequestState.failure) {
                    return const EquipmentShimmer();
                  } else {
                    return Animate(
                      effects: const [FadeEffect()],
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.workoutTypes.length > 4 ? 4 : state.workoutTypes.length,
                        itemBuilder: (context, index) => EquipmentItem(
                          title: state.workoutTypes[index].name,
                          imageUrl: state.workoutTypes[index].image ?? "",
                          onTap: () => cubit.updateSelectedWorkoutTypes(state.workoutTypes[index].id),
                          isSelected: state.userInfo.workoutTypesIds.contains(
                                state.workoutTypes[index].id,
                              )
                        ),
                      ),
                    );
                  }
                },
              ),
              // continue button
              CustomElevatedButton(
                text: LocaleKeys.continuee.tr(),
                padding: EdgeInsets.zero,
                onPressed: canProssed
                    ? () {
                        cubit.goToNextPage();
                      }
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
