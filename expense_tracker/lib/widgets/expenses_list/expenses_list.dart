import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // When list of known elements can use Column, either way use ListView
    // builder allows to create list bigger only if they need it
    return ListView.builder(
      itemCount: expenses
          .length, // Value to know how many items will be displayed and used to index
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}
