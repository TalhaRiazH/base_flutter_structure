import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../image_picker/views/image_picker_example.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // Pages for bottom navigation
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomEndDrawer(),
        appBar: AppBar(
          title: const Text('Base Project'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          leading: Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// Sample pages for bottom navigation
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            "Welcome to Base Project",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        SizedBox(height: 20),
        ImagePickerWidget(title: 'Select Profile Picture'),
        SizedBox(height: 20),
        CustomRoundButton(
          text: 'Click Me',
          onPressed: () {
            CustomBottomSheet.show(
              context: context,
              title: 'Simple Bottom Sheet',
              child: Text('Your content here'),
            );
          },
        ),
        SizedBox(height: 20),
        CustomRoundButton(
          text: 'Pick Image',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImagePickerExample()),
            );
          },
        ),
        SizedBox(height: 20),
        CustomRoundButton(
          text: 'go to todos list',
          onPressed: () {
            Get.toNamed(AppRoutes.todosScreen);
          },
        ),
      ],
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Icon(Icons.search, size: 80, color: Colors.blue)),
        SizedBox(height: 20),
        Center(
          child: Text(
            "Search Page",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Icon(Icons.favorite, size: 80, color: Colors.red)),
        SizedBox(height: 20),
        Center(
          child: Text(
            "Favorites Page",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Icon(Icons.person, size: 80, color: Colors.green)),
        SizedBox(height: 20),
        Center(
          child: Text(
            "Profile Page",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
