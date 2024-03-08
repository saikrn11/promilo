import '../../app_imports/app_constant_imports.dart';
import '../../app_imports/app_default_imports.dart';
import '../../widgets/dot.dart';
import '../../widgets/feed_card.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  int updateActive = 1;
  PageController? pagecontroller;

  ScrollController cont = ScrollController();
  bool visible = true;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    pagecontroller = PageController(
      initialPage: updateActive,
    );

    timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
      if (updateActive < 2) {
        updateActive++;
      } else {
        updateActive = 0;
      }

      pagecontroller!.animateToPage(
        updateActive,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    cont.addListener(() {
      cont.offset > 0.005
          ? setState(() {
              visible = false;
            })
          : cont.offset == 0
              ? setState(() {
                  visible = true;
                })
              : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.2,
          child: PageView.builder(
            controller: pagecontroller,
            onPageChanged: (val) {
              setState(() {
                updateActive = val % feedNews.length;
              });
            },
            itemCount: feedNews.length,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            padEnds: true,
            itemBuilder: (context, i) {
              return FeedCard(
                data: feedNews[i % feedNews.length],
                size: size,
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: feedNews.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Dot(
                active: updateActive == index,
                activeColor: black,
                inactiveColor: grey,
              );
            },
          ),
        ),
      ],
    );
  }
}
