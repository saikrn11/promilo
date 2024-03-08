import 'package:social_share/social_share.dart';

import '../../../app_imports/app_constant_imports.dart';
import '../../../app_imports/app_default_imports.dart';
import '../../../widgets/dot.dart';

class DescriptionImages extends StatefulWidget {
  const DescriptionImages({super.key});

  @override
  State<DescriptionImages> createState() => _DescriptionImagesState();
}

class _DescriptionImagesState extends State<DescriptionImages> {
  int updateActive = 0;
  PageController? pagecontroller;

  ScrollController cont = ScrollController();
  bool visible = true;
  Timer? timer;
  bool addbookMark = false;
  bool addFav = false;
  bool addRating = false;

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
    cont.addListener(
      () {
        cont.offset > 0.005
            ? setState(() {
                visible = false;
              })
            : cont.offset == 0
                ? setState(() {
                    visible = true;
                  })
                : null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: PageView.builder(
              controller: pagecontroller,
              onPageChanged: (val) {
                setState(() {
                  updateActive = val % descImgList.length;
                });
              },
              itemCount: descImgList.length,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              padEnds: true,
              itemBuilder: (context, i) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: lightVoilet,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20),
                          top: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            descImgList[i] ?? "",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        height: 10,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: descImgList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Dot(
                              active: updateActive == index,
                              activeColor: white,
                              inactiveColor: grey,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.file_download_outlined,
                  size: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addbookMark = !addbookMark;
                    });
                  },
                  child: Icon(
                    addbookMark == false
                        ? Icons.bookmark_border_outlined
                        : Icons.bookmark_outlined,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addFav = !addFav;
                    });
                  },
                  child: Icon(
                    addFav == false
                        ? Icons.favorite_border_outlined
                        : Icons.favorite_outlined,
                    size: 30,
                    color: addFav == false ? black : red,
                  ),
                ),
                const Icon(
                  Icons.center_focus_strong_outlined,
                  size: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addRating = !addRating;
                    });
                  },
                  child: Icon(
                    addRating == false
                        ? Icons.star_border_outlined
                        : Icons.star_outlined,
                    size: 30,
                    color: addRating == false ? black : orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    SocialShare.shareOptions('Promilo share');
                  },
                  child: const Icon(
                    Icons.share_outlined,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
