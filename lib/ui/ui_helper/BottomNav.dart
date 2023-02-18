import 'package:flutter/material.dart';



class BottomNav extends StatelessWidget {

  PageController pageController ;

   BottomNav({Key? key , required this.pageController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle() ,
      notchMargin: 5,
      color: Colors.amber,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width/ 2 - 20 ,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }, icon: const Icon(Icons.home)) ,
                  IconButton(onPressed: (){
                    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }, icon: const Icon(Icons.bar_chart))
                ],
              ),
            ) ,
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width/ 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }, icon: const Icon(Icons.person)) ,
                  IconButton(onPressed: (){
                    pageController.animateToPage(3, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }, icon: const Icon(Icons.bookmark))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

