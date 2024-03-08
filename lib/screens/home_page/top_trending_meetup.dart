import '../../app_imports/app_constant_imports.dart';
import '../../app_imports/app_default_imports.dart';
import '../../functions/navigation_anim.dart';
import 'description_page/description.dart';
import '../../widgets/number_widget.dart';

class TopTrendingMeetups extends StatelessWidget {
  const TopTrendingMeetups({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: size.height * 0.25,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: topPoster.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                myRoute(
                  page: const Description(),
                  animcurve: Curves.easeInOut,
                  trans: 'Slide',
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  width: size.width * 0.45,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: lightVoilet,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        topPoster[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: -50,
                  child: ClipPath(
                    clipper: NumberClipper(),
                    child: Container(
                      width: 300,
                      color: white,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 40,
                  child: numberWidget(
                    context,
                    (index + 1 <= 9) ? '0${index + 1}' : '${index + 1}',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
