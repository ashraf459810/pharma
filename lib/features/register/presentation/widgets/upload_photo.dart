import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

class UploadPhoto extends StatefulWidget {
   XFile file;
  final String text;
  UploadPhoto({Key key, this.file, this.text}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
    dynamic pickImageError;
    final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:   Center(
      child: GestureDetector(
                      onTap: () {
                        _onImageButtonPressed(widget.file,
                          ImageSource.gallery,
                            context: context);
                      },
                      child: container(
                          hight: h(70),
                          width: w(343),
                          borderRadius: 40,
                          bordercolor: AppColor.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: w(75),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: w(25),
                                    color: AppColor.grey,
                                  )),
                              Container(
                                // color: Colors.red,
                                width: w(180),
                        child:    Padding(
                                        padding: EdgeInsets.only(left: w(25)),
                                        child: text(
                                            text: widget.text,
                                            color: AppColor.grey,
                                            fontsize: 14.sp,
                                            textAlign: TextAlign.center),
                                      )
                                   
                              )
                            ],
                          )),
                    ),
    ),);
  }


  void _onImageButtonPressed(XFile file,  ImageSource source, {BuildContext context}) async {
    // await _displayPickImageDialog(context,
    //     (double maxWidth, double maxHeight, int quality) async {
    try {
      final file = await _picker.pickImage(
        source: source,
        // maxWidth: maxWidth,
        // maxHeight: maxHeight,
        // imageQuality: ,
      );
      setState(() {
        widget.file = file;
      });
    } catch (e) {
      setState(() {
        pickImageError = e;
      });
    }
  }
}