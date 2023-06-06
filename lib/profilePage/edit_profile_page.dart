import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../appConstants/backround_color_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile(
      {super.key,
      required this.email,
      required this.name,
      required this.schoolORjob,
      required this.about});

  final String email;
  final String name;
  final String schoolORjob;
  final String about;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController aboutController;
  late TextEditingController shoolORhjobbController;

  @override



  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              backgroundcolor(),

            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
      ),
    );
  }
}
