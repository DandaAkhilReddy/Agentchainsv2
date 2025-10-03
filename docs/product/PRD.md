# Product Requirements Document (PRD)
## AI Reply Copilot - Screenshot to Smart Reply Assistant

**Document Version**: 1.0
**Last Updated**: 2025-10-03
**Project Code**: ARC-001
**Product Manager**: [Your Name]
**Related Documents**: [BRD](../business/BRD.md), [Technical Architecture](../technical/ARCHITECTURE.md)

---

## 1. Product Overview

### 1.1 Product Vision
**AI Reply Copilot** will become the world's most trusted and fastest way to craft perfect message replies across any platform, saving users 1+ hour daily while maintaining complete privacy.

### 1.2 Product Mission
Empower every smartphone user to communicate confidently and efficiently by providing instant, contextually intelligent reply suggestions that feel authentically human—all while guaranteeing zero data retention.

### 1.3 Product Principles
1. **Privacy First**: Never store, log, or train on user conversations
2. **Speed Above All**: Screenshot → Reply in <3 seconds
3. **Universal Access**: Works in every messaging app, no exceptions
4. **Contextual Intelligence**: Understands platform, tone, and relationship
5. **Delightful UX**: So simple, anyone can use it immediately

---

## 2. Target Users

### 2.1 Primary Personas

#### Sarah - The Busy Professional
- **Age**: 32, Marketing Manager at tech startup
- **Devices**: iPhone 15 Pro, MacBook
- **Messaging Apps**: Slack (work), WhatsApp (personal), Email (Outlook), LinkedIn
- **Pain Points**:
  - Receives 200+ messages daily across 4 platforms
  - Struggles to maintain professional tone in quick replies
  - Screenshots conversations to ask team "how should I respond?"
- **Goals**: Respond within 5 minutes, sound professional, avoid misunderstandings
- **Tech Savvy**: High (uses ChatGPT, Notion AI, Grammarly)
- **Willingness to Pay**: $15/month

#### Dave - The Dating App User
- **Age**: 26, Software Engineer
- **Devices**: iPhone 14, iPad
- **Messaging Apps**: Hinge, Bumble, Instagram DMs
- **Pain Points**:
  - Overthinks flirty/witty responses
  - Currently screenshots and asks ChatGPT for help
  - Takes 10+ minutes to craft each reply
- **Goals**: Sound confident, charming, natural
- **Tech Savvy**: Medium-High (familiar with AI tools)
- **Willingness to Pay**: $10/month

#### Priya - The Non-Native Speaker
- **Age**: 29, Product Designer (relocated from India to US)
- **Devices**: iPhone 13, Apple Watch
- **Messaging Apps**: iMessage, WhatsApp, Slack, Email
- **Pain Points**:
  - Worried about sounding "too formal" or awkward in English
  - Uses Google Translate but results feel robotic
  - Spends 15+ minutes editing casual messages
- **Goals**: Sound natural, match American conversational tone
- **Tech Savvy**: Medium
- **Willingness to Pay**: $12/month

### 2.2 Secondary Personas
- **Enterprise Teams**: Customer support, sales, recruiting (bulk messaging)
- **Influencers/Creators**: Need quick, engaging responses to DMs
- **Students**: Homework help, professional email writing
- **Elderly Users**: Simple, large-button UI for basic replies

---

## 3. User Stories & Use Cases

### 3.1 Core User Stories

#### US-001: Quick Reply Generation (MVP)
**As a** busy professional
**I want to** screenshot a conversation and get instant reply suggestions
**So that** I can respond quickly without context-switching to another app

**Acceptance Criteria**:
- [ ] User can share a screenshot to AI Reply Copilot from Photos app
- [ ] App displays 3 reply suggestions within 3 seconds
- [ ] User can copy a suggestion with one tap
- [ ] Screenshot is never saved to device or cloud

**Priority**: P0 (Must-Have for MVP)

#### US-002: Universal Keyboard Integration (MVP)
**As a** messaging app power user
**I want to** access reply suggestions directly in my keyboard
**So that** I can insert replies without leaving the messaging app

**Acceptance Criteria**:
- [ ] User can enable custom keyboard in iOS Settings
- [ ] Keyboard shows latest 3-5 reply suggestions
- [ ] Tapping a suggestion inserts it into the active text field
- [ ] Keyboard works in WhatsApp, Instagram, Email, Slack, iMessage

