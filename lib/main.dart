import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
      _selectedIndex = index;
    });
  }

  List<Widget> _tabList = [
    new Center(
      child: Text(""),
    ),
    new Center(
      child: Text(""),
    ),
    new Center(
      child: Text(""),
    ),
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
        actions: [
          Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  )),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  "https://yt3.ggpht.com/XncyIcACdP4P7V1O7GcstQkRJEJgv8CK0bMWJLWUnTLy-c2jRmOcsiMQkkV-62k11o4mZgEU=s900-c-k-c0x00ffffff-no-rj"),
            )),
            Text(
              'Name Surname',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
          child: Column(children: [
        Expanded(
          flex: 2,
          child: DrawerHeader(
              child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                "https://yt3.ggpht.com/XncyIcACdP4P7V1O7GcstQkRJEJgv8CK0bMWJLWUnTLy-c2jRmOcsiMQkkV-62k11o4mZgEU=s900-c-k-c0x00ffffff-no-rj"),
          )),
        ),
        Expanded(
          flex: 3,
          child: Column(children: [
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.assignment_ind_outlined),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              title: Text("Images"),
              leading: Icon(Icons.image),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ]),
        ),
        Expanded(
            flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: ElevatedButton(
                  child: const Text('Выход'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 231, 230, 230),
                    onPrimary: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              ElevatedButton(
                child: const Text('Регистрация'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 231, 230, 230),
                  onPrimary: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ]))
      ])),
      body: TabBarView(
        controller: _tabController,
        children: _tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 60,
                      child: Center(
                        child: ListTile(
                          title: Text("Сумма"),
                          leading: Icon(Icons.credit_card),
                          trailing: Text("200 руб."),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Оплатить'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 231, 230, 230),
                        onPrimary: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
