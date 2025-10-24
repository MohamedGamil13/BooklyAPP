import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/home/presentation/views_model/featured_bookCubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views_model/new_booksCubit/new_books_cubit.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    initController();
    context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
    context.read<NewBooksCubit>().fetchNewBooks();
    navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Image.asset(Assets.logo, width: 250),
        ),
      ),
    );
  }

  void initController() {
    _controller = AnimationController(vsync: this, duration: kduration);

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }
}

void navigateToHome() {
  Future.delayed(
    Duration(seconds: 5),
    () => Get.to(
      () => HomeView(),
      transition: Transition.native,
      duration: kduration,
    ),
  );
}
