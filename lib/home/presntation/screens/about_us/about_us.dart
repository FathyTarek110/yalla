import 'package:flutter/material.dart';
import 'package:yalla_go/core/resources/color_manager.dart';
import 'package:yalla_go/core/resources/values_manager.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/reusable_components.dart';
import '../../../../core/resources/routes_manager.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height/2,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s20),bottomRight: Radius.circular(AppSize.s12))
              ),
              child:  Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p9),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(

                            child: CircleAvatar(

                              backgroundImage: AssetImage('assets/images/paris1.png'),
                              backgroundColor: ColorManager.white,
                              minRadius: size.width/6,
                            ),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              shape: BoxShape.circle
                            ),
                            padding: EdgeInsets.all(AppSize.s6),
                          ),
                          SizedBox(height: AppSize.s11,),
                          Text('Bella Tourism',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20,color: Colors.white),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_sharp,color: ColorManager.white,),
                              Text('القاهرة مدية نصر',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16,color: Colors.white),),

                            ],
                          ),
                          SizedBox(height: AppSize.s6,),
                          Image.asset('assets/images/social.png')
                        ],
                      ),
                    ),

                  ),
                   Align(
                     alignment: Alignment.topCenter,
                     child: Padding(
                       padding: const EdgeInsets.all(AppPadding.p22),
                       child: Row(
                        children: [
                          IconButton(onPressed: (){
                          }, icon: Icon( Icons.shopping_bag,color: ColorManager.white,)),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon( Icons.arrow_forward,color: ColorManager.white,)),
                        ],
                  ),
                     ),
                   ),
                  Positioned(
                    bottom: -size.height/7.5,
                    left: size.width/10,
                    child: Container(
                      width: size.width/1.2,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          color: ColorManager.white,
                          borderRadius:  BorderRadius.circular(AppSize.s12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Bella Tourism',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20,color: ColorManager.black),),
                            Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص .',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s14,color: ColorManager.silver),textAlign: TextAlign.end,),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.star,color: ColorManager.gold,),
                                      ),
                                      TextSpan(text: '4.9 (123)',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.black,fontSize:  FontSize.s13)),
                                      WidgetSpan(child: SizedBox(width: 5,)),
                                      TextSpan(text: '(عرض المتاح 15)',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.black,fontSize: FontSize.s13)),

                                    ],
                                  ),
                                ),

                                Spacer(),
                                MyRoundedButtonWidget(buttonText: 'متابعة', width: size.width/5, onPressed: (){}),

                              ],

                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height/6,
            ),

            DefaultTabController(
              length: 3,
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s20,color: ColorManager.black),

                indicatorColor: ColorManager.primary,
                tabs: [
                  Tab(
                    child: Text('فروعنا',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14,color: ColorManager.black),),

                  ),
                  Tab(
                    child: Text('الاراء و التعليقات',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s13,color: ColorManager.black),),

                  ),
                  Tab(
                      child: Text('العروض المتاحة',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s14,color: ColorManager.black),)

                  ),
                ],),
            ),

            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: DropdownButton(

                  items: [
                DropdownMenuItem(child: Text('الأعلي تقييما',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14,color: ColorManager.black),),
                )
              ], onChanged: (S){}),
            ),

            Container(
              height: size.height/1.2,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context,index) {
                    return Column(
                      children: [
                        MultipleDaysFlight(size: size, isMultiple: false,),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  }),
            )



          ],

        ),
      ),
    );
  }
}
