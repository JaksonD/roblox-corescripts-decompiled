# Info
A full decompilation of every CoreScript Roblox currently ships in the client.

> [!WARNING]  
> Consider all code inside this repo to be unlicensed. This is provided solely as reference.

Made possible by the [Oracle Decompiler.](https://discord.gg/prHW9TA4QW)

## Quick Reference

### In-Game (InExperience)

**CoreScript entry points** (chat, voice, notifications, proximity prompts, etc.):
[`extracontent-models/InExperience/.../CoreScripts/CoreScripts/`](extracontent-models/InExperience/InExperience/PatchRoot/CoreScripts/CoreScripts/)

**RobloxGui Modules** - most in-game UI lives here:
[`extracontent-models/InExperience/.../CoreGui/RobloxGui/Modules/`](extracontent-models/InExperience/InExperience/PatchRoot/DataModelInstances/CoreGui/RobloxGui/Modules/)

Notable subdirectories include:
- `TopBar/` and `Chrome/` - topbar and the unified Chrome UI system
- `InGameMenu/` and `Settings/` - escape menu and settings
- `PlayerList/` - leaderboard
- `InGameChat/` - in-game chat UI
- `VoiceChat/` and `SelfView/` - voice chat and avatar camera
- `EmotesMenu/` - emote wheel
- `BackpackScript.luau` - inventory/backpack
- `InspectAndBuy/` - item inspection and purchase
- `DevConsole/` - developer console (F9)
- `Stats/` - performance stats
- `Captures/` - screenshot system
- `AvatarContextMenu/` - right-click player menu
- `TrustAndSafety/` - reporting and moderation
- `VR/` - VR-specific UI

### Universal App

**App entry point:**
[`extracontent-models/UniversalApp/.../CoreScripts/LuaAppStarterScript.luau`](extracontent-models/UniversalApp/UniversalApp/PatchRoot/CoreScripts/LuaAppStarterScript.luau)

**RobloxGui Modules** - app-level UI and features:
[`extracontent-models/UniversalApp/.../CoreGui/RobloxGui/Modules/`](extracontent-models/UniversalApp/UniversalApp/PatchRoot/DataModelInstances/CoreGui/RobloxGui/Modules/)

Notable subdirectories include:
- `LuaApp/Components/TopBar/` - app navigation bar
- `LuaApp/Components/Chat/` - app chat
- `LuaApp/Components/More/` - settings and more menu
- `AvatarExperience/` - avatar editor, catalog, color picker, emotes, photobooth
- `Personalization/` - home feed, OmniFeed, search, games discovery
- `Shell/` - console/10-foot UI framework (Xbox nav, overscan, etc.)

**Shared Core Packages** (React/Roact, Rodux, networking, UI libraries):
[`extracontent-models/UniversalApp/.../CorePackages/`](extracontent-models/UniversalApp/UniversalApp/PatchRoot/DataModelInstances/CorePackages/)