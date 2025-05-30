import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Container(),
    );
  }
}

class NgamarSignInView extends StatefulWidget {
  const NgamarSignInView({super.key});

  @override
  State<NgamarSignInView> createState() => _NgamarSignInViewState();
}

class _NgamarSignInViewState extends State<NgamarSignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          elevation: 0,
          leading: const BackButton(
            color: AppColors.kPrimary,
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const Text('Let’s Sign you in',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 5),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur',
                  style: TextStyle(fontSize: 14, color: AppColors.kGrey60),
                ),
                const SizedBox(height: 30),
                // Email Field.
                AuthField(
                  title: 'Email Address',
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!value.isEmail) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                // Password Field.
                AuthField(
                  title: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password should be at least 8 characters long';
                    }
                    return null;
                  },
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    RememberMeCard(
                      onChanged: (value) {
                        setState(() {
                          isRemember = value;
                        });
                      },
                    ),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {},
                      text: 'Forget Password',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Sign In',
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Don’t have an account? ',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.kGrey70),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kPrimary),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const TextWithDivider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSocialButton(
                      onTap: () {},
                      icon: AppAssets.kGoogle,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: AppAssets.kApple,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: AppAssets.kFacebook,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const AgreeTermsTextCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AgreeTermsTextCard extends StatelessWidget {
  const AgreeTermsTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: RichText(
        text: TextSpan(
          text: 'By signing up you agree to our ',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.kGrey70),
          children: [
            TextSpan(
                text: 'Terms',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGrey100)),
            const TextSpan(
                text: ' and ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGrey70)),
            TextSpan(
                text: 'Conditions of Use',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGrey100)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomSocialButton extends StatefulWidget {
  final String icon;
  final VoidCallback onTap;
  const CustomSocialButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  State<CustomSocialButton> createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          height: 48,
          width: 72,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFFF6F6F6),
            image: DecorationImage(image: AssetImage(widget.icon)),
          ),
        ),
      ),
    );
  }
}

class TextWithDivider extends StatelessWidget {
  const TextWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.kGrey60,
          ),
        ),
        SizedBox(width: 20),
        Text(
          'Or Sign In with',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.kGrey60,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Divider(color: AppColors.kGrey60),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            height: widget.height ?? 50,
            alignment: Alignment.center,
            width: widget.width ?? double.maxFinite,
            decoration: BoxDecoration(
              color: widget.color ?? const Color(0xFFD1A661),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.color == null ? AppColors.kWhite : Colors.black,
                  fontSize: widget.fontSize ?? 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.red,
          fontSize: fontSize ?? 14,
        ),
      ),
    );
  }
}

class RememberMeCard extends StatefulWidget {
  final Function(bool isChecked) onChanged;
  const RememberMeCard({required this.onChanged, super.key});

  @override
  State<RememberMeCard> createState() => _RememberMeCardState();
}

class _RememberMeCardState extends State<RememberMeCard> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
            widget.onChanged(_isChecked);
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isChecked
                    ? const Color(0xFFD1A661)
                    : const Color(0xFFE3E9ED),
                width: 2,
              ),
            ),
            child: _isChecked
                ? const Icon(
              Icons.check,
              size: 16,
              color: Color(0xFFD1A661),
            )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Remember me',
          style: TextStyle(fontSize: 14, color: Color(0xFF78828A)),
        ),
      ],
    );
  }
}

class AuthField extends StatefulWidget {
  final String title;
  final String hintText;
  final Color? titleColor;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final int? maxLines;
  const AuthField({
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.titleColor,
    this.maxLines,
    this.textInputAction,
    this.keyboardType,
    this.isPassword = false,
    super.key,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 14,
              color: widget.titleColor ?? const Color(0xFF78828A)),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          // ignore: avoid_bool_literals_in_conditional_expressions
          obscureText: widget.isPassword ? isObscure : false,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            fillColor: const Color(0xFFF6F6F6),
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.kGrey60),
            suffixIcon: widget.isPassword
                ? IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF171725)),
            )
                : null,
          ),
        ),
      ],
    );
  }
}


//CREATE ACCOUNT

class NgamarSignUpView extends StatefulWidget {
  const NgamarSignUpView({super.key});

  @override
  State<NgamarSignUpView> createState() => _NgamarSignUpViewState();
}

