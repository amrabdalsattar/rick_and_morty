part of '../character_details_screen.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({
    super.key,
    required this.leadingText,
    required this.titleText,
    required this.dividerPercentFromScreenWidth,
  });

  final String leadingText;
  final String titleText;
  final double dividerPercentFromScreenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Text(
            "$leadingText :",
          ),
          title: Text(
            titleText,
          ),
          titleTextStyle: const TextStyle(color: AppColors.white),
          subtitleTextStyle: const TextStyle(color: AppColors.white),
          leadingAndTrailingTextStyle: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15),
          horizontalTitleGap: 8,
        ),
        Container(
          width:
              MediaQuery.sizeOf(context).width * dividerPercentFromScreenWidth,
          margin: const EdgeInsets.only(left: 20),
          child: const Divider(
            color: AppColors.yellow,
            thickness: 1.5,
            height: 0,
          ),
        )
      ],
    );
  }
}
