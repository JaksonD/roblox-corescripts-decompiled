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
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v18 = require(l_Parent_0.SharedFlags);
local l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 = v18.FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation;
local l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 = v18.FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAvatarEditorPageInputBindings_0 = v18.FFlagAXMigrateAvatarEditorPageInputBindings;
local l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 = v18.FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad;
local l_FFlagAXMigrateEmoteMenuFromRoactGamepad_0 = v18.FFlagAXMigrateEmoteMenuFromRoactGamepad;
local l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 = v18.FFlagAXMigrateSceneGamepadHandlerInputBindings;
local l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 = v18.FFlagAXMigrateLayeredClothingSortPageToFocusNavigation;
local l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 = v18.FFlagAXMigratePurchasePromptInteractiveToFocusNavigation;
local l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 = v18.FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation;
local l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 = v18.FFlagAXMigrateFormPeekViewToFocusNavigation;
local l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 = v18.FFlagAXMigrateAdjustAccessoryViewToFocusNavigation;
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = v18.FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 = v18.FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation;
local l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 = v18.FFlagAXMigrateCatalogSearchToFocusNavigation;
local l_FFlagAXMigrateCatalogPageInputBindings_0 = v18.FFlagAXMigrateCatalogPageInputBindings;
local l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 = v18.FFlagAXMigrateLookDetailsPeekViewToFocusNavigation;
local l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 = v18.FFlagAXMigrateVerticalClothingListToFocusNavigation;
local l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 = v18.FFlagAXMigrateUpdateOutfitPageToFocusNavigation;
local l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 = v18.FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation;
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v18.FFlagLuaAppEnableStickyShortcutBar;
local l_FFlagLuaAppResponsiveEnginePreferredInput_0 = v18.FFlagLuaAppResponsiveEnginePreferredInput;
local l_FFlagEnableLeftNavOnConsole_0 = v18.FFlagEnableLeftNavOnConsole;
local l_FFlagAXEnableMakeupForConsoleRoot_0 = v18.FFlagAXEnableMakeupForConsoleRoot;
local l_FFlagConnectionsToFriendsRename_0 = v18.FFlagConnectionsToFriendsRename;
local l_FFlagGuacStickyShortcutBarEnabled_0 = v18.FFlagGuacStickyShortcutBarEnabled;
local v44 = {
    [Enum.KeyCode.Thumbstick1] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Horizontal.png"
    }, 
    [Enum.KeyCode.Thumbstick2] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Horizontal.png"
    }
};
local v45 = {
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
local v46 = {
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
table.insert(v46, l_FocusNavigationEventNameEnum_0.Confirm);
if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
    table.insert(v46, l_FocusNavigationEventNameEnum_0.SelectItem);
    table.insert(v46, l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage);
end;
if l_FFlagAXMigrateCatalogPageInputBindings_0 then
    table.insert(v46, l_FocusNavigationEventNameEnum_0.ToggleTryOnManager);
end;
local v47 = {
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
local v48 = {
    [Enum.KeyCode.ButtonB] = true, 
    [Enum.KeyCode.ButtonL1] = true, 
    [Enum.KeyCode.ButtonR1] = true
};
local v49 = {
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
local v50 = if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then {
    [Enum.KeyCode.ButtonA] = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonA)
} else nil;
local v51 = {
    [Enum.KeyCode.ButtonY] = {
        [l_FocusNavigationEventNameEnum_0.Search] = v49[Enum.KeyCode.ButtonY], 
        [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = v49[Enum.KeyCode.ButtonY], 
        [l_FocusNavigationEventNameEnum_0.OpenLayeredClothingSortResetPrompt] = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenLayeredMakeupSortResetPrompt] = if l_FFlagAXEnableMakeupForConsoleRoot_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.SortAndFiltersReset] = if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.WearAfterPurchase] = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.FormPeekViewReset] = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.AdjustAccessoryViewReset] = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsRename] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPeekView] = if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.CloseItemDetailsPeekView] = if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.ToggleTryOn] = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.ToggleTryOnManager] = if not not l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 or l_FFlagAXMigrateCatalogPageInputBindings_0 then v49[Enum.KeyCode.ButtonY] else nil, 
        [l_FocusNavigationEventNameEnum_0.RemoveClothingTile] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v49[Enum.KeyCode.ButtonY] else nil
    }, 
    [Enum.KeyCode.ButtonX] = {
        [l_FocusNavigationEventNameEnum_0.Play] = v49[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.SeeAll] = v49[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = v49[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AddFriend] = v49[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if not not l_FFlagAXMigrateAvatarEditorPageInputBindings_0 or l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage] = if l_FFlagAXMigrateEmoteMenuFromRoactGamepad_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.SortAndFiltersApply] = if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.SaveAsCharacter] = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.FormPeekViewApply] = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsDelete] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPrompt] = if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.UpdateOutfit] = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v49[Enum.KeyCode.ButtonX] else nil, 
        [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = v49[Enum.KeyCode.ButtonX]
    }, 
    [Enum.KeyCode.ButtonA] = {
        [l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest] = v49[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToAddFriend] = v49[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToJoinEvent] = v49[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent] = v49[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToNotifyMe] = v49[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToPlay] = v49[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.SelectItem] = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.SlotEmote] = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.UnslotEmote] = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.EquipSlotsSelectSlot] = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v49[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.Confirm] = v49[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.SelectOutfit] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.UnselectOutfit] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonA] else nil, 
        [l_FocusNavigationEventNameEnum_0.SelectClothingTile] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v49[Enum.KeyCode.ButtonA] else nil
    }, 
    [Enum.KeyCode.ButtonB] = {
        [l_FocusNavigationEventNameEnum_0.CancelAndReset] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v49[Enum.KeyCode.ButtonB] else nil
    }, 
    [Enum.KeyCode.ButtonR3] = {
        [l_FocusNavigationEventNameEnum_0.ExitAvatarFullView] = if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then v49[Enum.KeyCode.ButtonR3] else nil, 
        [l_FocusNavigationEventNameEnum_0.Fullscreen] = v49[Enum.KeyCode.ButtonR3], 
        [l_FocusNavigationEventNameEnum_0.ExitFullscreen] = v49[Enum.KeyCode.ButtonR3]
    }, 
    [Enum.KeyCode.ButtonL3] = {
        [l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu] = if not not l_FFlagAXMigrateAvatarEditorPageInputBindings_0 or l_FFlagAXMigrateCatalogPageInputBindings_0 or l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 or l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v49[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage] = if not not l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 or l_FFlagAXMigrateCatalogPageInputBindings_0 then v49[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsToggleMultiSelect] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.ManageOutfitsCancelMultiSelect] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.OpenEditorDetailsPage] = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then v49[Enum.KeyCode.ButtonL3] else nil, 
        [l_FocusNavigationEventNameEnum_0.Mute] = v49[Enum.KeyCode.ButtonL3], 
        [l_FocusNavigationEventNameEnum_0.Unmute] = v49[Enum.KeyCode.ButtonL3]
    }, 
    [Enum.KeyCode.ButtonStart] = {
        [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = v49[Enum.KeyCode.ButtonStart]
    }, 
    [Enum.KeyCode.Thumbstick1] = {
        [l_FocusNavigationEventNameEnum_0.PanAvatar] = if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then v49[Enum.KeyCode.Thumbstick1] else nil, 
        [l_FocusNavigationEventNameEnum_0.MoveClothingTile] = if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then v49[Enum.KeyCode.Thumbstick1] else nil
    }, 
    [Enum.KeyCode.Thumbstick2] = {
        [l_FocusNavigationEventNameEnum_0.RotateAndZoomAvatar] = if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then v49[Enum.KeyCode.Thumbstick2] else nil
    }
};
local v52 = if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then {
    [Enum.KeyCode.ButtonA] = {
        [l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest] = v50[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToAddFriend] = v50[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToJoinEvent] = v50[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent] = v50[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToNotifyMe] = v50[Enum.KeyCode.ButtonA], 
        [l_FocusNavigationEventNameEnum_0.HoldToPlay] = v50[Enum.KeyCode.ButtonA]
    }
} else nil;
local v53 = {
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
local v54 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "Common.VisitGame.Label.Play"
};
local v55 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
};
local v56 = {
    [l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToAddFriend] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToJoinEvent] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToNotifyMe] = true, 
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = true
};
local function v64(v57, v58, v59) --[[ Line: 510 ]] --[[ Name: getLegacyInputBindings ]]
    -- upvalues: v44 (copy), v49 (copy)
    if v58.axes then
        local l_vertical_0 = v58.axes.vertical;
        local l_horizontal_0 = v58.axes.horizontal;
        local v62 = v44[v57];
        local v63 = {};
        if l_vertical_0 then
            table.insert(v63, {
                icon = v62.vertical, 
                text = v59:Format(l_vertical_0.key)
            });
        end;
        if l_horizontal_0 then
            table.insert(v63, {
                icon = v62.horizontal, 
                text = v59:Format(l_horizontal_0.key)
            });
        end;
        return v63;
    elseif v58.key then
        return {
            {
                icon = v49[v57], 
                text = v59:Format(v58.key)
            }
        };
    else
        return {};
    end;
