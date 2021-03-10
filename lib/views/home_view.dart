import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController firstName = new TextEditingController();
  TextEditingController secondName = new TextEditingController();
  String result = '';
  //bool display = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/lovbg.jpg'), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.only(left: 30, top: 60, right: 30),
          child: Column(
            children: [
              Text(
                "Love Test",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              new Padding(padding: EdgeInsets.only(top: 30)),
              TextField(
                controller: firstName,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Your Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Loves',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: secondName,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'His/Her Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                //padding: EdgeInsets.only(left: 10, right: 20),
                onPressed: () {
                  setState(() {
                    result = calculateLove(firstName.text, secondName.text);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  result,
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 350,
              )
            ],
          ),
        ),
      ),
    );
  }
}

String countChars(String firstName, String secondName) {
  String phrase =
      (firstName.trim() + "loves" + secondName.trim()).toLowerCase();

  String strAllChars = "";
  String strCount = "";
  for (int a = 0; a < phrase.length; a++) {
    if (strAllChars.indexOf(phrase[a]) < 0) {
      int count = 0;
      for (int j = 0; j < phrase.length; j++) {
        if (phrase[a] == phrase[j]) {
          count = count + 1;
        }
      }
      strAllChars = strAllChars + phrase[a];
      strCount = strCount + count.toString();
    }
  }
  return strCount;
}

String shortenNumber(String countList) {
  String shortenString = "";
  if (countList.length >= 2) {
    int numOne = int.parse(countList[0]);
    int numTwo = int.parse(countList[countList.length - 1]);
    shortenString = (numOne + numTwo).toString() +
        shortenNumber(countList.substring(1, countList.length - 1));
  } else {
    return countList;
  }
  return shortenString;
}

String calculateLove(String firstName, String secondName) {
  String shortString = countChars(firstName, secondName);
  do {
    shortString = shortenNumber(shortString);
  } while (shortString.length > 2);
  shortString = shortString + '%';
  return shortString;
}
