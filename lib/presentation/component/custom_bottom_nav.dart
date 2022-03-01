import 'package:crypto_pricelist_test/core/constants/app_color.dart';
import 'package:crypto_pricelist_test/core/utils/extensions.dart';
import 'package:crypto_pricelist_test/core/utils/gaps.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  final void Function(int) onChange;
  final int currentIndex;
  final List<Widget> items;
  const CustomBottomNav(
      {required this.items,
      required this.onChange,
      this.currentIndex = 0,
      Key? key})
      : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _index = 0;
  List<Widget> _listOfItems = [];

  @override
  void initState() {
    super.initState();
    _index = widget.currentIndex;
    _listOfItems = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItems = [];
    for (var i = 0; i < _listOfItems.length; i++) {
      _navBarItems.add(_buildItem(_listOfItems[i], i));
    }
    return Container(
      width: context.screenWidth(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      color: AppColor.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _navBarItems,
      ),
    );
  }

  Widget _buildItem(Widget child, int position) {
    return InkWell(
      onTap: () {
        widget.onChange(position);
        setState(() {
          _index = position;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
              data: ThemeData(
                iconTheme: IconThemeData(
                    color: _index == position ? AppColor.black : AppColor.grey),
              ),
              child: child),
          const YGap(5),
          Visibility(
            visible: _index == position,
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: AppColor.black,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