**Priority**: P0 (Must-Have for MVP)

#### US-003: Tone Selection (MVP)
**As a** user switching between work and personal chats
**I want to** choose the tone of reply (Professional vs Friendly)
**So that** I get contextually appropriate suggestions

**Acceptance Criteria**:
- [ ] User can select tone before processing screenshot: Professional, Friendly, Casual
- [ ] AI generates replies matching the selected tone
- [ ] Tone preference is saved for next use

**Priority**: P0 (Must-Have for MVP)

#### US-004: Platform Auto-Detection (Phase 2)
**As a** user of multiple messaging apps
**I want to** the app to auto-detect which platform the screenshot is from
**So that** I get platform-appropriate reply styles (WhatsApp casual vs Outlook formal)

**Acceptance Criteria**:
- [ ] AI detects platform UI (WhatsApp, Instagram, Outlook, Slack, iMessage)
- [ ] Replies match platform conventions (emoji usage, length, formality)
- [ ] User can override auto-detection if wrong

**Priority**: P1 (Nice-to-Have for MVP, Must-Have for Phase 2)

#### US-005: Multi-Language Support (Phase 2)
**As a** non-native English speaker
**I want to** get reply suggestions in my preferred language
**So that** I can communicate naturally

**Acceptance Criteria**:
- [ ] User can select language in settings (English, Spanish, French, German, Hindi, Japanese, Portuguese, Italian, Korean, Chinese)
- [ ] AI generates replies in the selected language
- [ ] Detects input language automatically if mixed

**Priority**: P1 (Phase 2)

#### US-006: Privacy Verification (Phase 2)
**As a** privacy-conscious user
**I want to** verify that my screenshots are never stored
**So that** I can trust the app with sensitive conversations

**Acceptance Criteria**:
- [ ] Settings screen shows "Zero Storage Guarantee" with explanation
- [ ] Optional: Blockchain audit trail shows request hash (not content)
- [ ] Privacy policy clearly states no data retention

**Priority**: P1 (Phase 2, critical for trust)

### 3.2 Detailed Use Cases

#### Use Case 1: Screenshot-to-Reply in WhatsApp

**Actors**: Sarah (Primary), AI Backend (System)

**Preconditions**:
- Sarah has AI Reply Copilot installed
- She has enabled the custom keyboard
- She receives a message from her manager in WhatsApp

**Main Flow**:
1. Sarah's manager sends: *"Can you send me the Q4 report by EOD? Also, did you finish the slides for tomorrow's client pitch?"*
2. Sarah takes a screenshot (Power + Volume Up)
3. Sarah opens Photos app, selects the screenshot
4. Sarah taps "Share" → "AI Reply Copilot"
5. App shows tone selection: Professional, Friendly, Casual
6. Sarah selects "Professional"
7. App uploads screenshot to Azure OpenAI Vision (encrypted)
8. Azure Vision reads the message and generates 3 replies:
   - *"Absolutely! I'll send the Q4 report by 5 PM. The client pitch slides are ready—just sent them to your email for review."*
   - *"Yes, both will be ready today. Q4 report by EOD and slides are finalized. Let me know if you need any changes."*
   - *"On it! Report coming by 5 PM, and I just emailed you the pitch slides. Anything else you need?"*
9. App displays all 3 suggestions
10. Sarah taps "Copy" on option 1
11. Sarah returns to WhatsApp
12. Sarah pastes the reply and sends

**Alternate Flow 1 (Using Keyboard)**:
- At step 10, Sarah opens WhatsApp directly
- Sarah taps the text field (keyboard appears)
- Sarah switches to AI Reply Copilot keyboard
- Sarah sees the same 3 suggestions as buttons
- Sarah taps option 1 → text is inserted
- Sarah taps "Send"

**Postconditions**:
- Reply is sent in WhatsApp
- Screenshot is deleted from app memory
- No data is stored in cloud or device

**Time to Complete**: 15 seconds (vs 39 seconds with ChatGPT)

---

#### Use Case 2: Flirty Reply on Dating App

**Actors**: Dave (Primary), AI Backend (System)

