
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselView extends StatefulWidget {

  @override
  _CarouselViewState createState() => new _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {

  // 声明一个list 存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {

    super.initState();

    imageList
      ..add(Image.network(
        'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
        fit: BoxFit.fill,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 160.0,
      child: Swiper(
        itemBuilder: _carouselBuilder,
        itemCount: 3,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          ),
        ),
        controller: new SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ),
    );
  }

  Widget _carouselBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

}