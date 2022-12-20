import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:interioro_casa/data/carousel_data.dart';

class TopCarousel extends StatefulWidget {
  const TopCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<TopCarousel> createState() => _TopCarouselState();
}

class _TopCarouselState extends State<TopCarousel> {
  int activeImage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        topCarouselBuilder(size),
        const SizedBox(
          height: 32,
        ),
        Container(
          child: buildIndicator(),
        ),
      ],
    );
  }

  CarouselSlider topCarouselBuilder(Size size) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 400.0,
          viewportFraction: 1,
          pageSnapping: true,
          onPageChanged: (index, reason) =>
              {setState((() => activeImage = index))}),
      itemCount: CarouselData.img.length,
      itemBuilder: (context, index, realIndex) {
        final url = CarouselData.img[index];
        return Stack(
          // fit: StackFit.expand,
          children: [
            Positioned(
              child: Image.asset("assets" + url,
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
            ),
            Positioned(
              width: size.width,
              left: 10,
              child: Text(
                CarouselData.text[index],
                style: const TextStyle(
                    backgroundColor: Colors.black12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    overflow: TextOverflow.visible),
              ),
              top: 150,
            ),
            Positioned(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Book an appointment",
                  ),
                ),
                bottom: 40.0,
                left: (MediaQuery.of(context).size.width) / 2 - 70),
          ],
        );
      },
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeImage,
        // activeIndex: 0,
        count: CarouselData.img.length,
        effect: const ScrollingDotsEffect(
            activeDotColor: Colors.pink,
            fixedCenter: true,
            dotHeight: 10,
            dotWidth: 10),
      );
}