class _NgamarSignUpViewState extends State<NgamarSignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          elevation: 0,
          leading: const BackButton(
            color: AppColors.kPrimary,
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const Text('Create Account',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 5),
                const Text('Lorem ipsum dolor sit amet, consectetur',
                    style: TextStyle(fontSize: 14, color: AppColors.kGrey60)),
                const SizedBox(height: 30),
                // FullName.
                AuthField(
                  title: 'Full Name',
                  hintText: 'Enter your name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    } else if (!RegExp(r'^[a-zA-Z ]+ $').hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                // Email Field.
                AuthField(
                  title: 'E-mail',
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!value.isEmail) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                // Password Field.
                AuthField(
                  title: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password should be at least 8 characters long';
                    }
                    return null;
                  },
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Create An Account',
                ),
                const SizedBox(height: 30),
                const TextWithDivider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSocialButton(
                      onTap: () {},
                      icon: AppAssets.kGoogle,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: AppAssets.kApple,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: AppAssets.kFacebook,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const AgreeTermsTextCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class AgreeTermsTextCard extends StatelessWidget {
  const AgreeTermsTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: RichText(
        text: TextSpan(
          text: 'By signing up you agree to our ',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.kGrey70),
          children: [
            TextSpan(
                text: 'Terms',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGrey100)),
            const TextSpan(
                text: ' and ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGrey70)),
            TextSpan(
                text: 'Conditions of Use',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGrey100)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomSocialButton extends StatefulWidget {
  final String icon;
  final VoidCallback onTap;
  const CustomSocialButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  State<CustomSocialButton> createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          height: 48,
          width: 72,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFFF6F6F6),
            image: DecorationImage(image: AssetImage(widget.icon)),
          ),
        ),
      ),
    );
  }
}

class TextWithDivider extends StatelessWidget {
  const TextWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.kGrey60,
          ),
        ),
        SizedBox(width: 20),
        Text(
          'Or Sign In with',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.kGrey60,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Divider(color: AppColors.kGrey60),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            height: widget.height ?? 50,
            alignment: Alignment.center,
            width: widget.width ?? double.maxFinite,
            decoration: BoxDecoration(
              color: widget.color ?? const Color(0xFFD1A661),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.color == null ? AppColors.kWhite : Colors.black,
                  fontSize: widget.fontSize ?? 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.red,
          fontSize: fontSize ?? 14,
        ),
      ),
    );
  }
}

class RememberMeCard extends StatefulWidget {
  final Function(bool isChecked) onChanged;
  const RememberMeCard({required this.onChanged, super.key});

  @override
  State<RememberMeCard> createState() => _RememberMeCardState();
}

class _RememberMeCardState extends State<RememberMeCard> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
            widget.onChanged(_isChecked);
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isChecked
                    ? const Color(0xFFD1A661)
                    : const Color(0xFFE3E9ED),
                width: 2,
              ),
            ),
            child: _isChecked
                ? const Icon(
              Icons.check,
              size: 16,
              color: Color(0xFFD1A661),
            )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Remember me',
          style: TextStyle(fontSize: 14, color: Color(0xFF78828A)),
        ),
      ],
    );
  }
}

class AuthField extends StatefulWidget {
  final String title;
  final String hintText;
  final Color? titleColor;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final int? maxLines;
  const AuthField({
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.titleColor,
    this.maxLines,
    this.textInputAction,
    this.keyboardType,
    this.isPassword = false,
    super.key,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 14,
              color: widget.titleColor ?? const Color(0xFF78828A)),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          // ignore: avoid_bool_literals_in_conditional_expressions
          obscureText: widget.isPassword ? isObscure : false,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            fillColor: const Color(0xFFF6F6F6),
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.kGrey60),
            suffixIcon: widget.isPassword
                ? IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF171725)),
            )
                : null,
          ),
        ),
      ],
    );
  }
}




// Multi select

import '../../app/shared/fonts.dart';
import '../../shared/exports/export_boiler_plate.dart';

class RecordSelectionScreen extends StatefulWidget {
  const RecordSelectionScreen({Key? key}) : super(key: key);

  @override
  _RecordSelectionScreenState createState() => _RecordSelectionScreenState();
}

