import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfit/core/utils/constants.dart';
import 'package:urfit/core/shared/widgets/weak_days_date.dart';
import 'package:urfit/core/shared/widgets/package_progress_exercise.dart';
import 'package:urfit/modules/auth_module/bloc/authentication_bloc.dart';
import 'package:urfit/modules/workout_module/controller/workout_cubit.dart';
import 'package:urfit/modules/workout_module/data/model/workout_model.dart';
import 'package:urfit/modules/workout_module/widgets/shimmer/start_workout_card_shimmer.dart';
import 'package:urfit/modules/workout_module/widgets/shimmer/workout_detail_card_shimmer.dart';
import 'package:urfit/modules/workout_module/workout_widgets/start_workout_card.dart';
import 'package:urfit/modules/workout_module/workout_widgets/today_workout_details_card.dart';
import 'package:urfit/modules/workout_module/workout_widgets/weight_progress_card.dart';

import '../../core/const.dart';
import '../../core/utils/enums.dart';
import '../../generated/locale_keys.g.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    super.initState();
    final user = context
        .read<AuthenticationBloc>()
        .currentUser;
    final cubit = context.read<WorkoutCubit>();
    if (user?.haveExercisePlan == true && user?.hasValidSubscription == true) {
      cubit.getWorkOutPlan().then((value) {;
        setState(() {});
      });
    } else
    if (user?.haveExercisePlan == false && user?.hasValidSubscription == true &&
        (user?.packageId == 3 || user?.packageId == 6 || user?.packageId == 9 ||
            user?.packageId == 2 || user?.packageId == 3 ||
            user?.packageId == 5 || user?.packageId == 8)) {
      cubit.generateWorkOutPlan().then((value) {;
        Future.delayed(Duration(milliseconds: 500), () {
          cubit.getWorkOutPlan();
          setState(() {});
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final user = context
        .read<AuthenticationBloc>()
        .currentUser;
    final cubit = context.read<WorkoutCubit>();


    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        return Scaffold(
          body: user?.haveExercisePlan == true  || state.getWorkOutPlanState == RequestState.loading || state.allPlans.isNotEmpty ? ListView(
            padding: const EdgeInsets.only(
              bottom: kBottomPadding,
              left: kHorizontalPadding,
              right: kHorizontalPadding,
            ),
            children: [
              // package progress and end date
              PackageProgressExercise(),

              const SizedBox(height: 16),

              // todays date
              const WeakDaysDate(),

              const SizedBox(height: 16),

              // workout details (calories, workout duration ...)
              BlocBuilder<WorkoutCubit, WorkoutState>(
                buildWhen: (p, c) =>
                p.allPlans != c.allPlans ||
                    p.getWorkOutPlanState != c.getWorkOutPlanState,
                builder: (context, state) {
                  if (state.getWorkOutPlanState == RequestState.loading ||
                      state.getWorkOutPlanState == RequestState.failure) {
                    return const WorkoutDetailCardShimmer();
                  } else {
                    if (cubit.getPlanForToday() != null) {
                      return const TodayWorkoutDetailsCard();
                    } else {
                      return SizedBox();
                    }
                  }
                },
              ),

              const SizedBox(height: 16),

              // weight progress bar
              // if(cubit.getPlanForToday() != null)
              // const WeightProgressCard(),
              // if(cubit.getPlanForToday() != null)
              const SizedBox(height: 16),
              // if(cubit.getPlanForToday() != null)

              // today's workout card
              BlocBuilder<WorkoutCubit, WorkoutState>(
                // buildWhen: (p, c) =>
                //     p.allPlans != c.allPlans ||
                //     p.getWorkOutPlanState != c.getWorkOutPlanState,
                  builder: (context, state) {
                    if (state.getWorkOutPlanState == RequestState.loading ||
                        state.getWorkOutPlanState == RequestState.failure) {
                      return StartWorkoutCardShimmer();
                    } else {
                      if (cubit.getPlanForToday() == null) {
                        return const Center(
                            child: Text('لا يوجد تمرين لهذا اليوم'));
                      } else {
                        return StartWorkoutCard();
                      }
                    }
                  }),

            ],
          ) : Center(
              child: Text(LocaleKeys.noSubscription.tr())),
        );
      },
    );
  }
}
