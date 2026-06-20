import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../widgets/widgets.dart';

/// Living style guide for the Barakah City UI system. Renders every token and
/// component in one scroll so the design system can be reviewed on-device.
///
/// This is a Day-2 deliverable / reference screen — the real Splash → Home →
/// Dashboard flow replaces it as the home route once the Skeleton phase builds.
class DesignGalleryScreen extends StatelessWidget {
  const DesignGalleryScreen({super.key});

  static const ResourceBarData _demoData = ResourceBarData(
    coins: '1,240',
    population: '86/100',
    happiness: '92%',
    water: 'Plenty',
    cityLevel: 'Lv2',
  );

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: <Widget>[
          // --- The HUD floats at the top, over the ambient world ---------
          // (rendered last so it sits above the scroll content)
          ListView(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.screen,
              MediaQuery.of(context).padding.top + 72,
              AppSpacing.screen,
              120,
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Barakah City', style: AppTypography.displayL),
                  const TierBadge(tier: 'Town'),
                ],
              ),
              Text('UI System — Day 2', style: AppTypography.caption),
              const SizedBox(height: AppSpacing.xl),

              _Section(
                title: 'Buttons',
                child: Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: <Widget>[
                    AppButton(
                      label: 'Build',
                      icon: Icons.construction_rounded,
                      variant: AppButtonVariant.primary,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: 'Continue',
                      variant: AppButtonVariant.secondary,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: 'Cancel',
                      variant: AppButtonVariant.soft,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: 'See all',
                      variant: AppButtonVariant.ghost,
                      onPressed: () {},
                    ),
                    const AppButton(
                      label: "Can't afford",
                      variant: AppButtonVariant.primary,
                      onPressed: null,
                    ),
                  ],
                ),
              ),

              _Section(
                title: 'Icon & Build actions',
                child: Row(
                  children: <Widget>[
                    IconRoundButton(icon: Icons.settings_rounded, onPressed: () {}),
                    const SizedBox(width: AppSpacing.md),
                    IconRoundButton.filled(
                      icon: Icons.close_rounded,
                      color: AppColors.green,
                      onPressed: () {},
                    ),
                    const SizedBox(width: AppSpacing.md),
                    BuildFab(onPressed: () {}),
                  ],
                ),
              ),

              _Section(
                title: 'Resource pills (HUD)',
                child: Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: <Widget>[
                    StatPill(type: ResourceType.coins, value: '1,240', onAdd: () {}),
                    const StatPill(type: ResourceType.population, value: '86/100'),
                    const StatPill(type: ResourceType.happiness, value: '92%'),
                    const StatPill(type: ResourceType.water, value: 'Low', alert: true),
                    const StatPill(type: ResourceType.education, value: 'Lv2'),
                  ],
                ),
              ),

              _Section(
                title: 'Feedback bits',
                child: Row(
                  children: const <Widget>[
                    HappinessFace(percent: 92, size: 32),
                    SizedBox(width: AppSpacing.lg),
                    HappinessFace(percent: 55, size: 32),
                    SizedBox(width: AppSpacing.lg),
                    HappinessFace(percent: 20, size: 32),
                    SizedBox(width: AppSpacing.xl),
                    FloatingGainLabel(type: ResourceType.coins, amount: 5, loop: true),
                    SizedBox(width: AppSpacing.lg),
                    FloatingGainLabel(type: ResourceType.population, amount: 2, loop: true),
                  ],
                ),
              ),

              _Section(
                title: 'Building cards',
                child: SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      BuildingCard(
                        name: 'House',
                        description: 'Homes for your growing population.',
                        icon: Icons.home_rounded,
                        ownedCount: 3,
                        costs: const <BuildingCost>[BuildingCost(ResourceType.coins, 50)],
                        onTap: () {},
                      ),
                      const SizedBox(width: AppSpacing.md),
                      BuildingCard(
                        name: 'Well',
                        description: 'Clean water keeps the city alive.',
                        icon: Icons.water_drop_rounded,
                        accent: AppColors.skySoft,
                        selected: true,
                        costs: const <BuildingCost>[BuildingCost(ResourceType.coins, 80)],
                        onTap: () {},
                      ),
                      const SizedBox(width: AppSpacing.md),
                      BuildingCard(
                        name: 'School',
                        description: 'Education unlocks long-term happiness.',
                        icon: Icons.menu_book_rounded,
                        accent: Color(0xFFE9E4F4),
                        costs: const <BuildingCost>[
                          BuildingCost(ResourceType.coins, 200, affordable: false),
                        ],
                        onTap: () {},
                      ),
                      const SizedBox(width: AppSpacing.md),
                      const BuildingCard(
                        name: 'Garden',
                        description: 'A peaceful green space.',
                        icon: Icons.park_rounded,
                        locked: true,
                        unlockHint: 'Reach City',
                        costs: <BuildingCost>[BuildingCost(ResourceType.coins, 120)],
                      ),
                    ],
                  ),
                ),
              ),

              _Section(
                title: 'Dividers & dialog',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const GeometricDivider(),
                    const SizedBox(height: AppSpacing.lg),
                    AppButton(
                      label: 'Open dialog',
                      variant: AppButtonVariant.soft,
                      onPressed: () => AppDialog.show(
                        context,
                        title: 'Reset City?',
                        message:
                            'This clears your city and starts fresh. Your progress cannot be recovered.',
                        confirmLabel: 'Reset',
                        cancelLabel: 'Keep building',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // The persistent top HUD overlay.
          Align(
            alignment: Alignment.topCenter,
            child: ResourceBar(
              data: _demoData,
              onSettings: () {},
              onAddCoins: () {},
              onResourceTap: (_) {},
            ),
          ),

          // The persistent Build FAB, bottom-right over the world.
          Positioned(
            right: AppSpacing.lg,
            bottom: AppSpacing.xl,
            child: BuildFab(onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(title: title),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}
