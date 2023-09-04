import 'package:flutter/material.dart';
import 'package:yalla_go/core/resources/color_manager.dart';
import 'package:yalla_go/core/resources/values_manager.dart';

import 'font_manager.dart';

class MyRoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final Function onPressed;

  MyRoundedButtonWidget({
    required this.buttonText,
    required this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorManager.primary,
              ColorManager.buttonColor
            ],
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(width, 50)),
            backgroundColor:
            MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor:
            MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            onPressed();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              buttonText,
              style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontSize: FontSize.s14)

            ),
          ),
        ),
      ),
    );
  }
}



class FlightsCard extends StatelessWidget {
  const FlightsCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(AppPadding.p8),
      child: Card(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/paris1.png'),
                  Image.asset('assets/images/paris 2.png')
                ],
              ),
              const SizedBox(
                height: AppSize.s6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('4.0',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.silver,fontSize: FontSize.s13),),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),
                              Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),
                              Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),
                              Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),

                            ],
                          ),
                        ),
                        const Spacer(),
                        Text('رحلة إلي فرنسا',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),


                      ],
                    ),
                    const SizedBox(height: AppSize.s6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('باريس',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.silver,fontSize: FontSize.s14),),
                        Icon(Icons.location_on_rounded,color: ColorManager.silver,size: 14,),

                      ],
                    ),
                    const SizedBox(height: AppSize.s6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('متبقي 5 مقاعد',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.red,fontSize: FontSize.s14),),

                        Text(':رحلة متجهة إلي باريس فرنسا ',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14),),

                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.smokeWhite,
                            borderRadius: BorderRadius.circular(AppSize.s16),


                          ),
                          child: Row(
                            children: [
                              Text('\$',style:Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14)),

                              Text('السعر : 1000 ',style:Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14)),

                            ],
                          ),
                        ),
                        Spacer(),
                        MyRoundedButtonWidget(buttonText: 'احجز الأن', width: size.width/3, onPressed: (){}),

                      ],

                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class ClothCard extends StatelessWidget {
  const ClothCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2.1,
      child: Card(
        child:
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/images/jeans.png'),
              const SizedBox(
                height: AppSize.s6,
              ),
              Row(

                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),
                      Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),
                      Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),
                      Icon(Icons.star,color: ColorManager.gold,size: AppSize.s11,),

                    ],
                  ),
                  const Spacer(),
                  Text('4 الوان متاحة',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.silver),),

                ],
              ),
              const SizedBox(
                height: AppSize.s6,
              ),
              Text('جاكيت جينز رجالي شتوي بررقبة و قصة مريحة',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s13),textAlign: TextAlign.end,),
              const SizedBox(
                height: AppSize.s6,
              ),

              Row(
                children: [
                  Icon(Icons.shopping_basket_outlined,color: ColorManager.buttonColor,),
                  const Spacer(),
                  Text('450 جنيه',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s13),textAlign: TextAlign.end,),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Article extends StatelessWidget {
  const Article({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: double.infinity,
                    child: Image.asset('assets/images/ka3ba.png',fit: BoxFit.cover,)),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text('شروط العمرة في السعودية',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: AppSize.s12),),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text('يسافر ملايين المسلمين إلى مكة المكرمة من جميع أنحاء العالم إلى لزيارة المسجد الحرام وأداء مختلف الشعائر الدينية، فكما هو معلوم إن الحج هو أحد أركان الإسلام ...',textAlign: TextAlign.end,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: AppSize.s12),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalesCard extends StatelessWidget {
  const SalesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(10) ),),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.card,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSize.s10),topRight: Radius.circular(AppSize.s10))
              ),
              width: MediaQuery.of(context).size.width/3,

              child: Center(
                child: Text('مصليات',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Image.asset('assets/images/subha.png',fit: BoxFit.cover,),
            )
          ],
        ),
      ),
    );
  }
}



class MultipleDaysFlight extends StatelessWidget {
  final bool isMultiple;
  const MultipleDaysFlight({
    super.key,
    required this.size, required this.isMultiple,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorManager.smokeWhite
                          ),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '4.0',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.silver,fontSize: 13)),
                                WidgetSpan(
                                  child: Icon(Icons.star,color: ColorManager.gold,),
                                )
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Text('رحلة إلي اسطنبول',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),

                      ],

                    ),
                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('اسطنبول',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.silver,fontSize: FontSize.s14),),
                        Icon(Icons.location_on_rounded,color: ColorManager.silver,size: 14,),

                      ],
                    ),
                    SizedBox(height: 5,),

                    if(isMultiple)Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              Text('1_6_2023',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                              Text('نهاية العرض',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:ColorManager.silver,fontSize: 12),)

                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.calendar_today_rounded,color: ColorManager.primary,),
                        SizedBox(width: 5,),
                        Container(width: 2,color: ColorManager.black,height: AppSize.s30,),
                        SizedBox(width: 5,),
                        Container(
                          child: Column(
                            children: [
                              Text('29_3_2023',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                              Text('بداية العرض',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:ColorManager.silver,fontSize: 12),)

                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.calendar_today_rounded,color: ColorManager.primary,),



                      ],
                    ),
                    SizedBox(height: 5,),


                    Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،',textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13,color: ColorManager.silver,),),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.smokeWhite,
                            borderRadius: BorderRadius.circular(AppSize.s16),


                          ),
                          child: Row(
                            children: [
                              Text('\$',style:Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14)),

                              Text('السعر : 1000 ',style:Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14)),

                            ],
                          ),
                        ),
                        Spacer(),
                        MyRoundedButtonWidget(buttonText: 'احجز الأن', width: size.width/3, onPressed: (){}),

                      ],

                    )


                  ],
                ),
              ),
            ),
            Image.asset('assets/images/istanbul.png')


          ],
        ),
      ),
    );
  }
}



class myFirstCardInMain extends StatelessWidget {
  final String image;
  final String title;
  final bool comingSoon;
  final void Function()? onTap;
  const myFirstCardInMain({
    super.key, required this.image, required this.title, this.onTap, required this.comingSoon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image),
                  Text(title,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s13),)
                ],
              ),
            ),
          ),
          if(comingSoon)Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/icons/commngsoon.png'),
          )
        ],
      ),
    );
  }
}

class PrayerColumn extends StatelessWidget {
  const PrayerColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('4 :54',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14),),
        Text('صباحا',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14),),
        Text('الفجر',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:ColorManager.silver,fontSize: FontSize.s11),)


      ],
    );
  }
}

class MyBottomNavItem extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final void Function()? function;
  const MyBottomNavItem({
    super.key, required this.color, required this.title, required this.icon, this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Icon(icon,color: color,),
          Text(title,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),)
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter{
  final BuildContext context;

  MyCustomPainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = ColorManager.smokeWhite..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 10);
    path.lineTo(size.width*0.35, 10);
    path.quadraticBezierTo(size.width*0.4, 10, size.width*0.4, 2.5);
    path.arcToPoint(Offset(size.width*0.6,  2.5),radius: Radius.circular(10.0),clockwise: false);
    path.quadraticBezierTo(size.width*0.6, 10, size.width*0.65, 10);
    path.lineTo(size.width, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, ColorManager.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
