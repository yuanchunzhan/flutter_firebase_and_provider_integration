import 'package:flutter/material.dart';
import 'package:flutter_firebase_and_provider_integration/provider/AuthModel.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../screen_size.dart';

class Header extends StatelessWidget {
  const Header(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!ScreenSize.isLarge(context))
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: secondaryColor,
            ),
            onPressed: () {
              if (!Scaffold.of(context).isDrawerOpen) {
                Scaffold.of(context).openDrawer();
              }
            },
          ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: secondaryTextColor),
        ),
        const Spacer(),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Consumer<AuthModel>(
            builder: (context, auth, child) {
              return auth.isSignIn
                  ? const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        "assets/images/woman.png",
                      ),
                    )
                  : const Icon(
                      Icons.account_circle,
                      color: primaryColor,
                    );
            },
          ),
          if (!ScreenSize.isSmall(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Consumer<AuthModel>(
                builder: (context, auth, child) {
                  return auth.isSignIn
                      ? Text(
                          '${auth.user?.email}',
                          style: const TextStyle(color: darkTextColor),
                        )
                      : TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Please Log In',
                            style: TextStyle(color: darkTextColor),
                          ),
                        );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: fillColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
