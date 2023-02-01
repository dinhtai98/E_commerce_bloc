import 'package:e_commerce/core/blocs/delivery_blocs/delivery_bloc/delivery_bloc.dart';
import 'package:e_commerce/core/services/interfaces/idelivery_serivce.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/delivery_utils.dart';
import 'package:e_commerce/core/utils/icon_button_util.dart';
import 'package:e_commerce/core/utils/list_extension.dart';
import 'package:e_commerce/core/utils/modal_bottom_sheet_util.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/custom_input_field.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:e_commerce/global/router.dart';
import 'package:e_commerce/ui/add_new_card_screen/add_new_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeliveryDetailWidget extends StatefulWidget {
  const DeliveryDetailWidget({super.key});

  @override
  State<DeliveryDetailWidget> createState() => _DeliveryDetailWidgetState();
}

class _DeliveryDetailWidgetState extends State<DeliveryDetailWidget> {
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  late IDeliveryService _deliveryService;
  @override
  void initState() {
    context.read<DeliveryBloc>().add(const DeliveryInitEvent());
    _deliveryService = locator<IDeliveryService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocBuilder<DeliveryBloc, DeliveryState>(
            builder: (context, state) {
              if (state is DeliveryLoadedState && state.deliveries.isNotEmpty) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.deliveries.length,
                          itemBuilder: (context, index) {
                            var delivery = state.deliveries[index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: delivery.isDefault
                                    ? Colors.red[200]
                                    : ColorUtils.grey10,
                                border: Border.all(
                                    width: 3.0, color: ColorUtils.transparent),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        context.read<DeliveryBloc>().add(
                                            SelectedDeliveryEvent(
                                                delivery: delivery));
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          delivery.address,
                                          style: TextStyleUtils.medium(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButtonUtil(
                                      onTap: () {
                                        context.read<DeliveryBloc>().add(
                                            RemoveDeliveryEvent(
                                                delivery: delivery));
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 20.sp,
                                        color: ColorUtils.red,
                                      ),
                                      buttonSize: 30)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      CustomButton(
                        btnColor: ColorUtils.lightOrange,
                        btnRadius: 10,
                        height: 36.h,
                        minWidth: 160.w,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: ColorUtils.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const _BuildModalBottomSheetAddNewDelivery();
                            },
                          );
                        },
                        child: Text(
                          AppText.btnAddNewDelivery,
                          style: TextStyleUtils.medium(12)
                              .copyWith(color: ColorUtils.deepOrange),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                );
              }
              return Expanded(
                child: _BuildInputInfoDelivery(
                  addressTextEditingController: _addressTextEditingController,
                  phoneTextEditingController: _phoneTextEditingController,
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onPressed: () async {
                  var defaultDeliver = _deliveryService
                      .getDeliveries()
                      .firstOrDefault((x) => x.isDefault);
                  if (defaultDeliver == null) {
                    await DeliveryUtils.addNewDelivery(
                      context,
                      addressTextEditingController:
                          _addressTextEditingController,
                      phoneTextEditingController: _phoneTextEditingController,
                      isDefault: true,
                    );
                    Get.toNamed(MyRouter.orderCompleted);
                  } else {
                    Get.toNamed(MyRouter.orderCompleted);
                  }
                },
                child: Text(
                  AppText.btnPayOnDelivery,
                  style: TextStyleUtils.medium(16)
                      .copyWith(color: ColorUtils.deepOrange),
                ),
                btnColor: ColorUtils.lightOrange,
                btnRadius: 10,
                height: 56.h,
                minWidth: 160.w,
              ),
              CustomButton(
                onPressed: () {
                  Get.back();
                  showModalBottomSheet(
                    backgroundColor: ColorUtils.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const AddNewCard();
                    },
                  );
                },
                child: Text(
                  AppText.btnPayWithCard,
                  style: TextStyleUtils.medium(16)
                      .copyWith(color: ColorUtils.deepOrange),
                ),
                btnColor: ColorUtils.lightOrange,
                btnRadius: 10,
                height: 56.h,
                minWidth: 160.w,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _BuildInputInfoDelivery extends StatelessWidget {
  final TextEditingController phoneTextEditingController;
  final TextEditingController addressTextEditingController;

  const _BuildInputInfoDelivery({
    required this.phoneTextEditingController,
    required this.addressTextEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          AppText.lblYourDeliveryAddress,
          style: TextStyleUtils.regular(16).copyWith(color: ColorUtils.blue),
        ),
        CustomTextInputField(
          controller: addressTextEditingController,
          hintText: AppText.lblAddressHint,
          hintStyle:
              TextStyleUtils.medium(16).copyWith(color: ColorUtils.grey70),
        ),
        Text(
          AppText.lblNumberWeCanCall,
          style: TextStyleUtils.regular(16).copyWith(color: ColorUtils.blue),
        ),
        CustomTextInputField(
          controller: phoneTextEditingController,
          hintText: AppText.lblPhoneHint,
          hintStyle:
              TextStyleUtils.medium(16).copyWith(color: ColorUtils.grey70),
        ),
      ],
    );
  }
}

class _BuildModalBottomSheetAddNewDelivery extends StatefulWidget {
  const _BuildModalBottomSheetAddNewDelivery();

  @override
  State<_BuildModalBottomSheetAddNewDelivery> createState() =>
      _BuildModalBottomSheetAddNewDeliveryState();
}

class _BuildModalBottomSheetAddNewDeliveryState
    extends State<_BuildModalBottomSheetAddNewDelivery> {
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      child: Column(
        children: [
          Expanded(
            child: _BuildInputInfoDelivery(
              addressTextEditingController: _addressTextEditingController,
              phoneTextEditingController: _phoneTextEditingController,
            ),
          ),
          CustomButton(
            btnColor: ColorUtils.lightOrange,
            btnRadius: 10,
            height: 36.h,
            minWidth: 160.w,
            onPressed: () async {
              Get.back();
              await DeliveryUtils.addNewDelivery(context,
                  addressTextEditingController: _addressTextEditingController,
                  phoneTextEditingController: _phoneTextEditingController);
            },
            child: Text(
              AppText.btnAddNewDelivery,
              style: TextStyleUtils.medium(12)
                  .copyWith(color: ColorUtils.deepOrange),
            ),
          ),
        ],
      ),
    );
  }
}
