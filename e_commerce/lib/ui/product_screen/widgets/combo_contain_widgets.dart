part of '../product_screen.dart';

class ComboContain extends StatelessWidget {
  const ComboContain({super.key});

  @override
  Widget build(BuildContext context) {
    var combos = [
      'Red Quinoa',
      'Lime',
      'Honey',
      'Blueberries',
      'Mango',
      'Strawberries',
      'Fresh Mint',
    ];
    return SizedBox(
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextUnderLine(
            title: AppText.lblThisComboContain,
          ),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 5,
              runSpacing: 5,
              children: [
                for (var item in combos)
                  InkWell(
                    onTap: () {
                      //TODO Select combo contrains
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffEDEDED),
                            Color(0xffEDEDED),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item,
                          maxLines: 1,
                          style: TextStyleUtils.regular(12)
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          const Divider(thickness: 2, height: 1),
        ],
      ),
    );
  }
}
