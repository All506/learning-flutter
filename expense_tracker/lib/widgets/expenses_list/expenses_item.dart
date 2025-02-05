import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    // Card is mostly used for styling
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4), // adds space
            Row(
              children: [
                Text(
                    '\$${expense.amount.toStringAsFixed(2)}'), // only show two digits after comma
                // Spacer takes most of the space so row can be align to the right
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
