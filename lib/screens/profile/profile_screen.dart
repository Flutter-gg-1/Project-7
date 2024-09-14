import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project_pulse/screens/profile/profile_cubit.dart';
import 'package:tuwaiq_project_pulse/screens/profile/subviews/edit_profile_view.dart';
import 'package:tuwaiq_project_pulse/screens/profile/subviews/show_profile_view.dart';

import '../../utils/typedefs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<ProfileCubit>();
        return BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoadingState || state is ProfileErrorState) {
              cubit.showAlert(context, false);
            } else {
              cubit.dismissAlert(context);
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileInitial) cubit.loadProfile();
                    return Column(
                      children: [
                        _HeaderView(cubit: cubit),
                        Expanded(
                          child: cubit.isEdit
                              ? EditProfileView(cubit: cubit)
                              : ShowProfileView(cubit: cubit),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _HeaderView extends StatelessWidget {
  const _HeaderView({required this.cubit});
  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cubit.headerTitle(),
          style: const TS(
            fontWeight: FW.bold,
          ),
        ),
        Row(
          children: [
            TextButton(
                onPressed: cubit.toggleIsEdit,
                child: Text(cubit.isEdit ? 'cancel' : 'edit')),
            if (cubit.isEdit)
              TextButton(
                  onPressed: cubit.updateProfile, child: const Text('save')),
          ],
        ),
      ],
    );
  }
}
