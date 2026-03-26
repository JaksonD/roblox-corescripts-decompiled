local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v6 = require(l_Parent_0.ReactFocusNavigation);
local _ = require(l_script_FirstAncestor_0.Components.AppShortcutBar);
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v10 = require(l_Parent_0.Responsive);
local l_useHeldProgressByEvent_0 = require(l_script_FirstAncestor_0.Hooks.AppShortcutBarContext).useHeldProgressByEvent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLastInputMethod_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMethod;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useIsStickyShortcutBarEnabled_0 = require(l_script_FirstAncestor_0.Hooks).useIsStickyShortcutBarEnabled;
local v17 = require(l_Parent_0.SharedFlags);
local l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 = v17.FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation;
local l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 = v17.FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAvatarEditorPageInputBindings_0 = v17.FFlagAXMigrateAvatarEditorPageInputBindings;
local l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 = v17.FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad;
local l_FFlagAXMigrateEmoteMenuFromRoactGamepad_0 = v17.FFlagAXMigrateEmoteMenuFromRoactGamepad;
local l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 = v17.FFlagAXMigrateSceneGamepadHandlerInputBindings;
local l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 = v17.FFlagAXMigrateLayeredClothingSortPageToFocusNavigation;
local l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 = v17.FFlagAXMigratePurchasePromptInteractiveToFocusNavigation;
local l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 = v17.FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation;
local l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 = v17.FFlagAXMigrateFormPeekViewToFocusNavigation;
local l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 = v17.FFlagAXMigrateAdjustAccessoryViewToFocusNavigation;
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = v17.FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 = v17.FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation;
local l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 = v17.FFlagAXMigrateCatalogSearchToFocusNavigation;
local l_FFlagAXMigrateCatalogPageInputBindings_0 = v17.FFlagAXMigrateCatalogPageInputBindings;
local l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 = v17.FFlagAXMigrateLookDetailsPeekViewToFocusNavigation;
local l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 = v17.FFlagAXMigrateVerticalClothingListToFocusNavigation;
local l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 = v17.FFlagAXMigrateUpdateOutfitPageToFocusNavigation;
local l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 = v17.FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation;
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v17.FFlagLuaAppEnableStickyShortcutBar;
local l_FFlagLuaAppResponsiveEnginePreferredInput_0 = v17.FFlagLuaAppResponsiveEnginePreferredInput;
local l_FFlagEnableLeftNavOnConsole_0 = v17.FFlagEnableLeftNavOnConsole;
local l_FFlagAXEnableMakeupForConsoleRoot_0 = v17.FFlagAXEnableMakeupForConsoleRoot;
local l_FFlagConnectionsToFriendsRename_0 = v17.FFlagConnectionsToFriendsRename;
local v42 = {
    [Enum.KeyCode.Thumbstick1] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Horizontal.png"
    }, 
    [Enum.KeyCode.Thumbstick2] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Horizontal.png"
    }
};
local v43 = {
    Enum.KeyCode.ButtonA, 
    Enum.KeyCode.ButtonX, 
    Enum.KeyCode.ButtonY, 
    Enum.KeyCode.ButtonL3, 
    Enum.KeyCode.ButtonR3, 
    Enum.KeyCode.Thumbstick1, 
    Enum.KeyCode.Thumbstick2, 
    Enum.KeyCode.ButtonStart, 
    Enum.KeyCode.Slash, 
    Enum.KeyCode.Escape, 
    Enum.KeyCode.LeftBracket, 
    Enum.KeyCode.PageUp, 
    Enum.KeyCode.RightBracket, 
    Enum.KeyCode.PageDown
};
local v44 = {
    l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest, 
    l_FocusNavigationEventNameEnum_0.HoldToAddFriend, 
    l_FocusNavigationEventNameEnum_0.HoldToJoinEvent, 
    l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent, 
    l_FocusNavigationEventNameEnum_0.HoldToNotifyMe, 
    l_FocusNavigationEventNameEnum_0.HoldToPlay, 
    l_FocusNavigationEventNameEnum_0.Play, 
    l_FocusNavigationEventNameEnum_0.Search, 
    l_FocusNavigationEventNameEnum_0.SeeAll, 
    l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo, 
    l_FocusNavigationEventNameEnum_0.AcceptFriendRequest, 
    l_FocusNavigationEventNameEnum_0.AddFriend, 
    l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest, 
    l_FocusNavigationEventNameEnum_0.OpenQuickMenu, 
    l_FocusNavigationEventNameEnum_0.NavigateBack, 
    l_FocusNavigationEventNameEnum_0.ScrollUp, 
    l_FocusNavigationEventNameEnum_0.ScrollDown
};
table.insert(v44, l_FocusNavigationEventNameEnum_0.Confirm);
if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
    table.insert(v44, l_FocusNavigationEventNameEnum_0.SelectItem);
    table.insert(v44, l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage);
