import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfit/core/assets_manager.dart';
import 'package:urfit/core/style/colors.dart';
import 'package:urfit/core/style/fonts.dart';

import '../../../../core/shared/widgets/custom_image_view.dart';
import '../../../auth_module/bloc/authentication_bloc.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user =context.read<AuthenticationBloc>().currentUser;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        // user image
         CircleAvatar(
          radius: 26,
          backgroundImage: customImageView(AssetsManager.profileImage)
        ),

        const SizedBox(width: 8),

        // user name
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.bold_16,
              ),

              const SizedBox(height: 6),

              // email
              Text(
                user.email.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.regular_16.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
