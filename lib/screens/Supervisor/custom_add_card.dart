import 'package:flutter/material.dart';

class CustomAddCard extends StatelessWidget {
  const CustomAddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 211,
      width: 306,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 29,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25))
                    ],
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff57E3D8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Assign to: ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4129B7),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: const TextField(
                          cursorColor: Colors.black,
                          maxLines: 1,
                          style: TextStyle(fontSize: 16),
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'End Date: ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4129B7),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: const TextField(
                          cursorColor: Colors.black,
                          maxLines: 1,
                          style: TextStyle(fontSize: 16),
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Edit: ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4129B7),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Checkbox(value: false, onChanged: (value) {})
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
