import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfit/modules/auth_module/bloc/authentication_bloc.dart';

import '../../../modules/auth_module/personal_info/controller/cubit/setup_personal_info_cubit.dart';
import '../../../modules/auth_module/personal_info/widgets/equipment_item.dart';
import '../../../modules/auth_module/personal_info/widgets/shimmer_widgets/equipment_shimmer.dart';
import '../../utils/enums.dart';

class EquipmentList extends StatelessWidget {
  final SetupPersonalInfoCubit cubit ;
  const EquipmentList({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationBloc>().currentUser;
    return BlocBuilder<SetupPersonalInfoCubit, SetupPersonalInfoState>(
      buildWhen: (p, c) =>
      (p.userInfo.equipmentsIds != c.userInfo.equipmentsIds) ||
          (p.getEquipmentsState != c.getEquipmentsState),
      builder: (context, state) {
        if (state.getEquipmentsState == RequestState.loading ||
            state.getEquipmentsState == RequestState.failure) {
          return const EquipmentShimmer();
        } else {
          return Animate(
            effects: const [FadeEffect()],
            child: ListView.builder(
              itemCount: state.equipments.length,
              itemBuilder: (context, index) => EquipmentItem(
                title: state.equipments[index].name,
                imageUrl: state.equipments[index].image ?? "",
                onTap: () =>
                    cubit.updateSelectedEquipments(state.equipments[index].id),
                isSelected: state.userInfo.equipmentsIds.contains(
                  state.equipments[index].id,
                ) || (user != null && user.equipments != null && user.equipments!.any((equipment) => equipment.id == state.equipments[index].id)),
              ),
            ),
          );
        }
      },
    );
  }
}