end;
if l_FFlagAXMigrateCatalogPageInputBindings_0 then
    table.insert(v44, l_FocusNavigationEventNameEnum_0.ToggleTryOnManager);
end;
local v45 = {
    [Enum.KeyCode.ButtonA] = true, 
    [Enum.KeyCode.ButtonB] = true, 
    [Enum.KeyCode.ButtonX] = true, 
    [Enum.KeyCode.ButtonY] = true, 
    [Enum.KeyCode.ButtonL1] = true, 
    [Enum.KeyCode.ButtonL2] = true, 
    [Enum.KeyCode.ButtonL3] = true, 
    [Enum.KeyCode.ButtonR1] = true, 
    [Enum.KeyCode.ButtonR2] = true, 
    [Enum.KeyCode.ButtonR3] = true, 
    [Enum.KeyCode.ButtonSelect] = true, 
    [Enum.KeyCode.ButtonStart] = true, 
    [Enum.KeyCode.DPadDown] = true, 
    [Enum.KeyCode.DPadLeft] = true, 
    [Enum.KeyCode.DPadRight] = true, 
    [Enum.KeyCode.DPadUp] = true, 
    [Enum.KeyCode.Thumbstick1] = true, 
    [Enum.KeyCode.Thumbstick2] = true
};
local v46 = {
    [Enum.KeyCode.ButtonB] = true, 
    [Enum.KeyCode.ButtonL1] = true, 
    [Enum.KeyCode.ButtonR1] = true
};
local v47 = {
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY.png", 
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", 
    [Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonL3.png", 
    [Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonR3.png", 
    [Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Directional.png", 
    [Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Directional.png", 
    [Enum.KeyCode.ButtonStart] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonStart.png"
};
local v48 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then {
    [Enum.KeyCode.ButtonA] = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonA)
} else nil;
local v49 = {
    [Enum.KeyCode.ButtonY] = {
        [l_FocusNavigationEventNameEnum_0.Search] = v47[Enum.KeyCode.ButtonY], 
        [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = v47[Enum.KeyCode.ButtonY], 
        [l_FocusNavigationEventNameEnum_0.OpenLayeredClothingSortResetPrompt] = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenLayeredMakeupSortResetPrompt] = if l_FFlagAXEnableMakeupForConsoleRoot_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.SortAndFiltersReset] = if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.WearAfterPurchase] = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.FormPeekViewReset] = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.AdjustAccessoryViewReset] = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsRename] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPeekView] = if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.CloseItemDetailsPeekView] = if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.ToggleTryOn] = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.ToggleTryOnManager] = if not not l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 or l_FFlagAXMigrateCatalogPageInputBindings_0 then v47[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.RemoveClothingTile] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v47[Enum.KeyCode.ButtonY] else nil
    }, 
    [Enum.KeyCode.ButtonX] = {
        [l_FocusNavigationEventNameEnum_0.Play] = v47[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.SeeAll] = v47[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = v47[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AddFriend] = v47[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if not not l_FFlagAXMigrateAvatarEditorPageInputBindings_0 or l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage] = if l_FFlagAXMigrateEmoteMenuFromRoactGamepad_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.SortAndFiltersApply] = if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.SaveAsCharacter] = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.FormPeekViewApply] = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsDelete] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPrompt] = if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.UpdateOutfit] = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v47[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = v47[Enum.KeyCode.ButtonX]
    }, 
    [Enum.KeyCode.ButtonA] = {
        [l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest] = v47[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToAddFriend] = v47[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToJoinEvent] = v47[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent] = v47[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToNotifyMe] = v47[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToPlay] = v47[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.SelectItem] = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.SlotEmote] = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.UnslotEmote] = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.EquipSlotsSelectSlot] = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v47[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.Confirm] = v47[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.SelectOutfit] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.UnselectOutfit] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.SelectClothingTile] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v47[Enum.KeyCode.ButtonA] else nil
    }, 
    [Enum.KeyCode.ButtonB] = {
        [l_FocusNavigationEventNameEnum_0.CancelAndReset] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v47[Enum.KeyCode.ButtonB] else nil
    }, 
    [Enum.KeyCode.ButtonR3] = {
        [l_FocusNavigationEventNameEnum_0.ExitAvatarFullView] = if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then v47[Enum.KeyCode.ButtonR3] else nil, 
        [l_FocusNavigationEventNameEnum_0.Fullscreen] = v47[Enum.KeyCode.ButtonR3], 
        [l_FocusNavigationEventNameEnum_0.ExitFullscreen] = v47[Enum.KeyCode.ButtonR3]
    }, 
    [Enum.KeyCode.ButtonL3] = {
        [l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu] = if not not l_FFlagAXMigrateAvatarEditorPageInputBindings_0 or l_FFlagAXMigrateCatalogPageInputBindings_0 or l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 or l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v47[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage] = if not not l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 or l_FFlagAXMigrateCatalogPageInputBindings_0 then v47[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsToggleMultiSelect] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsCancelMultiSelect] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenEditorDetailsPage] = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then v47[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.Mute] = v47[Enum.KeyCode.ButtonL3], 
        [l_FocusNavigationEventNameEnum_0.Unmute] = v47[Enum.KeyCode.ButtonL3]
    }, 
    [Enum.KeyCode.ButtonStart] = {
        [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = v47[Enum.KeyCode.ButtonStart]
    }, 
    [Enum.KeyCode.Thumbstick1] = {
        [l_FocusNavigationEventNameEnum_0.PanAvatar] = if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then v47[Enum.KeyCode.Thumbstick1] else nil, 
        [l_FocusNavigationEventNameEnum_0.MoveClothingTile] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v47[Enum.KeyCode.Thumbstick1] else nil
    }, 
    [Enum.KeyCode.Thumbstick2] = {
        [l_FocusNavigationEventNameEnum_0.RotateAndZoomAvatar] = if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then v47[Enum.KeyCode.Thumbstick2] else nil
    }
};
local v50 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then {
    [Enum.KeyCode.ButtonA] = {
        [l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest] = v48[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToAddFriend] = v48[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToJoinEvent] = v48[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent] = v48[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToNotifyMe] = v48[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToPlay] = v48[Enum.KeyCode.ButtonA]
    }
} else nil;
local v51 = {
    [l_FocusNavigationEventNameEnum_0.Fullscreen] = "Feature.ExperienceDetails.Action.FullScreen", 
    [l_FocusNavigationEventNameEnum_0.ExitFullscreen] = "Feature.ExperienceDetails.Action.ExitFullScreen", 
    [l_FocusNavigationEventNameEnum_0.Mute] = "Feature.ExperienceDetails.Action.Mute", 
    [l_FocusNavigationEventNameEnum_0.Unmute] = "Feature.ExperienceDetails.Action.Unmute", 
    [l_FocusNavigationEventNameEnum_0.Search] = "CommonUI.Features.Label.ControllerBar.Search", 
    [l_FocusNavigationEventNameEnum_0.SeeAll] = "Feature.Home.ActionSeeAll", 
    [l_FocusNavigationEventNameEnum_0.Play] = "Common.VisitGame.Label.Play", 
    [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = "Feature.GameDetails.Label.LearnMore", 
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.ToPlaySuffix", 
    [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = l_FFlagConnectionsToFriendsRename_0 and "Feature.AddFriends.Action.IgnoreFriendRequest" or "Feature.AddFriends.Action.IgnoreConnectionRequest", 
    [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = l_FFlagConnectionsToFriendsRename_0 and "CommonUI.Features.Label.AcceptFriend" or "CommonUI.Features.Label.AcceptConnection", 
    [l_FocusNavigationEventNameEnum_0.AddFriend] = l_FFlagConnectionsToFriendsRename_0 and "CommonUI.Features.Label.AddFriend" or "CommonUI.Features.Label.AddConnection", 
    [l_FocusNavigationEventNameEnum_0.HoldToAddFriend] = l_FFlagConnectionsToFriendsRename_0 and "CommonUI.Features.Label.AddFriend" or "CommonUI.Features.Label.AddConnection", 
    [l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest] = l_FFlagConnectionsToFriendsRename_0 and "CommonUI.Features.Label.AcceptFriend" or "CommonUI.Features.Label.AcceptConnection", 
    [l_FocusNavigationEventNameEnum_0.HoldToJoinEvent] = "Feature.VirtualEvents.JoinEvent", 
    [l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent] = "Feature.VirtualEvents.UnfollowEvent", 
    [l_FocusNavigationEventNameEnum_0.HoldToNotifyMe] = "Feature.VirtualEvents.NotifyMe", 
    [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = "Feature.Catalog.Heading.QuickMenu", 
    [l_FocusNavigationEventNameEnum_0.ScrollUp] = "Feature.Accessibility.Action.ScrollUp", 
    [l_FocusNavigationEventNameEnum_0.ScrollDown] = "Feature.Accessibility.Action.ScrollDown", 
    [l_FocusNavigationEventNameEnum_0.NavigateBack] = "CommonUI.Controls.Action.Back", 
    [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = (not not l_FFlagAXMigrateAvatarEditorPageInputBindings_0 or l_FFlagAXMigrateCatalogSearchToFocusNavigation_0) and "Feature.Catalog.Action.Buy" or nil, 
    [l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu] = (not not l_FFlagAXMigrateAvatarEditorPageInputBindings_0 or l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 or l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0) and "Feature.Catalog.Action.ItemOptions" or nil, 
    [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage] = l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 and "Feature.Catalog.Action.OpenDetails" or nil, 
    [l_FocusNavigationEventNameEnum_0.SelectItem] = l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.Select" or nil, 
    [l_FocusNavigationEventNameEnum_0.EquipSlotsSelectSlot] = l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 and "Feature.Avatar.Action.SelectSlot" or nil, 
    [l_FocusNavigationEventNameEnum_0.SlotEmote] = l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.SlotEmote" or nil, 
    [l_FocusNavigationEventNameEnum_0.UnslotEmote] = l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.UnslotEmote" or nil, 
    [l_FocusNavigationEventNameEnum_0.OpenEditorDetailsPage] = l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 and "Feature.Catalog.Action.OpenDetails" or nil, 
    [l_FocusNavigationEventNameEnum_0.PanAvatar] = l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 and "Feature.Avatar.Action.Pan" or nil, 
    [l_FocusNavigationEventNameEnum_0.RotateAndZoomAvatar] = l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 and "Feature.Avatar.Action.Rotate" or nil, 
    [l_FocusNavigationEventNameEnum_0.ExitAvatarFullView] = l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 and "Feature.Avatar.Action.DefaultView" or nil, 
    [l_FocusNavigationEventNameEnum_0.OpenLayeredClothingSortResetPrompt] = l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 and "CommonUI.Messages.Action.Reset" or nil, 
    [l_FocusNavigationEventNameEnum_0.OpenLayeredMakeupSortResetPrompt] = l_FFlagAXEnableMakeupForConsoleRoot_0 and "CommonUI.Messages.Action.Reset" or nil, 
    [l_FocusNavigationEventNameEnum_0.SortAndFiltersApply] = l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 and "CommonUI.Messages.Action.Apply" or nil, 
    [l_FocusNavigationEventNameEnum_0.SortAndFiltersReset] = l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 and "CommonUI.Messages.Action.Reset" or nil, 
    [l_FocusNavigationEventNameEnum_0.SaveAsCharacter] = l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 and "Feature.Avatar.Heading.SaveCostume" or nil, 
    [l_FocusNavigationEventNameEnum_0.WearAfterPurchase] = l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 and "Feature.Avatar.Heading.WearConfirmation" or nil, 
    [l_FocusNavigationEventNameEnum_0.Confirm] = "CommonUI.Controls.Action.Confirm", 
    [l_FocusNavigationEventNameEnum_0.FormPeekViewApply] = l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 and "CommonUI.Messages.Action.Apply" or nil, 
    [l_FocusNavigationEventNameEnum_0.FormPeekViewReset] = l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 and "CommonUI.Messages.Action.Reset" or nil, 
    [l_FocusNavigationEventNameEnum_0.AdjustAccessoryViewReset] = l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 and "CommonUI.Messages.Action.Reset" or nil, 
    [l_FocusNavigationEventNameEnum_0.ManageOutfitsToggleMultiSelect] = l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.SelectMultipleItems" or nil, 
    [l_FocusNavigationEventNameEnum_0.ManageOutfitsCancelMultiSelect] = l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.CancelSelection" or nil, 
    [l_FocusNavigationEventNameEnum_0.ManageOutfitsDelete] = l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.Delete" or nil, 
    [l_FocusNavigationEventNameEnum_0.ManageOutfitsRename] = l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.Rename" or nil, 
    [l_FocusNavigationEventNameEnum_0.SelectOutfit] = l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.Select" or nil, 
    [l_FocusNavigationEventNameEnum_0.UnselectOutfit] = l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 and "Feature.Avatar.Action.Unselect" or nil, 
    [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPeekView] = l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 and "Feature.Catalog.Action.OpenDetails" or nil, 
    [l_FocusNavigationEventNameEnum_0.CloseItemDetailsPeekView] = l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 and "Feature.Catalog.Action.CloseDetails" or nil, 
    [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPrompt] = l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 and "Feature.Catalog.Action.Buy" or nil, 
    [l_FocusNavigationEventNameEnum_0.ToggleTryOn] = l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 and "Feature.Catalog.Label.TryOns" or nil, 
    [l_FocusNavigationEventNameEnum_0.UpdateOutfit] = l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 and "Feature.Avatar.Action.Update" or nil, 
    [l_FocusNavigationEventNameEnum_0.ToggleTryOnManager] = (not not l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 or l_FFlagAXMigrateCatalogPageInputBindings_0) and "Feature.Catalog.Label.TryOns" or nil, 
    [l_FocusNavigationEventNameEnum_0.SelectClothingTile] = l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 and "Feature.Avatar.Action.Select" or nil, 
    [l_FocusNavigationEventNameEnum_0.MoveClothingTile] = l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 and "Feature.Avatar.Title.Move" or nil, 
    [l_FocusNavigationEventNameEnum_0.RemoveClothingTile] = l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 and "Feature.Catalog.Action.Remove" or nil, 
    [l_FocusNavigationEventNameEnum_0.CancelAndReset] = l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 and "Feature.Catalog.Action.Cancel" or nil
};
local v52 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "Common.VisitGame.Label.Play"
};
local v53 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
};
local v54 = {
    [l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToAddFriend] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToJoinEvent] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToNotifyMe] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = true
};
local function v62(v55, v56, v57) --[[ Line: 507 ]] --[[ Name: getLegacyInputBindings ]]
    -- upvalues: v42 (copy), v47 (copy)
    if v56.axes then
        local l_vertical_0 = v56.axes.vertical;
        local l_horizontal_0 = v56.axes.horizontal;
        local v60 = v42[v55];
        local v61 = {};
        if l_vertical_0 then
            table.insert(v61, {
                icon = v60.vertical, 
                text = v57:Format(l_vertical_0.key)
            });
        end;
        if l_horizontal_0 then
            table.insert(v61, {
                icon = v60.horizontal, 
                text = v57:Format(l_horizontal_0.key)
            });
        end;
        return v61;
    elseif v56.key then
        return {
            {
                icon = v47[v55], 
                text = v57:Format(v56.key)
            }
        };
    else
        return {};
    end;
end;
local function v64(v63) --[[ Line: 540 ]] --[[ Name: selectRoactGamepadBindings ]]
    if v63.GamepadBottomBar then
        return v63.GamepadBottomBar.boundInputs;
    else
        return nil;
    end;
end;
local function v91(v65, v66, v67, v68, v69) --[[ Line: 544 ]] --[[ Name: getGamepadItems ]]
    -- upvalues: v43 (copy), v45 (copy), v46 (copy), v62 (copy), v49 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), v50 (copy), v52 (copy), v51 (copy), v53 (copy), v54 (copy), l_FocusNavigationEventNameEnum_0 (copy), v47 (copy)
    local v70 = {};
    for _, v72 in v43 do
        if v45[v72] and (not v68 or not v46[v72]) then
            if v68 then
                if not v46[v72] then
                    local v73 = v68[v72];
                    if v73 then
                        for _, v75 in (v62(v72, v73, v67)) do
                            table.insert(v70, v75);
                        end;
                    end;
                else
                    continue;
                end;
            end;
            local v76 = v65[v72];
            if v76 then
                local v77 = v49[v72];
                local v78 = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then v50[v72] else nil;
                local v79 = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 and v77 then v77[v76] else nil;
                local v80 = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 and v78 then v78[v76] else nil;
                local v81 = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then v80 or v79 else if v77 then v77[v76] else nil;
                local v82 = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then v52[v76] else nil;
                local v83 = v51[v76];
                local v84 = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then v82 or v83 else v51[v76];
                local v85 = if v84 then v67:Format(v84) else nil;
                local v86 = v53[v76];
                local v87 = if v86 then v67:Format(v86) else nil;
                local v88 = v66[v76];
                local v89 = v54[v76];
                if v81 and v85 then
                    table.insert(v70, {
                        icon = v81, 
                        text = v85, 
                        actionText = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then nil else v87, 
                        progress = v88, 
                        hasProgress = v89, 
                        inputKeyCode = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then v72 else nil, 
                        eventName = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then v76 else nil
                    });
                end;
            end;
        end;
    end;
    if l_FFlagLuaAppEnableStickyShortcutBar_0 and v69 then
        local v90 = v65[Enum.KeyCode.ButtonB];
        if v90 == l_FocusNavigationEventNameEnum_0.NavigateBack then
            table.insert(v70, {
                icon = v47[Enum.KeyCode.ButtonB], 
                text = v67:Format(v51[v90]), 
                inputKeyCode = Enum.KeyCode.ButtonB, 
                eventName = v90
            });
        end;
    end;
    return v70;
