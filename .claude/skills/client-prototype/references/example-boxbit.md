# Worked example: BoxBit (boxing community app)

The first project run through this pipeline. Use it as a quality bar. The full prototype is bundled at `examples/boxbit-prototype.html` and the stack doc at `examples/boxbit-TECH_STACK.md`. Read them for depth and polish, not to copy their content.

**Input:** a transcript from a boxing coach: a positive team social feed, Konquer as a comparison ("starts with a K"), a founder's wearable that makes any watch smart, analytics, privacy ("ain't nobody need to know what we cooking"), fighter profiles for promoters, and Punch-Out!!-style gamification.

**Research found:**
- The wearable is the Ganance Heir. It syncs to Apple Health, which made day-one integration possible.
- Konquer handles USA Boxing event matching, so the plan became integrate rather than compete.
- Competitors: CRDED, Fightbook, Ready to Fight, TakeTheFight, Fightcode, Hykso, FightCamp, TeamBuildr.
- A Strava privacy-leak story shaped the youth GPS rule.

**Roles and tabs:**
- Fighter: Corner feed, Train, Stats, Events, Profile.
- Coach: Corner, Team roster, Plans builder, Events, Gym.
- Promoter: Corner (public only), Discover, Events, Shortlist, Profile.

**Signature moment:** a live round timer (3:00 work, 1:00 rest) with a pixel-art coach jogging beside the fighter and calling combos, plus live wearable stats and a 10×/30× demo speed.

**Hardest idea made tangible:** per-data-type privacy, Fight Camp mode, and a "Preview as promoter" toggle that blurs hidden stats.

**Checklist (8):** give props, post with audience, start session, Fight Camp on, preview as promoter, register for a show and review a match, assign a workout (coach), shortlist a fighter (promoter).

**Stack:** Turborepo, Expo, Next.js, Convex (privacy enforced in a `canView` helper), Clerk orgs as gyms, HealthKit/Health Connect then the Ganance API, Mux, Rive, Stripe, Expo Push, and Claude for moderation.
