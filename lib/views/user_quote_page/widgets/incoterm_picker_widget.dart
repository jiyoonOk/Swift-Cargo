import 'package:fast_1/constants/app_incoterms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/user_quote_viewmodel.dart';

class IncotermPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserQuoteViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '인코텀즈',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        GestureDetector(
          onTap: () => _selectIncoterm(context, viewModel),
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
                  viewModel.currentQuote.incoterms.isNotEmpty
                      ? viewModel.currentQuote.incoterms
                      : '인코텀즈를 선택하세요', // 수정된 부분
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _selectIncoterm(BuildContext context, UserQuoteViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: AppIncoterms.incoterms.map((incoterm) {
            return ListTile(
              title: Text(
                "${incoterm.code} (${incoterm.description})",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                viewModel.updateCurrentQuote(
                    viewModel.currentQuote.copyWith(incoterms: incoterm.code));
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