end;
local function v109(v92, v93, v94, v95) --[[ Line: 640 ]] --[[ Name: getKeyboardItems ]]
    -- upvalues: v45 (copy), v44 (copy), v51 (copy), v53 (copy), v54 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy)
    local v96 = {};
    local v97 = {};
    for v98, v99 in v92 do
        if not v45[v98] then
            if typeof(v97[v99]) == "table" then
                table.insert(v97[v99], v98);
            else
                v97[v99] = {
                    v98
                };
            end;
        end;
    end;
    for _, v101 in v44 do
        local v102 = v97[v101];
        if v102 then
            local v103 = v51[v101];
            local v104 = if v103 then v94:Format(v103) else nil;
            local v105 = v53[v101];
            local v106 = if v105 then v94:Format(v105) else nil;
            local v107 = v93[v101];
            local v108 = v54[v101];
            if v104 then
                table.insert(v96, {
                    icon = v102, 
                    text = v104, 
                    actionText = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v95 then nil else v106, 
                    progress = v107, 
                    hasProgress = v108, 
                    inputKeyCode = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v95 then v102[1] else nil, 
                    eventName = if l_FFlagLuaAppEnableStickyShortcutBar_0 and v95 then v101 else nil
                });
            end;
        end;
    end;
    return v96;
