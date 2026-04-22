local _ = require(script.Common.FocusNavHelper);
local v1 = require(script.Hooks.usePlayerListFocusNavigation);
local v2 = require(script.Flags.FFlagUseNewPlayerList);
local v3 = require(script.Flags.FFlagPlayerListUseFocusNavHook);
return {
    ["jest.config"] = script["jest.config"], 
    LeaderboardStoreInstanceManager = require(script.Common.LeaderboardStoreInstanceManager), 
    LeaderboardStoreContext = require(script.Common.LeaderboardStoreContext), 
    Flags = {
        FFlagUseNewPlayerList = require(script.Flags.FFlagUseNewPlayerList), 
        FFlagAddNewPlayerListFocusNav = require(script.Flags.FFlagAddNewPlayerListFocusNav), 
        FFlagAddNewPlayerListMobileFocusNav = require(script.Flags.FFlagAddNewPlayerListMobileFocusNav), 
        FFlagRemoveNewPlayerListOverlay = require(script.Flags.FFlagRemoveNewPlayerListOverlay), 
        FFlagEnableMobilePlayerListOnConsole = require(script.Flags.FFlagEnableMobilePlayerListOnConsole), 
        FFlagPlayerListUseMobileOnSmallDisplay = require(script.Flags.FFlagPlayerListUseMobileOnSmallDisplay), 
        FFlagPlayerListIgnoreDevGamepadBindings = require(script.Flags.FFlagPlayerListIgnoreDevGamepadBindings), 
        FFlagPlayerListUseFocusNavHook = v3, 
        FFlagPlayerListDropDownShowPlatformName = require(script.Flags.FFlagPlayerListDropDownShowPlatformName), 
        FFlagPlayerListFoundationSubscriptionIcon = require(script.Flags.FFlagPlayerListFoundationSubscriptionIcon)
    }, 
    Hooks = {
        useLeaderboardStore = require(script.Hooks.useLeaderboardStore), 
        usePlayerListFocusNavigation = if v3 then v1 else nil
    }, 
    Common = {
        LayoutValuesContext = if v2 then require(script.Common.LayoutValuesContext) else nil, 
        CreateLayoutValues = require(script.Common.CreateLayoutValues), 
        useLayoutValues = require(script.Common.useLayoutValues), 
        useSignalMapState = require(script.Common.useSignalMapState), 
        FormatStatString = require(script.Common.FormatStatString), 
        Constants = require(script.Common.Constants)
    }, 
    Container = {
        PlayerListContainer = require(script.Components.Containers.PlayerListContainer)
    }, 
    Presentation = {
        EntryFrameView = require(script.Components.Presentation.EntryFrameView), 
        StatEntryView = require(script.Components.Presentation.StatEntryView)
    }
};