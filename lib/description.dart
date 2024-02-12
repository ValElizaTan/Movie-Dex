/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/utility/text.dart';

import 'screen/ticket.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: modified_text(
                        text: '⭐ Average Rating - ' + vote,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child:
                  modified_text(text: 'Released On - ' + launch_on, size: 14),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => Tickets());
              },
              child: Text('Buy Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/utility/text.dart';

import 'screen/ticket.dart';


class Description extends StatefulWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({
    Key key,
    this.name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.launch_on,
  }) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        widget.bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: modified_text(
                        text: '⭐ Average Rating - ' + widget.vote,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: widget.name != null ? widget.name : 'Not Loaded',
                  size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                  text: 'Released On - ' + widget.launch_on, size: 14),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(widget.posterurl),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: widget.description, size: 18),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => Tickets());
              },
              child: Text('Buy Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
