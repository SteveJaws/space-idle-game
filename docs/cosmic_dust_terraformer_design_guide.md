# 🌌 Cosmic Dust: Terraformer - Advanced Systems & Implementation Guide

## 1. Game Design Overview

### Core Gameplay Loop
1. **Passive Generation:** Your planet automatically produces a base amount of **Stardust ($S$)** per second ($S/s$).
2. **Active Engagement (Clicking & Catching):**
   * **Direct Planet Clicks:** Earn a base amount of Stardust per click.
   * **Floating Cosmic Dust:** Catch flying space debris, comets, and nebulae for massive instant rewards or temporary multipliers.
3. **Upgrades & Progression:** Spend Stardust on atmosphere generators, oceans, and lifeforms. Visual progression transforms the planet from a barren rock into a lush, vibrant world.

---

### Floating Dust Types

| Type | Appearance Rate | Speed | Reward / Effect |
| :--- | :--- | :--- | :--- |
| **Normal Dust Cloud** | Common (Every 8–15s) | Slow ($120 \text{ px/s}$) | Instant bonus equal to $15 \times \text{Stardust/sec}$ (min. $10 S$). |
| **Golden Comet** | Rare (20% chance) | Fast ($250 \text{ px/s}$) | Instant bonus equal to $60 \times \text{Stardust/sec}$ (min. $100 S$) OR a temporary $2\times$ global multiplier. |
| **Cosmic Nebula** | Very Rare (5% chance) | Very Slow ($60 \text{ px/s}$) | Requires 5 quick clicks to burst, releasing a massive Stardust shower. |

---

## 2. Dynamic Upgrade & Shop System

Idle games rely heavily on exponential price scaling so players always have a long-term goal.
