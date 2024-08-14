import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_1/view_models/quote_viewmodel.dart';
import 'package:country_picker/country_picker.dart';

class AddressInputSection extends StatelessWidget {
  final bool isDeparture;

  AddressInputSection({required this.isDeparture});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuoteViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isDeparture ? '출발지' : '도착지',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _selectCountry(context, viewModel),
                child: Text(
                  '국가 : ${isDeparture ? viewModel.originCountry : viewModel.destinationCountry}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 8), // 국가 선택과 세부주소 간의 간격을 위한 SizedBox
              TextField(
                onChanged: (value) {
                  isDeparture
                      ? viewModel.updateOriginAddress(value)
                      : viewModel.updateDestinationAddress(value);
                },
                decoration: InputDecoration(
                  hintText: '세부주소',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 국가 선택 함수
  void _selectCountry(BuildContext context, QuoteViewModel viewModel) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        isDeparture
            ? viewModel.updateOriginCountry(country.name)
            : viewModel.updateDestinationCountry(country.name);
      },
    );
  }
}
