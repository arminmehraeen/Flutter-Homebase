import 'dart:async';

import 'package:flutter/material.dart';

// Custom Slider widget
class MSlider extends StatefulWidget {
  // Constructor for MSlider
  const MSlider({
    Key? key,
    required this.pictures,
    this.height,
    this.dotColors,
    this.selectedDotColor,
    this.autoScroll = true,
    this.autoScrollSecondDuration = 2,
  }) : super(key: key);

  // List of picture paths to be displayed in the slider
  final List<String> pictures;

  // Height of the slider
  final double? height;

  // Color of the dots
  final Color? dotColors;

  // Color of the selected dot
  final Color? selectedDotColor;

  // Whether to enable auto-scrolling
  final bool autoScroll;

  // Duration for auto-scrolling in seconds
  final int autoScrollSecondDuration;

  @override
  State<MSlider> createState() => _MSliderState();
}

// State class for MSlider
class _MSliderState extends State<MSlider> {
  // Index of the current picture
  int index = 0;

  // Page controller for managing page navigation
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // Auto-scrolling functionality
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
    // Build the slider widget
    return Stack(
      children: [
        // Slider content with PageView
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
                // Display each picture as an Image asset
                return Image.asset(
                  widget.pictures[index],
                  fit: BoxFit.cover,
                );
              }),
        ),
        // Dots indicator at the bottom of the slider
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
                      // Navigate to the selected page
                      pageController.animateToPage(i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                        radius: i == index ? 6 : 3,
                        // Apply selected dot color if the dot is selected, otherwise apply dot color
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
