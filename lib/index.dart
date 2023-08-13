
import 'package:flutter/material.dart';
import 'package:forjobtest/utility/colors.dart';
import 'package:forjobtest/view/cart/cart.dart';
import 'package:forjobtest/view/home/home.dart';
import 'package:forjobtest/view/orders/ordersList.dart';
import 'package:forjobtest/view/profile/profile.dart';
import 'package:forjobtest/view/wishList/wishList.dart';


class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<Widget> pages = [
    Home(),
    WishList(),
    OrderList(),
    Profile()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: pages[currentIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart())),
            backgroundColor: AppColors.primaryColor,
            child: Stack(
              children: [
                SizedBox(
                    height: 30, width: 30,
                    child: Icon(Icons.shopping_cart_outlined, color: AppColors.white, size: 30,)),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 15, height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.white,
                      //border: Border.all(width: 0.7, color: AppColors.primaryColor)
                    ),
                    child: Center(
                      child: Text("5",
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              width: size.width,
              height: 65,
              padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: ()=>_onItemTapped(0),
                    child: Column(
                      children: [
                        Icon(Icons.home_filled, size: 30, color: currentIndex==0? AppColors.primaryColor : Colors.grey ,),
                        Text("Home",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex==0? AppColors.primaryColor:Colors.grey ,
                              fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    // onTap: ()=>_onItemTapped(1),
                    child: Column(
                      children: [
                        Icon(Icons.favorite, size: 30, color: currentIndex==1? AppColors.primaryColor : Colors.grey ,),
                        Text("Wish List",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex==1? AppColors.primaryColor:Colors.grey ,
                              fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                   // onTap: ()=>_onItemTapped(2),
                    child: Column(
                      children: [
                        Icon(Icons.list_alt_outlined, size: 30, color: currentIndex==2? AppColors.primaryColor : Colors.grey ,),
                        Text("Order List",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex==2? AppColors.primaryColor:Colors.grey ,
                              fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    //onTap: ()=>_onItemTapped(3),
                    child: Column(
                      children: [
                        Icon(Icons.person, size: 30, color: currentIndex==3? AppColors.primaryColor : Colors.grey ,),
                        Text("Person",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex==3? AppColors.primaryColor:Colors.grey ,
                              fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.white,
          ),

        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
