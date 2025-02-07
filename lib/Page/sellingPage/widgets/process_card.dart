import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProcessCardSelling extends StatelessWidget {
  final String imagePath;
  final String title;
  final String pemesan;
  final String metodePembayaran;
  final String lokasiPertemuan;
  final double rating;
  final int price;

  const ProcessCardSelling({
    Key? key,
    required this.imagePath,
    required this.pemesan,
    required this.title,
    required this.metodePembayaran,
    required this.lokasiPertemuan,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 0),
      color: AppColors.cardProdukTidakDipilih,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "$imageUrl${imagePath.replaceFirst("storage/", "")}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle().descriptionBold(AppColors.titleLine),
                  ),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.bintang,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: AppColors.borderIcon,
                            size: 20,
                          ),
                        ],
                      ),
                      Text(
                        rating.toString(),
                        style:
                            AppTextStyle().textInfoBold(AppColors.description),
                      ),
                    ].withSpaceBetween(width: 6),
                  ),
                  Row(
                    children: [
                      Text(
                        '${'total'.tr} :',
                        style: AppTextStyle().textInfo(AppColors.description),
                      ),
                      Text(
                        'Rp $price',
                        style: AppTextStyle().textInfoBold(AppColors.hargaStat),
                      ),
                    ].withSpaceBetween(width: 4),
                  ),
                  Row(
                    children: [
                      Text(
                        'metodePembayaran'.tr,
                        style: AppTextStyle().textInfo(AppColors.description),
                      ),
                      Text(
                        metodePembayaran,
                        style: AppTextStyle().textInfoBold(AppColors.hargaStat),
                      ),
                    ].withSpaceBetween(width: 4),
                  ),
                  Row(
                    children: [
                      Text(
                        'Pesanan Oleh'.tr,
                        style: AppTextStyle().textInfo(AppColors.description),
                      ),
                      Text(
                        pemesan,
                        style: AppTextStyle().textInfoBold(AppColors.hargaStat),
                      ),
                    ].withSpaceBetween(width: 4),
                  ),
                  Row(
                    children: [
                      Text(
                        'lokasiPertemuan'.tr,
                        style: AppTextStyle().textInfo(AppColors.description),
                      ),
                      Text(
                        lokasiPertemuan,
                        style: AppTextStyle().textInfoBold(AppColors.hargaStat),
                      ),
                    ].withSpaceBetween(width: 4),
                  ),
                ].withSpaceBetween(height: 6),
              ),
            ),
          ].withSpaceBetween(width: 8),
        ),
      ),
    );
  }
}
