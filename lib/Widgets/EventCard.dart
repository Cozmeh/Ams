import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftest/Presentation/Scanner/Nfc.dart';
import 'package:ftest/Data/constants.dart';
import '../Presentation/Participants/Participants.dart';
import '../Presentation/Scanner/scan.dart';

// ignore: must_be_immutable
class EventCard extends StatefulWidget {
  String imageUrl, eventName, departName, date, venue, time, description, id;
  bool button, isOpenForall;
  EventCard(
      {super.key,
      required this.imageUrl,
      required this.eventName,
      required this.departName,
      required this.date,
      required this.time,
      required this.venue,
      required this.description,
      required this.button,
      required this.id,
      required this.isOpenForall});
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  var divider = Padding(
    padding: EdgeInsets.only(left: 30.w, right: 30.w),
    child: const Divider(
      color: dimGrey,
      height: 10,
    ),
  );

  var Leftspacer = SizedBox(
    width: 30.w,
  );

  var sizedbox10 = SizedBox(height: 10.h);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 950.h,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Card(
          shadowColor: Colors.grey[300],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                child: Expanded(
                  // takes possible vertical height
                  child: Row(
                    children: [
                      Expanded(
                        // take possible horizontal height
                        child: SizedBox(
                          height: 300
                              .h, // beyound certain amount which makes the image stay inside the possible vertical and horizontal limits
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(
                              widget.imageUrl,
                              fit: BoxFit.cover, // lets the image clip and zoom
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return const Center(child: Text("Loading.."));
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Center(
                                  child: Text(
                                    "N/A",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                //Event Name row
                children: [
                  Leftspacer,
                  Text(
                    widget.eventName,
                    style: TextStyle(
                        color: textColor,
                        fontFamily: 'Inter',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                // Department Row
                children: [
                  Leftspacer,
                  Text(
                    "Department of ${widget.departName}",
                    style: TextStyle(
                        color: textColor,
                        fontFamily: 'Inter',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              sizedbox10,
              divider,
              sizedbox10,
              Row(
                // Date Row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          'Date ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: Text(
                          widget.date,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              sizedbox10,
              divider,
              sizedbox10,
              Row(
                // Venue Row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          'Venue ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: Text(
                          widget.venue,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              sizedbox10,
              divider,
              sizedbox10,
              Row(
                // Time Row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          'Time ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: Text(
                          widget.time,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              sizedbox10,
              divider,
              sizedbox10,
              Row(
                //Event Name row
                children: [
                  Leftspacer,
                  Text(
                    "Description",
                    style: TextStyle(
                        color: textColor,
                        fontFamily: 'Inter',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              sizedbox10,
              Row(
                //Event Name row
                children: [
                  Leftspacer,
                  SizedBox(
                    width: 450.w,
                    height: 100.h,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: textColor,
                            fontFamily: 'Inter',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                // Time Row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: ElevatedButton(
                            onPressed: widget.button
                                ? () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Scanner(
                                          eventID: widget.id,
                                          isOpenForall: widget.isOpenForall),
                                    ));
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(200.w, 50.h),
                                backgroundColor: primaryBlue),
                            child: Text(
                              'Scanner',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: ElevatedButton(
                          onPressed: widget.button
                              ? () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const nfcScanner(),
                                  ));
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(200.w, 50.h),
                              backgroundColor: primaryBlue),
                          child: Text(
                            'NFC',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              sizedbox10,
              SizedBox(
                child: Expanded(
                  // takes possible vertical height
                  child: Row(
                    children: [
                      Expanded(
                        // take possible horizontal height
                        child: SizedBox(
                          // beyound certain amount which makes the image stay inside the possible vertical and horizontal limits
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Participants(
                                        eventID: widget.id,
                                        isOpenForall: widget.isOpenForall),
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryBlue),
                                child: Text(
                                  'Participants',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
