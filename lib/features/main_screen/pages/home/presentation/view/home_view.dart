import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    context.read<SwitchFingerprintCubit>().fetchInitialFingerSwitch();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        context.read<HomeAppBarCubit>().scrollHomeAppBar(scrollController: scrollController);
        return true;
      },
      child: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: HomeBody(),
          ),
        ],
        controller: scrollController,
      ),
    );
  }
}
