import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnYz_yN68eGjMSQ5pbum94YUpIPPvJOp4XTg&usqp=CAU")),
        ),
        width: 50,
      ),
    );
  }
}
