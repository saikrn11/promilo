import '../../../app_imports/app_constant_imports.dart';
import '../../../app_imports/app_default_imports.dart';
import '../../../widgets/star_rating.dart';
import 'desc_img.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
        title: Text(
          "Description",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DescriptionImages(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_border_outlined,
                    color: blue,
                  ),
                  const Spacer(),
                  Text(
                    "1034",
                    style: Fonts().h4m(context),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_border_outlined,
                    color: blue,
                  ),
                  const Spacer(),
                  Text(
                    "1034",
                    style: Fonts().h4m(context),
                  ),
                  const Spacer(),
                  const StarRating(3.2),
                  const Spacer(),
                  Text(
                    "3.2",
                    style: Fonts().h4m(context).copyWith(
                          color: blue,
                        ),
                  ),
                  const Spacer(
                    flex: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Actor Name",
                style: Fonts().h3l(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Indian Actress",
                style: Fonts().h4l(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "🕓 Duration 20 Mins",
                style: Fonts().h4l(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "💼 Total Average Fees ₹9,999",
                style: Fonts().h4l(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "About",
                style: Fonts().h3l(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. so, you may find yourself wondering what are thr benefits of going on a surf camp.",
                style: Fonts().h4l(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "See More",
                  style: Fonts().h4l(context).copyWith(
                        color: blue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
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
