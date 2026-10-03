# Market research and case studies

Researched October 2026. The goal is to learn from existing apps, not to copy them.

## Platforms named by the client

| App | What it is | Lesson for BoxBit |
|---|---|---|
| **Konquer Club** ("starts with a K") ([App Store](https://apps.apple.com/app/id6450438631), [Android](https://apkcombo.com/konquer-club/com.konquer.konquer_club/)) | Amateur boxing event network. Bracket generation for 1,000+ competitors, synced bout sheets, payments, and USA Boxing Appendix F matching rules built in. Boxers approve or deny matches. | Konquer owns event logistics, so **integrate rather than compete**. The gap the client identified is real: no social feed, no video, no community. |
| **USA Boxing / WebPoint** ([registration notes](https://www.usaboxing.org/news/features/2021/october/18/registration-now-open-for-2021-usa-boxing-national-championships)) | Official membership, documents (physical, proof of age), weight class changes, MatchTracker bout counts. | Mirror the document-check UX at registration, but USA Boxing stays the source of truth. |
| **Mindbody** ([site](https://www.mindbodyonline.com)) | Studio scheduling, billing, client management. | Gyms will eventually want class booking and payments. Treat it as a later module, not the MVP. |
| **ClassPass** ([site](https://classpass.com)) | Multi-studio credit marketplace. | Discovery of gyms by location could be a fan/beginner on-ramp later. |

## Direct competitors: boxing and combat-sports social

| App | What it does | Takeaway |
|---|---|---|
| **CRDED** ([landing](https://crded-landing.expo.app/)) | "The professional network the fight game never had." Numbered, scannable fighter cards with record, highlights and story; viewable without an account. Built with Expo. | Closest to our fighter card. Our edge is team-first plus training data plus privacy. Their numbered-card idea is in the mockup (NO. 0417). |
| **Fightbook** ([listing](https://mwm.ai/apps/fightbook/6746456808)) | Fighters, promoters, fans and service providers: update records, find fights, sell merch. | Broad marketplace. We stay narrower: gym/team culture. |
| **Ready to Fight** (Usyk) ([news](https://so.affino.com/news/mike-tyson-joins-ready-to-fight-app-launched-by-usyk-3102888), [DAZN](https://dazn.com/en-CA/news/boxing/world-heavyweight-champion-oleksandr-usyks-ready-to-fight-app-partners-with-saudi-boxing-federation/s7nxd0npeuwr10fyyf7kw41ky)) | Boxing social platform, 130k+ users, 10k+ verified boxers/managers; celebrity backing (Tyson). Blockchain angle. | Proves demand. Avoid the crypto complexity; focus on grassroots gyms. |
| **Fightcode** ([App Store](https://apps.apple.com/mw/app/fightcode/id6499111010)) | Organize and plan combat events across boxing, MMA, Muay Thai and kickboxing. | Event tooling is crowded. |
| **TakeTheFight** ([listing](https://mwm.ai/apps/takethefight/6788427550)) | Promoter search by discipline, weight, record, location. | Validates our promoter Discover tab. |
| **FightHub** ([listing](https://mwm.ai/apps/fighthub/6755408126)), **Boutlook** ([App Store](https://apps.apple.com/mx/app/boutlook/id6749233027)) | Newer fight-matching / fighter-network entrants. | Watch list. |
| **Fight Record** ([v4 launch](https://fightrecord.co.uk/company/fight-record-launches-v4-of-mobile-app-to-enhance-fan-engagement-in-combat-sports/)), **BoxerBase** ([docs](https://www.boxerbase.com/pl/docs)) | Records and fan engagement (UK / EU). | Record data sources and fan features for later. |

## Training, wearables and gamification

| Product | Notes | Takeaway |
|---|---|---|
| **Ganance Heir** (founder Alex Ocampo) ([App Store](https://apps.apple.com/app/id6472748227), [Android Authority](https://www.androidauthority.com/ganance-the-heir-fitness-tracker-3652250), [mHUB spotlight](https://mhub.org/blog/member-spotlight-ganance-making-any-watch-a-smart-watch)) | 5 g coin-sized sensor that sticks to the caseback of any watch. Tracks steps, distance, calories and cadence (active vs casual steps). Syncs to Apple Health. Roadmap: activity types, sedentary time, adaptive goals, silent alarm. Inspired by a watch from Alex's brother. | Apple Health sync means **we can integrate on day one** without an SDK. Roadwork and conditioning tracking fit well. It does not do heart rate or punches today, so don't promise those. |
| **Hykso** ([App Store](https://apps.apple.com/app/id1185727236), [review](https://hothardware.com/reviews/hykso-punch-trackers-review)) | Wrist punch trackers: volume, speed, type; live counters. Used by Olympic teams. | Possible future partner for punch data. |
| **FightCamp** ([trackers](https://joinfightcamp.com/trackers/), [leaderboards](https://blog.joinfightcamp.com/boxing-equipment/how-leaderboards-push-you-further)) | Punch-tracked home workouts and leaderboards modeled on pro rankings. | Leaderboards motivate, but our culture is team-positive, so prefer **team totals and personal bests** over public rankings that shame. |
| **TeamBuildr / TrainHeroic** ([comparison](https://www.teambuildr.com/trainheroic-vs-teambuildr)) | Coach-to-athlete programming, team feed, video form checks, group messaging. | Model for the coach Plans tab and feedback-on-video loop. |
| **Strava** ([privacy features](https://road.cc/content/tech-news/strava-adds-privacy-features-hiding-data-285549)) | Clubs, kudos, granular privacy, hidden maps. | "Props" are our kudos. **Caution:** fitness apps have leaked location despite privacy zones ([Dark Reading](https://www.darkreading.com/application-security/popular-fitness-apps-leak-location-data-even-when-users-set-privacy-zones)), so we don't store GPS routes for youth by default. |
| **Punch-Out!!** (Nintendo) | Doc Louis jogging beside Little Mac. | Inspiration only. Our coach character must be original art, with no Nintendo IP. |

## UX/UI standards applied in the prototype

- **Privacy is visible everywhere:** every post and chart shows its audience badge, and "Preview as promoter" blurs exactly what's hidden.
- **Positive by design:** reactions are props only (no dislikes), comments moderated, coaches approve youth public posts, promoter contact routes through the coach.
- **Auto-log over manual entry:** wearable roadwork appears without typing.
- **Native patterns:** bottom tabs that never slide, sheets with drag-to-dismiss and velocity, press feedback at scale 0.97, toasts that enter and exit from the same edge.
- **Motion budget:** under 300 ms for UI, strong ease-out curves, delight (the arcade coach, milestones) reserved for rare moments, reduced-motion support.
- **Accessibility:** 44 pt touch targets, visible focus, tabular numbers, color is never the only signal (labels accompany red/blue corners).

## Design-engineering reference

- Emil Kowalski skills (MIT), vendored in `.claude/skills/`: [github.com/emilkowalski/skill](https://github.com/emilkowalski/skill), [Agents with Taste](https://emilkowal.ski/ui/agents-with-taste)
- Convex + Expo: [expo.dev/blog/convex-is-a-backend-for-expo-apps](https://expo.dev/blog/convex-is-a-backend-for-expo-apps)
