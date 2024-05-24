import 'package:event_calender/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class NextCard extends StatelessWidget {
  const NextCard({
    super.key,
    required this.time,
    required this.title,
    required this.color,
  });

  final String time;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              colors: [Colors.white12, Colors.white12],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 25, right: 16, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white24, fontSize: 16),
                  ),

                  // Padding(padding: EdgeInsets.only(left: 320)),

                  CircleAvatar(
                    backgroundColor: color,
                    radius: 7.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: primaryColor,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.orange,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 45),
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white70,
                        child: Text(
                          "4+",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
