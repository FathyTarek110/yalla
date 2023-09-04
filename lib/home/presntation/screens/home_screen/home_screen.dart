import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:yalla_go/core/resources/color_manager.dart';
import 'package:yalla_go/core/resources/font_manager.dart';
import 'package:yalla_go/core/resources/reusable_components.dart';
import 'package:yalla_go/core/resources/style_manager.dart';
import 'package:yalla_go/core/resources/values_manager.dart';
import 'package:yalla_go/home/presntation/controller/home_layout_cubit/main_cubit.dart';

import '../../../../core/resources/routes_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return  BlocProvider(
  create: (context) => MainCubit()..scrollControllerInit(),
  child: BlocConsumer<MainCubit, MainState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    MainCubit cubit = MainCubit.get(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomAppBar(
         shape: const CircularNotchedRectangle(),
         notchMargin:10,
         child:SizedBox(
           height: MediaQuery.of(context).size.height/9,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyBottomNavItem(color: ColorManager.gray,title: 'الحساب',icon: Icons.person,function: (){},),
                MyBottomNavItem(color: ColorManager.gray,title: 'عربة التسوق',icon: Icons.shopping_cart,function: (){}),
                Container(width: size.width*0.1,),
                MyBottomNavItem(color: ColorManager.gray,title: 'المفضلة',icon: Icons.favorite,function: (){}),
                MyBottomNavItem(color: ColorManager.primary,title: 'الرئيسية',icon: Icons.home_rounded,function: (){}),
              ],
            ),
         ),
       ),
       floatingActionButton: FloatingActionButton(onPressed: () {  },child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset('assets/icons/shop.png'),
           Text('تسوق',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s13,color: ColorManager.white),)

         ],
       ),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       body: CustomScrollView(
         controller: cubit.scrollController,
         slivers: [
           SliverToBoxAdapter(
             child: Container(
               height: size.height/2.8,
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     decoration: const BoxDecoration(
                         image: DecorationImage(
                             colorFilter: ColorFilter.mode(Color(0xFF455D79), BlendMode.dstATop),
                             fit: BoxFit.fill,
                             image: AssetImage('assets/images/Rectangle1.png'))
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.only(left: AppPadding.p12,top: AppPadding.p22),
                     child: IconButton(onPressed: (){
                       Navigator.pushNamed(context, Routes.aboutUs);
                     }, icon: Icon( Icons.notifications_active,color: ColorManager.white,)),
                   ),
                   Align(
                     alignment: Alignment.topRight,
                     child: Padding(
                       padding: const EdgeInsets.only(right: AppPadding.p12,top: AppPadding.p22),
                       child: Row(
                          mainAxisSize: MainAxisSize.min,
                         children: [

                           Column(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Row(
                                 children: [
                                   Row(
                                     children: [
                                       const Icon(Icons.waving_hand_rounded,color: Colors.amber,),
                                       Text('مرحباً بعودتك ',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s12,color: Colors.white),),


                                     ],
                                   )
                                 ],
                               ),
                               Text('سعود عبد الحميد',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontSize: FontSize.s14),),

                             ],
                           ),
                           const SizedBox(
                             width: 10,
                           ),
                           const CircleAvatar(
                             backgroundImage: AssetImage('assets/images/profile.png'),
                           ),
                         ],
                       ),
                     ),
                   ),
                   Align(
                     alignment: Alignment.center,
                     child: StrokeText(
                       text: 'معنا للسفر معني',
                       textStyle: getBoldStyle(color: Colors.white, fontSize: FontSize.s26),
                       strokeWidth: 2,
                       strokeColor: Colors.cyan,
                     ),
                   ),
                   Positioned(
                     bottom: -20,
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
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(AppSize.s16)
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('رحلات و رفهيات',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 13),),
                           Image.asset('assets/icons/Hiking.png')
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             )
           ),
           const SliverToBoxAdapter(
             child: Column(
               children: [
                 SizedBox(
                   height: AppSize.s50,
                 ),

                 //item
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     myFirstCardInMain(title: 'فنادق و طيران', image: 'assets/icons/Tourism.png', comingSoon: true,),
                     myFirstCardInMain(title: 'متاحف و معالم', image: 'assets/icons/Eiffel.png', comingSoon: true,),
                     myFirstCardInMain(title: 'هدايا مجانية', image: 'assets/icons/Gift.png', comingSoon: false,),

                   ],
                 ),
               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               children: [
                 const SizedBox(
                   height: AppSize.s22,
                 ),


                 //prayer card
                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text('اوقات الصلاة',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                       const SizedBox(
                         height: AppSize.s20,
                       ),
                       Card(
                         child: Padding(
                           padding: const EdgeInsets.all(AppPadding.p8),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   GestureDetector(
                                     onTap: (){},
                                     child: Row(
                                       children: [
                                         Icon(Icons.arrow_back_ios,color: ColorManager.primary,size: 11,),
                                         Text('تحديد القبلة ',style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s12),),

                                       ],
                                     ),
                                   ),
                                   const Spacer(),

                                   Text(' (GMT+02:02)الجيزة مصر',style:  getBoldStyle(color: ColorManager.black, fontSize: FontSize.s11),),

                                 ],
                               ),
                               const SizedBox(
                                 height: AppSize.s6,
                               ),
                               const SizedBox(height: AppSize.s6,),

                               const Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   PrayerColumn(),
                                   PrayerColumn(),
                                   PrayerColumn(),
                                   PrayerColumn(),
                                   PrayerColumn(),
                                 ],
                               ),

                               Padding(
                                 padding: const EdgeInsets.all(AppPadding.p9),
                                 child: Row(

                                   children: [
                                     Icon(Icons.close,color: ColorManager.red,size: AppSize.s11,),
                                     Text('الغاء الخدمة',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s11,color: ColorManager.red),),

                                     const Spacer(),
                                     Text('02:40:09',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s11),),
                                     Text('الوقت المتبقي لصلاة المغرب',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s11),),


                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),

                 const SizedBox(
                   height: AppSize.s22,
                 ),
               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 // r7lat
                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Text('رحلات جارية',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                 ),
                 const SizedBox(
                   height: AppSize.s22,
                 ),

                 SizedBox(
                   width: size.width,
                   height: size.height/2,
                   child: Swiper(
                     controller: cubit.flightsSwiperController,
                     itemCount: 5,
                     itemWidth: MediaQuery.of(context).size.width/1.2,
                     loop: false,
                     scrollDirection: Axis.horizontal,
                     duration: 1200,
                     itemBuilder: (context,index) {
                       return FlightsCard(size: size);
                     },
                   ),
                 ),
               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 const SizedBox(
                   height: AppSize.s22,),
                 // r7lat l3dt ayam

                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Text('رحلات لعدة أيام',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                 ),
                 const SizedBox(
                   height: AppSize.s16,
                 ),

                 SizedBox(
                   width: size.width,
                   height: size.height/2.8,
                   child: Swiper(
                     controller: cubit.flightsMultipleSwiperController,
                     itemCount: 5,
                     itemWidth: MediaQuery.of(context).size.width/1.2,
                     loop: false,
                     scrollDirection: Axis.horizontal,
                     duration: 1200,
                     itemBuilder: (context,index) {
                       return    MultipleDaysFlight(size: size, isMultiple: true,);
                     },
                   ),
                 ),
               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(

               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 //weekend
                 const SizedBox(
                   height: AppSize.s22,
                 ),

                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Text('عطلات الويك اند',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                 ),
                 const SizedBox(
                   height: AppSize.s16,
                 ),

                 SizedBox(
                   width: size.width,
                   height: size.height/2.8,
                   child: Swiper(
                     controller: cubit.flightsMultipleSwiperController,
                     itemCount: 5,
                     itemWidth: MediaQuery.of(context).size.width/1.2,
                     loop: false,
                     scrollDirection: Axis.horizontal,
                     duration: 1200,
                     itemBuilder: (context,index) {
                       return    MultipleDaysFlight(size: size, isMultiple: false,);
                     },
                   ),
                 ),
               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               children: [
                 const SizedBox(
                   height: AppSize.s16,
                 ),

                 //banner2
                 Center(
                   child: Stack(
                     alignment: Alignment.center,
                     children: [
                       SizedBox(
                         width: double.infinity,
                         child: Image.asset('assets/images/banner2.png',fit: BoxFit.cover,),
                       ),
                       SizedBox(
                         width: double.infinity,
                         child: Image.asset('assets/images/blur2.png',fit: BoxFit.cover,),
                       ),
                       Column(
                         children: [
                           Text('احجز معنا رحلتك بكل سهولة',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.white,fontSize: FontSize.s16),),
                           const SizedBox(
                             height: AppSize.s11,
                           ),
                           Image.asset('assets/images/logobanner2.png'),
                         ],
                       )
                     ],
                   ),
                 ),

               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 //recommendation

                 const SizedBox(
                   height: AppSize.s22,
                 ),

                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Text('ترشيحات يلا جو',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                 ),
                 const SizedBox(
                   height: AppSize.s16,
                 ),
                 SizedBox(
                   width: size.width,
                   height: size.height/2.8,
                   child: Swiper(
                     controller: cubit.flightsMultipleSwiperController,
                     itemCount: 5,
                     itemWidth: MediaQuery.of(context).size.width/1.2,
                     loop: false,
                     scrollDirection: Axis.horizontal,
                     duration: 1200,
                     itemBuilder: (context,index) {
                       return    MultipleDaysFlight(size: size, isMultiple: false,);
                     },
                   ),
                 ),
               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 //shopping
                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Text('التسوق',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                 ),

                 const SizedBox(
                   height: AppSize.s16,
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height/2,
                   child: ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemCount: 6,
                       itemBuilder: (context,index)=>const ClothCard()),
                 ),


                 const SizedBox(
                   height: AppSize.s16,
                 ),

               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 //banner3
                 Center(
                   child: Stack(
                     alignment: Alignment.center,
                     children: [
                       SizedBox(
                         width: double.infinity,
                         child: Image.asset('assets/images/banner3.png',fit: BoxFit.cover,),
                       ),
                       SizedBox(
                         width: double.infinity,
                         child: Image.asset('assets/images/blur3.png',fit: BoxFit.cover,),
                       ),
                       Column(
                         children: [
                           Text('احجز معنا رحلتك بكل سهولة',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.white,fontSize: FontSize.s16),),
                           const SizedBox(
                             height: AppSize.s11,
                           ),
                           Image.asset('assets/images/logobanner2.png'),
                         ],
                       )
                     ],
                   ),
                 ),





               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 //offers
                 const SizedBox(
                   height: AppSize.s22,
                 ),

                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Text('عروض حصرية',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height/4,
                   child: ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemCount: 6,
                       itemBuilder: (context,index)=>const SalesCard()),
                 ),


               ],
             ),
           ),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 //articles
                 const SizedBox(
                   height: AppSize.s22,
                 ),

                 Padding(
                   padding: const EdgeInsets.all(AppPadding.p8),
                   child: Text('مقالات',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: FontSize.s16),),
                 ),

                 const Article(),
                 const Article(),
                 const Article()



               ],
             ),
           ),

         ],
       )
    );
  },
),
);
  }
}


