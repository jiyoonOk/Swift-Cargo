import 'package:fast_1/constants/app_incoterms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/quote_view_model.dart';

class IncotermPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuoteViewModel>();

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
                Text(viewModel.incoterms, style: TextStyle(fontSize: 16)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 인코텀즈 선택 함수
  void _selectIncoterm(BuildContext context, QuoteViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: AppIncoterms.incoterms.map((incoterm) {
            return ListTile(
              title: Text("${incoterm.code} (${incoterm.description})",
                  style: TextStyle(fontSize: 16)),
              onTap: () {
                viewModel.updateIncoterms(incoterm.code);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
