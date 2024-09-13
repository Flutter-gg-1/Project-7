import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:project_management_app/Bottom_Nav/bloc/bottom_nav_bloc.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
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
          bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<BottomNavBloc>(context);
              int currentPageIndex = bloc.currentIndex;

              if (state is SuccessChangeViewState) {
                currentPageIndex = state.currentPageIndex;
              }

              return DotCurvedBottomNav(
                selectedIndex: currentPageIndex,
                indicatorColor: Colors.white,
                backgroundColor: Color(0xff4129B7),
                height: 70,
                onTap: (index) {
                  BlocProvider.of<BottomNavBloc>(context)
                      .add(ChangeEvent(index: index));
                },
                items: [
                  Icon(
                    Icons.home,
                    color: currentPageIndex == 0
                        ? Color(0xffFFDB5E)
                        : Colors.white,
                  ),
                  Icon(
                    Icons.notification_add,
                    color: currentPageIndex == 1
                        ? Color(0xffFFDB5E)
                        : Colors.white,
                  ),
                  Icon(
                    Icons.settings,
                    color: currentPageIndex == 2
                        ? Color(0xffFFDB5E)
                        : Colors.white,
                  ),
                  Icon(
                    Icons.person,
                    color: currentPageIndex == 3
                        ? Color(0xffFFDB5E)
                        : Colors.white,
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
