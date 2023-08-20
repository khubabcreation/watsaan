import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';

class MyDropdownButton extends StatefulWidget {
  MyDropdownButton({required this.height,required this.widht, required this.hint_txt,required this.dropdownOptions,this.ontap});

  double height ;
  double widht ;
  String hint_txt ;
  List<String> dropdownOptions ;
  Function(String? value)? ontap;
  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState(dropdownOptions: dropdownOptions);
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  _MyDropdownButtonState({ required this.dropdownOptions});
    String? selectedOption;

  List<String> dropdownOptions ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.widht,
      child: Card(
        color: AppColors.freshgreen,
        child: Center(
          child: DropdownButton<String>(
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            style: TextStyle(color: Colors.white),
            underline: SizedBox(),
            value: selectedOption,
            dropdownColor: AppColors.freshgreen,
            items: dropdownOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {

                print('ya object aya ha $newValue');
                selectedOption = newValue!;
                setState(() {

                });
                if(widget.ontap != null){
                  widget.ontap!(newValue);
                }

            },
            hint: Text(widget.hint_txt,style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
