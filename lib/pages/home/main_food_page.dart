
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/food_page_body.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/samll_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BigText(text: 'Syria',color: AppColors.mainColor,size: 20,),
                      Row(
                        children: [
                          SmallText(text: "narsifn",color: Colors.black54,),
                          SizedBox(width: 9),
                          Transform.rotate(
                            angle:0,
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
          
            Expanded(
         
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: FoodPageBody()),
            ),
            
            

          ],
        ),
      ),
    );
  }
}
