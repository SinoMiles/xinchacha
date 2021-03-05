import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

import 'package:get/get.dart';

class Controller extends GetxController with SingleGetTickerProviderMixin {
  static Controller get to => Get.put(Controller());
  final homeTabs = [
    '资讯',
    '课程',
    '方案',
  ];
  final searchTabs = [
    '查芯片',
    '查替代',
    '查企业',
  ];
  TabController tabController;
  TabController searchController;
  TabController homeTabController;
  var homePageMenu = [
    {"icon": 0xE654, 'label': '学课堂'},
    {"icon": 0xE65E, 'label': '查方案'},
    {"icon": 0xE657, 'label': '看直播'},
    {"icon": 0xE664, 'label': 'PCN/PDN'},
    {"icon": 0xE6A0, 'label': '查专利'},
    {"icon": 0xE65B, 'label': '查代理'},
    {"icon": 0xE677, 'label': '查展会'},
    {"icon": 0xE6A5, 'label': '查网信'},
    {"icon": 0xE655, 'label': '丝印反查'},
    {"icon": 0xE653, 'label': '硬件工具'},
    {"icon": 0xE665, 'label': '管控物料'},
    {"icon": 0xE66A, 'label': '实体名单'},
  ];
  final homeNewsList = [
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
    {
      'content': '东京奥组委主席：3月底决定是否允许海外观众入场东京奥组委主席：3月底决定是否允许海外观众入场',
      'image': 'https://inews.gtimg.com/newsapp_ls/0/13241730850_640330/0'
    },
  ];
  void changePage(int _index) {
    navBarCurrentIndex.value = _index;
  }

  ScrollController customScroll;
  final navBar = [
    BottomNavigationBarItem(
      icon:
          Icon(IconData(0xE6BB, fontFamily: 'icon'), color: Color(0xff6f12f6)),
      activeIcon:
          Icon(IconData(0xE678, fontFamily: 'icon'), color: Color(0xff6f12f6)),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon:
          Icon(IconData(0xE6BD, fontFamily: 'icon'), color: Color(0xff6f12f6)),
      activeIcon:
          Icon(IconData(0xE677, fontFamily: 'icon'), color: Color(0xff6f12f6)),
      label: '资讯',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconData(0xE6BF, fontFamily: 'icon')),
      activeIcon: Icon(
        IconData(0xE639, fontFamily: 'icon'),
      ),
      label: '查企业',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconData(0xE6BE, fontFamily: 'icon')),
      activeIcon: Icon(IconData(0xE633, fontFamily: 'icon')),
      label: '萤火学堂',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconData(0xE6BC, fontFamily: 'icon')),
      activeIcon: Icon(IconData(0xE676, fontFamily: 'icon')),
      label: '我的',
    ),
  ];

  var navBarCurrentIndex = 0.obs;
  var navBarPages = [
    HomePage(),
    NewsPage(),
    CompanyPage(),
    StudyPage(),
    MyPage()
  ];
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: homeTabs.length, vsync: this);
    homeTabController =
        TabController(length: homeTabs.length, initialIndex: 0, vsync: this);
    searchController =
        TabController(length: homeTabs.length, initialIndex: 0, vsync: this);
  }
}
