import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Admin/custom_info_cards.dart';
import 'package:project_management_app/screens/Home/projects_contaner.dart';
import 'package:sizer/sizer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Image.asset(
                    scale: 3,
                    'assets/Group 10 (1).png',
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  const CustomInfoCards(),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Username: ',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4129B7),
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownMenu(dropdownMenuEntries: [
                            DropdownMenuEntry(value: 'fahad', label: 'fahad'),
                            DropdownMenuEntry(
                                value: 'abdulaziz', label: 'abdulaziz'),
                            DropdownMenuEntry(
                                value: 'muhhanned', label: 'muhanned'),
                            DropdownMenuEntry(value: 'rawan', label: 'rawan')
                          ])
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Assign Role: ',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4129B7),
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownMenu(dropdownMenuEntries: [
                            DropdownMenuEntry(
                                value: 'supervisor', label: 'Supervisor'),
                            DropdownMenuEntry(value: 'user', label: 'User'),
                          ])
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                 Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                                    'All Projects.. ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff4129B7),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // ...List.generate(6, (_){
                                  //   return const Projects();
                                  // })
                   ],
                 ),
                
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
