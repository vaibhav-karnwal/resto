
import 'package:flutter/material.dart';
import 'package:resto/model/productModel.dart';
import 'package:resto/screen/restaurantPage.dart';

final totalAmount = ValueNotifier<String>("");

class Cart extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;
  Cart(
      {Key key, this.minValue = 0, this.maxValue = 10, this.onChanged})
      : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  int counter= 0;
  var sum=0;
  int _groupValue = -1;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    print(cartList.value);
    setState(() {
      _loading = false;
    });
    total();
  }

  total() async{
    var amount=0;
    for(var item in cartList.value) {
      amount += int.parse(item.price) * int.parse(item.counter);
    }
    setState(() {
      sum=amount;
      totalAmount.value="$sum";
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
        backgroundColor: Colors.white,
      ),
        body: Stack(
          children:<Widget>[
        SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 8,left: 10),
                      child: Text(
                        'Your Order',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    createCartList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12.0, bottom: 8),
                          child: Text(
                            'ADD MORE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 8,left: 10),
                      child: Text(
                        'ORDER SUMMARY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$ $sum.00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Charge',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Free',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '\$ $sum.00',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 8,left: 10),
                      child: Text(
                        'PAYMENT MODE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: RadioListTile(
                              value: 0,
                              groupValue: _groupValue,
                              title: Text("Cash on Delivery"),
                              onChanged: (newValue) => setState(() => _groupValue = newValue),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                              value: 1,
                              groupValue: _groupValue,
                              title: Text("Digital Payments"),
                              onChanged: (newValue) => setState(() => _groupValue = newValue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
          Positioned(
            bottom: 0.01*MediaQuery.of(context).size.height,
            child: SizedBox(
              width: 1*MediaQuery.of(context).size.width,
              height: 0.07*MediaQuery.of(context).size.height,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: (){},
                  child: Text("Place Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
            ),
          ),

          ],
        )
    );
  }

  createCartList() {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:  cartList.value == null ? 0: cartList.value.length,
        itemBuilder: (context, index) {
          DishesList cartItem = cartList.value[index];
           counter=int.parse(cartItem.counter);
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                        cartItem.img
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
                          child: Text(cartItem.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(cartItem.description,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("\$${cartItem.price}.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color:Colors.blue),),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon:  Image(
                          image: AssetImage("assets/minus.png"
                          ),
                          height: 15,
                          width: 15,
                          fit:BoxFit.fitHeight,
                        ),
                        onPressed: () {
                          setState(() {
                            if (int.parse(cartItem.counter) > widget.minValue) {
                              counter = int.parse(cartItem.counter)-1;
                              cartItem.counter= "$counter";
                            }
                            total();
                            widget.onChanged(counter);
                          });
                        },
                      ),
                      Text(
                        '${cartItem.counter}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        icon: Image(
                          image: AssetImage("assets/add.png"
                          ),
                          height: 15,
                          width: 15,
                          fit:BoxFit.fitHeight,
                        ),
                        onPressed: () {
                          setState(() {
                            if (int.parse(cartItem.counter) > widget.minValue) {
                              counter = int.parse(cartItem.counter)+1;
                              cartItem.counter= "$counter";
                            }
                            total();
                            widget.onChanged(counter);
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
    );
  }
}