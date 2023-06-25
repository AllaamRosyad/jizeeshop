import 'package:flutter/material.dart';
import 'package:jizeeshop/pages/home.dart';
import 'package:jizeeshop/pages/login_page.dart';
import 'package:jizeeshop/pages/account.dart';

void main() {
  runApp(const MaterialApp(
    home: Menu(),
  ));
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            print(value);
            if (value == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            } else if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Account()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: "Account")
          ]),
      appBar: AppBar(title: const Text("Hello Navigation Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              leading: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
