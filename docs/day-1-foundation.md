# Barakah City — Day 1 Foundation & Design Decisions

**Stack:** Flutter + Flame · **Genre:** Peaceful city-building simulation
**State management:** Riverpod (single, final choice)
**Status:** Foundation complete. Gameplay begins in the Skeleton phase.

---

## 1. Game Concept

Barakah City is a peaceful, ethical, value-based city-building game. Players
nurture a clean, balanced city. There are **no enemies, no punishing timers, and
no "game over."** Success means the city *flourishes*.

**Core loop:** Build → Grow → Manage Resources → Expand.

---

## 2. Core Resources (directional rules — numbers tuned later)

| Resource    | Increases from              | Decreases from        | Role                       |
|-------------|-----------------------------|-----------------------|----------------------------|
| Coins       | Population / economy output | Building costs        | Currency to expand         |
| Population  | Enough Happiness + Water    | Overcrowding          | Growth metric              |
| Happiness   | Education, water, services  | Overcrowding, neglect | Gatekeeper for growth      |
| Water       | Wells / infrastructure      | Population consumption | Survival resource          |
| Education   | Schools                     | —                     | Long-term happiness, unlocks |

---

## 3. Progression (peaceful, no-lose)

Milestone tiers instead of win/lose:
**Village → Town → City → Barakah City.**
Reaching a population + happiness threshold levels the city up.

---

## 4. Visual Identity

- **Palette:** Green (growth), Gold (prosperity), Cream/Sand/Sky (calm). No harsh reds.
- **Style:** Flat cartoon tiles first; evolve toward isometric later.
- **Tone:** Peaceful, unhurried, ethical, rewarding.
- **Emotion target:** *"A quiet, satisfying space where doing good makes the city flourish."*

Tokens live in `lib/core/theme/`.

---

## 5. MVP Scope

### Build first (V1)
- City Dashboard showing all 5 resources (persistent top bar)
- A small fixed Flame grid (single starting plot)
- Place 3–5 building types (house, well, school, +1–2)
- Basic resource logic — building changes resources
- Population growth tied to ≥1 resource
- Local save/load (shared_preferences)
- Core screens navigable: Splash → Home → Dashboard ⇄ Build Menu, + Settings

### Deliberately avoid early
Multiplayer · cloud sync · accounts/login · ads/IAP/monetization · sound & music
systems · heavy animations/particles · large building catalogs · procedural
generation · full isometric 3D-style rendering.

---

## 6. Screen List & Flow

```
Splash → Home ─┬─→ City Dashboard ⇄ Build Menu
               ├─→ Settings
               └─→ (later) Missions / Shop / Stats / Tutorial
```

| Screen         | MVP? | Purpose                          |
|----------------|------|----------------------------------|
| Splash         | Yes  | Branding + asset load            |
| Home / Menu    | Yes  | Start, Continue, Settings        |
| City Dashboard | Yes  | Core Flame view + resource bar   |
| Build Menu     | Yes  | Choose building to place         |
| Settings       | Yes  | Sound toggle, reset city         |
| Missions       | Later| Objectives, milestones           |
| Stats / Info   | Later| Detailed breakdown               |
| Tutorial       | Later| Teach the loop                   |
| Shop / Unlocks | Later| Spend coins on buildings         |

Persistent element: top **resource bar** (Coins · Population · Happiness · Water · Education).

---

## 7. Architecture (clean, layered)

Dependencies point downward only. Flame is an **engine adapter** for rendering &
input — it never decides game rules.

```
presentation/  Flutter widgets + the single Flame GameWidget
application/   Riverpod controllers/state — bridges UI <-> domain
domain/        PURE Dart game rules (systems, entities, progression)
data/          models, repositories, local persistence
game/          Flame components, world, input (rendering only)
core/          theme, routing, constants, config, utils
shared/        cross-cutting widgets/assets
```

**Critical rule:** Flame components render domain state and forward taps upward.
They never calculate coins, population, or happiness.
