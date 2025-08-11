import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';
import '../../../core/widgets/buttons/buttons.dart';
import '../../auths/login/login.dart';

class AbonnePage extends StatefulWidget {
  const AbonnePage({super.key});

  @override
  State<AbonnePage> createState() => _AbonnePageState();
}

class _AbonnePageState extends State<AbonnePage> {
  int? selectedIndex;

  final List<Map<String, dynamic>> abonnements = [
    {
      'titre': 'Gratuit',
      'prix': '0 FCFA',
      'features': [
        'Créer jusqu’à 5 aventures',
        'Inviter jusqu’à 2 participants',
        'Accès limité aux aventures',
        'Accès basique aux fonctionnalités',
        'Aucune personnalisation avancée',
        'Pas de support prioritaire',
      ],
    },
    {
      'titre': 'VERSION PRINT ET NUMERIQUE',
      'prix': '60 000 FCFA',
      'features': [
        'Créer un nombre illimité d’aventures',
        'Accès illimité aux aventures',
        'Inviter jusqu’à 5 participants par aventure',
        'Personnalisation complète des notifications',
        'Support prioritaire et accès anticipé aux nouveautés',
        'Support client prioritaire',
        'Recevez des alertes exclusives',
      ],
    },
    {
      'titre': 'VERSION PRINT',
      'prix': '50 000 FCFA',
      'features': [
        'Créer un nombre illimité d’aventures',
        'Accès illimité aux aventures',
        'Inviter jusqu’à 5 participants par aventure',
        'Personnalisation complète des notifications',
        'Support prioritaire et accès anticipé aux nouveautés',
        'Support client prioritaire',
        'Recevez des alertes exclusives',
      ],
    },
    {
      'titre': 'VERSION NUMERIQUE',
      'prix': '15 000 FCFA',
      'features': [
        'Créer un nombre illimité d’aventures',
        'Accès illimité aux aventures',
        'Inviter jusqu’à 5 participants par aventure',
        'Personnalisation complète des notifications',
        'Support prioritaire et accès anticipé aux nouveautés',
        'Support client prioritaire',
        'Recevez des alertes exclusives',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Choisissez votre",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: appBlack,
                ),
              ),
              Text(
                "abonnement annuel",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: appColorRed,
                ),
              ),
              Gap(2.h),
              Column(
                children:
                    abonnements.asMap().entries.map((entry) {
                      final index = entry.key;
                      final abonnement = entry.value;
                      final bool isSelected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.blue.shade50 : Colors.white,
                            border: Border.all(
                              color:
                                  isSelected
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    isSelected
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    color: isSelected ? appColor : Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      abonnement['titre'],
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            isSelected
                                                ? appColor
                                                : Colors.black87,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    abonnement['prix'],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          isSelected
                                              ? appColor
                                              : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              ...abonnement['features'].map<Widget>((feature) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          feature,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
              Gap(1.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 15.sp, color: appBlack),
                  children: [
                    const TextSpan(text: "Déja abonné ? "),
                    TextSpan(
                      text: "Se connecter",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: SubmitButton(
          "S'abonner",
          fontSize: 18.sp,
          onPressed: () async {
            print(selectedIndex);
          },
        ),
      ),
    );
  }
}