**Preconditions**:
- Dave matched with someone on Hinge
- She sent a witty message, he wants to reply but feels stuck

**Main Flow**:
1. Hinge match sends: *"I see you're into hiking! Last trail you did? I'm always looking for recs 🏔️"*
2. Dave screenshots the conversation
3. Dave shares to AI Reply Copilot
4. Dave selects tone: "Flirty"
5. AI generates 3 replies:
   - *"Just crushed the Eagle Peak trail last weekend! Happy to be your hiking guide if you can keep up 😉"*
   - *"Eagle Peak! The view was almost as good as yours 😏 Want to join next time?"*
   - *"Did Eagle Peak—10/10 recommend. We should go together, I'll bring snacks 🥾✨"*
6. Dave loves option 3, taps "Copy"
7. Dave returns to Hinge, pastes, sends
8. Match replies immediately → success!

**Postconditions**:
- Dave successfully continues the conversation
- No awkwardness from overthinking
- Screenshot is deleted

**Time to Complete**: 12 seconds

---

## 4. Feature Requirements

### 4.1 MVP Features (Phase 1 - Week 0-6)

#### Feature 1: Screenshot Share Extension
**Description**: Users can share screenshots directly to the app from Photos or Shortcut.

**Functional Requirements**:
- FR-1.1: App registers as a Share Extension target for images
- FR-1.2: Share Extension accepts PNG/JPEG up to 20MB
- FR-1.3: Image is loaded into memory buffer (never written to disk)
- FR-1.4: User is taken to the app's reply generation screen

**Non-Functional Requirements**:
- NFR-1.1: Share Extension loads in <1 second
- NFR-1.2: Memory usage stays under 50MB
- NFR-1.3: Works on iOS 17.0+

**User Interface**:
```
┌─────────────────────────────────────┐
│  Share to AI Reply Copilot          │
├─────────────────────────────────────┤
│  [Screenshot Thumbnail]             │
│                                      │
│  Select Tone:                       │
│  ○ Professional  ● Friendly  ○ Casual│
│                                      │
│  [Generate Replies] (Button)        │
└─────────────────────────────────────┘
```

**Priority**: P0 (Critical)

---

#### Feature 2: AI Reply Generation (Vision API)
**Description**: Send screenshot to Azure OpenAI Vision and receive 3-5 contextual reply suggestions.

**Functional Requirements**:
- FR-2.1: Convert image to base64 or byte array
- FR-2.2: Call Azure OpenAI Vision API with system prompt + user tone preference
- FR-2.3: Parse response to extract 3-5 reply options
- FR-2.4: Display suggestions in scrollable list

**Non-Functional Requirements**:
- NFR-2.1: API response time <2 seconds (p95)
- NFR-2.2: Fallback to error message if API fails
- NFR-2.3: Retry logic (3 attempts with exponential backoff)

**API Request Format**:
```json
{
  "messages": [
    {
      "role": "system",
      "content": "You are a reply assistant. Generate 3 contextual replies. Tone: Friendly. Platform: WhatsApp. Max 2 sentences each."
    },
    {
      "role": "user",
      "content": [
        {"type": "text", "text": "Suggest replies to the last message"},
        {"type": "image_url", "image_url": {"url": "data:image/png;base64,..."}}
      ]
    }
  ]
}
```

**API Response Format**:
```json
{
  "choices": [
    {
      "message": {
        "content": "1. Hey! Sounds great, let me know when\n2. Awesome, I'm in!\n3. Perfect, count me in 😊"
      }
    }
  ]
}
```

**Priority**: P0 (Critical)

---

#### Feature 3: Reply Suggestions UI
**Description**: Display AI-generated replies with copy/tap-to-use functionality.

**Functional Requirements**:
- FR-3.1: Show 3-5 replies as individual cards
- FR-3.2: Each card has "Copy" button
- FR-3.3: Tapping "Copy" copies text to clipboard and shows "Copied!" toast
- FR-3.4: User can regenerate suggestions (max 3 times per screenshot)

