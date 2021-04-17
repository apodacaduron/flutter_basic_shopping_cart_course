import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 1
// Main
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Shopping Cart Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingList(),
    );
  }
}
// End main

// 2
// Json Data
List foodsJson = [
  {
    "id": 1,
    "title": "Sandwich/ Pork",
    "restaurantChain": "Happi House Restaurant",
    "servingSize": "1 sandwich",
    "readableServingSize": "1 sandwich",
    "image": "https://images.spoonacular.com/file/wximages/394931-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 2,
    "title": "Sandwich/ Beef",
    "restaurantChain": "Happi House Restaurant",
    "servingSize": "1 sandwich",
    "readableServingSize": "1 sandwich",
    "image": "https://images.spoonacular.com/file/wximages/394930-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 3,
    "title": "Ham Sandwich on Pretzel Bread (Half)",
    "restaurantChain": "Corner Bakery",
    "servingSize": null,
    "readableServingSize": "Half",
    "image": "https://images.spoonacular.com/file/wximages/340023-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 4,
    "title": "Meat Sandwich, Turkey",
    "restaurantChain": "D'Angelo Grilled Sandwiches",
    "servingSize": null,
    "readableServingSize": "Large",
    "image": "https://images.spoonacular.com/file/wximages/342881-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 5,
    "title": "Meat Sandwich, Turkey",
    "restaurantChain": "D'Angelo Grilled Sandwiches",
    "servingSize": null,
    "readableServingSize": "Medium",
    "image": "https://images.spoonacular.com/file/wximages/342889-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 6,
    "title": "Girf Sandwich on French Bread",
    "restaurantChain": "Erbert & Gerbert's Subs & Clubs",
    "servingSize": "362g",
    "readableServingSize": "13 oz",
    "image": "https://images.spoonacular.com/file/wximages/385748-312x231.png",
    "imageType": "png"
  },
  {
    "id": 7,
    "title": "Cuban Sandwich",
    "restaurantChain": "Shari's",
    "servingSize": "269g",
    "readableServingSize": "9 oz",
    "image": "https://images.spoonacular.com/file/wximages/362929-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 8,
    "title": "Cuban Sandwich",
    "restaurantChain": "The Cheesefacke Factory",
    "servingSize": null,
    "readableServingSize": null,
    "image": "https://images.spoonacular.com/file/wximages/424103-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 9,
    "title": "4 Grilled Chicken",
    "restaurantChain": "Lee's Sandwiches",
    "servingSize": "1 sandwich",
    "readableServingSize": "1 sandwich",
    "image": "https://images.spoonacular.com/file/wximages/384684-312x231.png",
    "imageType": "png"
  },
  {
    "id": 10,
    "title": "Titan Sandwich on Honey Wheat Bread",
    "restaurantChain": "Erbert & Gerbert's Subs & Clubs",
    "servingSize": "355g",
    "readableServingSize": "13 oz",
    "image": "https://images.spoonacular.com/file/wximages/385793-312x231.png",
    "imageType": "png"
  },
  {
    "id": 11,
    "title": "Sandwich/ Pork",
    "restaurantChain": "Happi House Restaurant",
    "servingSize": "1 sandwich",
    "readableServingSize": "1 sandwich",
    "image": "https://images.spoonacular.com/file/wximages/394931-312x231.jpg",
    "imageType": "jpg"
  },
  {
    "id": 12,
    "title": "Sandwich/ Beef",
    "restaurantChain": "Happi House Restaurant",
    "servingSize": "1 sandwich",
    "readableServingSize": "1 sandwich",
    "image": "https://images.spoonacular.com/file/wximages/394930-312x231.jpg",
    "imageType": "jpg"
  }
];
// End Json Data

// 3
// Food model
class Food {
  final int id;
  final String title;
  final String restaurantChain;
  final String servingSize;
  final String readableServingSize;
  final String image;
  final String imageType;

  Food({
    this.id,
    this.title,
    this.restaurantChain,
    this.servingSize,
    this.readableServingSize,
    this.image,
    this.imageType,
  });

