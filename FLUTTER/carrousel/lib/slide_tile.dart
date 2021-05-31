import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {

 final String image ;
 final bool activePage;

  const SlideTile({Key key, this.image, this.activePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double top = this.activePage ? 50: 150;
    final double blur = this.activePage ? 18: 0;
    final double offset = this.activePage ? 20: 0;

    return AnimatedContainer(
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 1),
      child: Container(
        margin: EdgeInsets.only(left: 30,top: top,bottom: 50,),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(this.image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(color:Colors.black87,
            blurRadius: blur,
            offset: Offset(offset,offset)),


          ]
        ),
      ),
    );
  }
}
