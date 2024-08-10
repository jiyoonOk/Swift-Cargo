import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/quote_view_model.dart';

class DatePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuoteViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '운송일시',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        GestureDetector(
          onTap: () => _selectDate(context, viewModel),
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${viewModel.transportDate.toLocal()}'.split(' ')[0],
                    style: TextStyle(fontSize: 16)),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 날짜 선택 함수
  void _selectDate(BuildContext context, QuoteViewModel viewModel) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: viewModel.transportDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != viewModel.transportDate) {
      viewModel.updateTransportDate(pickedDate);
    }
  }
}
