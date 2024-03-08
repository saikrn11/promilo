import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';
import 'tag_chip.dart';

class TrendingCards extends StatelessWidget {
  const TrendingCards({
    super.key,
    required this.data,
  });
  final Map data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minWidth: size.width * .6,
        maxWidth: size.width * .75,
        minHeight: size.height * 0.15,
        maxHeight: size.height * 0.25,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1),
                ),
                child: Image.network(
                  data['icon'] ?? "",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'] ?? "",
                    style: Fonts().h4l(context).copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    data['subtitle'] ?? "",
                    style: Fonts().h4l(context).copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: grey,
          ),
          Stack(
            textDirection: TextDirection.rtl,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  foregroundImage: NetworkImage(data['images'][0] ?? ""),
                  maxRadius: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(data['images'][1] ?? ""),
                    maxRadius: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(data['images'][2] ?? ""),
                    maxRadius: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(data['images'][3] ?? ""),
                    maxRadius: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 135.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundImage: NetworkImage(
                      data['images'][4] ?? "",
                    ),
                    maxRadius: 26,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: TagChip(
              title: "See all",
              color: blue,
              textcolor: white,
            ),
          ),
        ],
      ),
    );
  }
}
