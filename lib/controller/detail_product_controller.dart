import 'dart:convert';
import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/html_escape.dart';
import 'package:html/parser.dart';
import 'package:get/get.dart';
import 'package:mini_app/model/detail_product_model.dart';
import 'package:http/http.dart' as http;

class DetailProductController extends GetxController {
  Rx<DetailProductTotalModel?> detailProduct = Rxn<DetailProductTotalModel>();

  RxBool isLoading = false.obs;
  RxString titleColor = ''.obs;
  RxString titleSizeMemory = ''.obs;

  List<AttributeGroups> attributes = [];

  List<String> getInfoTitleList = [];
  List<String> imageCarousel = [];

  void changeColor(String value) {
    titleColor.value = value;
  }

  void changeSize(String value) {
    titleSizeMemory.value = value;
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement?.text ?? '';

    print('parsed string ${parsedString}');
    return parsedString;
  }

  List<String?> colorOptions() {
    print('model ne ${detailProduct.value?.result?.product?.productOptions!.rows?[1].options}');
    List<String?> colorOptions = detailProduct
            .value?.result?.product?.productOptions?.rows?[1].options
            ?.map((e) => e.label)
            .toList() ??
        [];

    print('coloroPTIONS ${colorOptions}');
    return colorOptions;
  }

  void getInfoTitle() {
    getInfoTitleList =
        detailProduct.value?.result?.product?.productDetail?.shortDescription?.split('<br/>') ?? [];
  }

  void getAttributes() {
    attributes = detailProduct.value?.result?.product?.productDetail?.attributeGroups ?? [];
  }

  void getImageCarousel() {
    imageCarousel = detailProduct.value?.result?.product?.productDetail?.images
            ?.map((e) => e.url ?? '')
            .toList() ??
        [];
  }

  List<String?> sizeMemory() {
    final List<String?> sizeMemories = detailProduct
            .value?.result?.product?.productOptions?.rows?[0].options
            ?.map((e) => e.label)
            .toList() ??
        [];
    return sizeMemories;
  }

