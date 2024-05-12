import 'dart:async';

import 'package:flutter/material.dart';

class MSlider extends StatefulWidget {
  const MSlider(
      {super.key,
      required this.pictures,
      this.height,
      this.dotColors,
      this.selectedDotColor,
      this.autoScroll = true,
      this.autoScrollSecondDuration = 2});

  final List<String> pictures;

  final double? height;
  final Color? dotColors;

  final Color? selectedDotColor;

  final bool autoScroll;

  final int autoScrollSecondDuration;

  @override
  State<MSlider> createState() => _MSliderState();
}

class _MSliderState extends State<MSlider> {
  int index = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    if (widget.autoScroll) {
      Timer.periodic(Duration(seconds: widget.autoScrollSecondDuration),
          (timer) {
        if (pageController.page == widget.pictures.length - 1) {
          pageController.animateToPage(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        } else {
          pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        }
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: widget.height ?? MediaQuery.of(context).size.height / 4,
          child: PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.pictures.length,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.pictures[index],
                  fit: BoxFit.cover,
                );
              }),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.pictures.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: InkWell(
                    onTap: () {
                      pageController.animateToPage(i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                        radius: i == index ? 6 : 3,
                        backgroundColor: i == index
                            ? widget.selectedDotColor ??
                                Theme.of(context).primaryColor
                            : widget.dotColors ?? Colors.white),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
