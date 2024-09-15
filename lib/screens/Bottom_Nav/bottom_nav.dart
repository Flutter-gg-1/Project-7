import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:project_management_app/screens/Bottom_Nav/bottom_nav_bloc/bottom_nav_bloc.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> iconList = [
      Icons.home,
      Icons.notification_add,
      Icons.settings,
      Icons.person,
    ];

    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          extendBody: true,

          body: BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<BottomNavBloc>(context);
              int currentPageIndex = bloc.currentIndex;

              if (state is SuccessChangeViewState) {
                currentPageIndex = state.currentPageIndex;
              }

              return IndexedStack(
                index: currentPageIndex,
                children: bloc.views,
              );
            },
          ),

          // Floating Action Button

          bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<BottomNavBloc>(context);
              int currentPageIndex = bloc.currentIndex;

              if (state is SuccessChangeViewState) {
                currentPageIndex = state.currentPageIndex;
              }

              return AnimatedBottomNavigationBar.builder(
                itemCount: iconList.length,
                tabBuilder: (int index, bool isActive) {
                  final color =
                      isActive ? const Color(0xffFFDB5E) : Colors.white;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconList[index],
                        size: 30,
                        color: color,
                      ),
                      if (isActive)
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 5,
                          width: 20,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    ],
                  );
                },
                backgroundColor: const Color(0xff4129B7),
                height: 40,
                activeIndex: currentPageIndex,
                gapLocation: GapLocation.none,
                leftCornerRadius: 32,
                rightCornerRadius: 32,
                notchSmoothness: NotchSmoothness.verySmoothEdge,
                onTap: (index) {
                  BlocProvider.of<BottomNavBloc>(context)
                      .add(ChangeEvent(index: index));
                },
              );
            },
          ),
        );
      }),
    );
  }
}
