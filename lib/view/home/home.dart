import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:forjobtest/controller/productController/productController.dart';
import 'package:forjobtest/model/productModels/foodsModel.dart';
import 'package:forjobtest/utility/colors.dart';
import 'package:forjobtest/utility/json.dart';
import 'package:shimmer/shimmer.dart';

import '../singleProduct/singleProduct.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> sliderItems = [
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("assets/images/slider1.jpeg", fit: BoxFit.cover,)),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("assets/images/slider2.jpeg",  fit: BoxFit.cover,)),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("assets/images/slider3.png",  fit: BoxFit.cover,)),
  ];


  List<String> categoryList = [
    "Category1",
    "Category2",
    "Category3",
    "Category4",
    "Category5",
    "Category6",
    "Category7",
    "Category8",
    "Category9",
    "Category10",
  ];
  List<String> selectedCategory = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFoodsFuture = getFoods();
  }

  //menu item ids manage
  List categoryMenuIdList = [];//store category 
  List foodList = []; // store foods data
  
  bool foodsLoad = false;
  Map<String, dynamic> foodsData ={};
  Future? getFoodsFuture;
  getFoods()async{
    setState(() =>foodsLoad = true);
    var res = await ProductController.getFoods();

    if(res.statusCode == 200){
      var data = jsonDecode(res.body)["results"][0];
      setState(() {
        foodsData.addAll(data);
      });
      setState(() =>foodsLoad = false);
      return foodsData;
    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(Icons.dashboard, color: AppColors.primaryColor, size: 30,),
                ),
              ),
              Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text("Location",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("Klaten, Indonesia",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  )
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
          SizedBox(height: 20,),
          Container(
            width: size.width,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.white,
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
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search foods"
              ),

            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView(
              children: [
                CarouselSlider(
                    items: sliderItems,
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16/9,
                      viewportFraction: 0.9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      scrollDirection: Axis.horizontal,
                    )
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (_,index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedCategory.clear();
                            selectedCategory.add(categoryList[index]);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: selectedCategory.contains(categoryList[index]) ? AppColors.primaryColor : AppColors.white,
                            //border: Border.all(width: 1, color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("${categoryList[index]}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: selectedCategory.contains(categoryList[index]) ? AppColors.white : AppColors.primaryColor,
                                fontSize: 15
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30,),

                  //check loading 
                  // ========= //
                  foodsLoad
                    ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (_, catIndex){
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.7),
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return  Shimmer.fromColors(
                            baseColor:  AppColors.white,
                            highlightColor:Colors.grey.shade200,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
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
                              child: Container(
                                color: AppColors.white,
                              ),
                            ),
                          );
                        },
                      );

                    },
                  )
                    : foodsData.isNotEmpty
                    ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: foodsData["category_set"].length > 9 ? 8 : foodsData["category_set"].length,
                  itemBuilder: (_, catIndex){

              
                    List categoryMenuId = foodsData["category_set"][catIndex]["menuitem_set"].toList();
                    for(var i in categoryMenuId){
                      categoryMenuIdList.add(i);
                    }

                    //menuitem_set store
                    for(var i in foodsData["menuitem_set"]){
                      if(categoryMenuIdList.contains(i["id"])){
                        foodList.add(i);
                      }
                    }


                    //Category set data
                    var categorySetData = foodsData["category_set"][catIndex];
                    return Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${categorySetData['name']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black
                                ),
                              ),
                              TextButton(
                                onPressed: (){},
                                child: Text("SEE ALL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor,
                                      fontSize: 18
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio: MediaQuery.of(context).size.width /
                                  (MediaQuery.of(context).size.height / 1.7),
                            ),
                            itemCount: foodList.length,
                            itemBuilder: (context, index) {
                              var newLink;
                              if(foodList[index]["image"] != null){
                                String fileId =
                                foodList[index]["image"][0]["remote_url"].substring(foodList[index]["image"][0]["remote_url"].indexOf('/d/') + 3, foodList[index]["image"][0]["remote_url"].indexOf('/view'));
                                 newLink = 'https://drive.google.com/uc?export=view&id=$fileId';
                              }

                              // print("jsonEncode(foodList[index] ==== ${foodList[index]["images"].length}");
                              // print("jsonEncode(foodList[index] ==== ${foodList[index]["images"]}");

                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleProduct(singleProduct: foodList[index]))),
                                      child: Stack(
                                        children: [
                                          foodList[index]["image"] != null ? ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network("$newLink", height: 100, width: size.width, fit: BoxFit.contain,)
                                          ) : ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset("assets/images/icons/logo.png", height: 100, width: size.width, fit: BoxFit.contain,)
                                          ),
                                          Positioned(
                                            right: 5,
                                            top:5,
                                            child: InkWell(
                                              onTap: (){},
                                              child: Icon(Icons.favorite_border, color: AppColors.primaryColor,),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("${foodList[index]["name"]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber, size: 20,),
                                        Icon(Icons.star, color: Colors.amber, size: 20,),
                                        Icon(Icons.star, color: Colors.amber, size: 20,),
                                        Icon(Icons.star, color: Colors.amber, size: 20,),
                                        Icon(Icons.star_border_outlined, color: Colors.amber, size: 20,),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("\$${foodList[index]["base_price"]}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){},
                                          child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                              child: Icon(Icons.add, color: AppColors.white, size: 20,)
                                          ),
                                        )

                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                )
                    : Center(child: Text("No Data Found"),)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
