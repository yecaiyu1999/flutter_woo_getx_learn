import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({Key? key}) : super(key: key);

  // 头像
  Widget _buildAvatar() {
    return ListTileWidget(
      title: TextWidget.body1(LocaleKeys.profileEditMyPhoto.tr),
      trailing: [
        controller.filePhoto != null
            ? ImageWidget.file(
                controller.filePhoto?.path ?? "",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              )
            : ImageWidget.url(
                // UserService.to.profile.avatarUrl,
                "https://pics4.baidu.com/feed/fd039245d688d43f498e1951ae67a3120ff43bf5.jpeg@f_auto?token=6a77b8caf95784509b57a4d0d1237b30",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              ),
      ],
      padding: EdgeInsets.all(AppSpace.card),
      onTap: controller.onSelectPhoto,
    ).card().height(105.h).paddingBottom(AppSpace.card);
  }

//  profile 表单
  Widget _buildProfileForm() {
    return const Text("profile 表单");
  }

  //  password 表单
  Widget _buildPasswordForm() {
    return const Text("password 表单");
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 头像
        _buildAvatar(),

        // 表单
        Form(
          key: controller.formKey, //设置globalKey，用于后面获取FormState
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: <Widget>[
            // profile 表单
            _buildProfileForm(),
            // password 表单
            _buildPasswordForm(),
          ].toColumn(),
        ).paddingBottom(AppSpace.card),

        // 保存按钮
        ButtonWidget.primary(
          LocaleKeys.commonBottomSave.tr,
        ).paddingHorizontal(AppSpace.page),
      ].toColumn().padding(
            top: 45.h,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
      init: ProfileEditController(),
      id: "profile_edit",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(titleString: LocaleKeys.profileEditTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
