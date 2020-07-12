import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Widgets/tiles_collection.dart';
import 'Widgets/marble_collection.dart';
import 'Widgets/latest_collection.dart';
import 'services/auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();

  @override
  int _selectedIndex = 0;

  int _currentTab = 0;

  List<IconData> _icons1 = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.plane,
  ];

  Widget _buildIcon1(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 40.0,
        width: 40.0,
//        decoration: BoxDecoration(
//          color: _selectedIndex == index
//              ? Theme.of(context).accentColor
//              : Color(0xFFE7EBEE),
//          borderRadius: BorderRadius.circular(30.0),
//        ),
        child: Column(
          children: <Widget>[
            Icon(
              _icons1[index],
              size: 25.0,
              color: _selectedIndex == index
                  ? Theme.of(context).accentColor
                  : Color(0xFFB4C1C4),
            ),
            Text(
              'Text',
              style: TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIcon(IconData data, String text) {
    return MaterialButton(
      child: Container(
        height: 40.0,
        width: 40.0,
//        decoration: BoxDecoration(
//          color: _selectedIndex == index
//              ? Theme.of(context).accentColor
//              : Color(0xFFE7EBEE),
//          borderRadius: BorderRadius.circular(30.0),
//        ),
        child: Column(
          children: <Widget>[
            Icon(
              data,
              size: 25.0,
              color: Color(0xFFB4C1C4),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3EBACE),
        title: Text('Marvin Ceramics'),
        leading: IconButton(
          icon: Icon(Icons.menu),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
          ),
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      backgroundColor: Color(0xFFF3F5F7),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'How can I help you?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xFFD8ECF1),
                  hintText: 'Search',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Menu',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildIcon(_icons1[0], 'text'),
                buildIcon(_icons1[1], 'text'),
                buildIcon(_icons1[2], 'text'),
                buildIcon(_icons1[3], 'text'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildIcon(_icons1[0], 'text'),
                buildIcon(_icons1[1], 'text'),
                buildIcon(_icons1[2], 'text'),
                buildIcon(_icons1[3], 'text'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Latest_collection(),
            SizedBox(
              height: 10,
            ),
            Tiles_collection(),
            SizedBox(
              height: 10,
            ),
            marble_collection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTab,
        backgroundColor: Color(0xFF3EBACE),
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.calculator,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
