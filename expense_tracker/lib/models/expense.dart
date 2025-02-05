import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Can localizate dates
final formatter = DateFormat.yMd();
// Utility object that can be used anywhere inside of file
const uuid = Uuid();

// Fix set of allowed values
enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining_outlined,
  Category.travel: Icons.flight_class_outlined,
  Category.leisure: Icons.movie_creation_outlined,
  Category.work: Icons.work_outline
};

class Expense {
  // Constructor with Initializer Lists (Variables that are created once object was make)
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id; // generated with uuid package
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
