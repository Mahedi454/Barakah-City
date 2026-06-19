# Barakah City — 45-Day Build Roadmap

**Philosophy:** MVP-first, vertical slices. Every phase ends with a build that
runs on a real device. Build for this phase's feature, not next month's.

| Phase | Days  | Focus                                              | Runnable deliverable             |
|-------|-------|----------------------------------------------------|----------------------------------|
| 0 — Foundation   | 1     | Setup, architecture, scope, identity     | Green build + locked decisions   |
| 1 — Skeleton     | 2–6   | All MVP screens + navigation + static bar | Tap-through app, no logic        |
| 2 — Flame Grid   | 7–13  | Flame surface, render fixed grid, taps    | A grid you can tap               |
| 3 — Build System | 14–20 | Place buildings, catalog (3–5)            | Buildings appear on tap          |
| 4 — Resource Logic | 21–27 | Domain systems: economy, water, happiness, growth | Resources react to building |
| 5 — Persistence  | 28–31 | Save/load city locally                    | City survives restart            |
| 6 — Progression  | 32–36 | Milestones, city tiers                    | City "levels up"                 |
| 7 — Polish & Feel| 37–41 | Theme, transitions, light animation, sound toggle | Looks and feels calm    |
| 8 — Test & Ship  | 42–45 | Bug fixing, device testing, build APK, store assets | Installable build      |

## Cadence rules
- End of every phase = a working build.
- Commit small and often with clear messages.
- One vertical slice in flight at a time.
- Defer the "avoid" list ruthlessly.
- Re-balance numbers, don't re-architect systems.

## Next up — Phase 1 (Skeleton)
Build Splash → Home → Dashboard with a static resource bar and working
navigation. Still no game logic — just screens you can tap through.
