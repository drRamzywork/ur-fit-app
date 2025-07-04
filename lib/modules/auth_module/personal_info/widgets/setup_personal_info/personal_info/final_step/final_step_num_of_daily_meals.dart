import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfit/core/assets_manager.dart';
import 'package:urfit/core/utils/app_assets.dart';

import '../../../../../../../core/shared/widgets/custom_buttons.dart';
import '../../../../../../../core/style/fonts.dart';
import '../../../../../../../core/utils/enums.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../controller/cubit/setup_personal_info_cubit.dart';
import '../../../shimmer_widgets/values_gridview_shimmer.dart';
import '../../animated_value_container.dart';
import '../../values_gridview.dart';

class FinalStepNumOfDailyMeals extends StatelessWidget {
  const FinalStepNumOfDailyMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetupPersonalInfoCubit>();
    cubit.getDietOptions();
    return BlocBuilder<SetupPersonalInfoCubit, SetupPersonalInfoState>(
      buildWhen: (previous, current) =>
          previous.userInfo.diet_id != current.userInfo.diet_id,
      builder: (context, state) {
        bool canProssed = state.userInfo.diet_id != null ;
        print("canProssed: ${state.userInfo.diet_id}");
        // final image = state.diet.firstWhere((diet) => diet.id == state.userInfo.diet_id).image;
        // if (image != null) {
        //
        // }

        return SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  LocaleKeys.dietType.tr(),
                  style: CustomTextStyle.semiBold_16,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                   CircleAvatar(
                    radius: 140,
                    backgroundColor: Color(0xff484848,).withValues(alpha: 0.7),
                  ),
                  CircleAvatar(
                    radius: 110,
                    backgroundColor: const Color(0xff575757),
                  ),
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: const Color(0xff575757),
                    backgroundImage: AssetImage(AssetsManager.noOfDailyMeals),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<SetupPersonalInfoCubit, SetupPersonalInfoState>(
                buildWhen: (p, c) =>
                    p.userInfo.diet_id != c.userInfo.diet_id ||
                    p.getDietOptionsState != c.getDietOptionsState,
                builder: (context, state) {
                  if (state.getDietOptionsState == RequestState.loading ||
                      state.getDietOptionsState == RequestState.failure) {
                    return const ValuesGridviewShimmer();
                  } else {
                    return ValuesGridView(
                      itemCount: state.diet.length,
                      itemBuilder: (_, index) => ValueContainer(
                        value: state.diet[index].name,
                        onTap: () => cubit.updateDietId(
                            state.diet[index].id),
                        isSelected: state.userInfo.diet_id ==
                            state.diet[index].id,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 32,
              ),
          
              // continue button
              CustomElevatedButton(
                text: LocaleKeys.continuee.tr(),
                padding: EdgeInsets.zero,
                onPressed: canProssed
                    ? () {
                        cubit.goToNextIndexFinalStep();
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
