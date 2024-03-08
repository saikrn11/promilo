import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({
    super.key,
    required this.data,
    required this.size,
    this.color = white,
  });

  final Map? data;
  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              10,
            ),
            image: DecorationImage(
              image: NetworkImage(
                data!['img'],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                black,
                Colors.transparent,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Text(
            data!['title'] ?? "",
            maxLines: 2,
            style: Fonts().h4l(context).copyWith(
                  fontSize: size.width * 0.045,
                  color: white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
