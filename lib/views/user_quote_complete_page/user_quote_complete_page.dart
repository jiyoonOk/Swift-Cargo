import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/user_quote_viewmodel.dart';

class QuoteCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserQuoteViewModel>();

    DateTime quoteDeadline =
        DateTime.tryParse(viewModel.currentQuote.quote_deadline)?.toLocal() ??
            DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text('견적 요청 완료'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Icon(Icons.check_circle, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              '견적 요청 완료!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '견적 사항',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            _buildQuoteDetail('물품명', viewModel.currentQuote.item_name),
            _buildQuoteDetail('HSCode', viewModel.currentQuote.hs_code),
            _buildQuoteDetail('총금액', '${viewModel.currentQuote.total_price} 원'),
            _buildQuoteDetail('부피',
                '${viewModel.currentQuote.volume} ${viewModel.currentQuote.volume_unit}'),
            _buildQuoteDetail('포장정보', viewModel.currentQuote.packaging_info),
            _buildQuoteDetail(
                '개수', viewModel.currentQuote.total_items.toString()),
            _buildQuoteDetail(
                '견적 요청 마감일', quoteDeadline.toString().split(' ')[0]),
          ],
        ),
      ),
    );
  }

  // 견적 상세 정보 빌드 함수
  Widget _buildQuoteDetail(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(detail, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
