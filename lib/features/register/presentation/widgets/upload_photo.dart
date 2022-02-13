import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

class UploadPhoto extends StatefulWidget {
  final int index;
   XFile file;
  final String text;
  final Function getImages;
  UploadPhoto({Key key, this.file, this.text, this.getImages, this.index}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  List<XFile> images =[XFile(''),XFile(''),XFile(''),XFile(''),XFile(''),];
    dynamic pickImageError;
    final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:   Center(
      child: GestureDetector(
                      onTap: () {
                        _onImageButtonPressed(widget.file,
                          ImageSource.gallery,
                            );
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
                                width: w(160),
                        child:    Padding(
                                        padding: EdgeInsets.only(right: w(20)),
                                        child: Container(
                                          width: w(150),
                                          child: text(
                                            
                                              text: widget.text,
                                              color: AppColor.grey,
                                              fontsize: 14.sp,
                                              textAlign: TextAlign.end),
                                        ),
                                      )
                                   
                              )
                            ],
                          )),
                    ),
    ),);
  }


  void _onImageButtonPressed(XFile file,  ImageSource source,) async {
           
                                final pickedImage = await ImagePicker()
                                .pickImage(source: source);
                    
                              images[widget.index]  =pickedImage;
                              print(images[widget.index].path);
                              widget.getImages(images);
                                
}}
