import 'package:fast_1/view_models/user_quote_viewmodel.dart';
import 'package:fast_1/models/quote_image_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePreviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserQuoteViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () => _pickImage(viewModel),
          child: Text('사진 추가', style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 10),
        _buildImagePreview(viewModel),
      ],
    );
  }

  // 이미지 선택 함수
  Future<void> _pickImage(UserQuoteViewModel viewModel) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      for (var image in images) {
        viewModel.addImage(QuoteImage(path: image.path));
      }
    }
  }

  // 이미지 미리보기 빌드 함수
  Widget _buildImagePreview(UserQuoteViewModel viewModel) {
    return (viewModel.currentQuote.images != null &&
            viewModel.currentQuote.images!.isNotEmpty)
        ? Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                viewModel.currentQuote.images!.asMap().entries.map((entry) {
              int index = entry.key;
              QuoteImage image = entry.value;
              return Stack(
                children: [
                  Image.file(
                    File(image.path),
                    height: 100,
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () => viewModel.removeImage(index),
                      child: Icon(Icons.cancel, color: Colors.black),
                    ),
                  ),
                ],
              );
            }).toList(),
          )
        : Center(child: Text('등록된 사진이 없습니다.'));
  }
}