**User Interface**:
```
┌─────────────────────────────────────────┐
│  ← Back            Suggested Replies     │
├─────────────────────────────────────────┤
│                                          │
│  ┌────────────────────────────────────┐ │
│  │ "Hey! Sounds great, let me know    │ │
│  │  when you're free 👍"              │ │
│  │                          [Copy] ──┐│ │
│  └──────────────────────────────────┘│ │
│                                          │
│  ┌────────────────────────────────────┐ │
│  │ "Awesome! I'm in, just send me     │ │
│  │  the details"                      │ │
│  │                          [Copy] ──┐│ │
│  └──────────────────────────────────┘│ │
│                                          │
│  ┌────────────────────────────────────┐ │
│  │ "Perfect timing! Count me in 😊"   │ │
│  │                          [Copy] ──┐│ │
│  └──────────────────────────────────┘│ │
│                                          │
│  [Regenerate] [Done]                    │
└─────────────────────────────────────────┘
```

**Priority**: P0 (Critical)

---

#### Feature 4: Custom Keyboard Extension
**Description**: iOS keyboard that shows latest reply suggestions for one-tap insertion.

**Functional Requirements**:
- FR-4.1: Keyboard reads latest suggestions from App Group shared storage
- FR-4.2: Shows 3 buttons (one per suggestion, truncated to 40 chars)
- FR-4.3: Tapping a button inserts the full text into the active field
- FR-4.4: Keyboard auto-dismisses after insertion (or user can switch back to default keyboard)

**Non-Functional Requirements**:
- NFR-4.1: Keyboard loads in <0.5 seconds
- NFR-4.2: Memory usage under 30MB (iOS keyboard memory limits)
- NFR-4.3: Works in all apps (except secure text fields like passwords)

**User Interface**:
```
┌─────────────────────────────────────────────────────┐
│  AI Reply Copilot Keyboard                          │
├─────────────────────────────────────────────────────┤
│  [Hey! Sounds great, let me know when... (tap)]     │
│  [Awesome! I'm in, just send me the de... (tap)]    │
│  [Perfect timing! Count me in 😊 (tap)]             │
├─────────────────────────────────────────────────────┤
│  [Switch Keyboard] [Settings]                       │
└─────────────────────────────────────────────────────┘
```

**Technical Notes**:
- Use App Group (`group.com.agentchains.replycopilot`) to share data between main app and keyboard
- Store suggestions in `UserDefaults(suiteName: "group.com.agentchains.replycopilot")`
- Add 5-minute expiry (suggestions older than 5 min are cleared)

**Priority**: P0 (Critical)

---

#### Feature 5: Settings & Tone Management
**Description**: User preferences for default tone, language, and privacy settings.

**Functional Requirements**:
- FR-5.1: User can set default tone (Professional, Friendly, Casual)
- FR-5.2: User can view privacy policy and zero-storage guarantee
- FR-5.3: User can enable/disable keyboard tutorial
- FR-5.4: User can view usage stats (replies generated this week)

**User Interface**:
```
┌─────────────────────────────────────┐
│  ⚙️ Settings                         │
├─────────────────────────────────────┤
│  Preferences                         │
│  • Default Tone: Friendly       >    │
│  • Language: English            >    │
│                                      │
│  Privacy                             │
│  • Zero Storage Guarantee       >    │
│  • Privacy Policy               >    │
│                                      │
│  Account                             │
│  • Usage Stats                  >    │
│  • Upgrade to Pro               >    │
│  • Sign Out                          │
│                                      │
│  About                               │
│  • Version 1.0.0                     │
│  • Contact Support                   │
└─────────────────────────────────────┘
```

**Priority**: P0 (Critical)

---

### 4.2 Phase 2 Features (Week 7-12)

#### Feature 6: Platform Auto-Detection
**Description**: AI detects which messaging platform the screenshot is from (WhatsApp, Instagram, Outlook, etc.) and adjusts reply style accordingly.

**Functional Requirements**:
- FR-6.1: Vision AI analyzes UI elements (colors, fonts, layouts) to identify platform
- FR-6.2: Detected platform is shown to user with option to override
- FR-6.3: Platform-specific reply rules:
  - WhatsApp: Casual, emojis okay, 1-2 sentences
  - Outlook/Email: Formal, no emojis, structured paragraphs
  - Instagram: Very casual, emojis encouraged, short
  - Slack: Professional-casual hybrid, bullet points okay
  - LinkedIn: Professional, thought leadership tone

**User Interface**:
```
Detected: WhatsApp ✓  [Change]
Tone: Friendly (matches platform)
```

