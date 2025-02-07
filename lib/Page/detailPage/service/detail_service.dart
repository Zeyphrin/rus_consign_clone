import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/detail_barang_response.dart';

class DetailService {
  static Future<DetailBarangModel> fetchProductDetail(int productId) async {


    final response = await http.get(
      Uri.parse("https://rusconsign.com/api/barang/$productId"),
    );

    // ignore: avoid_print
    print(response.body);

    if(response.statusCode == 200) {
      return detailBarangModelFromJson(response.body);
    }else{
      throw  Exception("gagal");
    }

  }

}