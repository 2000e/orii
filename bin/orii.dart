import 'package:dio/dio.dart';

void main(List<String> args) async {
  try {
    final dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 3)));
    Response response = await Dio().get("https://api.xygeng.cn/one");
    dio.close();
    final data = response.data;
    if (data['code'] != 200) throw Exception(data['error']);

    final oneWord = data['data'];
    final content = oneWord["content"];
    final origin = oneWord["origin"];
    final name = oneWord["name"];
    final tag = oneWord["tag"];
    print(
        " 🍵 $content \n    \x1B[35m#$tag \x1B[36mfrom \x1B[32m${name == "佚名" ? '' : name + "@"}$origin");
  } catch (e) {
    print("😥 网络出错了...");
  }
}
