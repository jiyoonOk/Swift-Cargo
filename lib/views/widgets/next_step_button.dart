import 'package:flutter/material.dart';

// 재사용 가능한 NextStepButton 위젯
class NextStepButton extends StatelessWidget {
  final VoidCallback onPressed; // 버튼이 눌렸을 때의 콜백 함수
  final String label; // 버튼에 표시할 텍스트

  NextStepButton({required this.onPressed, this.label = '다음'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
