


import 'package:flutter/material.dart';
import 'package:user_test_app/data/models/user_model.dart';
import 'package:user_test_app/screens/profile_screen/screen.dart';
import 'package:user_test_app/source/images.dart';
import 'package:user_test_app/style/app_text_styles.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({Key? key,
    required this.user,

  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: SingleChildScrollView(
        //reverse: true,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 70,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black12,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.picture.thumbnail),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children:  [
                      Expanded(
                        child: Text(
                          user.name.firstName,
                          style: AppTextStyle.textStyle16w500,
                        ),
                      ),
                      Text(
                        user.name.lastName,
                        style: AppTextStyle.textStyle22w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                             ProfileScreen(
                                 user: user
                             )));
                      },
                      child: const Icon(Icons.arrow_forward)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
