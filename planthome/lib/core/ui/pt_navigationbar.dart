import 'package:flutter/material.dart';
import 'package:planthome/core/ui/responsive.dart';


import 'package:planthome/core/ui/responsive.dart';

class PtNavigationBar extends StatefulWidget {
  final int posicion;

  const PtNavigationBar({required this.posicion, Key? key}) : super(key: key);

  @override
  State<PtNavigationBar> createState() => _PtNavigationBarState();
}

class _PtNavigationBarState extends State<PtNavigationBar> {
  late int posicion = widget.posicion;
  late Responsive responsive;
  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Container(
      decoration: const BoxDecoration(
        color:  Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 1.00),
            blurRadius: 4.00,
            color:Colors.orange,
            spreadRadius: 1.00,
          ),
        ],
      ),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          backgroundColor:  Colors.orange,
          selectedItemColor: const Color(0xffFFFFFF),
          currentIndex: widget.posicion,
          iconSize: 18,
          selectedFontSize: 10,
          selectedLabelStyle: TextStyle(fontSize:responsive.dp(12)),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Portafolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_rounded),
              label: 'Mercado',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Deuda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: 'Menu',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: const Color(0xffFFFFFF),
          onTap: (index) {
            switch (index) {
              case 0:
                if (widget.posicion != 0) {
              //    Navigator.of(context).pushReplacement(
              //      MaterialPageRoute(
               //         builder: (context) => const PortafolioPage()),
               //   );
                  posicion = index ;
                }
                break;
              case 1:
                if (widget.posicion != 1) {
                //  Navigator.of(context).pushReplacement(
                //    MaterialPageRoute(
                //        builder: (context) => const EmisorasPage()),
                //  );
                  posicion = index;
                }
                break;
              case 2:
                if (widget.posicion != 2) {
                  //Navigator.of(context).pushReplacement(
                   // MaterialPageRoute(
                    //    builder: (context) => const InversionDeudaPage()),
                  //);
                  posicion = index;
                }
                break;
              case 3:
                if (widget.posicion != 3) {
                  //Navigator.of(context).pushReplacement(
                   // MaterialPageRoute(builder: (context) => const MenuPage()),
                  //);
                  posicion = index;
                }
                break;
            }
          },
        ),
      ),
    );
  }
}
