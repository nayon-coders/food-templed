import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forjobtest/utility/json.dart';

import '../../utility/colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double height = 70.00;

  double total = 0.00;
  double subTotal = 0.00;
  double discount = 0.00;
  int qty = 1;






  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 3),
                decoration: BoxDecoration(
                    color: AppColors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).pop();
                            print("click");
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor, size: 20,),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text("Cart",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Stack(
                          children: [

                            Icon(Icons.notifications_active, color: AppColors.primaryColor, size: 30,),
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 15, height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.primaryColor,
                                  //border: Border.all(width: 0.7, color: AppColors.primaryColor)
                                ),
                                child: Center(
                                  child: Text("5",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                //height: size.height*.90,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(onPressed: (){}, child: Text("Go to shop",style: TextStyle(fontSize: 17, color: AppColors.primaryColor)),),
                                Icon(Icons.shopping_bag_outlined, color: AppColors.primaryColor, size: 20,)
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 95.00*AppJson.cart.length+AppJson.cart.length*15,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            //shrinkWrap: true,
                            itemCount: AppJson.cart.length,
                            itemBuilder: (_, index){
                              
                              return buildSingleCartPageItems(
                                size: size,
                                name: "${AppJson.cart[index]["productName"]}",
                                price: double.parse("${AppJson.cart[index]["price"]}"),
                                qty: AppJson.cart[index]["qty"],
                                image: "${AppJson.cart[index]["image"]}",
                                increace: ()=>_incrementQuantity(index),
                                dicreace: ()=>_decrementQuantity(index)

                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width*.65,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0,1),
                                        blurRadius: 4,
                                        spreadRadius: 2
                                    )
                                  ]
                              ),
                              child: TextFormField(
                                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                                  hintText: "Apply Coupon",

                                ), // Set minimum width

                              ),
                            ),
                            Container(
                              height: 55,
                              width: size.width*.25,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0,1),
                                        blurRadius: 4,
                                        spreadRadius: 2
                                    )
                                  ]
                              ),
                              child: Center(
                                child: Text("Apply Now",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Sub total: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                           ),
                           Text("\$${_calculateTotal().toStringAsFixed(2)}",
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20,
                             ),
                           )
                         ],
                       ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Discount: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            Text("(-) \$$discount",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 7,),
                        Divider(height: 1, color: Colors.grey,),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            Text("\$${(_calculateTotal()).toStringAsFixed(2)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 30,),



                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
          bottomNavigationBar:  Container(
            height: 65,
            width: size.width,
            padding: EdgeInsets.only(left: 30, right: 30),
            //margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(0,1),
                      blurRadius: 4,
                      spreadRadius: 2
                  )
                ]
            ),
            child: Center(
              child: Text("Place Order",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildSingleCartPageItems({
  required String name,
    required double price,
    required int qty,
    required Size size,
    required String image,
    required VoidCallback increace,
    required VoidCallback dicreace,
}) {
    return Container(
                     width: size.width,
                     padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                     margin: EdgeInsets.only(bottom: 10),
                     decoration: BoxDecoration(
                         color: AppColors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                               color: Colors.grey.shade200,
                               offset: Offset(0,1),
                               blurRadius: 4,
                               spreadRadius: 4
                           )
                         ]
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SizedBox(
                           width:size.width*.55,
                           child: Row(
                             children: [
                               ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.network(image,
                                   width: 60, height: 60, fit: BoxFit.cover,
                                 ),
                               ),
                               SizedBox(width: 15,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   InkWell(
                                     onTap: (){},
                                     child: Text("$name",
                                       style: TextStyle(
                                           fontSize: 17,
                                           fontWeight: FontWeight.w600,
                                           color: Colors.black
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: 10,),
                                   Text("$qty X \$$price ",
                                     style: TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.w400,
                                         color: Colors.black
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),

                         SizedBox(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text("\$${(qty*price).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18
                                ),
                               ),
                               SizedBox(height: 10,),
                               Row(
                                 children: [
                                   InkWell(
                                     onTap: dicreace,
                                     child: Container(
                                         width: 30,
                                         height: 30,
                                         decoration: BoxDecoration(
                                             color: AppColors.primaryColor,
                                             borderRadius: BorderRadius.circular(100)
                                         ),
                                         child: Icon(Icons.remove, color: AppColors.white, size: 14,)
                                     ),
                                   ),
                                   SizedBox(width: 6,),
                                   Container(
                                     padding: EdgeInsets.only(left: 5, right: 5),
                                     child: Text("$qty",
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 15
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 6,),
                                   InkWell(
                                     onTap: increace,
                                     child: Container(
                                         width: 30,
                                         height: 30,
                                         decoration: BoxDecoration(
                                             color: AppColors.primaryColor,
                                             borderRadius: BorderRadius.circular(100)
                                         ),
                                         child: Icon(Icons.add, color: AppColors.white, size: 20,)
                                     ),
                                   ),

                                 ],
                               ),
                             ],
                           ),
                         )
                       ],
                     ),
                   );
  }


  void _incrementQuantity(int index) {
    setState(() {
      AppJson.cart[index]['qty']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (AppJson.cart[index]['qty'] > 1) {
        AppJson.cart[index]['qty']--;
      }
      if(AppJson.cart[index]['qty'] == 0){
        AppJson.cart.removeAt(index);
      }
    });
  }

  double _calculateSubtotal(int index) {
    return double.parse("${AppJson.cart[index]['qty']}") * AppJson.cart[index]['price'];
  }

  double _calculateTotal() {
    double total = 0;
    for (var item in AppJson.cart) {
      total += _calculateSubtotal(AppJson.cart.indexOf(item));
    }
    return total;
  }
}
