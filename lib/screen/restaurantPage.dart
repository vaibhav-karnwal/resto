import 'package:flutter/material.dart';
import 'package:resto/apiService/services.dart';
import 'package:resto/screen/cartPage.dart';
import 'package:resto/model/productModel.dart';

final cartList = ValueNotifier<List<DishesList>>([]);
class RestaurantDetail extends StatefulWidget {

  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;
  RestaurantDetail(
      {Key key, this.minValue = 0, this.maxValue = 10, this.onChanged})
      : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {

  List<DishesList> _dishList;
  int counter= 0;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getDishes().then((dishList){
      setState(() {
        _dishList = dishList;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'MORE INFO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Stack(
            children:[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.0, bottom: 8),
                        child: Text(
                          'Italian Restaurant - London',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          'ITALIAN FOODS, CHINESE, THAI FOOD, BBQ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Text(
                          "Starters",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:  _dishList == null ? 0:_dishList.length,
                          itemBuilder: (context, index) {
                            DishesList dish = _dishList[index];
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          dish.img
                                      ),
                                      height: 100,
                                      width: 100,
                                      fit:BoxFit.fitHeight,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(dish.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(dish.description,style: TextStyle(fontSize: 15,color: Colors.blueGrey[300]),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("\$${dish.price}.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color:Colors.blue),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          child: Text("Add to Cart",style: TextStyle(
                                            fontSize: 15,
                                          ),),
                                          onPressed: () {
                                            setState(() {
                                              cartList.value.add(dish);
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Text(
                          "Main Course",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:  _dishList == null ? 0:_dishList.length,
                          itemBuilder: (context, index) {
                            DishesList dish = _dishList[index];
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          dish.img
                                      ),
                                      height: 100,
                                      width: 100,
                                      fit:BoxFit.fitHeight,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(dish.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(dish.description,style: TextStyle(fontSize: 15,color: Colors.blueGrey[300]),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("\$${dish.price}.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color:Colors.blue),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          child: Text("Add to Cart",style: TextStyle(
                                            fontSize: 15,
                                          ),),
                                          onPressed: () {
                                            setState(() {
                                              if(cartList.value.contains(dish)){
                                                cartList.value=cartList.value;
                                              }else{
                                                cartList.value.add(dish);
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              Positioned(
                bottom: 0.01*MediaQuery.of(context).size.height,
                height: 0.1*MediaQuery.of(context).size.height,
                width: 1*MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsets.only(left:8,right: 8),
                  decoration: new BoxDecoration(
                    color: Colors.black87,
                    shape:BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(4.0),),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${cartList.value.length} items",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Row(
                                children: [
                                  Text("\$${totalAmount.value}.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),Text("          PLUS TEXT",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Cart(),
                                ));
                          },
                          child: Text(
                              'View Cart',
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
        )
    );
  }
}