import 'package:dio/dio.dart';

void main(List<String> args) async {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.xygeng.cn",
      sendTimeout: Duration(seconds: 1),
      connectTimeout: Duration(seconds: 1)));
  try {
    Response response = await dio.get("/one");
    dio.close();
    final data = response.data;
    if (data['code'] != 200) throw Exception();

    final oneWord = data['data'];
    final content = oneWord["content"];
    final origin = oneWord["origin"];
    final name = oneWord["name"];
    final tag = oneWord["tag"];
    print(
        " 🍵 $content\n\n    \x1B[35m#$tag \x1B[36mfrom \x1B[32m${name == "佚名" ? '' : name + "@"}$origin");
  } catch (e) {
    print("😥 网络出错了...");
  }
}
