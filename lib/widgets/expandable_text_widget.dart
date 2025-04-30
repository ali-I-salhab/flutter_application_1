import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/samll_text.dart';
import 'package:get/get.dart';

class ExpandedTextWidget extends StatefulWidget {
  final String text;
  const ExpandedTextWidget({super.key, required this.text});

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  late String firstPart;
  late String secondPart;
  bool hidden =false;
  double textHeight=Get.size.height/10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
if(widget.text.length > textHeight.toInt()){
  print("object");
      firstPart = widget.text.substring(0,textHeight.floor());
    secondPart = widget.text.substring(textHeight.floor()+1,widget.text.length);
}else{
  firstPart=widget.text;
  secondPart="";
}

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:secondPart == "" ? SmallText(text: firstPart,size: 16,) : Column(children: [
       SmallText(text: hidden? "$firstPart....." : firstPart + secondPart,size: 17,),
        InkWell(onTap: (){
          setState(() {
            hidden=!hidden;
          });
        },child: Row(children: [Text("Show More")],))
      ],)  ,
    );
  }
}