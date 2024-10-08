import 'package:fast_1/view_models/user_quote_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/image_preview_widget.dart';
import 'package:fast_1/views/widgets/next_step_button.dart';
import 'package:fast_1/views/user_quote_deadline_page/user_quote_deadline_page.dart';

class ProductInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 위젯 트리에서 UserQuoteViewModel에 접근
    final viewModel = context.watch<UserQuoteViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('물품 정보 등록'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이 필드들은 viewModel의 함수를 직접 사용하여 상태를 업데이트합니다.
            _buildInputField('물품명', viewModel.updateItemName),
            _buildInputField('HSCode', viewModel.updateHSCode),
            _buildInputFieldWithConversion(
                '총금액',
                (value) =>
                    viewModel.updateTotalPrice(double.tryParse(value) ?? 0.0)),
            Divider(color: Colors.grey),
            _buildInputFieldWithConversion(
                '부피',
                (value) =>
                    viewModel.updateVolume(double.tryParse(value) ?? 0.0)),
            _buildInputField('단위', viewModel.updateVolumeUnit),
            _buildInputField('포장 정보', viewModel.updatePackagingInfo),
            _buildInputFieldWithConversion(
                '개수',
                (value) =>
                    viewModel.updateTotalItems(int.tryParse(value) ?? 0)),
            SizedBox(height: 20),
            Text(
              '제품사진 등록',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            ImagePreviewWidget(), // 이미지 미리보기 위젯
            SizedBox(height: 20),
            NextStepButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: viewModel,
                      child: QuoteDeadlinePage(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // 입력 필드 생성 헬퍼 함수
  Widget _buildInputField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 16),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // 숫자 변환 입력 필드 생성 헬퍼 함수
  Widget _buildInputFieldWithConversion(
      String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 16),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
