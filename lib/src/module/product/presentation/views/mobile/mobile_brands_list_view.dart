import 'package:e_commerce_admin/src/module/product/domain/entities/brand_entity.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/dialogs/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/util/app_widgets/inputs/custom_text_form_field.dart';
import '../../logic/brands_bloc/brands_bloc.dart';
import '../../../../../config/util/app_widgets/dialogs/app_custom_bottom_sheet.dart';

class MobileBrandListView extends StatelessWidget {
  const MobileBrandListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BrandsBloc>(context).add(GetAllBrandsEvent());
    return BlocListener<BrandsBloc, BrandsState>(
      listener: (context, state) {
        if (state is CreatedBrandState) {
          BlocProvider.of<BrandsBloc>(context).add(GetAllBrandsEvent());
          CustomSnackbar().getSnackbar(
            context: context,
            title: '${state.brandName} добавлен.',
          );
        }
        if (state is DeletedBrandState) {
          BlocProvider.of<BrandsBloc>(context).add(GetAllBrandsEvent());
          CustomSnackbar().getSnackbar(
            context: context,
            title: '${state.brandName} удален.',
          );
        }
      },
      child: BlocBuilder<BrandsBloc, BrandsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAllBrandsState) {
            return NestedMobileBrandView(
              allBrands: state.allBrands,
            );
          } else if (state is BrandsFailureState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
    );
  }
}

class NestedMobileBrandView extends StatelessWidget {
  const NestedMobileBrandView({super.key, required this.allBrands});

  final List<BrandEntity> allBrands;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Brand',
        showSearchBtn: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///SearchBar
          // Padding(
          //   padding: REdgeInsets.only(left: 16, right: 16, top: 22),
          //   child: CustomSearchBar(),
          // ),

          /// button
          Padding(
            padding: REdgeInsets.only(left: 16, right: 16, top: 22),
            child: CustomElevatedButton(
              sizedBoxHeight: 50.h,
              sizedBoxWidth: MediaQuery.of(context).size.width,
              borderRadius: 30,
              bgColor: AppColors.mainColor,
              //isBorderSide: true,
              text: Text(
                'ADD NEW BRAND',
                style: AppTextStyles.white14,
              ),
              onPressed: () {
                AppCustomBottomSheet().showBottomSheet(
                  context: context,
                  title: 'Add new brand',
                  btnText: 'ADD BRAND',
                  onPressed: () {
                    BlocProvider.of<BrandsBloc>(context)
                        .add(SetBrandEvent(controller.text));
                    controller.clear();
                    Navigator.pop(context);
                  },
                  content: CustomTextFormField(
                    controller: controller,
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Enter brand name',
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Text(
              'Choose brand',
              style: AppTextStyles.grey14,
            ),
          ),

          /// Brand ListView
          Expanded(
            child: ListView.separated(
              itemCount: allBrands.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final brand = allBrands[index];
                return ListTile(
                  onTap: () {
                    BlocProvider.of<BrandsBloc>(context).add(
                      TypedBrandsEvent(brand.name!),
                    );
                    Navigator.pop(context);
                  },
                  title: Text(
                    brand.name!,
                    style: AppTextStyles.black16,
                  ),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     BlocProvider.of<BrandsBloc>(context).add(
                  //       DeleteBrandEvent(brand.id!, brand.name!),
                  //     );
                  //   },
                  //   icon: const Icon(
                  //     Icons.delete,
                  //     color: AppColors.mainColor,
                  //   ),
                  // ),
                  contentPadding: REdgeInsets.symmetric(horizontal: 16),
                  minVerticalPadding: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
