import 'package:flutter/material.dart';
import 'package:user_test_app/data/models/user_model.dart';
import 'package:user_test_app/screens/profile_screen/screen.dart';
import 'package:user_test_app/style/app_colors.dart';
import 'package:user_test_app/style/app_text_styles.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 70,
              width: 400,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user.picture.thumbnail),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          user.name.firstName,
                          style: AppTextStyle.textStyle18w500
                              .copyWith(color: AppColors.darkGray),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          user.name.lastName,
                          style: AppTextStyle.textStyle18w500
                              .copyWith(color: AppColors.darkGray),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(user: user),
                          ),
                        );
                      },
                      child: const Icon(Icons.arrow_forward),),
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
