import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Food Menu',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/menu.png'), color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage('assets/user.png'), color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Selector
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 80, // Adjust height for category icons
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryItem(image: 'assets/burger.png', label: 'All'),
                    CategoryItem(image: 'assets/fries.png', label: 'Makanan'),
                    CategoryItem(image: 'assets/drink.png', label: 'Minuman'),
                  ],
                ),
              ),
            ),
            // Food list header
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'All Food',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Food Item Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1, // Adjust to make items square
              ),
              itemCount: 8, // Number of food items
              itemBuilder: (context, index) {
                return FoodItem(
                  name: 'Burger King Medium',
                  price: 'Rp. 50.000,00',
                  image: 'assets/burger.png',
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/cart.png')),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/order.png')),
            label: 'Orders',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  CategoryItem({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
            ],
          ),
          child: Image.asset(image, width: 40, height: 40),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class FoodItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  FoodItem({required this.name, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(price, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

// New CartPage
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/back.png')),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage('assets/user.png'), color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          CartItem(name: 'Burger King Medium', price: 'Rp. 50.000,00', quantity: 1, image: 'assets/burger.png'),
          CartItem(name: 'Burger King Small', price: 'Rp. 35.000,00', quantity: 1, image: 'assets/burger.png'),
          CartItem(name: 'teh botol', price: 'Rp. 4.000,00', quantity: 1, image: 'assets/tehbotol.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("PPN 11%"), Text("Rp. 10.000,00")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Total belanja"), Text("Rp. 84.000,00")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Rp. 94.000,00", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final String image;

  CartItem({required this.name, required this.price, required this.quantity, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    IconButton(onPressed: () {},icon: ImageIcon(AssetImage('assets/minus.png'))),
                    Text(quantity.toString()),
                    IconButton(onPressed: () {}, icon: ImageIcon(AssetImage('assets/add.png'))),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: ImageIcon(AssetImage('assets/delete.png')),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}