**Priority**: P1 (Phase 2)

---

#### Feature 7: Multi-Language Support
**Description**: Generate replies in 10+ languages with proper grammar and cultural context.

**Functional Requirements**:
- FR-7.1: User selects language in settings: English, Spanish, French, German, Hindi, Japanese, Portuguese, Italian, Korean, Chinese (Simplified)
- FR-7.2: AI generates replies in the selected language
- FR-7.3: Auto-detect input language if screenshot contains non-English text
- FR-7.4: Allow mixed-language replies (e.g., Hinglish for Indian users)

**Priority**: P1 (Phase 2)

---

#### Feature 8: Clarifying Questions
**Description**: If the message is ambiguous, AI asks a clarifying question before generating replies.

**Functional Requirements**:
- FR-8.1: AI detects ambiguous messages (e.g., "Are you free?" without context)
- FR-8.2: Shows modal: "Is this for work or personal?" with 2 options
- FR-8.3: User taps an option, AI refines suggestions accordingly

**Example**:
```
Screenshot: "Are you free tomorrow?"

AI asks:
┌───────────────────────────────┐
│  This message is ambiguous.   │
│  Help me understand:          │
│                               │
│  Is this for:                 │
│  • Work/Professional          │
│  • Personal/Social            │
└───────────────────────────────┘
```

**Priority**: P2 (Phase 2, nice-to-have)

---

#### Feature 9: Safety Filters
**Description**: Detect and filter inappropriate replies (profanity, PII leakage, harmful content).

**Functional Requirements**:
- FR-9.1: Scan generated replies for profanity using Azure Content Safety API
- FR-9.2: Detect if AI accidentally includes user's phone number, email, or address
- FR-9.3: Filter out replies that could be offensive or harmful
- FR-9.4: Log filtered replies for improvement (anonymized)

**Priority**: P1 (Phase 2, critical for safety)

---

### 4.3 Phase 3 Features (Month 7-12)

#### Feature 10: Android App
**Description**: Port the iOS app to Android with full feature parity.

**Functional Requirements**:
- FR-10.1: Android app with Kotlin + Jetpack Compose
- FR-10.2: Screenshot capture via Share Intent or Accessibility Service
- FR-10.3: Custom keyboard using InputMethodService
- FR-10.4: Auto-paste using Accessibility API (with user permission)

**Priority**: P0 (Phase 3 critical)

---

#### Feature 11: Offline Mode (On-Device AI)
**Description**: Use small on-device vision model (Phi-3-Vision) for basic replies when offline.

**Functional Requirements**:
- FR-11.1: Download Phi-3-Vision CoreML model (500MB) to device
- FR-11.2: When offline, use on-device model for short messages (<100 words)
- FR-11.3: Show badge "Offline Mode" to indicate lower quality replies
- FR-11.4: Sync back to cloud when online for analytics

**Priority**: P2 (Phase 3, nice-to-have)

---

#### Feature 12: Voice Reply Mode
**Description**: AI generates reply and speaks it aloud (text-to-speech).

**Functional Requirements**:
- FR-12.1: After generating replies, show "🔊 Read Aloud" button
- FR-12.2: Tap to play reply using iOS AVSpeechSynthesizer
- FR-12.3: Support multiple voices (male, female, accents)

**Priority**: P3 (Future)

---

## 5. User Experience (UX) Requirements

### 5.1 Onboarding Flow

**Step 1: Welcome Screen**
```
┌─────────────────────────────────────┐
│                                      │
│     🚀 AI Reply Copilot              │
│                                      │
│  Reply smarter, not harder.          │
│  AI-powered responses in 3 seconds. │
│                                      │
│  [Get Started]                       │
│  Already have an account? [Sign In]  │
└─────────────────────────────────────┘
```

**Step 2: Permission Requests**
```
┌─────────────────────────────────────┐
│  📸 Screenshot Access                │
│                                      │
│  We need access to your screenshots │
│  to generate replies. Don't worry—  │
│  they're never saved or stored.     │
│                                      │
│  [Allow Access]  [Learn More]       │
└─────────────────────────────────────┘
```

