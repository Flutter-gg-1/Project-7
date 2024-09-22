import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/all_project/all_project_screen.dart';
import 'package:tuwaiq_project/screens/bottomNavBloc/bottomnav_bloc.dart';
import 'package:tuwaiq_project/screens/profile/profile_screen.dart';
import 'package:tuwaiq_project/screens/rating/rating_screen.dart';
import 'package:tuwaiq_project/screens/serch_screen/search_screen.dart';
import 'package:tuwaiq_project/screens/user_project/user_project_screen.dart';

import 'package:tuwaiq_project/shape/auth_shape.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ScanResult? scanResult;

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  final _aspectTolerance = 0.00;
  final _selectedCamera = -1;
  final _useAutoFocus = true;
  final _autoEnableFlash = false;
  final List<Widget> tabs = const [
    AllProjectScreen(),
    UserProjectScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnavBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<BottomnavBloc>();
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BlocBuilder<BottomnavBloc, BottomnavState>(
            builder: (context, state) {
              int selectedIndex = 0;
              if (state is IndexChangeState) {
                selectedIndex = state.index;
              }
              return FlashyTabBar(
                onItemSelected: (index) {
                  bloc.add(NavigatorBetweenScreenEvent(selectedIndex: index));
                },
                selectedIndex: selectedIndex,
                items: [
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.home_bold,
                      color: Color(0x889B37FF),
                      size: 30,
                    ),
                    title: const Text('Home'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.card_add_bold,
                      color: Color(0x889B37FF),
                      size: 30,
                    ),
                    title: const Text('my project'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      LineAwesome.search_solid,
                      color: Color(0x889B37FF),
                      size: 30,
                    ),
                    title: const Text('Search'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.profile_2user_bold,
                      color: Color(0x889B37FF),
                      size: 30,
                    ),
                    title: const Text('Profile'),
                  ),
                ],
              );
            },
          ),
          body: Column(
            children: [
              CustomPaint(
                size: Size(context.getWidth(multiply: 1),
                    context.getHeight(multiply: 0.1)),
                painter: AuthShape(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () async {
                      try {
                        final result = await BarcodeScanner.scan(
                          options: ScanOptions(
                            strings: {
                              'cancel': _cancelController.text,
                              'flash_on': _flashOnController.text,
                              'flash_off': _flashOffController.text,
                            },
                            restrictFormat: [BarcodeFormat.qr],
                            useCamera: _selectedCamera,
                            autoEnableFlash: _autoEnableFlash,
                            android: AndroidOptions(
                              aspectTolerance: _aspectTolerance,
                              useAutoFocus: _useAutoFocus,
                            ),
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RatingScreen(projectId: result.rawContent),
                            ));
                      } on PlatformException catch (e) {
                        scanResult = ScanResult(
                          rawContent: e.code ==
                                  BarcodeScanner.cameraAccessDenied
                              ? 'The user did not grant the camera permission!'
                              : 'Unknown error: $e',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(scanResult!.rawContent),
                          backgroundColor: Colors.red[300],
                        ));
                      }
                    },
                    icon: const Icon(Iconsax.scan_barcode_outline)),
              ),
              BlocBuilder<BottomnavBloc, BottomnavState>(
                builder: (context, state) {
                  int selectedIndex = 0;
                  if (state is IndexChangeState) {
                    selectedIndex = state.index;
                  }
                  return tabs[selectedIndex];
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