  Food.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        title = json["title"] as String,
        restaurantChain = json["restaurantChain"] as String,
        servingSize = json["servingSize"] as String,
        readableServingSize = json["readableServingSize"] as String,
        image = json["image"] as String,
        imageType = json["imageType"] as String;
}
// End food model

// 4
// Shopping List
class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<Food> foods = [];
  List<Food> cart = [];

  @override
  void initState() {
    foods = foodsJson.map((foodJson) => Food.fromJson(foodJson)).toList();
    super.initState();
  }

  void addToCart(Food _food) {
    setState(() {
      cart = List.from(cart)..add(_food);
    });
  }

  void removeFromCart(Food _food) {
    setState(() {
      cart = List.from(cart)..removeWhere((food) => food.id == _food.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Shopping List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      Cart(onPressed: removeFromCart, cartFoods: cart),
                ),
              );
            },
            icon: CartCounter(
              count: cart.length,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return FoodCard(
            food: foods[index],
            onTap: (Food food) {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => FoodView(
                      onPressed: addToCart,
                      food: food,
                      inCart: cart.indexWhere(
                              (cartFood) => cartFood.id == food.id) >
                          -1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
// End shopping list

// 5
// CartCounter
class CartCounter extends StatelessWidget {
  final int count;
  CartCounter({this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.shopping_cart_outlined),
        Visibility(
          visible: count > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// End CartCounter

// 6
// FoodCard
class FoodCard extends StatelessWidget {
  final Food food;
  final Function onTap;
  final Function onDismissed;
  final bool showTrailing;
  FoodCard({this.onTap, this.food, this.onDismissed, this.showTrailing = true});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: InkWell(
          onTap: () {
            return onTap != null ? onTap(food) : null;
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Hero(
                tag: food.id,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.transparent,
                  child: Image.network(
                    food.image,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace stackTrace) {
                      return Icon(Icons.fastfood);
                    },
                  ),
                ),
              ),
              title: Text(food.title),
              subtitle: Text(food.restaurantChain),
              trailing: Visibility(
                visible: showTrailing,
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
        ),
      ),
      direction: !showTrailing ? DismissDirection.horizontal : null,
      background: Container(
        color: Colors.red,
      ),
      key: ValueKey<int>(food.id),
      onDismissed: (DismissDirection direction) {
        onDismissed();
      },
    );
  }
}
// End food card

// 7
// Food view
class FoodView extends StatelessWidget {
  final Food food;
  final bool inCart;
  final Function onPressed;
  FoodView({this.onPressed, this.food, this.inCart = false});

  void _addFoodToCart(context) {
    onPressed(food);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(food.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: food.id,
              child: Image.network(
                food.image,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace stackTrace) {
                  return Icon(Icons.fastfood);
                },
              ),
            ),
            ListTile(
              title: Text(food.title),
              subtitle:
                  Text('${food.restaurantChain} / ${food.readableServingSize}'),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: !inCart ? () => _addFoodToCart(context) : null,
                child: Text('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// End food view

// 8
// Cart view
class Cart extends StatefulWidget {
  final Function onPressed;
  final List<Food> cartFoods;
  Cart({this.onPressed, this.cartFoods});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Food> _cartFoods;
  void initState() {
    _cartFoods = widget.cartFoods;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Cart'),
        actions: [
          TextButton(
            onPressed: null,
            child: Text(
              _cartFoods.length.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Visibility(
        visible: _cartFoods.length > 0,
        child: ListView.builder(
          itemCount: _cartFoods.length,
          itemBuilder: (context, index) {
            return FoodCard(
              food: _cartFoods[index],
              onDismissed: () {
                widget.onPressed(_cartFoods[index]);
                setState(() {
                  _cartFoods = List.from(_cartFoods)
                    ..removeWhere((food) => food.id == _cartFoods[index].id);
                });
              },
              showTrailing: false,
            );
          },
        ),
        replacement: Center(
          child: Text('Your cart is empty'),
        ),
      ),
    );
  }
}
// End cart view
