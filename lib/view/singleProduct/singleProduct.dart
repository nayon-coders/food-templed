import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:forjobtest/utility/colors.dart';

class SingleProduct extends StatefulWidget {
  final Map<String, dynamic> singleProduct;
  const SingleProduct({Key? key, required this.singleProduct}) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {

  int currentSliderIndex = 0;

  int qty = 1;

 List<Widget> sliderFoods = [];
 addFoodsInSlider(){
   print("widget.singleProduct['images'] === ${widget.singleProduct['images'][0]["remote_url"]}");
   if(widget.singleProduct['images'] != null){
     for(var i =0; i>widget.singleProduct['images'].length; i++){
       String fileId =
       widget.singleProduct['images'][i]["remote_url"].substring(widget.singleProduct['images'][i]["remote_url"].indexOf('/d/') + 3, widget.singleProduct['images'][i]["remote_url"].indexOf('/view'));

       setState(() {
         sliderFoods.add( ClipRRect(
           borderRadius: BorderRadius.only(
             bottomRight: Radius.circular(30),
             bottomLeft: Radius.circular(30),
           ),
           child: Image.network('https://drive.google.com/uc?export=view&id=$fileId',
             height: MediaQuery.of(context).size.height*.45, width: MediaQuery.of(context).size.width, fit: BoxFit.none,
           ),
         ),);
       });
     }
   }else{
     for(var i =0; i>4; i++){
       setState(() {
         sliderFoods.add( ClipRRect(
           borderRadius: BorderRadius.only(
             bottomRight: Radius.circular(30),
             bottomLeft: Radius.circular(30),
           ),
           child: Image.asset("assets/images/icons/logo.png",
             height: MediaQuery.of(context).size.height*.45, width: MediaQuery.of(context).size.width, fit: BoxFit.none,
           ),
         ),);
       });
     }
   }

 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addFoodsInSlider();

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Stack(
                 alignment: Alignment.center,
                 children: [
                   Container(
                     decoration: BoxDecoration(
                       color: AppColors.primaryColor.withOpacity(0.1)
                     ),
                     child: CarouselSlider(
                         items: sliderFoods,
                         options: CarouselOptions(
                           height: size.height*.45,
                           aspectRatio: 16/9,
                           viewportFraction: 1,
                           initialPage: 0,
                           enableInfiniteScroll: true,
                           reverse: false,
                           autoPlay: true,
                           autoPlayInterval: Duration(seconds: 4),
                           autoPlayAnimationDuration: Duration(milliseconds: 800),
                           autoPlayCurve: Curves.fastOutSlowIn,
                           enlargeCenterPage: true,
                           enlargeFactor: 0.4,
                           scrollDirection: Axis.horizontal,
                           onPageChanged: (index, reason) {
                             setState(() {
                               currentSliderIndex = index;
                             });
                           },
                         ),
                     ),
                   ),
                   Positioned(
                     bottom: 20,
                     child: Align(
                       alignment: Alignment.center,
                       child: DotsIndicator(
                         dotsCount: 3,
                         position: currentSliderIndex,
                         decorator: DotsDecorator(
                           size: const Size.square(9.0),
                           activeSize: const Size(18.0, 9.0),
                           color: AppColors.primaryColor.withOpacity(0.4),
                           activeColor: AppColors.primaryColor,
                           activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                         ),
                       ),
                     ),
                   ),
                   Positioned(
                     left: 20, top: 20,
                     child: InkWell(
                       onTap: ()=>Navigator.pop(context),
                       child: Container(
                         width: 35, height: 35,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: AppColors.primaryColor,
                           //border: Border.all(width: 0.7, color: AppColors.primaryColor)
                         ),
                         child: Padding(
                           padding: EdgeInsets.only(left: 8),
                           child: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 20,)
                         ),
                       ),
                     ),
                   ),
                   Positioned(
                     right: 20, top: 20,
                     child: InkWell(
                       onTap: ()=>Navigator.pop(context),
                       child: Container(
                         width: 35, height: 35,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: AppColors.primaryColor,
                           //border: Border.all(width: 0.7, color: AppColors.primaryColor)
                         ),
                         child:Icon(Icons.favorite_border, color: AppColors.white, size: 20,)
                       ),
                     ),
                   ),
                 ],
               ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width:size.width*.70,
                            child: Text( "${widget.singleProduct["name"]}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text( "\$${(double.parse("${widget.singleProduct["base_price"]}") * qty).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("Category Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 25,),
                          Text("4.5",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text("(97 Reviews)",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                                color: Colors.black54
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("About Foods",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("${widget.singleProduct["description"] != null ? widget.singleProduct["description"] : 'No Description.'}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Text("About Restaurant",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width: size.width,
                        height: 50,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network("https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
                                width: 50, height: 50, fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Restaurant Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 6,),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 25,),
                                    Text("4.5",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text("(150 Reviews)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.black54
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            //width: size.width,
            height: 80,
            padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width*.40,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            if(qty>0){
                              qty--;
                            }
                          });
                        },
                        icon: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.remove, color: AppColors.white, size: 20,)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text("$qty",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            qty++;
                          });
                        },
                        icon: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.add, color: AppColors.white, size: 20,)
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: InkWell(
                    onTap: ()=>addToCart(),
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart_outlined, color: AppColors.white, size: 25,),
                          SizedBox(width: 10,),
                          Text("Add to cart",
                            style: TextStyle(
                                fontSize: 16, color: AppColors.white, fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addToCart()async{

  }
}
