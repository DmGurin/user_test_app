import 'package:flutter/material.dart';
import 'package:user_test_app/data/models/user_model.dart';
import 'package:user_test_app/style/app_colors.dart';
import 'package:user_test_app/style/app_text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title:  Text('Profile of ${widget.user.name.firstName}'),
        ),
        backgroundColor: AppColors.darkWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              //height: MediaQuery.of(context).size.width * 1.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 1.1,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.user.picture.large),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.user.name.firstName,
                            style: AppTextStyle.textStyle22w500.copyWith(color: AppColors.darkGray),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.user.name.lastName,
                            style: AppTextStyle.textStyle22w500.copyWith(color: AppColors.darkGray),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('City: ${widget.user.location.city}',
                            style: AppTextStyle.textStyle18w500.copyWith(color: AppColors.gray),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Str. ${widget.user.location.street.nameStreet}, ',
                            style: AppTextStyle.textStyle14w500.copyWith(color: AppColors.gray),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Hse.  ${widget.user.location.street.number.toString()}',
                            style: AppTextStyle.textStyle14w500.copyWith(color: AppColors.gray),
                          ),

                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}