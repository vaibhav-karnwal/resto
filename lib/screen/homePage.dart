import 'package:flutter/material.dart';
import 'package:resto/screen/restaurantPage.dart';
import 'package:resto/screen/cartPage.dart';
//import 'package:resto/model/buttonModel.dart';

class HomePage extends StatefulWidget {
  bool changeButtonColor;

  HomePage({this.changeButtonColor = false});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var userName = "Broke Lee";
  var address = "A-B01 Union Heights, Piolad";
  var title = "Healthy foods and ingredients";
  var dishCategories = "ITALIAN FOODS, CHINESE, THAI FOOD, BBQ";
  // List<ButtonList> buttonList=[
  //   ButtonList(
  //       text:"Food",
  //       img : "assets/foods.png"
  //   ),
  //   ButtonList(
  //       text:"Snacks",
  //       img : "assets/snacks.png"
  //   ),
  //   ButtonList(
  //       text:"Dessert",
  //       img : "assets/dessert.png"
  //   ),
  //   ButtonList(
  //       text:"Drinks",
  //       img : "assets/drinks.png"
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/vaibhav2.jpg',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 8, bottom: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        'Hello, $userName',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '$address',
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 15,
                                            ),
                                          ),
                                          Icon(                // Add this
                                            Icons.arrow_drop_down,  // Add this
                                            color: Colors.blue,   // Add this
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                splashColor: Colors.black,
                                icon: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.grey,),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Cart(),
                                      ));
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 10),
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 22.0, color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                icon: new Icon(Icons.search,),
                                filled: true,
                                fillColor: Colors.blueGrey[50],
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Search restaurants..',
                                contentPadding: EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                suffixIcon: new IconButton(
                                    icon: Image.asset(
                                      'assets/filter.png', height: 25,),
                                    onPressed: null),
                              ),
                              textInputAction: TextInputAction.go,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   itemCount: buttonList.length,
                          //   itemBuilder: (context, index) {
                          //     ButtonList button = buttonList[index];
                          //     return  Column(
                          //       children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       primary: widget.changeButtonColor ? Colors.grey[100] : Colors.blue,
                          //       // background
                          //       onPrimary: Colors
                          //           .blue, // foreground
                          //     ),
                          //     onPressed: () {
                          //       setState(() {
                          //         widget.changeButtonColor = !widget.changeButtonColor;
                          //       });
                          //     },
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child:ColorFiltered(
                          //         colorFilter:  widget.changeButtonColor
                          //             ? ColorFilter.mode(Colors.white, BlendMode.color) : ColorFilter.mode(Colors.transparent, BlendMode.color),
                          //         child: Image.asset(
                          //           'assets/foods.png',
                          //           height: 40,
                          //           width: 20,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Text("Food", style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: widget.changeButtonColor
                          //         ? Colors.blue
                          //         : Colors.black,
                          //     fontSize: 15),),
                          //       ],
                          //     );
                          //   },
                          // ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: widget.changeButtonColor ? Colors.grey[100] : Colors.blue,
                                          // background
                                          onPrimary: Colors
                                              .blue, // foreground
                                        ),
                                        onPressed: () {
                                          setState(() {
                                          widget.changeButtonColor = !widget.changeButtonColor;
                                        });
                                          },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:ColorFiltered(
                                            colorFilter:  widget.changeButtonColor
                                                ? ColorFilter.mode(Colors.white, BlendMode.color) : ColorFilter.mode(Colors.transparent, BlendMode.color),
                                            child: Image.asset(
                                              'assets/foods.png',
                                              height: 40,
                                              width: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("Food", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: widget.changeButtonColor
                                            ? Colors.blue
                                            : Colors.black,
                                        fontSize: 15),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: widget.changeButtonColor ? Colors.grey[100] : Colors.blue,
                                          // background
                                          onPrimary: Colors
                                              .blue, // foreground
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            widget.changeButtonColor = !widget.changeButtonColor;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:ColorFiltered(
                                            colorFilter:  widget.changeButtonColor
                                                ? ColorFilter.mode(Colors.white, BlendMode.color) : ColorFilter.mode(Colors.transparent, BlendMode.color),
                                            child: Image.asset(
                                            'assets/snacks.png',
                                            height: 40,
                                            width: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("Snacks", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: widget.changeButtonColor
                                            ? Colors.blue
                                            : Colors.black,
                                        fontSize: 15),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: widget.changeButtonColor ? Colors.grey[100] : Colors.blue,
                                          // background
                                          onPrimary: Colors
                                              .blue, // foreground
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            widget.changeButtonColor = !widget.changeButtonColor;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:ColorFiltered(
                                            colorFilter:  widget.changeButtonColor
                                                ? ColorFilter.mode(Colors.white, BlendMode.color) : ColorFilter.mode(Colors.transparent, BlendMode.color),

                                            child: Image.asset(
                                            'assets/dessert.png',
                                            height: 40,
                                            width: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("Dessert", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: widget.changeButtonColor
                                            ? Colors.blue
                                            : Colors.black,
                                        fontSize: 15),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: widget.changeButtonColor ? Colors.grey[100] : Colors.blue,
                                            // background
                                            onPrimary: Colors
                                                .blue, // foreground
                                          ),
                                        onPressed: () {
                                          setState(() {
                                            widget.changeButtonColor = !widget.changeButtonColor;
                                          });
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:ColorFiltered(
                                              colorFilter:  widget.changeButtonColor
                                                  ? ColorFilter.mode(Colors.white, BlendMode.color) : ColorFilter.mode(Colors.transparent, BlendMode.color),

                                              child: Image.asset(
                                              'assets/drinks.png',
                                              height: 40,
                                              width: 30,
                                              ),
                                            ),
                                        ),
                                      ),
                                    ),
                                    Text("Drinks", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: widget.changeButtonColor
                                            ? Colors.blue
                                            : Colors.black,
                                        fontSize: 15),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: widget.changeButtonColor ? Colors.grey[100] : Colors.blue,
                                          // background
                                          onPrimary: Colors
                                              .blue, // foreground
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            widget.changeButtonColor = !widget.changeButtonColor;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:ColorFiltered(
                                            colorFilter:  widget.changeButtonColor
                                                ? ColorFilter.mode(Colors.white, BlendMode.color) : ColorFilter.mode(Colors.transparent, BlendMode.color),

                                            child: Image.asset(
                                            'assets/foods.png',
                                            height: 40,
                                            width: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("Food", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Text(
                                    "Popular Dishes",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("SEE ALL", style: TextStyle(
                                        color: Colors.grey, fontSize: 12),)
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),
                    Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/food.png',
                              fit: BoxFit.cover,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RestaurantDetail(),
                                    ));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  '$title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10, left: 8),
                              child: Text(
                                '$dishCategories',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 90,
                          right: 20,
                          child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  '42',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/food.png',
                              fit: BoxFit.cover,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RestaurantDetail(),
                                    ));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  '$title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10, left: 8),
                              child: Text(
                                '$dishCategories',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 90,
                          right: 20,
                          child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  '42',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 0.88 * MediaQuery
                      .of(context)
                      .size
                      .height,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[100],
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/menu.png',
                            height: 40,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[100],
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/flash.png',
                            height: 40,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[100],
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/user.png',
                            height: 40,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}