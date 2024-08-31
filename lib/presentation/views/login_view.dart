import 'package:fate_date_demo/core/core.dart';
import 'package:fate_date_demo/presentation/views/home_view.dart';
import 'package:fate_date_demo/presentation/widgets/app_textfield.dart';
import 'package:fate_date_demo/provider/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>((ref) {
  return '';
});

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    final homeCtrl = ref.read(homeControllerProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Welcome to Restaurants Hub',
                style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Please input your name to access the hub',
                style: context.textTheme.bodyMedium,
              ),
            ].paddingInColumn(AppSpacings.k4),
          ),
          Form(
            key: homeCtrl.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: AppTextField(
              hintText: 'Enter your name',
              validator: (p0) {
                if (p0 != null && p0.length < 6) {
                  return 'name must be more than 5 characters';
                }
                return null;
              },
              onChanged: (p0) {
                ref.read(nameProvider.notifier).update((state) => p0);
              },
              suffixIcon: ref.watch(nameProvider).length > 5
                  ? const Icon(Icons.send).onTapWidget(
                      onTap: () {
                        pushReplacement(context, const HomeView());
                      },
                      tooltip: 'login',
                    )
                  : null,
            ),
          )
        ].paddingInColumn(AppSpacings.k20),
      ).padAll(AppSpacings.k16),
    );
  }
}
