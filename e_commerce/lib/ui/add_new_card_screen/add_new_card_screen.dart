import 'package:e_commerce/core/blocs/card_bloc/card_bloc.dart';
import 'package:e_commerce/core/database/entities/card/card_entity.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/date_time_util.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/icon_button_util.dart';
import 'package:e_commerce/core/utils/modal_bottom_sheet_util.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/custom_input_field.dart';
import 'package:e_commerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController _cardHoldersTextEditingController =
      TextEditingController();
  final TextEditingController _cardNumberTextEditingController =
      TextEditingController();
  final TextEditingController _dateTextEditingController =
      TextEditingController();
  final TextEditingController _cvvTextEditingController =
      TextEditingController();
  DateTime? _date;
  DateTime? _cvv;

  @override
  void initState() {
    context.read<CardBloc>().add(CardLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardBloc, CardState>(
      listener: (context, state) {
        if (state is InsertCardFailed) {
          _showDialog(state.message);
        }
      },
      child: ModalBottomSheet(
        height: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BlocBuilder<CardBloc, CardState>(
                builder: (context, state) {
                  if (state is CardLoadedState) {
                    if (state.cards.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.lblCardHolderName,
                            style: TextStyleUtils.regular(16)
                                .copyWith(color: ColorUtils.blue),
                          ),
                          CustomTextInputField(
                            controller: _cardHoldersTextEditingController,
                            hintText: AppText.lblAddressHint,
                            hintStyle: TextStyleUtils.medium(16)
                                .copyWith(color: ColorUtils.grey70),
                          ),
                          Text(
                            AppText.lblCardNumber,
                            style: TextStyleUtils.regular(16)
                                .copyWith(color: ColorUtils.blue),
                          ),
                          CustomTextInputField(
                            controller: _cardNumberTextEditingController,
                            hintText: AppText.lblPhoneHint,
                            hintStyle: TextStyleUtils.medium(16)
                                .copyWith(color: ColorUtils.grey70),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppText.lblDate,
                                      style: TextStyleUtils.regular(16)
                                          .copyWith(color: ColorUtils.blue),
                                    ),
                                    SizedBox(height: 17.h),
                                    InkWell(
                                      onTap: () async {
                                        _date = await DateTimeUtils
                                            .buildCupertinoDatePicker(context);
                                        _dateTextEditingController.text =
                                            DateTimeUtils.dateFormat
                                                .format(_date!);
                                      },
                                      child: CustomTextInputField(
                                        enabled: false,
                                        controller: _dateTextEditingController,
                                        hintText: AppText.lblDateHint,
                                        hintStyle: TextStyleUtils.medium(16)
                                            .copyWith(color: ColorUtils.grey70),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 150.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppText.lblCVV,
                                      style: TextStyleUtils.regular(16)
                                          .copyWith(color: ColorUtils.blue),
                                    ),
                                    SizedBox(height: 17.h),
                                    InkWell(
                                      onTap: () async {
                                        _cvv = await DateTimeUtils
                                            .buildCupertinoDatePicker(context);
                                        _cvvTextEditingController.text =
                                            DateTimeUtils.dateFormat
                                                .format(_cvv!);
                                      },
                                      child: CustomTextInputField(
                                        enabled: false,
                                        controller: _cvvTextEditingController,
                                        hintText: AppText.lblDateHint,
                                        hintStyle: TextStyleUtils.medium(16)
                                            .copyWith(color: ColorUtils.grey70),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }
                    return _BuildCardInfo(cards: state.cards);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<CardBloc, CardState>(
              buildWhen: (previous, current) => current is CardLoadedState,
              builder: (context, state) {
                if (state is CardLoadedState) {
                  bool hasCard = state.cards.isNotEmpty;
                  var titleButton = hasCard
                      ? AppText.btnCompleteOrder
                      : AppText.btnInsertCard;
                  return Center(
                    child: CustomButton(
                      onPressed: () {
                        if (hasCard) {
                          Get.toNamed(MyRouter.orderCompleted);
                          return;
                        }
                        context.read<CardBloc>().add(
                              InsertCardEvent(
                                cardHolderName:
                                    _cardHoldersTextEditingController.text,
                                cardNumber:
                                    _cardNumberTextEditingController.text,
                                date: _date,
                                cvv: _cvv,
                              ),
                            );
                      },
                      child: Text(
                        titleButton,
                        style: TextStyleUtils.medium(16)
                            .copyWith(color: ColorUtils.white),
                      ),
                      btnColor: ColorUtils.deepOrange,
                      btnRadius: 10,
                      height: 56.h,
                      minWidth: 199.w,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(String message) async {
    await DialogUtils.showOkDialog(body: message, title: AppText.lblWarning);
  }
}

class _BuildCardInfo extends StatelessWidget {
  final List<CardEntity> cards;
  const _BuildCardInfo({required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        var card = cards[index];
        return Card(
          elevation: 2,
          child: Container(
            padding: EdgeInsets.all(8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: AppText.lblCardHolderName + ': ',
                        style: TextStyleUtils.regular(16)
                            .copyWith(color: ColorUtils.black),
                        children: [
                          TextSpan(
                              text: card.cardHolderName,
                              style: TextStyleUtils.bold(17))
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: AppText.lblCardNumber + ': ',
                        style: TextStyleUtils.regular(16)
                            .copyWith(color: ColorUtils.black),
                        children: [
                          TextSpan(
                              text: card.cardNumber,
                              style: TextStyleUtils.bold(17))
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: AppText.lblDate + ': ',
                        style: TextStyleUtils.regular(16)
                            .copyWith(color: ColorUtils.black),
                        children: [
                          TextSpan(
                              text: DateTimeUtils.dateFormat.format(card.date),
                              style: TextStyleUtils.bold(17))
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: AppText.lblCVV + ': ',
                        style: TextStyleUtils.regular(16)
                            .copyWith(color: ColorUtils.black),
                        children: [
                          TextSpan(
                              text: DateTimeUtils.dateFormat.format(card.cVV),
                              style: TextStyleUtils.bold(17))
                        ],
                      ),
                    ),
                  ],
                ),
                IconButtonUtil(
                    onTap: () {
                      context.read<CardBloc>().add(RemoveCardEvent(card: card));
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: ColorUtils.red,
                    ),
                    buttonSize: 30)
              ],
            ),
          ),
        );
      },
    );
  }
}
