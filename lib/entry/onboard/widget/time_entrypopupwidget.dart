import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';

class TimeEntryPopupWidget extends StatefulWidget {
  final String mealType;
  final void Function(String time) onSave;

  const TimeEntryPopupWidget({
    Key? key,
    required this.mealType,
    required this.onSave,
  }) : super(key: key);

  @override
  State<TimeEntryPopupWidget> createState() => _TimeEntryPopupWidgetState();
}

class _TimeEntryPopupWidgetState extends State<TimeEntryPopupWidget> {
  final TextEditingController _hourController = TextEditingController(text: '00');
  final TextEditingController _minuteController = TextEditingController(text: '00');
  RxBool istyping=false.obs;
  String _meridiem = 'AM';

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F9FC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Time',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Headers
            Row(
              children: [
                Text(
                  'Meal time',
                  style: TextStyle(fontSize: 14, color: AppColors.customGray2),
                ),
                const SizedBox(width: 40),
                const Expanded(
                  child: Text(
                    'Hour',
                    style: TextStyle(fontSize: 14, color: AppColors.customGray2),
                  ),
                ),
                const SizedBox(width: 5),
                const Expanded(
                  child: Text(
                    'Min',
                    style: TextStyle(fontSize: 14, color: AppColors.customGray2),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: const Text(
                    'Meridiem\nindicators',
                    style: TextStyle(fontSize: 14, color: AppColors.customGray2),
                  ),
                ),
              ],
            ),
Divider(),
            // Time input row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    '${widget.mealType} :',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      onChanged: (value){
istyping.value=true;
                      },
                      controller: _hourController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,

                      ],
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    ':',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      onChanged: (value){
                        istyping.value=true;
                      },
                      controller: _minuteController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,

                      ],
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _meridiem = 'AM';

                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _meridiem == 'AM' ? AppColors.borderGray : Colors.transparent,
                                  border: Border.all(
                                    color: AppColors.borderGray,
                                    width: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Text('AM', style: TextStyle(fontSize: 16,color:AppColors.customGray)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {

                              _meridiem = 'PM';
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _meridiem == 'PM' ? AppColors.borderGray : Colors.transparent,
                                  border: Border.all(
                                    color: AppColors.borderGray,
                                    width: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Text('PM', style: TextStyle(fontSize: 16,color: AppColors.customGray)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),

            const SizedBox(height: 10),
           Obx(()=> Center(
             child: ElevatedButton(
               onPressed: (){},
               style: ElevatedButton.styleFrom(
                   backgroundColor: istyping.value==false ?AppColors.lightGray : AppColors.darkOlive,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                   )
               ),

               child: Text("Save",style: TextStyle(fontSize: 16,color: istyping.value==false ?AppColors.darkOlive : AppColors.lightGray),),
             ),
           ),)
          ],
        ),
      ),
    );
  }
}
