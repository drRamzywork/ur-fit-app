import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:urfit/core/assets_manager.dart';
import 'package:urfit/core/style/colors.dart';
import 'package:urfit/core/style/fonts.dart';

import '../../../core/shared/widgets/title_with_icon.dart';
import '../bloc/authentication_bloc.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({super.key});

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {

  int currentIndex = 0;
  PageController pageController =PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: currentIndex != 1 ? Theme.of(context).colorScheme.primary : AppColors.backGround,
      body: Stack(
        children: [
          switch(currentIndex){
            0 => Positioned(
              // top: MediaQuery(data: data, child: child),
              // top: MediaQuery.sizeOf(context),
              bottom: 0,
              left: -10,
              right: -10,
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  children: [
                    CircleAvatar(
                      radius: 220,
                      backgroundColor: AppColors.strockColor.withValues(alpha: 0.2),
                    ),
                    CircleAvatar(
                      radius: 150,
                      backgroundColor: AppColors.strockColor.withValues(alpha: 0.4),
                    ),
                  ],
                ),
              ),
            ),
            1 => Positioned(
              // top: MediaQuery(data: data, child: child),
              // top: MediaQuery.sizeOf(context),
              bottom: 0,
              left: -45,
              right: 45,
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  children: [
                    CircleAvatar(
                      radius: 220,
                      backgroundColor: AppColors.strockColor.withValues(alpha: 0.2),
                    ),
                    CircleAvatar(
                      radius: 150,
                      backgroundColor: AppColors.strockColor.withValues(alpha: 0.4),
                    ),
                  ],
                ),
              ),
            ),
            2 => Positioned(
              // top: MediaQuery(data: data, child: child),
              // top: MediaQuery.sizeOf(context),
              bottom: 0,
              left: -10,
              right: -10,
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  children: [
                    CircleAvatar(
                      radius: 220,
                      backgroundColor: AppColors.strockColor.withValues(alpha: 0.2),
                    ),
                    CircleAvatar(
                      radius: 150,
                      backgroundColor: AppColors.strockColor.withValues(alpha: 0.4),
                    ),
                  ],
                ),
              ),
            ),
            // TODO: Handle this case.
            int() => throw UnimplementedError(),
          },
          switch(currentIndex){
            0 => Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(AssetsManager.onboarding2_1,width:433 ,height: 410,fit: BoxFit.cover,)),
            1 => Align(
                alignment: Alignment.bottomLeft,
                child: Transform.flip(
                    flipX: true,child: Image.asset(AssetsManager.onboarding2_2,width:266 ,height: 403,fit: BoxFit.cover,alignment: Alignment.centerRight,))),
            2 => Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(AssetsManager.onboarding2_3,width:433 ,height: 410,fit: BoxFit.cover,)),
            int() => throw UnimplementedError(),
          },
          Align(
            alignment: Alignment.topCenter,
            child: PageView(
              controller: pageController,
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    IconWithTitle(),
                    const SizedBox(height: 20),
                    RichText(text: TextSpan(
                      text: 'صحتك ',
                      style: CustomTextStyle.bold_40.copyWith(color: AppColors.secondaryColor,fontSize: 34),
                      children: [
                        TextSpan(
                          text: 'اهم من كل شئ',
                          style: CustomTextStyle.bold_40.copyWith(color: AppColors.whiteColor,fontSize: 34),
                        ),
                      ],
                    )),
                    const SizedBox(height: 20),
                    RichText(text: TextSpan(
                      text: 'مرحبا بك فى رفيقك اليومى لحياة صحية',
                      style: CustomTextStyle.bold_20.copyWith(color: AppColors.whiteColor,fontSize: 24),
                      children: [
                        TextSpan(
                          text: '!',
                          style: CustomTextStyle.bold_20.copyWith(color: AppColors.secondaryColor,fontSize: 24),
                        ),
                      ],
                    )),
                    const SizedBox(height: 20),
                    Text(
                      'هل تعلم ان خطوات صغيرة كل يوم تصنع فرقا نحن هنا نساعدك تتابع صحتك ,تنام افضل ,وتعيش بطاقة اعلى !',
                      style: CustomTextStyle.bold_14.copyWith(color: AppColors.whiteColor,fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50.px,
                      width: 249.px,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Center(
                        child: Text(
                          'ابدا رحلتك الصحية اليوم!',
                          style: CustomTextStyle.semiBold_16.copyWith(color: AppColors.whiteColor,fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      IconWithTitle(),
                      const SizedBox(height: 20),
                      RichText(text: TextSpan(
                        text: 'حرك ',
                        style: CustomTextStyle.bold_40.copyWith(color: AppColors.primaryColor,fontSize: 34),
                        children: [
                          TextSpan(
                            text: 'جسمك حرر طاقتك !',
                            style: CustomTextStyle.bold_40.copyWith(color: AppColors.whiteColor,fontSize: 34),
                          ),
                        ],
                      )),
                      const SizedBox(height: 20),
                      RichText(text: TextSpan(
                        text: 'مايحتاج نادى .. تحتاج تبدأ',
                        style: CustomTextStyle.bold_20.copyWith(color: AppColors.whiteColor,fontSize: 24),
                        children: [
                          TextSpan(
                            text: '',
                            style: CustomTextStyle.bold_20.copyWith(color: AppColors.secondaryColor,fontSize: 24),
                          ),
                        ],
                      )),
                      const SizedBox(height: 20),
                      Text(
                        'معانا تقدر تحرك فى بيتك,فى وقتك المناسب, تمارين يومية ,تذكيرات ذكية وتحديات  ممتعة بانتظارك !',
                        style: CustomTextStyle.bold_14.copyWith(color: AppColors.whiteColor,fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 50.px,
                        width: 249.px,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Center(
                          child: Text(
                            'كل حركة تقربك لهدفك',
                            style: CustomTextStyle.semiBold_16.copyWith(color: AppColors.whiteColor,fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      IconWithTitle(),
                      const SizedBox(height: 20),
                      RichText(text: TextSpan(
                        text: 'كل ',
                        style: CustomTextStyle.bold_40.copyWith(color: AppColors.secondaryColor,fontSize: 34),
                        children: [
                          TextSpan(
                            text: 'صح تعيش صح',
                            style: CustomTextStyle.bold_40.copyWith(color: AppColors.whiteColor,fontSize: 34),
                          ),
                        ],
                      )),
                      const SizedBox(height: 20),
                      RichText(text: TextSpan(
                        text: 'ودع الحيرة ,واستقبل وصفات صحية و لذيذة',
                        style: CustomTextStyle.bold_20.copyWith(color: AppColors.whiteColor,fontSize: 24),
                        children: [
                          TextSpan(
                            text: '!',
                            style: CustomTextStyle.bold_20.copyWith(color: AppColors.secondaryColor,fontSize: 24),
                          ),
                        ],
                      )),
                      const SizedBox(height: 20),
                      Text(
                        'وخطط وجباتك ,احسب سعراتك و اكتشف البدائل الذكية ,لان الاكل الصحى مايعنى الحرمان,بل توازن وذكاء .',
                        style: CustomTextStyle.bold_14.copyWith(color: AppColors.whiteColor,fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 50.px,
                        width: 249.px,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Center(
                          child: Text(
                            'ابدا رحلتك الصحية اليوم!',
                            style: CustomTextStyle.semiBold_16.copyWith(color: AppColors.whiteColor,fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                    ],
                  ),
                )],
            ),
          ),


          Align(alignment: Alignment.bottomRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    if(currentIndex == 2){
                      context
                          .read<AuthenticationBloc>()
                          .add(GoToChooseLanguage());
                    }
                    else{
                      setState(() {
                        currentIndex += 1;
                        pageController.animateToPage(currentIndex, duration: Duration(milliseconds: 300), curve: Curves.linear);
                      });
                    }
                  }, icon: Icon(Icons.arrow_back)),

                  SizedBox(width: 10.px,),
                  Text("تخطي"),

                ],
              ),
            ),
          ),)
        ],
      ),
    );
  }
}




