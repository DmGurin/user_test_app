import 'package:flutter/material.dart';

@immutable
abstract class UsersEvent {}

class InitialUsersEvent extends UsersEvent{
}

class RefreshUserEvent extends UsersEvent{

}

class SearchUsersEvent extends UsersEvent{
  SearchUsersEvent({required this.name});
final String name;
}

class ReturnUsersEvent extends UsersEvent{

}