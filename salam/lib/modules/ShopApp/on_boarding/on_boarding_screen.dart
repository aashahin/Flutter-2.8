import 'package:flutter/material.dart';

class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/ShopApp/onboarding_screen/onboard.png',
        title: 'Welcome👋',
        body: 'We Hope You Like The App'),
    BoardingModel(
        image: 'assets/images/ShopApp/onboarding_screen/onboard.png',
        title: 'Great Start🎉',
        body: 'Small Ideas Always Start Like This'),
    BoardingModel(
        image: 'assets/images/ShopApp/onboarding_screen/onboard.png',
        title: 'لاغالب إلاالله❤',
        body: 'Whatever Happens, We Must Not Forget Who We Are'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Next',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(
                  '${model.image}'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      );
}
