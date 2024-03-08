import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.controller,
    this.clear,
    required this.onChanged,
    required this.hintText,
    this.color = white,
    this.border = BorderSide.none,
    this.prefix,
    this.suffix,
  });

  final TextEditingController controller;
  final Function()? clear;
  final Function(String?) onChanged;
  final String hintText;
  final Color color;
  final BorderSide border;
  final Icon? prefix;
  final IconData? suffix;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: border,
          ),
          hintText: hintText,
          hintStyle: Fonts().h4l(context),
          suffixIcon: Icon(
            suffix ?? Icons.mic_none_outlined,
            color: black,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          prefixIcon: prefix ??
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  height: 05,
                  width: 05,
                  child: Image.network(
                    AssetFiles().search,
                    fit: BoxFit.scaleDown,
                    color: black,
                  ),
                ),
              ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
