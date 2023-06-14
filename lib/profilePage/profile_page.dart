import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user.dart';
import 'user_data.dart';
import '../profilePage/profileWidgets/numbers_widget.dart';
import '../profilePage/profileWidgets/profile_widget.dart';
import '../appConstants/backround_color_widget.dart';
//import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      //appBar: buildAppBar(context),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              backgroundcolor(),
              ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 24,
                  ),
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () async {},
                  ),
                  const SizedBox(height: 24),
                  buildName(user),
                  const SizedBox(height: 24),
                  buildUpgradeButton(),
                  const SizedBox(height: 24, width: 60),
                  const NumbersWidget(),
                  const SizedBox(height: 48),
                  buildAbout(user),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      //width: double.infinity,
      //height: double.infinity,
      child: SizedBox(
        width: 20,
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 215, 249, 255),
            ),
            elevation: const MaterialStatePropertyAll(5.0),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(15.0)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()),);
          },
          child: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Color.fromARGB(255, 14, 28, 54),
              letterSpacing: 1.5,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono',
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
