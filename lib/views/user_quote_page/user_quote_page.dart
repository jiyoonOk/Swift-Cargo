import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/quote_view_model.dart';
import 'widgets/address_input_section.dart';
import 'widgets/date_picker_widget.dart';
import 'widgets/incoterm_picker_widget.dart';
import 'package:fast_1/views/widgets/next_step_button.dart';
import 'package:fast_1/views/user_product_info_page/user_product_info_page.dart';

class ShippingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildTabButton(context, 0, '수출'),
                _buildTabButton(context, 1, '수입'),
              ],
            ),
            SizedBox(height: 20),
            AddressInputSection(isDeparture: true), // 출발지
            SizedBox(height: 20),
            AddressInputSection(isDeparture: false), // 도착지
            SizedBox(height: 20),
            DatePickerWidget(), // 날짜 선택
            SizedBox(height: 20),
            IncotermPickerWidget(), // 인코텀즈 선택
            SizedBox(height: 20),
            NextStepButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductInfoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // 탭 버튼 빌드 함수
  Widget _buildTabButton(BuildContext context, int index, String text) {
    final viewModel = context.watch<QuoteViewModel>();

    return Expanded(
      child: GestureDetector(
        onTap: () {
          viewModel.updateTabIndex(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: viewModel.selectedTabIndex == index
                ? Theme.of(context).primaryColor
                : Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? 8 : 0),
              bottomLeft: Radius.circular(index == 0 ? 8 : 0),
              topRight: Radius.circular(index == 1 ? 8 : 0),
              bottomRight: Radius.circular(index == 1 ? 8 : 0),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: viewModel.selectedTabIndex == index
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
