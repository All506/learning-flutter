// Starts main user interface

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

// State class for main class
class _ExpensesState extends State<Expenses> {
  // Dummy info
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "Uber",
      amount: 25,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "Dates",
      amount: 29.99,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  // Handles add click
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold general base widget
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        // actions is mostly used to display buttons
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          // Toolbar
          const Text('The chart'),
          // Expenses list
          Expanded(
            // to show component completetly
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
