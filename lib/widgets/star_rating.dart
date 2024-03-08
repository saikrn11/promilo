import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    int filledStars = rating.floor();
    double remainder = rating - filledStars;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, growable: true, (index) {
          if (index < filledStars) {
            // Fill full stars
            if (index < filledStars) {
              return const Icon(
                Icons.star,
                color: starBlue,
                size: 15,
              );
            } else {
              return const Icon(
                Icons.star,
                color: black,
                size: 15,
              );
            }
          } else if (index == filledStars) {
            // Fill partial star
            if (index < remainder) {
              return Icon(
                Icons.star,
                color: black.withOpacity(remainder < 0.5 ? 0.2 : 0.5),
                size: 15,
              );
            } else {
              return Icon(
                Icons.star,
                color: starBlue.withOpacity(remainder < 0.5 ? 0.5 : 0.8),
                size: 15,
              );
            }
          } else {
            // Empty stars
            return const Icon(
              Icons.star,
              color: white,
              size: 15,
            );
          }
        }),
      ),
    );
  }
}
