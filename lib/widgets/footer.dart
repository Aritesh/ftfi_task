// widgets/footer.dart
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.email, color: Colors.lightBlueAccent),
          CircleAvatar(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.pets, color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('Be', style: TextStyle(color: Colors.white)),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