class _RecordSelectionScreenState extends State<RecordSelectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();
  List<RecordItem> _filteredItems = [];
  final Set<String> _selectedItems = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _filteredItems = _allRecordItems;
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KConstantColors.whiteColor,
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LinearProgressIndicator(
            value: 0.33,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          _buildSearchBar(context),
          _buildHeader(context),
          Expanded(
            child: _buildRecordList(context),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: KConstantColors.whiteColor,
      actions: [
        IconButton(
          icon: Icon(_isSearchVisible ? Icons.close : Icons.search,
              color: Colors.black),
          onPressed: () {
            setState(() {
              _isSearchVisible = !_isSearchVisible;
              if (_isSearchVisible) {
                _controller.forward();
              } else {
                _controller.reverse();
                _searchController.clear();
                _filteredItems = _allRecordItems;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _searchController,
          onChanged: _filterRecordItems,
          decoration: InputDecoration(
            hintText: 'Search records...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What would you like to record?',
            style: KCustomTextStyle.kMedium(
              context,
              FontSize.kLarge,
              KConstantColors.blackColor,
              KConstantFonts.geistMedium,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              _showInfoDialog(context);
            },
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  'What am I recording?',
                  style: KCustomTextStyle.kMedium(
                    context,
                    FontSize.kSmall,
                    Colors.grey[600]!,
                    KConstantFonts.geistMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        return _buildRecordItem(context, _filteredItems[index]);
      },
    );
  }

  Widget _buildRecordItem(BuildContext context, RecordItem item) {
    final isSelected = _selectedItems.contains(item.title);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border:
        Border.all(color: isSelected ? Colors.green : Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.green[50] : Colors.white,
      ),
      child: ListTile(
        leading: Icon(item.icon,
            color: isSelected ? Colors.green : Colors.grey[600]),
        title: Text(
          item.title,
          style: KCustomTextStyle.kMedium(
            context,
            FontSize.kMedium,
            isSelected ? Colors.green : KConstantColors.blackColor,
            KConstantFonts.geistMedium,
          ),
        ),
        subtitle: Text(
          item.description,
          style: KCustomTextStyle.kMedium(
            context,
            FontSize.kSmall,
            Colors.grey[600]!,
            KConstantFonts.geistMedium,
          ),
        ),
        trailing: Icon(
          isSelected ? Icons.check_circle : Icons.add_circle_outline,
          color: isSelected ? Colors.green : Colors.grey[600],
        ),
        onTap: () {
          setState(() {
            if (isSelected) {
              _selectedItems.remove(item.title);
            } else {
              _selectedItems.add(item.title);
            }
          });
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No worries! You can always edit this later.',
            style: KCustomTextStyle.kMedium(
              context,
              FontSize.kSmall,
              Colors.grey[600]!,
              KConstantFonts.geistMedium,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: _selectedItems.isNotEmpty
                ? () {
              // Handle next button press
              print('Selected items: $_selectedItems');
            }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: KConstantColors.bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text(
              'Next',
              style: KCustomTextStyle.kMedium(
                context,
                FontSize.kMedium,
                Colors.white,
                KConstantFonts.geistMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _filterRecordItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = _allRecordItems;
      } else {
        _filteredItems = _allRecordItems
            .where((item) =>
        item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'What am I recording?',
            style: KCustomTextStyle.kMedium(
              context,
              FontSize.kMedium,
              KConstantColors.blackColor,
              KConstantFonts.geistMedium,
            ),
          ),
          content: Text(
            'You are selecting categories of information you want to track in your daily life. This helps personalize your experience and provides insights into your habits and routines.',
            style: KCustomTextStyle.kMedium(
              context,
              FontSize.kSmall,
              Colors.grey[600]!,
              KConstantFonts.geistMedium,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Got it',
                style: KCustomTextStyle.kMedium(
                  context,
                  FontSize.kMedium,
                  Colors.green,
                  KConstantFonts.geistMedium,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class RecordItem {
  final String title;
  final String description;
  final IconData icon;

  RecordItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<RecordItem> _allRecordItems = [
  RecordItem(
    title: 'Emotion',
    description: 'happy, proud, gloomy, sad, etc.',
    icon: Icons.emoji_emotions_outlined,
  ),
  RecordItem(
    title: 'Social',
    description: 'friends, family, acquaintance, GF/BF, etc.',
    icon: Icons.people_outline,
  ),
  RecordItem(
    title: 'Weather',
    description: 'sunny, cloudy, rainy, snowy, windy, etc.',
    icon: Icons.wb_sunny_outlined,
  ),
  RecordItem(
    title: 'Meal',
    description: 'breakfast, lunch, dinner, night snack, etc.',
    icon: Icons.restaurant_menu,
  ),
  RecordItem(
    title: 'Hobbies',
    description:
    'movie, TV, gaming, reading, playing instrument, taking a walk, etc.',
    icon: Icons.sports_esports,
  ),
  RecordItem(
    title: 'Work',
    description: 'meetings, tasks, projects, deadlines, etc.',
    icon: Icons.work_outline,
  ),
  RecordItem(
    title: 'Exercise',
    description: 'running, gym, yoga, swimming, cycling, etc.',
    icon: Icons.fitness_center,
  ),
  RecordItem(
    title: 'Sleep',
    description: 'bedtime, wake time, sleep quality, etc.',
    icon: Icons.nightlight_round,
  ),
  RecordItem(
    title: 'Productivity',
    description: 'focus time, breaks, distractions, etc.',
    icon: Icons.trending_up,
  ),
  RecordItem(
    title: 'Finance',
    description: 'income, expenses, savings, investments, etc.',
    icon: Icons.attach_money,
  ),
];
