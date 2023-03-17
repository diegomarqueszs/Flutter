import 'package:flutter/material.dart';
import 'page/config.dart';
import 'page/perfil.dart';
import 'page/searchPlant.dart';
import 'page/yourPlant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [YourPlant(), SearchPlant(), Perfil(), Config()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = YourPlant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[800],
        child: Icon(
          Icons.camera_alt_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Perfil();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          color: currentTab == 2
                              ? Colors.green[800]
                              : Colors.green[300],
                        ),
                        Text(
                          'perfil',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Colors.green[800]
                                  : Colors.green[300]),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = SearchPlant();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: currentTab == 1
                              ? Colors.green[800]
                              : Colors.green[300],
                        ),
                        Text(
                          'buscar',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.green[800]
                                  : Colors.green[300]),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = YourPlant();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_florist,
                          color: currentTab == 0
                              ? Colors.green[800]
                              : Colors.green[300],
                        ),
                        Text(
                          'plantas',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Colors.green[800]
                                  : Colors.green[300]),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Config();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3
                              ? Colors.green[800]
                              : Colors.green[300],
                        ),
                        Text(
                          'config',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Colors.green[800]
                                  : Colors.green[300]),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
