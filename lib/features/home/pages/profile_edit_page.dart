import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms_adv/core/bloc/base_state/base.dart';
import 'package:lms_adv/core/bloc/bloc/update_profile_bloc.dart';
import 'package:lms_adv/core/bloc/profile/profile_bloc.dart';
import 'package:lms_adv/core/di/di_init.dart';
import 'package:lms_adv/core/extension/context_extension.dart';
import 'package:lms_adv/core/models/profile_model.dart';
import 'package:lms_adv/core/models/profile_model_patch.dart';
import 'package:lms_adv/core/utils/snackbar_utils.dart';
import 'package:lms_adv/core/widgets/app_button.dart';
import 'package:lms_adv/core/widgets/app_image.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/core/widgets/custom_text_form.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key, required this.user});
  final ProfileModel user;

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  File? _pickedProfileImage;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _usernameController = TextEditingController(text: widget.user.username);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdateProfileBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("edit your profile")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(8.0),
            child: Column(
              spacing: 12,
              children: [
                ImagePickerWidget(
                  networkImage: widget.user.avatar,
                  pickedImage: (file) {
                    _pickedProfileImage = file;
                  },
                ),
                AppText("Name", type: AppTextType.label),
                CustomTextForm(controller: _nameController),
                AppText("username", type: AppTextType.label),
                CustomTextForm(controller: _usernameController),
                BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      loaded: (data) {
                        ContextExtension(context).pop();
                        AppSnackBar.success(context, message: data);
                        context.read<ProfileBloc>().add(ProfileEvent.profile());
                        GoRouterHelper(context).pop();
                      },
                      failure: (failure) {
                        AppSnackBar.error(context, message: failure.message);
                      },
                      loading: () {
                        context.showDialogBox();
                      },
                    );
                  },
                  builder: (context, state) {
                    return AppButton(
                      text: 'update',
                      onPressed: () {
                        final user = ProfileModelPatch(
                          name: _nameController.text,
                          username: _usernameController.text,
                          avatar: _pickedProfileImage,
                        );
                        context.read<UpdateProfileBloc>().add(
                          UpdateProfileEvent.update(user),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    this.networkImage,
    required this.pickedImage,
  });
  final String? networkImage;
  final Function(File file) pickedImage;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: _pickedImage != null
              ? Image.file(File(_pickedImage!.path), fit: BoxFit.cover)
              : AppImage.circle(imageUrl: widget.networkImage),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(onPressed: _pickImage, icon: Icon(Icons.edit)),
        ),
      ],
    );
  }

  void _pickImage() async {
    try {
      final imagePicker = ImagePicker();
      _pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
      if (_pickedImage != null) {
        widget.pickedImage(File(_pickedImage!.path));
      }
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }
}
