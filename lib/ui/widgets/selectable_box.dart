part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected; //apakah sedang di select atau tidak
  final bool isEnabled; // bisa di select atau tidak
  final double width; // lebar box
  final double height; // tinggi box
  final String text; // tulisan di dalamnya
  final Function onTap; // apa yg terjadi kalo di tap
  final TextStyle textStyle; // style tulisan

  // contructor nya
  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnabled = true,
      this.width = 144,
      this.height = 60,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: (!isEnabled)
                ? accentColor4
                : isSelected
                    ? accentColor2
                    : Colors.transparent,
            border: Border.all(
                color: (!isEnabled)
                    ? accentColor4
                    : isSelected
                        ? Colors.transparent
                        : accentColor2)),
        child: Center(
          child: Text(text ?? "None",
              style: textStyle ??
                  blackTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