**Step 3: Keyboard Setup Tutorial**
```
┌─────────────────────────────────────┐
│  ⌨️ Set Up Your Keyboard             │
│                                      │
│  Follow these steps:                 │
│  1. Go to Settings > General > Keyboard│
│  2. Tap "Keyboards" > "Add New..."  │
│  3. Select "AI Reply Copilot"       │
│  4. Toggle "Allow Full Access"      │
│                                      │
│  [Open Settings]  [Skip for Now]    │
└─────────────────────────────────────┘
```

**Step 4: Quick Demo**
```
┌─────────────────────────────────────┐
│  🎓 Try It Out!                      │
│                                      │
│  Screenshot this fake message:       │
│  ┌──────────────────────────────┐   │
│  │ "Hey! Want to grab coffee    │   │
│  │  tomorrow?"                  │   │
│  └──────────────────────────────┘   │
│                                      │
│  Then share it to AI Reply Copilot. │
│                                      │
│  [Take Screenshot]  [Skip]           │
└─────────────────────────────────────┘
```

### 5.2 Empty States

**No Recent Replies**:
```
┌─────────────────────────────────────┐
│         📭                           │
│  No replies generated yet.           │
│                                      │
│  Screenshot a conversation and share │
│  it here to get started!             │
│                                      │
│  [Learn How]                         │
└─────────────────────────────────────┘
```

**Keyboard Not Enabled**:
```
┌─────────────────────────────────────┐
│         ⌨️                           │
│  Keyboard not enabled yet.           │
│                                      │
│  Enable the AI Reply Copilot keyboard│
│  to insert replies in any app.      │
│                                      │
│  [Open Settings]                     │
└─────────────────────────────────────┘
```

### 5.3 Error States

**API Error**:
```
┌─────────────────────────────────────┐
│  ⚠️ Oops! Something went wrong.      │
│                                      │
│  We couldn't generate replies right  │
│  now. Please try again in a moment.  │
│                                      │
│  [Retry]  [Contact Support]          │
└─────────────────────────────────────┘
```

**Network Offline**:
```
┌─────────────────────────────────────┐
│  📡 No Internet Connection           │
│                                      │
│  AI Reply Copilot needs internet to  │
│  generate replies. Check your        │
│  connection and try again.           │
│                                      │
│  [Retry]                             │
└─────────────────────────────────────┘
```

### 5.4 Loading States

**Generating Replies**:
```
┌─────────────────────────────────────┐
│         🤖                           │
│  Analyzing your conversation...      │
│                                      │
│  [Animated spinner]                  │
└─────────────────────────────────────┘
```

**Uploading Screenshot**:
```
Progress bar: [████████████░░░░] 75%
Uploading screenshot...
```

---

## 6. Technical Constraints

### 6.1 Platform Requirements
- iOS 17.0+ (for Share Extensions and Keyboard Extensions APIs)
- iPhone 8 and newer (A11 Bionic+)
- Requires internet connection (offline mode in Phase 3)

### 6.2 Performance Requirements
- Screenshot → Reply generation: <3 seconds (p95)
- Keyboard load time: <0.5 seconds
- App launch time: <1 second (cold start)
- Memory usage: <100MB (app), <30MB (keyboard)
- Battery impact: <5% per hour of active use

### 6.3 Security Requirements
- Zero screenshot storage (ephemeral memory only)
- TLS 1.3 for all network traffic
- Certificate pinning for Azure APIs
- Keychain storage for auth tokens
- No third-party analytics SDKs (privacy-first)

### 6.4 Scalability Requirements
- Support 10,000 users by Month 3
- Support 100,000 users by Month 12
- Support 5,000,000 users by Month 24
- Azure auto-scaling for spikes (10x traffic bursts)

---

## 7. Success Metrics

### 7.1 Product Metrics

| Metric | Target (Month 3) | Target (Month 12) |
|--------|------------------|-------------------|
| Reply Acceptance Rate | 70% | 80% |
| Time to Reply | <3 sec | <2 sec |
| Keyboard Activation Rate | 80% | 90% |
| Daily Active Users / MAU | 30% | 40% |
| NPS Score | 50+ | 60+ |
| App Store Rating | 4.5+ | 4.7+ |

### 7.2 Business Metrics