end;
local function v66(v65) --[[ Line: 543 ]] --[[ Name: selectRoactGamepadBindings ]]
    if v65.GamepadBottomBar then
        return v65.GamepadBottomBar.boundInputs;
    else
        return nil;
    end;
end;
local function v93(v67, v68, v69, v70, v71) --[[ Line: 547 ]] --[[ Name: getGamepadItems ]]
    -- upvalues: v45 (copy), v47 (copy), v48 (copy), v64 (copy), v51 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), v52 (copy), v54 (copy), v53 (copy), v55 (copy), v56 (copy), l_FocusNavigationEventNameEnum_0 (copy), v49 (copy)
    local v72 = {};
    for _, v74 in v45 do
        if v47[v74] and (not v70 or not v48[v74]) then
            if v70 then
                if not v48[v74] then
                    local v75 = v70[v74];
                    if v75 then
                        for _, v77 in (v64(v74, v75, v69)) do
                            table.insert(v72, v77);
                        end;
                    end;
                else
                    continue;
                end;
            end;
            local v78 = v67[v74];
            if v78 then
                local v79 = v51[v74];
                local v80 = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then v52[v74] else nil;
                local v81 = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 and v79 then v79[v78] else nil;
                local v82 = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 and v80 then v80[v78] else nil;
                local v83 = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then v82 or v81 else if v79 then v79[v78] else nil;
                local v84 = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then v54[v78] else nil;
                local v85 = v53[v78];
                local v86 = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then v84 or v85 else v53[v78];
                local v87 = if v86 then v69:Format(v86) else nil;
                local v88 = v55[v78];
                local v89 = if v88 then v69:Format(v88) else nil;
                local v90 = v68[v78];
                local v91 = v56[v78];
                if v83 and v87 then
                    table.insert(v72, {
                        icon = v83, 
                        text = v87, 
                        actionText = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then nil else v89, 
                        progress = v90, 
                        hasProgress = v91, 
                        inputKeyCode = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then v74 else nil, 
                        eventName = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then v78 else nil
                    });
                end;
            end;
        end;
    end;
    if (l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v71 then
        local v92 = v67[Enum.KeyCode.ButtonB];
        if v92 == l_FocusNavigationEventNameEnum_0.NavigateBack then
            table.insert(v72, {
                icon = v49[Enum.KeyCode.ButtonB], 
                text = v69:Format(v53[v92]), 
                inputKeyCode = Enum.KeyCode.ButtonB, 
                eventName = v92
            });
        end;
    end;
    return v72;
end;
local function v111(v94, v95, v96, v97) --[[ Line: 651 ]] --[[ Name: getKeyboardItems ]]
    -- upvalues: v47 (copy), v46 (copy), v53 (copy), v55 (copy), v56 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy)
    local v98 = {};
    local v99 = {};
    for v100, v101 in v94 do
        if not v47[v100] then
            if typeof(v99[v101]) == "table" then
                table.insert(v99[v101], v100);
            else
                v99[v101] = {
                    v100
                };
            end;
        end;
    end;
    for _, v103 in v46 do
        local v104 = v99[v103];
        if v104 then
            local v105 = v53[v103];
            local v106 = if v105 then v96:Format(v105) else nil;
            local v107 = v55[v103];
            local v108 = if v107 then v96:Format(v107) else nil;
            local v109 = v95[v103];
            local v110 = v56[v103];
            if v106 then
                table.insert(v98, {
                    icon = v104, 
                    text = v106, 
                    actionText = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v97 then nil else v108, 
                    progress = v109, 
                    hasProgress = v110, 
                    inputKeyCode = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v97 then v104[1] else nil, 
                    eventName = if (not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v97 then v103 else nil
                });
            end;
        end;
    end;
    return v98;
end;
local function v115() --[[ Line: 705 ]] --[[ Name: useShortcutBarFrameProps ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    local v112 = l_useUiModeInfo_0();
    local v113 = if v112 then v112.uiMode else nil;
    local v114 = l_useDesignTokens_0();
    if v113 == l_UiMode_0.TenFoot and not l_FFlagEnableLeftNavOnConsole_0 then
        return {};
    else
        return {
            Position = UDim2.new(0.5, 0, 1, if v114 then -v114.Global.Space_100 else 0), 
            AnchorPoint = Vector2.new(0.5, 1)
        };
    end;
end;
local function v125() --[[ Line: 724 ]] --[[ Name: useShortcutBarItems ]]
    -- upvalues: v6 (copy), v3 (copy), l_LocalizationRoactContext_0 (copy), l_useHeldProgressByEvent_0 (copy), l_useLastInputMethod_0 (copy), l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), v10 (copy), l_useSelector_0 (copy), v66 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), l_useAppPolicy_0 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_useIsStickyShortcutBarEnabled_0 (copy), v93 (copy), v111 (copy)
    local v116 = v6.useActiveEventMap();
    local v117 = v3.useContext(l_LocalizationRoactContext_0);
    local v118 = l_useHeldProgressByEvent_0();
    local v119 = l_useLastInputMethod_0();
    local v120 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v10.usePreferredInput() else nil;
    local _ = {};
    local v122 = l_useSelector_0(v66);
    local v123 = nil;
    v123 = if l_FFlagGuacStickyShortcutBarEnabled_0 then l_useAppPolicy_0(function(v124) --[[ Line: 736 ]]
        return v124.getStickyShortcutBarEnabled();
    end) else if l_FFlagLuaAppEnableStickyShortcutBar_0 then l_useIsStickyShortcutBarEnabled_0() else nil;
    if if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v120 == v10.Input.Directional else v119 == "Gamepad" then
        return (v93(v116, v118, v117, v122, if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then v123 else nil));
    else
        return (v111(v116, v118, v117, if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then v123 else nil));
    end;
end;
useAppShortcutBarProps = function() --[[ Line: 771 ]] --[[ Name: useAppShortcutBarProps ]]
    -- upvalues: v115 (copy), v125 (copy), v4 (copy)
    local v126 = v115();
    local v127 = v125();
    return v4.Dictionary.union(v126, {
        items = v127
    });
end;
return useAppShortcutBarProps;