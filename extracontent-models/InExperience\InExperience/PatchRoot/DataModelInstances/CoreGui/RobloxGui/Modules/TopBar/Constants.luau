local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Signals);
local v2 = require(l_CorePackages_0.Packages.SignalsReact);
local v3 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_getUIScale_0 = v3.GetDisplayStore(false).getUIScale;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.TenFootInterface);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_ChromeShared_0 = l_Parent_0.Chrome.ChromeShared;
local v9 = require(l_Parent_0.isNewTiltIconEnabled);
local l_FFlagTopBarRefactor_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor;
local v11 = if l_Enabled_0() then require(l_ChromeShared_0.Utility.GetStyleTokens)() else nil;
local function _(v12) --[[ Line: 19 ]] --[[ Name: withUIScale ]]
    -- upvalues: v6 (copy), l_Enabled_0 (copy)
    local v13 = v6:IsEnabled() and 1.5 or 1;
    if l_Enabled_0() then
        return v13 * v12;
    else
        return v12;
    end;
end;
local v15 = if l_Enabled_0() then v11.Size.Size_900 else 36;
local v16 = v15 - 4;
local v17;
if l_Enabled_0() then
    local v18 = v6:IsEnabled() and 1.5 or 1;
    v17 = if l_Enabled_0() then v18 * 58 else 58;
else
    v17 = 58;
end;
local v19 = if l_Enabled_0() then v11.Size.Size_1100 else 44;
local function _() --[[ Line: 29 ]] --[[ Name: getTopbarHeight ]]
    -- upvalues: v9 (copy), v15 (copy), l_Enabled_0 (copy), v17 (copy)
    if not v9() then
        return v15;
    elseif l_Enabled_0() then
        return v17;
    else
        return v15;
    end;
end;
local v21 = if not v9() then v15 else if l_Enabled_0() then v17 else v15;
local v22 = if l_Enabled_0() then v19 else v16;
local v23 = if l_Enabled_0() then v11.Padding.XXSmall else 2;
local v24 = if l_Enabled_0() then v11.Gap.Large else 16;
local v25 = if l_Enabled_0() then v11.Padding.Small else 12;
local v26 = {
    Enum.UserInputType.Gamepad1, 
    Enum.UserInputType.Gamepad2, 
    Enum.UserInputType.Gamepad3, 
    Enum.UserInputType.Gamepad4, 
    Enum.UserInputType.Gamepad5, 
    Enum.UserInputType.Gamepad6, 
    Enum.UserInputType.Gamepad7, 
    Enum.UserInputType.Gamepad8
};
return {
    ApplyDisplayScale = function(v27) --[[ Line: 60 ]] --[[ Name: ApplyDisplayScale ]]
        -- upvalues: l_getUIScale_0 (copy)
        return l_getUIScale_0(false) * v27;
    end, 
    useDisplayScaleState = function(v28) --[[ Line: 63 ]] --[[ Name: useDisplayScaleState ]]
        -- upvalues: v2 (copy), v1 (copy), v3 (copy)
        return v2.useSignalState(v1.createComputed(function(v29) --[[ Line: 64 ]]
            -- upvalues: v3 (ref), v28 (copy)
            local l_getUIScale_1 = v3.GetDisplayStore(v29).getUIScale;
            return v28 * l_getUIScale_1(v29);
        end));
    end, 
    TopBarHeight = v21, 
    TopBarHeightTenFoot = if l_Enabled_0() then nil else 72, 
    TopBarButtonHeight = v22, 
    TopBarButtonPadding = v23, 
    TopBarTopMargin = if l_FFlagTopBarRefactor_0 then v11.Gap.Medium else v21 - v22 - 2 * v23, 
    LegacyCloseMenuIconSize = if v9() then v21 - v11.Size.Size_100 else 30, 
    MENU_ICON_SIZE = if l_Enabled_0() then v11.Size.Size_600 else 24, 
    MenuIconOpenScale = 1.25, 
    UnibarFrame = {
        PaddingTop = if l_Enabled_0() then v11.Padding.XXSmall else 2, 
        PaddingBottom = if l_Enabled_0() then v11.Padding.XXSmall else 2, 
        PaddingLeft = v24 + v25 + v21 + if l_Enabled_0() then v11.Padding.XXSmall else 2, 
        ExtendedSize = v21 - if l_Enabled_0() then v11.Size.Size_100 else 4
    }, 
    MenuIconKeepOutAreaId = "roblox-menu-icon", 
    HealthBarKeepOutAreaId = "health-bar", 
    MoreMenuKeepOutAreaId = "more-menu", 
    ChatIconKeepOutAreaId = "chat-icon", 
    BackIconKeepOutAreaId = "back-icon", 
    VoiceBetaBadgeKeepOutAreaId = "badge-voice-beta", 
    TopBarKeepOutAreaId = "roblox-topbar", 
    ScreenSideOffset = v24, 
    ScreenSideOffsetTenFoot = if l_Enabled_0() then nil else 48, 
    TopBarPadding = v25, 
    InitialHealth = 100, 
    HealthPercentForOverlay = 0.05, 
    HealthRedColor = Color3.fromRGB(255, 28, 0), 
    HealthYellowColor = Color3.fromRGB(250, 235, 0), 
    HealthGreenColor = Color3.fromRGB(27, 252, 107), 
    InputType = {
        MouseAndKeyBoard = "MouseAndKeyboard", 
        Touch = "Touch", 
        Gamepad = "Gamepad"
    }, 
    GamepadInputTypes = v26, 
    Analytics = {
        ShowGamepadNavigationDialog = "show-gamepad-navigation-dialog", 
        DismissGamepadNavigationDialog = "dismiss-gamepad-navigation-dialog", 
        EventNameTopBarButtonActivated = "topbar-button-activated", 
        ChatButtonName = "chat", 
        MoreMenuButtonName = "more-menu", 
        InventoryButtonName = "inventory", 
        LeaderboardButtonName = "leaderboard", 
        EmotesButtonName = "emotes", 
        StatusActive = "active", 
        StatusInactive = "inactive"
    }, 
    LocalizedKeys = {
        UILessTooltipTitle = "CoreScripts.TopBar.Label.UILessHintTitle", 
        UILessTooltipDescription = "CoreScripts.TopBar.Label.UILessHintDescription"
    }
};