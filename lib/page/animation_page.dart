import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_news_article/constan.dart';
import 'package:test_news_article/provider/animation.dart';

class AnimationPage extends ConsumerWidget {
  static String routeName = '/animation';
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var isFauchetOn = ref.watch(faucetProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test EV Studio'),
      ),
      body: Stack(children: [
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: InkWell(
            onTap: () {
              if (isFauchetOn == false) {
                ref.read(faucetProvider.notifier).state = true;
              } else {
                ref.read(faucetProvider.notifier).state = false;
              }
            },
            child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('${Constan.pathRootImage}faucet.png')),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(seconds: 1),
          top: isFauchetOn ? 250 : 130,
          left: 120,
          right: 16,
          child: Visibility(
            visible: isFauchetOn,
            child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset('${Constan.pathRootImage}drop.png')),
          ),
        ),
      ]),
    );
  }
}
