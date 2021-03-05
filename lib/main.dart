import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      // 设备像素大小(必须在首页中获取)
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      // 设计尺寸
      designSize: Size(1080, 2337),
      allowFontScaling: false,
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff6f12f6),
          unselectedItemColor: Color(0xff4655f8),
          items: Controller.to.navBar,
          currentIndex: Controller.to.navBarCurrentIndex.value,
          onTap: (index) {
            Controller.to.navBarCurrentIndex.value = index;
          }),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    color: Color(0xff4396e6),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(150),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(900),
                          height: ScreenUtil().setHeight(300),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                      'assets/images/logo.png'))),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(900),
                          child: TabBar(
                              indicatorColor: Colors.white,
                              labelStyle:
                                  TextStyle(fontSize: ScreenUtil().setSp(35)),
                              controller: Controller.to.searchController,
                              tabs: [
                                for (final tab in Controller.to.searchTabs)
                                  Tab(
                                    text: tab,
                                  )
                              ]),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(30),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(800),
                          height: ScreenUtil().setHeight(90),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search),
                              Text(
                                '型号/类型',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setSp(15))),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(90),
                  ),
                  Center(
                    child: Wrap(
                      spacing: ScreenUtil().setWidth(80),
                      runSpacing: ScreenUtil().setWidth(65),
                      children: [
                        for (final menu in Controller.to.homePageMenu)
                          Container(
                            width: ScreenUtil().setWidth(180),
                            child: Column(
                              children: [
                                Icon(
                                  IconData(int.parse(menu['icon'].toString()),
                                      fontFamily: 'icon'),
                                  color: Color(0xff4396e6),
                                  size: ScreenUtil().setWidth(100),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(45),
                                ),
                                Text(menu['label'].toString())
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(75),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(239),
                    width: ScreenUtil().setWidth(985),
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(40)),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('assets/images/homeAd.png')),
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(30))),
                  ),
                ],
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              title: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  onTap: (index) {},
                  controller: Controller.to.homeTabController,
                  tabs: [
                    for (final tab in Controller.to.homeTabs)
                      Tab(
                        text: tab,
                      )
                  ]),
            ),
          ];
        },
        body: TabBarView(
          controller: Controller.to.homeTabController,
          children: [NewsPage(), NewsPage(), NewsPage()],
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(50)),
                    width: ScreenUtil().setWidth(657),
                    child: Column(
                      children: [
                        Text(
                          Controller.to.homeNewsList[index]['content']
                              .toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(30),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(657),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('中国电子报'),
                              SizedBox(
                                width: ScreenUtil().setWidth(50),
                              ),
                              Text('3小时前'),
                              Spacer(),
                              Icon(
                                IconData(0xE62C, fontFamily: 'icon'),
                                size: ScreenUtil().setSp(50),
                              ),
                              Text('10')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: ScreenUtil().setHeight(240),
                      width: ScreenUtil().setWidth(300),
                      child: Image.network(
                        Controller.to.homeNewsList[index]['image'].toString(),
                        fit: BoxFit.fill,
                      ))
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
              );
            },
            itemCount: Controller.to.homeNewsList.length));
  }
}

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('企业页面'),
      ),
    );
  }
}

class StudyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('学堂页面'),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('我的页面'),
      ),
    );
  }
}
