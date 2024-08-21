import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/user_quote_viewmodel.dart';
import 'package:intl/intl.dart'; //intl 패키지를 추가

class DatePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserQuoteViewModel>();

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
                Text(
                  viewModel.currentQuote.transport_date.isNotEmpty
                      ? DateFormat('yyyy-MM-dd').format(
                          DateTime.parse(viewModel.currentQuote.transport_date))
                      : '날짜를 선택하세요',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 날짜 선택 함수
  void _selectDate(BuildContext context, UserQuoteViewModel viewModel) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: viewModel.currentQuote.transport_date.isNotEmpty
          ? DateTime.parse(viewModel.currentQuote.transport_date)
          : DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      viewModel.updateCurrentQuote(
          viewModel.currentQuote.copyWith(transport_date: formattedDate));
    }
  }
}
