import 'package:promilo/widgets/trending_cards.dart';

import '../../app_imports/app_constant_imports.dart';
import '../../app_imports/app_default_imports.dart';
import '../../functions/text_proper.dart';
import '../../widgets/search_widget.dart';
import 'top_trending_meetup.dart';
import 'news_feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
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
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Individual meetup".proper(),
          style: Fonts().h2l(context).copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: grey,
            thickness: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SearchWidget(
                controller: controller,
                onChanged: (val) {
                  setState(() {});
                },
                color: white,
                border: const BorderSide(
                  width: 1,
                ),
                hintText: 'Search',
              ),
              const SizedBox(
                height: 10,
              ),
              const NewsFeed(),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Trending popular people".proper(),
                  style: Fonts().h4l(context).copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingList.length,
                  itemBuilder: (context, index) {
                    return TrendingCards(
                      data: trendingList[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top Trending Meetups".proper(),
                  style: Fonts().h4l(context).copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TopTrendingMeetups(),
              SizedBox(
                height: size.height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
