
import 'package:flutter/material.dart';


class Topbar extends StatefulWidget {
  String? title;

  Topbar(String titletext) {
    title = titletext;
  }

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF5E5E5E),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 18,
              ),
            ), // Name & Back Arrow

            const SizedBox(
              width: 5,
            ),
            Text(widget.title!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ],
        ),


        const Icon(
          Icons.menu,
          size: 30,
        ),
      ],
    );
  }
}

class Topbarlogin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: const Icon(Icons.arrow_back_ios_outlined),
        ), // Name & Back Arrow

        const Text("SelloVia",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ],
    );
  }
}

class Bottomnav extends StatelessWidget {
  String? navtext;

  Bottomnav(String nav) {
    navtext = nav;
  }

  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      color: const Color(0xFFF5675B),
      child: Text(
        navtext!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//product detais bottom nav
class Bottomnavproduct extends StatelessWidget {
  String? navtext1;
  String? navtext2;

  Bottomnavproduct(String nav1, nav2) {
    navtext1 = nav1;
    navtext2 = nav2;
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 180,
          alignment: Alignment.center,
          color: const Color(0xFF676563),
          child: Text(
            navtext1!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontFamily: 'Fira Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 180,
          height: 70,
          alignment: Alignment.center,
          color: const Color(0xFFF5675B),
          child: Text(
            navtext2!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontFamily: 'Fira Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Bottomnavwithicons extends StatefulWidget {

 final Function(int)? onClick;
  Bottomnavwithicons({ this.onClick});
  @override
  State<Bottomnavwithicons> createState() => _BottomnavwithiconsState();
}

class _BottomnavwithiconsState extends State<Bottomnavwithicons> {
  int clickedItem = 1;

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          //padding: EdgeInsets.all(10),
          height: 50,
          //width:300,
          decoration: ShapeDecoration(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 1 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                   widget.onClick!(0);
                    clickedItem = 1;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.house_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 2 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onClick!(1);
                    clickedItem = 2;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.explore_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 3 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onClick!(3);
                    clickedItem = 3;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 4 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onClick!(4);
                    clickedItem = 4;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.messenger_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          //bottom:15,

          child: InkWell(
            onTap: (){
              widget.onClick!(2);
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