end;
local function v113() --[[ Line: 691 ]] --[[ Name: useShortcutBarFrameProps ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    local v110 = l_useUiModeInfo_0();
    local v111 = if v110 then v110.uiMode else nil;
    local v112 = l_useDesignTokens_0();
    if v111 == l_UiMode_0.TenFoot and not l_FFlagEnableLeftNavOnConsole_0 then
        return {};
    else
        return {
            Position = UDim2.new(0.5, 0, 1, if v112 then -v112.Global.Space_100 else 0), 
            AnchorPoint = Vector2.new(0.5, 1)
        };
    end;
end;
local function v122() --[[ Line: 710 ]] --[[ Name: useShortcutBarItems ]]
    -- upvalues: v6 (copy), v3 (copy), l_LocalizationRoactContext_0 (copy), l_useHeldProgressByEvent_0 (copy), l_useLastInputMethod_0 (copy), l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), v10 (copy), l_useSelector_0 (copy), v64 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_useIsStickyShortcutBarEnabled_0 (copy), v91 (copy), v109 (copy)
    local v114 = v6.useActiveEventMap();
    local v115 = v3.useContext(l_LocalizationRoactContext_0);
    local v116 = l_useHeldProgressByEvent_0();
    local v117 = l_useLastInputMethod_0();
    local v118 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v10.usePreferredInput() else nil;
    local _ = {};
    local v120 = l_useSelector_0(v64);
    local v121 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then l_useIsStickyShortcutBarEnabled_0() else nil;
    if if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v118 == v10.Input.Directional else v117 == "Gamepad" then
        return (v91(v114, v116, v115, v120, if l_FFlagLuaAppEnableStickyShortcutBar_0 then v121 else nil));
    else
        return (v109(v114, v116, v115, if l_FFlagLuaAppEnableStickyShortcutBar_0 then v121 else nil));
    end;
end;
useAppShortcutBarProps = function() --[[ Line: 746 ]] --[[ Name: useAppShortcutBarProps ]]
    -- upvalues: v113 (copy), v122 (copy), v4 (copy)
    local v123 = v113();
    local v124 = v122();
    return v4.Dictionary.union(v123, {
        items = v124
    });
end;
return useAppShortcutBarProps;