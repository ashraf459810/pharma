

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

class UploadPhoto extends StatefulWidget {
  final int index;
  final String text;
  final Function getImages;
  UploadPhoto({Key key,  this.text, this.getImages, this.index, }) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {

  List<XFile> images =[XFile('empty'),XFile('empty'),XFile('empty'),XFile('empty'),XFile('empty'),];
    dynamic pickImageError;
    final ImagePicker _picker = ImagePicker();
    @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:   Center(
      child: GestureDetector(
                      onTap: () {
                    

                                    showAlertDialog(context);
                        // _onImageButtonPressed(
                        //   ImageSource.gallery,
                        //     );
                      },
                      child: container(
                          hight: h(50),
                          width: w(343),
                          borderRadius: 40,
                          bordercolor: AppColor.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: w(75),
                                  child: 
                          Icon(
                     images[widget.index] !=null ?          images[widget.index].path =='empty'?        Icons.camera_alt_outlined:Icons.check :  Icons.camera_alt_outlined,
                                    size: w(25),
                                    color: images[widget.index] !=null ?          images[widget.index].path =='empty'?      AppColor.grey : Colors.green:Colors.grey,
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


  void _onImageButtonPressed(  ImageSource source,) async {
    // log('here');
    
      //  log(widget.index.toString());
           
                                final pickedImage = await _picker
                                .pickImage(source: source);
                    // log(pickedImage.path);
                
                        images[widget.index] = pickedImage;
                              widget.getImages(pickedImage);

                              setState(() {
                                
                              });

                            
                        
                         
                                

}


showAlertDialog(BuildContext context) {

  // set up the button
  

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Align(alignment: Alignment.bottomRight,
      child: Text("اختر المصدر",style: TextStyle(),)),
    content: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: ()  {
              Navigator.of(context).pop();
             _onImageButtonPressed(ImageSource.camera);

          },
          child: Icon(Icons.camera_alt_outlined,size: 30,)),
        GestureDetector(
          onTap: (){
               Navigator.of(context).pop();
             _onImageButtonPressed(ImageSource.gallery);
          },
          child: Icon(Icons.attachment,size: 30,))
      ],
    ),
  
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


}
