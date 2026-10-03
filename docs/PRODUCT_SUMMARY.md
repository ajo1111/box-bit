# BoxBit: product summary (draft for confirmation)

> Working name taken from the repo. Replace it once the client picks a brand.

## One-liner

A positive, team-first social and training platform for the boxing community. Fighters share progress, coaches run their teams, promoters find talent, and wearable data from the Ganance Heir fills in the numbers automatically. Each fighter controls who sees what, down to the individual data type.

## Who it's for

| Role | What they get |
|---|---|
| **Fighter** (amateur → pro, many are youth) | Training log, milestones, highlight clips, a shareable fighter card, automatic activity data from their watch, event registration |
| **Coach / gym** | Team roster with compliance and weight tracking, workout plans pushed to the team, approval of youth public posts, team feed, bulk device ordering |
| **Promoter / manager** | Discover public fighter cards (record, division, highlights, training consistency), shortlist, request contact through the coach, run events |
| **Fans / family** (later) | Follow public fighters and gyms |

## Core features (MVP)

1. **Corner (team feed).** A positive, sport-specific feed of workouts, milestones, videos, results and coach shout-outs. Reactions are "props" (glove taps). Comments are moderated for positivity.
2. **Privacy by data type.** Training log, stats/wearable data, weight and highlight videos each get their own audience (Public / Team / Coaches only). **Fight Camp mode** hides all training until fight night ("ain't nobody need to know what we cooking"). A **"Preview as promoter"** toggle shows exactly what others see.
3. **Train.** Coach-assigned round-based sessions with a round timer, bell, and live wearable metrics.
4. **Gamified coach.** A Punch-Out!!-inspired animated coach runs alongside the fighter during sessions and calls out combos. Streaks and auto-detected milestones (e.g. 100 sparring rounds).
5. **Analytics.** Rounds, roadwork, steps, streaks, weight trend against the division limit, coach notes. A coach-level team dashboard.
6. **Wearable integration (Ganance Heir).** Steps, distance, cadence, active energy and sedentary time arrive through Apple Health / Health Connect, with a direct partner integration later. Works both ways: the platform sells devices (including bulk/school orders, e.g. OUSD) and the device adds depth to profiles.
7. **Fighter card.** A public profile (record, division, stance, titles, highlights) that promoters can find. It answers the reality that social presence now affects fight opportunities.
8. **Events.** Browse sanctioned shows, register, check documents, and see suggested matches (division, age and experience rules). Konquer already does this for USA Boxing, so the plan is **integrate or complement, not rebuild** (see research).

## What it is not (for now)

- Not a replacement for USA Boxing membership/registration (WebPoint) or Konquer's bout-sheet tooling.
- Not a class-booking or gym-billing system like Mindbody or ClassPass (possible later module).
- Not a punch-tracking hardware company: the Heir covers activity. Punch tracking could come from partners (Hykso/FightCamp-style) later.

## Open questions for the client

1. Youth fighters: what age floor, and do parents need their own accounts and consent flows (COPPA if under 13)?
2. Is the Ganance partnership formal? Can we get a direct API/SDK, or do we start through Apple Health only?
3. Konquer: partner (API/data sharing) or stay separate and deep-link?
4. Monetization: gym subscriptions, promoter seats, device revenue share, event fees, or a mix?
5. Amateur only at launch, or pros as well (different records and sanctioning bodies)?
6. Launch region: Bay Area / Oakland first?
