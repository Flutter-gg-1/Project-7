import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomInfoCards extends StatelessWidget {
  const CustomInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 14, right: 10),
                  height: 130,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25))
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Projects: ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff4129B7),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff57E3D8),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Accepted: ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff4129B7),
                                fontWeight: FontWeight.bold),
                          ),
                          Text('20',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff57E3D8),
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rejected: ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff4129B7),
                                fontWeight: FontWeight.bold),
                          ),
                          Text('20',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff57E3D8),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CircularPercentIndicator(
                        radius: 27,
                        percent: 0.6,
                        center: const Text(
                          '60%',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4129B7)),
                        ),
                        backgroundColor: const Color(0xff4129B7),
                        progressColor: const Color(0xff57E3D8),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 51,
                      width: 97,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.25))
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Users: ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff4129B7),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff57E3D8),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 51,
                      width: 97,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.25))
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Users: ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff4129B7),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff57E3D8),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
  }
}
