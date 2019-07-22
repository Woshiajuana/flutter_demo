
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselView extends StatefulWidget {

  const CarouselView({
    Key key,
    this.data,
  }) : super(key: key);

  final List data;

  @override
  _CarouselViewState createState() => new _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {

  // 声明一个list 存放image Widget
  List<Widget> imageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _formatData();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 345.0,
      child: Swiper(
        itemBuilder: _carouselBuilder,
        itemCount: imageList.length,
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

  void _formatData () {
    List<String> arrImageSrc = [];
    if (!mounted) return;
    widget.data?.forEach((item) {
      if (item['type'] == 'wheelPlanting') {
        arrImageSrc = item['filePath'].split(',');
      }
    });
    print('arrImageSrc => $arrImageSrc');
    arrImageSrc.forEach((item) {
      imageList.add(Image.network(
        item,
        fit: BoxFit.fill,
      ));
    });
    this.setState((){});
  }

}