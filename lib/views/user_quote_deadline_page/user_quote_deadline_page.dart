import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/user_quote_viewmodel.dart';
import 'package:fast_1/views/widgets/next_step_button.dart';
import 'package:fast_1/views/user_quote_complete_page/user_quote_complete_page.dart';

class QuoteDeadlinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserQuoteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('견적 요청 마감일 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '견적 요청 마감일을 선택하세요.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 20),
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
                        viewModel.currentQuote.quote_deadline.isNotEmpty
                            ? DateFormat('yyyy-MM-dd').format(DateTime.parse(
                                viewModel.currentQuote.quote_deadline))
                            : '날짜를 선택하세요',
                        style: TextStyle(fontSize: 16)),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            NextStepButton(
              onPressed: () async {
                await viewModel.addOrUpdateQuote(); //서버로 데이터 전송
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: viewModel,
                      child: QuoteCompletePage(),
                    ),
                  ),
                );
              },
              label: '견적 요청',
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context, UserQuoteViewModel viewModel) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: viewModel.currentQuote.quote_deadline != ''
          ? DateTime.parse(viewModel.currentQuote.quote_deadline)
          : DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      viewModel.updateCurrentQuote(
          viewModel.currentQuote.copyWith(quote_deadline: formattedDate));
    }
  }
}