  Future<void> getDetailProduct() async {
    isLoading.value = true;

    const String userUrl =
        "https://discovery.tekoapis.com/api/v1/product?productld=535038&sku=230900684&location=&terminalCode=phongvu";
    try {
      final response = await http.get(Uri.parse(userUrl));
      if (response.statusCode == 200) {
        detailProduct.value =
            DetailProductTotalModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        isLoading.value = false;
        // update();
      } else {
        isLoading.value = false;
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    } catch (error) {
      isLoading.value = false;
      Get.snackbar('Error Loading data!', 'error occurs');
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getDetailProduct();
    getInfoTitle();
    getAttributes();
    getImageCarousel();
  }

  static const testHtml =
      r'''<p>Trong bộ sưu tập iPhone 15 series được ra mắt trong năm 2023, <strong>iPhone 15 Plus</strong> nói riêng và các phiên bản iPhone 15 khác nói chung được đánh giá cao có bước nhảy vọt trong thiết kế mới, tính năng nổi bật được cải tiến hơn so với iPhone 14 series năm 2022, đem lại một trải nghiệm hoàn toàn mới mẻ cho các tín đồ đam mê iPhone. Cùng Phong Vũ tìm hiểu về iPhone 15 Plus qua bài viết này!</p><figure class=\"image\"><img src=\"https://storage.googleapis.com/teko-gae.appspot.com/media/image/2023/9/29/bff96341-e48c-4ee3-935b-5e775e73045b/image.jpeg\" alt=\"Trong bộ sưu tập Iphone 15 series\"><figcaption>Trong bộ sưu tập iPhone 15 series</figcaption></figure><h2><strong>Đánh giá iPhone 15 Plus: Siêu phẩm bị lãng quên của Apple!</strong></h2><figure class=\"media\"><div data-oembed-url=\"https://www.youtube.com/watch?v=ufrExwCfdo0\"><div style=\"position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;\"><iframe src=\"https://www.youtube.com/embed/ufrExwCfdo0\" style=\"position: absolute; width: 100%; height: 100%; top: 0; left: 0;\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe></div></div></figure><h2><strong>Thiết kế sang trọng đẳng cấp, khung viền nhôm bền bỉ</strong></h2><p>So với các phiên bản iPhone 12, iPhone 13 và iPhone 14 thì các phiên bản trên iPhone 15 đều vẫn giữ nguyên thiết kế vuông ở các cạnh nhưng được điều chỉnh viền vuông thành bo tròn nhẹ, đồng thời iPhone 15 Plus có kích thích 160.9 x 77.8 x 7.80 mm và có trọng lượng 201 gram giúp bạn cầm nắm chiếc điện thoại trở nên dễ dàng hơn.</p><p>Bên cạnh đó, nếu iPhone 15 Pro và iPhone 15 Pro Max được trang bị khung Titan thì iPhone 15 Plus vẫn được trang bị khung viền nhôm như các dòng iPhone trước đó, vẫn đảm bảo lại sự bền bỉ, sang trọng là điểm nổi bật của những chiếc iPhone so với những dòng điện thoại khác. Với iPhone 15 Plus, bạn sẽ có nhiều phiên bản màu sắc để lựa chọn như: xanh lá, xanh dương, vàng, hồng và đen.</p><h2><strong>Hiệu năng ấn tượng với con chip A16 Bionic, dung lượng RAM lớn 6GB</strong></h2><p>Năm nay trên chiếc iPhone 15 Plus được trang bị con chip A16 Bionic chỉ xuất hiện trên iPhone 14 Pro và iPhone 14 Pro Max vừa thời điểm ra mắt. A16 Bionic được sản xuất trên tiến trình 4nm giúp tiết kiệm điện năng tiêu thụ lên đến 40% so với A15 Bionic. GPU còn được cải tiến vượt trội giúp iPhone 15 Plus hiển thị đồ họa mượt mà hơn đem lại chất lượng hình ảnh ấn tượng.</p><figure class=\"image\"><img src=\"https://storage.googleapis.com/teko-gae.appspot.com/media/image/2023/9/29/856478a7-fdeb-4e8a-b4f0-1d636da32aa2/image.jpeg\" alt=\"Hiệu năng ấn tượng với con chip A16 Bionic, dung lượng RAM lớn 6GB\"><figcaption>Hiệu năng ấn tượng với con chip A16 Bionic, dung lượng RAM lớn 6GB</figcaption></figure><p>Bên cạnh đó, iPhone 15 Plus dung lượng RAM lớn lên đến 6GB giúp lưu trữ tạm thời nhiều tab ứng dụng cũng như chuyển các tab một cách mượt mà và không gặp các tình trạng giật lag hay đơ máy khi sử dụng điện thoại trong khoảng thời gian dài.</p><h2><strong>Màn hình 6.7 inch OLED Super Retina XDR, bộ nhớ trong 128GB</strong></h2><p>iPhone 15 Plus được thiết kế màn hình lớn 6.7 inch, lớn nhất trong các phiên bản iPhone 15 năm nay và đi kèm với các viền được thu nhỏ giúp chiếc điện thoại trông nhỏ gọn hơn. Cùng với công nghệ màn hình OLED Super Retina XDR có độ tương phản cao 2.000.000:1, đồng thời còn được trang bị độ phân giải 2796 x 1290 pixels đem lại hình ảnh hiển thị trung thực, sinh động và sắc nét hơn.</p><p>Bên cạnh đó, iPhone 15 Plus được trang bị bộ nhớ trong lên đến 128GB giúp bạn thoải mái lưu trữ nhiều dữ liệu, tập tin, hình ảnh và video hay tải được nhiều ứng dụng cần thiết với nhu cầu sử dụng mà không lo lắng việc đầy bộ nhớ. Ngoài ra, iPhone 15 Plus còn có các phiên bản bộ nhớ trong khác như: 256GB và 512GB.</p><figure class=\"image\"><img src=\"https://storage.googleapis.com/teko-gae.appspot.com/media/image/2023/9/29/701ad2c1-7856-479b-a0bb-cc4ec0b2b151/image.jpeg\" alt=\"Màn hình 6.7 inch OLED Super Retina XDR, bộ nhớ trong 128GB\"><figcaption>Màn hình 6.7 inch OLED Super Retina XDR, bộ nhớ trong 128GB</figcaption></figure><h2><strong>Chụp ảnh sắc nét với bộ camera ấn tượng, thu phóng quang học 2x</strong></h2><p>iPhone 15 Plus được trang bị camera trước 12MP cho ra những tấm ảnh tự sướng sắc nét, chân thực đi kèm với cụm camera sau với một camera chính 48MP và một camera phụ 12MP được thiết kế nằm chéo nhau như dòng iPhone 14 Plus hỗ trợ chụp ảnh với chất lượng cao cùng độ phân giải ấn tượng. Với cảm biến quad-pixel và Focus Pixels 100% giúp bạn lấy được nét nhanh chóng.</p><p>Ngoài ra, iPhone 15 Plus được hỗ trợ thu phóng quang học 2x với 3 mức độ so với thu phóng quang học 5x trên iPhone 15 Pro và iPhone 15 Pro Max tuy không chụp được những tấm ảnh có tầm nhìn xa hơn, nhưng bạn vẫn có thể có được những tấm ảnh có độ xa vừa phải với độ sắc nét tuyệt vời. iPhone 15 Plus còn được trang bị Dynamic Island hiển thị thông báo và cảnh cáo trực tiếp.</p><figure class=\"image\"><img src=\"https://storage.googleapis.com/teko-gae.appspot.com/media/image/2023/9/29/ca887e6c-8a71-4aec-9124-e669df9a55d8/image.jpeg\" alt=\"Chụp ảnh sắc nét với bộ camera ấn tượng, thu phóng quang học 2x\"><figcaption>Chụp ảnh sắc nét với bộ camera ấn tượng, thu phóng quang học 2x</figcaption></figure><h2><strong>Nút tác vụ tích hợp nhiều tính năng, hệ điều hành ISO 17 mới</strong></h2><p>Nút tác vụ từ các dòng iPhone 14 series trở về trước đều được thiết kế với nút tác vụ đẩy để chỉnh chế độ chuông và im lặng. Tuy nhiên kể từ iPhone 15 series trở về sau sẽ được thay đổi bằng nút nhấn tiện lợi và tích hợp kèm theo nhiều tính năng như: chụp ảnh, đèn pin, phím tắt, ghi âm, trợ năng,…</p><p>Bên cạnh đó, iPhone 15 Plus được trang bị hệ điều hành mới nhất của Apple trong năm nay là ISO 17 được cập nhật nhiều tính năng nổi bật như chia sẻ vị trí nội tuyến, cải tiến cho Airdrop tính năng NameDrop giúp bạn chia sẻ thông tin liên hệ nhanh chóng chỉ cần để 2 chiếc iPhone gần nhau.</p><h2><strong>Thời lượng pin sử dụng được cải thiện, hỗ trợ sạc nhanh không dây</strong></h2><p>Dung lượng pin trên iPhone 15 Plus được trang bị lên đến 4.383mAh, đây là dung lượng lớn thứ hai chỉ sau iPhone 15 Pro Max trong chuỗi iPhone 15 series năm nay. Với dung lượng này Apple công bố sẽ có thời lượng xem video lên đến 26 giờ và có thời lượng xem lớn hơn 3 giờ so với iPhone 12, giúp bạn có thể sử dụng cả ngày dài làm việc.</p><figure class=\"image\"><img src=\"https://storage.googleapis.com/teko-gae.appspot.com/media/image/2023/9/29/21f40cf4-ea55-406b-9703-6e1b6ec549e4/image.jpeg\" alt=\"Thời lượng pin sử dụng được cải thiện, hỗ trợ sạc nhanh không dây\"><figcaption>Thời lượng pin sử dụng được cải thiện, hỗ trợ sạc nhanh không dây</figcaption></figure><p>Giống như các dòng iPhone 15 khác thì trên iPhone 15 Plus vẫn được hỗ trợ công nghệ sạc nhanh không dây MagSafe lên đến 15W và sạc không dây Qi lên đến 7.5W giúp bạn có thể sạc điện thoại khi đang ở bên ngoài với thời gian sạc ngắn.</p><h2><strong>Thay thế cổng sạc Lightning thành USB-C, cổng kết nối đa dạng</strong></h2><p>Kể từ iPhone 15 series trở về sau, Apple sẽ thay thế hoàn toàn cổng sạc Lightning truyền thống của hãng thành cổng sạc USB-C. Từ đây, bạn sẽ có thể đồng bộ cổng sạc điện thoại của mình với các thiết bị điện tử khác như máy tính bảng, tai nghe không dây,…</p><p>Ngoài ra, iPhone 15 Plus còn được hỗ trợ nhiều cổng kết nối tiện ích như&nbsp; Bluetooth 5.3 truyền tải dữ liệu nhanh chóng và Wi-Fi 802.11 a/b/g/n/ac/6 có tốc độ kết nối mạng ấn tượng, đồng thời hỗ trợ GPS, GLONASS, GALILEO, BDS, QZSS.</p><figure class=\"image\"><img src=\"https://storage.googleapis.com/teko-gae.appspot.com/media/image/2023/9/29/58faeaac-a343-432a-a74b-5dc2ae989f61/image.jpeg\" alt=\"Thay thế cổng sạc Lightning thành USB-C, cổng kết nối đa dạng\"><figcaption>Thay thế cổng sạc Lightning thành USB-C, cổng kết nối đa dạng</figcaption></figure><h2><strong>Video so sánh giữa iPhone 15 và iPhone 15 Plus chi tiết</strong></h2><figure class=\"media\"><div data-oembed-url=\"https://youtu.be/3EXeqarA9Fk?feature=shared\"><div style=\"position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;\"><iframe src=\"https://www.youtube.com/embed/3EXeqarA9Fk\" style=\"position: absolute; width: 100%; height: 100%; top: 0; left: 0;\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe></div></div></figure><h2><strong>Mua iPhone 15 Plus mới chính hãng tại Phong Vũ | Hỗ trợ bảo hành 12 tháng</strong></h2><p>Có thể nói iPhone 15 Plus nói riêng và iPhone 15 series nói chung đã được Apple cải tiến nhiều tính năng tiện ích, thay đổi thiết kế độc đáo hơn so với iPhone 14 Series. iPhone 15 Plus hiện đang được bán chính hãng tại các Showroom của&nbsp;<a href=\"http://phongvu.vn\">Phong Vũ</a> trên toàn quốc. Hãy đến Phong Vũ trải nghiệm sản phẩm và mua hàng ngay đi kèm với chính sách bảo hành chính hãng 12 tháng và hỗ trả khách hàng trả góp lãi suất thấp.</p>''';
}
