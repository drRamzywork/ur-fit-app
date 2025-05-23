import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfit/modules/auth_module/personal_info/controller/cubit/setup_personal_info_cubit.dart';
import 'package:urfit/modules/auth_module/personal_info/widgets/equipment_selection_page.dart';
import 'package:urfit/modules/auth_module/personal_info/widgets/setup_personal_info/setup_onboarding.dart';
import 'package:urfit/modules/auth_module/personal_info/widgets/setup_personal_info.dart';

class SetupPersonalInfoScreen extends StatelessWidget {
  const SetupPersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetupPersonalInfoCubit>();

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: cubit.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            SetupPersonalInfoOnboarding(),
            SetupPersonalInfo(),
            EquipmentSelectionPage(),
          ],
        ),
      ),
    );
  }
}
