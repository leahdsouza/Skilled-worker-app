import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 170,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/cleaning.jpg',
            ),
            fit: BoxFit.fitWidth,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'We clean like',
              style: TextStyle(
                color: Color(0xff040f48),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Never',
                  style: TextStyle(
                    color: Color(0xff040f48),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Been Dirty',
                  style: TextStyle(
                    color: Color(0xffe2345d),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 30),
              color: Color(0xff040f48),
              // shape: kShape,
              onPressed: () {},
              child: const Text(
                'Book now',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

