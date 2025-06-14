import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urfit/core/assets_manager.dart';
import 'package:urfit/core/routes/routes.dart';
import 'package:urfit/core/shared/appCubit/app_cubit.dart';
import 'package:urfit/core/style/colors.dart';
import 'package:urfit/core/style/fonts.dart';
import 'package:urfit/core/utils/app_assets.dart';
import 'package:urfit/core/utils/constants.dart';
import 'package:urfit/generated/locale_keys.g.dart';
import 'package:urfit/modules/profile_module/widgets/account_info_sectiond.dart';
import 'package:urfit/core/shared/widgets/app_language_buttons.dart';
import 'package:urfit/core/shared/widgets/default_list_tile.dart';

import '../../subscription_module/data/models/package_model.dart';

class ProfileScreen extends StatelessWidget {
  final bool isGuest;

  const ProfileScreen({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.only(
              bottom: 50,
              left: kHorizontalPadding,
              right: kHorizontalPadding,
            ),
            children: [
              // account info
              const AccountInfo(),

              const SizedBox(height: 12),

              // app language
              const AppLanguageButtons(),

              const SizedBox(height: 28),

              const Divider(
                color: AppColors.strockColor,
              ),

              const SizedBox(height: 12),

              // my plan tile
              DefaultListTile(
                onTap: () => GoRouter.of(context).push(Routes.myPlanScreen),
                title: LocaleKeys.myPlan.tr(),
                leadingIconSvgPath: AppAssets.iconsPaper,
              ),

              const Divider(
                color: AppColors.strockColor,
              ),

              // previous plan tile
              DefaultListTile(
                onTap: () =>
                    GoRouter.of(context).push(Routes.myPreviousPlanScreen),
                title: LocaleKeys.previousPlan.tr(),
                leadingIconSvgPath: AppAssets.iconsPaper2,
              ),

              const Divider(
                color: AppColors.strockColor,
              ),

              // subscription tile
              DefaultListTile(
                onTap: () => GoRouter.of(context)
                    .push(Routes.subscriptionPlansScreen, extra: PlanType.both),
                title: LocaleKeys.subscribe.tr(),
                leadingIconSvgPath: AppAssets.iconsCopy,
              ),

              const Divider(
                color: AppColors.strockColor,
              ),

              // settings tile
              DefaultListTile(
                onTap: () => GoRouter.of(context).push(Routes.settingsScreen),
                title: LocaleKeys.settings.tr(),
                leadingIconSvgPath: AppAssets.iconsSettings,
              ),

              const Divider(
                color: AppColors.strockColor,
              ),

              // privacy policy tile
              DefaultListTile(
                onTap: () => context.pushNamed(Routes.privacyPolicyScreen,
                    pathParameters: {"key": "privacy_policy"}),
                title: LocaleKeys.privacyPolicy.tr(),
                leadingIconSvgPath: AppAssets.iconsShieldCheck,
              ),

              const Divider(
                color: AppColors.strockColor,
              ),
              // terms_and_conditions tile
              DefaultListTile(
                onTap: () => context.pushNamed(Routes.privacyPolicyScreen,
                    pathParameters: {"key": "terms_and_conditions"}),
                title: LocaleKeys.termsAndConditions.tr(),
                leadingIconSvgPath: AppAssets.iconsShieldCheck,
              ),

              const Divider(
                color: AppColors.strockColor,
              ),
              // about_us
              DefaultListTile(
                onTap: () => context.pushNamed(Routes.privacyPolicyScreen,
                    pathParameters: {"key": "about_us"}),
                title: LocaleKeys.aboutUs.tr(),
                leadingIconSvgPath: AppAssets.iconsShieldCheck,
              ),

              const Divider(
                color: AppColors.strockColor,
              ),
              // notifications tile
              DefaultListTile(
                onTap: () {},
                title: LocaleKeys.notification.tr(),
                leadingIconSvgPath: AppAssets.iconsNotifications,
                trailing: SizedBox(
                  height: 35,
                  child: FittedBox(
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),

              const Divider(
                color: AppColors.strockColor,
              ),

              // support tile
              DefaultListTile(
                onTap: () => GoRouter.of(context).push(Routes.contactUsScreen),
                title: LocaleKeys.contactUs.tr(),
                leadingIconSvgPath: AppAssets.iconsSupport,
              ),

              // const Divider(
              //   color: AppColors.strockColor,
              // ),

              // medical department tile
              // DefaultListTile(
              //   onTap: () {
              //     showDialog(
              //         context: context,
              //         builder: (_) => new AlertDialog(
              //               backgroundColor: Colors.blue,
              //               insetPadding: EdgeInsets.zero,
              //               contentPadding: EdgeInsets.zero,
              //               titlePadding: EdgeInsets.zero,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(16.0))),
              //               content: Builder(
              //                 builder: (context) {
              //                   // Get available height and width of the build area of this widget. Make a choice depending on the size.
              //                   var height = MediaQuery.of(context).size.height;
              //                   var width = MediaQuery.of(context).size.width;
              //
              //                   return Container(
              //                     // color: Colors.red,
              //                     decoration: BoxDecoration(
              //                       borderRadius:
              //                           BorderRadius.all(Radius.circular(16.0)),
              //                       image: DecorationImage(
              //                         image: AssetImage(AssetsManager.medical),
              //                         fit: BoxFit.cover,
              //                       ),
              //                     ),
              //                     height: 473,
              //                     width: 343,
              //                     child: Stack(
              //                       children: [
              //                         Positioned(
              //                           left: 0,
              //                           top: -100,
              //                           child: Container(
              //                             child: Stack(
              //                               alignment: Alignment.center,
              //                               clipBehavior: Clip.none,
              //                               fit: StackFit.loose,
              //                               children: [
              //                                 CircleAvatar(
              //                                   radius: 220,
              //                                   backgroundColor: AppColors.strockColor.withValues(alpha: 0.2),
              //                                 ),
              //                                 CircleAvatar(
              //                                   radius: 150,
              //                                   backgroundColor: AppColors.strockColor.withValues(alpha: 0.4),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //
              //                         Positioned(
              //                             top: 20,
              //                             left: 20,
              //                             child: Container(
              //                                 padding:
              //                                     const EdgeInsets.symmetric(
              //                                   horizontal: 10,
              //                                   vertical: 4,
              //                                 ),
              //                                 decoration: BoxDecoration(
              //                                     color: AppColors.yellow,
              //                                     borderRadius:
              //                                         BorderRadius.all(
              //                                             Radius.circular(
              //                                                 16.0))),
              //                                 child: Text(
              //                                   LocaleKeys.soon.tr(),
              //                                   style: CustomTextStyle
              //                                       .semiBold_16
              //                                       .copyWith(
              //                                           color: AppColors
              //                                               .blackColor),
              //                                 ))),
              //                         Align(
              //                             alignment: Alignment.center,
              //                             child: Container(
              //                                 child: Column(mainAxisSize: MainAxisSize.min,
              //                               children: [
              //                                 const SizedBox(
              //                                   height: 20,
              //                                 ),
              //                                 Center(
              //                                   child: Text(
              //                                     LocaleKeys.becauseWeKeenToProvideAnIntegratedService.tr(),
              //                                     textAlign: TextAlign.center,
              //                                     style: CustomTextStyle.bold_20
              //                                         .copyWith(
              //                                             color: AppColors
              //                                                 .whiteColor),
              //                                   ),
              //                                 ),
              //                                 const SizedBox(
              //                                   height: 20,
              //                                 ),
              //                                 RichText(
              //                                   text: TextSpan(
              //                                     children: [
              //                                       TextSpan(
              //                                         text: "${LocaleKeys.waitFor.tr()} " ,
              //                                         style: CustomTextStyle
              //                                             .bold_20
              //                                             .copyWith(
              //                                                 color: AppColors
              //                                                     .primaryColor),
              //                                         children: [
              //                                           TextSpan(
              //                                             text: LocaleKeys.launching.tr(),
              //                                             style: CustomTextStyle
              //                                                 .bold_20
              //                                                 .copyWith(
              //                                                     color: AppColors
              //                                                         .whiteColor),
              //                                           ),
              //                                         ]
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 const SizedBox(
              //                                   height: 20,
              //                                 ),
              //                                 Text(
              //                                   LocaleKeys.ourMedicalServicesSoon.tr(),
              //                                   style: CustomTextStyle.bold_20
              //                                       .copyWith(
              //                                           color: AppColors
              //                                               .whiteColor),
              //                                 ),
              //                               ],
              //                             ))),
              //                         const Align(
              //                           alignment: Alignment.topRight,
              //                           child: CloseButton(),
              //                         )
              //
              //                         ],
              //                     ),
              //                   );
              //                 },
              //               ),
              //             ));
              //     // showDialog(
              //     //   context: context, builder: (BuildContext context) {
              //     //   return AlertDialog(
              //     //
              //     //
              //     //     child: Container(
              //     //       color: Colors.red,
              //     //       height: 343,
              //     //       width: 473,
              //     //       // decoration: BoxDecoration(
              //     //       //   image:  DecorationImage(
              //     //       //     image: AssetImage(AssetsManager.medical),
              //     //       //     fit: BoxFit.cover,
              //     //       //   ),
              //     //       // ),
              //     //       padding: const EdgeInsets.all(20),
              //     //
              //     //       child: Column(
              //     //         mainAxisSize: MainAxisSize.min,
              //     //         children: [
              //     //           Align(
              //     //             alignment: Alignment.topLeft,
              //     //               child: Text(LocaleKeys.soon.tr(),style: CustomTextStyle.semiBold_16.copyWith(color: AppColors.primaryColor),)),
              //     //           const SizedBox(height: 10,),
              //     //           // Text(LocaleKeys.comingSoon.tr(),style: CustomTextStyle.medium_14.copyWith(color: AppColors.primaryColor),),
              //     //         ],
              //     //       ),
              //     //                     ),
              //     //   );
              //     // },);
              //   },
              //   title: LocaleKeys.medicalSection.tr(),
              //   leadingIconSvgPath: AppAssets.iconsMedical,
              //   trailing: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 10,
              //       vertical: 4,
              //     ),
              //     decoration: BoxDecoration(
              //       color: AppColors.yellow,
              //       borderRadius: BorderRadius.circular(kBorderRadius),
              //     ),
              //     child: Text(
              //       LocaleKeys.soon.tr(),
              //       style: CustomTextStyle.semiBold_10.copyWith(
              //         color: AppColors.selectedFont,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
