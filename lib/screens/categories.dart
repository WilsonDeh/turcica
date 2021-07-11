import 'package:flutter/material.dart';

class Clothes extends StatelessWidget {
  //TreeLevelController treeController = Get.put(TreeLevelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey[200],
                        thickness: 3,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.00),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              /*some avatar*/

                              SizedBox(
                                width: 10,
                              ),

                              /*some text*/

                              Spacer(
                                flex: 1,
                              ),
                              IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: null)
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
