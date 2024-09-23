import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:project_judge/components/buttons/bottomNavBar.dart';
import 'package:project_judge/screens/browse_page/browsePage.dart';
import 'package:project_judge/screens/home_screen/home_screen.dart';
import 'package:project_judge/screens/myproject_page/myProjectsPage.dart';
import 'package:project_judge/screens/profile_screen/profile_screen.dart';
import 'package:project_judge/screens/rating/ratingPage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key, required this.slectedPage});
  final int slectedPage;

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  late int selectedIndex;
  String qrCodeResult = "Not Yet Scanned";
  String projectId = "12345";

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.slectedPage; // Initialize with the passed index
  }

  Future<void> scanQRCode() async {
    String scannedCode;
    try {
      scannedCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color of the scan line
        'Cancel', // Text for the cancel button
        false, // Show flash icon
        ScanMode.QR, // Scan mode, can be QR or Barcode
      );
    } catch (e) {
      scannedCode = "Failed to scan QR code.";
    }

    if (!mounted) return;

    setState(() {
      qrCodeResult = scannedCode != '-1' ? scannedCode : 'Scan cancelled';
    });
    if (scannedCode != '-1') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RatingPage(projectID: qrCodeResult),
        ),
      );
    }
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const BrowsePage(),
    const Center(child: Text("Middle Page")),
    const MyProjectsScreen(),
    const ProfileScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onMiddleButtonTapped() {
    scanQRCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
        onMiddleButtonTapped: onMiddleButtonTapped,
      ),
    );
  }
}
