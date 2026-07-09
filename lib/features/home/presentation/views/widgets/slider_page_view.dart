import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/home/presentation/manger/sliders/cubit/sliders_cubit.dart';
import 'package:shop/features/onboarding/widgets/pages_dots.dart';
import 'package:shop/core/widgets/slider_shimmer.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
class SliderPageView extends StatefulWidget {
  const SliderPageView({super.key});

  @override
  State<SliderPageView> createState() => _SliderPageViewState();
}

class _SliderPageViewState extends State<SliderPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // نقرأ الـ index الحالي من الكيوبيت عند البداية لتهيئة السلايدر في مكانه الصحيح
    _pageController = PageController(
      initialPage: context.read<SlidersCubit>().currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit, SlidersState>(
      // buildWhen تضمن أن الـ PageView لا يُعاد بناؤه إلا في حالات محددة
      buildWhen: (previous, current) =>
          current is SlidersSuccess || current is SlidersLoading || current is SlidersFailure,
      builder: (context, state) {
        var cubit = SlidersCubit.get(context);

        if (state is SlidersSuccess) {
          return Column(
            children: [
              SizedBox(
                width: 343.w,
                height: 189.h,
                child: PageView.builder(
                  controller: _pageController, // ربط الـ Controller
                  itemCount: cubit.sliders!.length,
                  onPageChanged: (index) {
                    cubit.changePage(index);
                  },
                  itemBuilder: (context, index) {
                    return CustomNetworkImage(
                      imageUrl: cubit.sliders![index].imagePath ?? '',
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(20.r),
                    );
                  },
                ),
              ),
              SizedBox(height: 12.h),
              // BlocSelector يقوم بتحديث النقاط فقط دون المساس بالـ PageView
              BlocSelector<SlidersCubit, SlidersState, int>(
                selector: (state) => context.read<SlidersCubit>().currentIndex,
                builder: (context, currentIndex) {
                  return pageDots(
                    currentPage: currentIndex,
                    dotsCount: cubit.sliders!.length,
                    activeColor: AppColors.lightPink,
                    activeSize: Size(12.w, 12.h),
                  );
                },
              ),
            ],
          );
        } else if (state is SlidersLoading) {
          return const SliderShimmer();
        } else if (state is SlidersFailure) {
          return Center(child: Text(state.errMessage));
        }
        return const SizedBox();
      },
    );
  }
}