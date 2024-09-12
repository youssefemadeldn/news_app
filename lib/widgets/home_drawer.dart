import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .2,
              color: Colors.green,
              child: Text(
                "News App!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.list,
                    size: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .01,
                  ),
                  Text(
                    "Categories",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .01,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