| Metric | Target (Month 3) | Target (Month 12) |
|--------|------------------|-------------------|
| Free to Paid Conversion | 10% | 20% |
| Monthly Churn Rate | <10% | <5% |
| CAC (Customer Acquisition Cost) | <$5 | <$3 |
| LTV (Lifetime Value) | $60 | $120 |
| MRR (Monthly Recurring Revenue) | $30K | $200K |

---

## 8. Out of Scope (Not in MVP)

The following features are explicitly **NOT** included in the initial release:

❌ Web app or browser extension
❌ Voice input (speak your message)
❌ Video reply suggestions
❌ Integration with third-party CRMs (Salesforce, HubSpot)
❌ Team collaboration (shared reply templates)
❌ A/B testing reply variants
❌ AI chat assistant (beyond reply generation)
❌ Scheduled send (send reply later)
❌ Read receipts or typing indicators

These may be considered for future phases based on user feedback.

---

## 9. Dependencies

### 9.1 External Dependencies
- **Azure OpenAI**: GPT-4o Vision API (Microsoft)
- **Firebase**: Auth, Firestore, Analytics (Google)
- **Apple App Store**: Distribution platform
- **Stripe**: Payment processing (for Pro subscriptions)

### 9.2 Internal Dependencies
- Design team: UI/UX mockups for all screens (Due: Week 1)
- Backend team: Azure Functions API (Due: Week 2)
- iOS team: Share Extension + Keyboard (Due: Week 4)
- QA team: Test plan for 1000+ screenshots (Due: Week 5)
- Legal team: Privacy policy, terms of service (Due: Week 3)

---

## 10. Release Plan

### 10.1 MVP Release (v1.0) - Week 6
**Features**:
- Screenshot Share Extension
- AI Reply Generation (3 suggestions, 3 tones)
- Custom Keyboard Extension
- Basic Settings (tone, privacy policy)

**Success Criteria**:
- 100 TestFlight beta users
- 4.5+ rating from beta testers
- <3 sec reply generation
- Zero critical bugs

### 10.2 Phase 2 Release (v1.5) - Week 12
**Features**:
- Platform auto-detection
- Multi-language support (10 languages)
- Safety filters
- Usage analytics dashboard

**Success Criteria**:
- 10,000 active users
- 15% free-to-paid conversion
- 70%+ reply acceptance rate

### 10.3 Phase 3 Release (v2.0) - Month 12
**Features**:
- Android app
- Offline mode (on-device AI)
- Enterprise team dashboard
- API for third-party integrations

**Success Criteria**:
- 100,000 active users
- $200K MRR
- SOC 2 Type II certification

---

## 11. Open Questions

**Q1**: Should we allow users to edit AI-generated replies before copying?
- **Answer**: Yes, add "Edit" button in Phase 2 (not MVP to keep UX simple)

**Q2**: How do we handle very long conversations (50+ messages in screenshot)?
- **Answer**: Truncate to last 10 messages, or ask user "Which message should I reply to?"

**Q3**: Should keyboard show tone selector?
- **Answer**: No, keyboard shows last generated replies only. User sets tone in main app.

**Q4**: What if user screenshots a message in a language we don't support?
- **Answer**: Detect language, show error: "Language not supported yet. Request it in Settings."

**Q5**: Should we support group chats (multiple people in screenshot)?
- **Answer**: Yes, but de-prioritized to Phase 2. AI should identify who to reply to.

---

## 12. Approval & Sign-Off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| **Product Manager** | [Your Name] | ____________ | 2025-10-03 |
| **Engineering Lead** | [TBD] | ____________ | ________ |
| **Design Lead** | [TBD] | ____________ | ________ |
| **CEO/Founder** | [TBD] | ____________ | ________ |

---

## 13. Appendix

### 13.1 Wireframes
- See [Figma Prototype](#) (link to be added)

### 13.2 User Research
- See [User Interviews Summary](#) (link to be added)

### 13.3 Competitive Analysis
- See [BRD Section 6](../business/BRD.md#6-competitive-analysis)

### 13.4 Document History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-10-03 | Claude Code | Initial PRD creation |

---

**Next Steps**:
1. Review and approve this PRD
2. Create Technical Architecture Document
3. Design high-fidelity mockups (Figma)
4. Begin Sprint 1 planning (Week 1-2)

**Questions or Feedback**: Contact [your-email@example.com]
