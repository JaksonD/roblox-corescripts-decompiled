local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = script.Parent;
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v12.Style.withStyle;
local v14 = require(l_CorePackages_0.Packages.Foundation);
local l_InputSize_0 = v14.Enums.InputSize;
local l_Toggle_0 = v14.Toggle;
local l_DropdownMenu_0 = v12.App.Menu.DropdownMenu;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_Slider_0 = v14.Slider;
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v23 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v24 = require(l_Parent_0.DeviceSettingsPageContentConstants);
local v25 = require(l_Parent_0.DeviceSettingsEnum);
local v26 = require(l_Modules_0.LuaApp.Analytics.Events.changeAccessibilitySettingFromApp);
local v27 = require(l_Parent_0.DeviceSettingsPageSetting);
local v28 = require(l_Modules_0.LuaApp.Components.More.MasterVolumeSetting);
local v29 = require(l_Modules_0.LuaApp.Components.More.PartyVoiceVolumeSettings);
local v30 = require(l_Modules_0.LuaApp.Components.More.HapticsToggleSetting);
local l_ThemeContext_0 = require(l_CorePackages_0.Workspace.Packages.Style).ThemeContext;
local l_LocalPlayerPartyVoiceEligibleBinder_0 = require(l_CorePackages_0.Workspace.Packages.SquadsCore).Components.LocalPlayerPartyVoiceEligibleBinder;
local v33 = require(l_CorePackages_0.Packages.Cryo);
local v34 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local v35 = v34.GetSystemThemeEnabled();
local v36 = v34.GetSystemThemeService();
local v37 = v34.GetSystemThemeEnum();
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.AppStorageJsonCacheUtils.default;
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local v41 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUiNavigationKeyBindSettingInAppShellSettings);
local v42 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 = v42.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty;
local l_GetFFlagEnableCrossExpVoiceVolumeIXPCheck_0 = v42.GetFFlagEnableCrossExpVoiceVolumeIXPCheck;
local v45 = require(l_Modules_0.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate);
local l_GetFFlagEnableReadAloudInUA_0 = v42.GetFFlagEnableReadAloudInUA;
local l_GetFFlagSystemTrayEnabled_0 = v42.GetFFlagSystemTrayEnabled;
local l_FFlagVRUseStandardDeviceSettingPageContent_0 = v42.FFlagVRUseStandardDeviceSettingPageContent;
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local v50 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableThemeUpdatedLoggingFix);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default;
local v52 = require(l_Parent_0.ApplyThemeSelection);
local v53 = require(l_Modules_0.LuaApp.Components.EventReceivers.GetSystemTheme);
local v54 = l_GetFFlagEnableCrossExpVoiceVolumeIXPCheck_0() and l_default_1 and l_default_1.getHasPartyVoiceVolume();
local l_DeviceLevelThemeKey_0 = v24.DeviceLevelThemeKey;
local l_LAYOUT_ORDER_0 = v24.LAYOUT_ORDER;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local function _() --[[ Line: 85 ]] --[[ Name: createLayoutOrderGenerator ]]
    -- upvalues: v35 (copy), l_LAYOUT_ORDER_0 (copy)
    local v58 = 0;
    return function(v59) --[[ Line: 87 ]]
        -- upvalues: v35 (ref), l_LAYOUT_ORDER_0 (ref), v58 (ref)
        if v35 and v59 then
            return l_LAYOUT_ORDER_0[v59];
        else
            v58 = v58 + 1;
            return v58;
        end;
    end;
end;
local v61 = v7.PureComponent:extend("DeviceSettingsPageContent");
if v35 then
    v61.validateProps = v11.strictInterface({
        formFactor = v11.string, 
        platform = v11.EnumItem, 
        themeSelectedCallback = v11.callback, 
        themeCellHeight = v11.UDim, 
        userId = v11.string, 
        screenSize = v11.Vector2, 
        isSpatial = v11.optional(v11.boolean), 
        roactAnalytics = v11.union(v11.Instance, v11.table)
    });
else
    v61.validateProps = v11.strictInterface({
        formFactor = v11.string, 
        platform = v11.EnumItem, 
        isSpatial = v11.optional(v11.boolean), 
        roactAnalytics = v11.union(v11.Instance, v11.table)
    });
end;
v61.eventDisconnect = function(v62) --[[ Line: 120 ]] --[[ Name: eventDisconnect ]]
    -- upvalues: l_GetFFlagEnableReadAloudInUA_0 (copy)
    if v62.onReducedMotionChangedSignal then
        v62.onReducedMotionChangedSignal:Disconnect();
        v62.onReducedMotionChangedSignal = nil;
    end;
    if v62.onPreferredTransparencyChangedSignal then
        v62.onPreferredTransparencyChangedSignal:Disconnect();
        v62.onPreferredTransparencyChangedSignal = nil;
    end;
    if v62.onPreferredTextSizeChangedSignal then
        v62.onPreferredTextSizeChangedSignal:Disconnect();
        v62.onPreferredTextSizeChangedSignal = nil;
    end;
    if v62.onUiNavigationKeyBindEnabledChanged then
        v62.onUiNavigationKeyBindEnabledChanged:Disconnect();
        v62.onUiNavigationKeyBindEnabledChanged = nil;
    end;
    if v62.onKeyboardEnabledChangedSignal then
        v62.onKeyboardEnabledChangedSignal:Disconnect();
        v62.onKeyboardEnabledChangedSignal = nil;
    end;
    if l_GetFFlagEnableReadAloudInUA_0() and v62.onReadAloudChangedSignal then
        v62.onReadAloudChangedSignal:Disconnect();
        v62.onReadAloudChangedSignal = nil;
    end;
end;
v61.init = function(v63) --[[ Line: 148 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagSystemTrayEnabled_0 (copy), l_AppStorageService_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), l_GetFFlagEnableReadAloudInUA_0 (copy), l_LocalStorageKey_0 (copy), v26 (copy), v23 (copy), v25 (copy)
    local function _(v64) --[[ Line: 149 ]] --[[ Name: preferredTransparencySliderValueFromValue ]]
        return 10 - math.clamp(math.floor(v64 * 10 + 0.5), 0, 10);
    end;
    local function _(v66) --[[ Line: 153 ]] --[[ Name: preferredTextSizeSliderValueFromValue ]]
        return v66.Value - 1;
    end;
    local function _(v68) --[[ Line: 157 ]] --[[ Name: appStorageItem ]]
        -- upvalues: l_GetFFlagSystemTrayEnabled_0 (ref), l_AppStorageService_0 (ref)
        if l_GetFFlagSystemTrayEnabled_0() then
            if l_AppStorageService_0:GetItem(v68) == "true" then
                return true;
            else
                return false;
            end;
        else
            return nil;
        end;
    end;
    local v70 = {
        keyboardEnabled = l_UserInputService_0.KeyboardEnabled, 
        reducedMotionEnabled = l_UserGameSettings_0.ReducedMotion, 
        preferredTransparencyValue = 10 - math.clamp(math.floor(l_UserGameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10), 
        preferredTextSizeValue = l_UserGameSettings_0.PreferredTextSize.Value - 1, 
        uiNavigationKeyBindEnabled = l_UserGameSettings_0.UiNavigationKeyBindEnabled, 
        readAloudEnabled = if l_GetFFlagEnableReadAloudInUA_0() then l_UserGameSettings_0.ReadAloud else nil, 
        isLocalPlayerPartyVoiceEligible = false
    };
    local l_LaunchAtStartup_0 = l_LocalStorageKey_0.LaunchAtStartup;
    v70.isLaunchAtStartupEnabled = if l_GetFFlagSystemTrayEnabled_0() then l_AppStorageService_0:GetItem(l_LaunchAtStartup_0) == "true" else nil;
    l_LaunchAtStartup_0 = l_LocalStorageKey_0.MinimizeToTray;
    v70.isMinimizeToTrayEnabled = if l_GetFFlagSystemTrayEnabled_0() then l_AppStorageService_0:GetItem(l_LaunchAtStartup_0) == "true" else nil;
    v63.state = v70;
    if l_GetFFlagSystemTrayEnabled_0() then
        v63.onLaunchAtStartupActivated = function() --[[ Line: 182 ]]
            -- upvalues: v63 (copy), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            local v72 = not v63.state.isLaunchAtStartupEnabled;
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.LaunchAtStartup, (tostring(v72)));
            l_AppStorageService_0:Flush();
            v63:setState({
                isLaunchAtStartupEnabled = v72
            });
        end;
        v63.onMinimizeToTrayActivated = function() --[[ Line: 194 ]]
            -- upvalues: v63 (copy), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            local v73 = not v63.state.isMinimizeToTrayEnabled;
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.MinimizeToTray, (tostring(v73)));
            l_AppStorageService_0:Flush();
            v63:setState({
                isMinimizeToTrayEnabled = v73
            });
        end;
    end;
    v63.onReducedMotionActivated = function() --[[ Line: 207 ]]
        -- upvalues: v63 (copy), l_UserGameSettings_0 (ref), v26 (ref), v23 (ref)
        local l_reducedMotionEnabled_0 = v63.state.reducedMotionEnabled;
        local v75 = not v63.state.reducedMotionEnabled;
        l_UserGameSettings_0.ReducedMotion = v75;
        v26(v63.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "ReducedMotion", tostring(l_reducedMotionEnabled_0), (tostring(v75)));
    end;
    v63.onReducedMotionChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 220 ]]
        -- upvalues: v63 (copy), l_UserGameSettings_0 (ref)
        v63:setState({
            reducedMotionEnabled = l_UserGameSettings_0.ReducedMotion
        });
    end);
    if l_GetFFlagEnableReadAloudInUA_0() then
        v63.onReadAloudActivated = function() --[[ Line: 227 ]]
            -- upvalues: v63 (copy), l_UserGameSettings_0 (ref), v26 (ref), v23 (ref), v25 (ref)
            local l_readAloudEnabled_0 = v63.state.readAloudEnabled;
            local v77 = not v63.state.readAloudEnabled;
            l_UserGameSettings_0.ReadAloud = v77;
            v26(v63.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, v25.ReadAloud, tostring(l_readAloudEnabled_0), (tostring(v77)));
        end;
        v63.onReadAloudChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("ReadAloud"):Connect(function() --[[ Line: 240 ]]
            -- upvalues: v63 (copy), l_UserGameSettings_0 (ref)
            v63:setState({
                readAloudEnabled = l_UserGameSettings_0.ReadAloud
            });
        end);
    end;
    v63.onPreferredTransparencyValueChanged = function(v78) --[[ Line: 247 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v26 (ref), v63 (copy), v23 (ref)
        local l_PreferredTransparency_0 = l_UserGameSettings_0.PreferredTransparency;
        local v80 = (10 - math.clamp(math.floor(v78), 0, 10)) / 10;
        l_UserGameSettings_0.PreferredTransparency = v80;
        v26(v63.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "PreferredTransparency", tostring(l_PreferredTransparency_0), (tostring(v80)));
    end;
    v63.onPreferredTransparencyChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 261 ]]
        -- upvalues: v63 (copy), l_UserGameSettings_0 (ref)
        v63:setState({
            preferredTransparencyValue = 10 - math.clamp(math.floor(l_UserGameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10)
        });
    end);
    v63.onPreferredTextSizeValueChanged = function(v81) --[[ Line: 269 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v26 (ref), v63 (copy), v23 (ref)
        local l_PreferredTextSize_0 = l_UserGameSettings_0.PreferredTextSize;
        local v83 = Enum.PreferredTextSize:GetEnumItems()[v81 + 1];
        l_UserGameSettings_0.PreferredTextSize = v83;
        v26(v63.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "PreferredTextSize", tostring(l_PreferredTextSize_0), (tostring(v83)));
    end;
    v63.onPreferredTextSizeChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ Line: 282 ]]
        -- upvalues: v63 (copy), l_UserGameSettings_0 (ref)
        v63:setState({
            preferredTextSizeValue = l_UserGameSettings_0.PreferredTextSize.Value - 1
        });
    end);
    v63.onUiNavigationKeyBindActivated = function() --[[ Line: 288 ]]
        -- upvalues: v63 (copy), l_UserGameSettings_0 (ref), v26 (ref), v23 (ref)
        local l_uiNavigationKeyBindEnabled_0 = v63.state.uiNavigationKeyBindEnabled;
        local v85 = not v63.state.uiNavigationKeyBindEnabled;
        l_UserGameSettings_0.UiNavigationKeyBindEnabled = v85;
        v26(v63.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "UiNavigationKeyBind", tostring(l_uiNavigationKeyBindEnabled_0), (tostring(v85)));
    end;
    v63.onUiNavigationKeyBindEnabledChanged = l_UserGameSettings_0:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function() --[[ Line: 302 ]]
        -- upvalues: v63 (copy), l_UserGameSettings_0 (ref)
        v63:setState({
            uiNavigationKeyBindEnabled = l_UserGameSettings_0.UiNavigationKeyBindEnabled
        });
    end);
    v63.onKeyboardEnabledChangedSignal = l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 309 ]]
        -- upvalues: v63 (copy), l_UserInputService_0 (ref)
        v63:setState({
            keyboardEnabled = l_UserInputService_0.KeyboardEnabled
        });
    end);
end;
local function v88(v86) --[[ Line: 316 ]] --[[ Name: Divider ]]
    -- upvalues: v7 (copy)
    local l_style_0 = v86.style;
    return v7.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_style_0.Theme.Divider.Color, 
        BackgroundTransparency = l_style_0.Theme.Divider.Transparency, 
        LayoutOrder = v86.layoutOrder
    });
end;
local function v96(v89, v90) --[[ Line: 327 ]] --[[ Name: getThemeDropdownProperties ]]
    -- upvalues: v35 (copy), v37 (copy), l_default_0 (copy), v34 (copy), l_DeviceLevelThemeKey_0 (copy), v50 (copy)
    local v91 = nil;
    local v92 = nil;
    if v35 and v37 then
        local l_result_0 = l_default_0:decodeInternal(v34.DeviceLevelThemeLocalStorageKey).result;
        local v94 = l_result_0 and l_result_0[v90] or nil;
        if v94 then
            local v95 = v37.getSystemThemeEnum(v94);
            if v95 == v37.Light then
                v91 = l_DeviceLevelThemeKey_0.Light;
                v92 = v89.deviceLevelThemeLight;
            elseif v95 == v37.Dark then
                v91 = l_DeviceLevelThemeKey_0.Dark;
                v92 = v89.deviceLevelThemeDark;
            elseif v95 == v37.SystemLight or v95 == v37.SystemDark then
                v91 = l_DeviceLevelThemeKey_0.System;
                v92 = v89.deviceLevelThemeSystem;
            end;
        end;
    end;
    if v50() and v35 and (v92 == nil or v92 == "") then
        v92 = v89.deviceLevelThemeLight or v89.deviceLevelThemeDark or v89.deviceLevelThemeSystem or "";
    end;
    if v50() and v92 == nil then
        v92 = "";
    end;
    return v91, v92;
end;
v61.renderWithProviders = function(v97, v98, _, v100) --[[ Line: 369 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FormFactor_0 (copy), v35 (copy), l_LAYOUT_ORDER_0 (copy), v41 (copy), v24 (copy), v96 (copy), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (copy), v7 (copy), v25 (copy), v45 (copy), v27 (copy), l_Toggle_0 (copy), l_InputSize_0 (copy), v88 (copy), v20 (copy), l_Slider_0 (copy), v14 (copy), v28 (copy), v54 (copy), v29 (copy), v30 (copy), l_DropdownMenu_0 (copy), l_DeviceLevelThemeKey_0 (copy), l_GetFFlagEnableReadAloudInUA_0 (copy), l_LocalPlayerPartyVoiceEligibleBinder_0 (copy), l_GetFFlagSystemTrayEnabled_0 (copy)
    local v101 = v97.props.formFactor == l_FormFactor_0.WIDE;
    local v102 = 0;
    local v103;
    do
        local l_v102_0 = v102;
        v103 = function(v105) --[[ Line: 87 ]]
            -- upvalues: v35 (ref), l_LAYOUT_ORDER_0 (ref), l_v102_0 (ref)
            if v35 and v105 then
                return l_LAYOUT_ORDER_0[v105];
            else
                l_v102_0 = l_v102_0 + 1;
                return l_v102_0;
            end;
        end;
    end;
    v102 = v97.props.userId;
    local l_isSpatial_0 = v97.props.isSpatial;
    local v107 = not l_isSpatial_0;
    local v108 = not l_isSpatial_0;
    local v109 = v41() and v97.state.keyboardEnabled;
    local l_BaseSize_0 = v100.Font.BaseSize;
    local v111 = l_BaseSize_0 * v100.Font.Body.RelativeSize;
    local v112 = l_BaseSize_0 * v100.Font.CaptionBody.RelativeSize;
    local l_Font_0 = v100.Font.Body.Font;
    local l_Font_1 = v100.Font.CaptionBody.Font;
    local v115 = v100.Tokens.Global.Stroke_100 * v24.CONTEXTUAL_SLIDER_BASE_WIDTH;
    local v116 = nil;
    local v117 = nil;
    if v35 then
        local v118, v119 = v96(v98, v102);
        v116 = v118;
        v117 = v119;
    end;
    local function v121(v120) --[[ Line: 394 ]]
        -- upvalues: l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (ref), v97 (copy)
        if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then
            v97:setState({
                isLocalPlayerPartyVoiceEligible = v120
            });
        end;
    end;
    return v7.createFragment({
        Frame = v7.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v103(v25.SettingDescription)
        }, {
            UIPadding = if not v45 then v7.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 25)
            }) else nil, 
            SettingDescriptionText = v7.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v98.accessibilityDescription, 
                Font = l_Font_0, 
                TextSize = v111, 
                TextColor3 = v100.Theme.TextDefault.Color, 
                TextTransparency = v100.Theme.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true
            })
        }), 
        ReducedMotion = if v107 then v7.createElement(v27, {
            style = v100, 
            header = v98.reducedMotionHeader, 
            description = v98.reducedMotionDescription, 
            layoutOrder = v103(v25.ReducedMotion), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v97.state.reducedMotionEnabled, 
                onActivated = v97.onReducedMotionActivated, 
                label = "", 
                size = l_InputSize_0.Large
            })
        }) else nil, 
        Divider1 = if v107 then v88({
            style = v100, 
            layoutOrder = v103(v25.PreferredTransparencyDivider)
        }) else nil, 
        PreferredTransparency = if v108 then v7.createElement(v27, {
            style = v100, 
            header = v98.preferredTransparencyHeader, 
            description = v98.preferredTransparencyDescription, 
            layoutOrder = v103(v25.PreferredTransparency), 
            topToBottom = not v101, 
            Control = v7.createElement("Frame", {
                Size = if v101 then UDim2.new(0, v115, 0, 0) else UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Layout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.Name, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v20.MORE_PAGE_SECTION_PADDING)
                }), 
                ContextualSlider = v7.createElement(l_Slider_0, {
                    width = UDim.new(1, 0), 
                    range = NumberRange.new(0, 10), 
                    value = v97.state.preferredTransparencyValue, 
                    onValueChanged = v97.onPreferredTransparencyValueChanged, 
                    size = v14.Enums.InputSize.Large, 
                    knobVisibility = v14.Enums.ScrollBarVisibility.Always, 
                    variant = v14.Enums.SliderVariant.Emphasis, 
                    step = 1
                }), 
                Frame = v7.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v7.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, -10)
                    }), 
                    LeftText = v7.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v98.preferredTransparencyTransparent, 
                        Font = l_Font_1, 
                        TextSize = v112, 
                        TextColor3 = v100.Theme.TextMuted.Color, 
                        TextTransparency = v100.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    RightText = v7.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v98.preferredTransparencyOpaque, 
                        Font = l_Font_1, 
                        TextSize = v112, 
                        TextColor3 = v100.Theme.TextMuted.Color, 
                        TextTransparency = v100.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        LayoutOrder = 2
                    })
                })
            })
        }) else nil, 
        Divider2 = if v108 then v88({
            style = v100, 
            layoutOrder = v103(v25.PreferredTextSizeDivider)
        }) else nil, 
        PreferredTextSize = v7.createElement(v27, {
            style = v100, 
            header = v98.preferredTextSizeHeader, 
            description = v98.preferredTextSizeDescription, 
            layoutOrder = v103(v25.PreferredTextSize), 
            topToBottom = not v101, 
            Control = v7.createElement("Frame", {
                Size = if v101 then UDim2.new(0, v115, 0, 0) else UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Layout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.Name, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v20.MORE_PAGE_SECTION_PADDING)
                }), 
                ContextualSlider = v7.createElement(l_Slider_0, {
                    width = UDim.new(1, 0), 
                    range = NumberRange.new(0, 3), 
                    value = v97.state.preferredTextSizeValue, 
                    onValueChanged = v97.onPreferredTextSizeValueChanged, 
                    size = v14.Enums.InputSize.Large, 
                    knobVisibility = v14.Enums.ScrollBarVisibility.Always, 
                    variant = v14.Enums.SliderVariant.Emphasis, 
                    step = 1
                }), 
                Frame = v7.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v7.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, -10)
                    }), 
                    LeftText = v7.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v98.preferredTextSizeDefault, 
                        Font = l_Font_1, 
                        TextSize = v112, 
                        TextColor3 = v100.Theme.TextMuted.Color, 
                        TextTransparency = v100.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    RightText = v7.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v98.preferredTextSizeLargest, 
                        Font = l_Font_1, 
                        TextSize = v112, 
                        TextColor3 = v100.Theme.TextMuted.Color, 
                        TextTransparency = v100.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        LayoutOrder = 2
                    })
                })
            })
        }), 
        Divider3 = if v109 then v88({
            style = v100, 
            layoutOrder = v103(v25.UINavigationKeyBindDivider)
        }) else nil, 
        UiNavigationKeyBind = if v109 then v7.createElement(v27, {
            style = v100, 
            header = v98.uiNavigationKeyBindHeader, 
            description = v98.uiNavigationKeyBindDescription, 
            layoutOrder = v103(v25.UINavigationKeyBind), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v97.state.uiNavigationKeyBindEnabled, 
                onActivated = v97.onUiNavigationKeyBindActivated, 
                label = "", 
                size = l_InputSize_0.Large
            })
        }) else nil, 
        Divider4 = v88({
            style = v100, 
            layoutOrder = v103(v25.ReducedMotionDivider)
        }), 
        MasterVolume = v7.createElement(v28, {
            layoutOrder = v103(v25.MasterVolume)
        }), 
        Divider5 = if v54 and (not l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() or v97.state.isLocalPlayerPartyVoiceEligible) then v88({
            style = v100, 
            layoutOrder = v103(v25.PartyVoiceVolumeDivider)
        }) else nil, 
        PartyVoiceVolume = if v54 and (not l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() or v97.state.isLocalPlayerPartyVoiceEligible) then v7.createElement(v29, {
            layoutOrder = v103(v25.PartyVoiceVolume)
        }) else nil, 
        Divider6 = v88({
            style = v100, 
            layoutOrder = v103(v25.HapticsDivider)
        }), 
        HapticsToggle = v7.createElement(v30, {
            layoutOrder = v103(v25.Haptics)
        }), 
        Divider7 = if v35 then v88({
            style = v100, 
            layoutOrder = v103(v25.DeviceLevelThemeDivider)
        }) else nil, 
        DeviceLevelThemeDropdown = if v35 then v7.createElement(v27, {
            style = v100, 
            header = v98.deviceLevelThemeHeading, 
            description = v98.deviceLevelThemeDescription, 
            layoutOrder = v103(v25.DeviceLevelTheme), 
            zIndex = 2, 
            topToBottom = not v101, 
            Control = v7.createElement("Frame", {
                Size = if v101 then UDim2.new(0, v115, 0, v97.props.themeCellHeight.Offset) else UDim2.new(1, 0, 0, v97.props.themeCellHeight.Offset), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                v7.createElement(l_DropdownMenu_0, {
                    placeholder = v117, 
                    onChange = v97.props.themeSelectedCallback, 
                    height = v97.props.themeCellHeight, 
                    screenSize = v97.props.screenSize, 
                    errorState = false, 
                    showDropShadow = false, 
                    dropdownMenuListPositionFixed = true, 
                    defaultKey = v116, 
                    cellDatas = {
                        {
                            key = l_DeviceLevelThemeKey_0.System, 
                            text = v98.deviceLevelThemeSystem
                        }, 
                        {
                            key = l_DeviceLevelThemeKey_0.Dark, 
                            text = v98.deviceLevelThemeDark
                        }, 
                        {
                            key = l_DeviceLevelThemeKey_0.Light, 
                            text = v98.deviceLevelThemeLight
                        }
                    }
                })
            })
        }) else nil, 
        Divider8 = if l_GetFFlagEnableReadAloudInUA_0() then v88({
            style = v100, 
            layoutOrder = v103(v25.ReadAloudDivider)
        }) else nil, 
        ReadAloud = if l_GetFFlagEnableReadAloudInUA_0() then v7.createElement(v27, {
            style = v100, 
            header = "Read Aloud", 
            description = "Experimental feature to allow text to be read aloud when right clicking.", 
            layoutOrder = v103(v25.ReadAloud), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v97.state.readAloudEnabled, 
                onActivated = v97.onReadAloudActivated, 
                size = l_InputSize_0.Large, 
                label = ""
            })
        }) else nil, 
        LocalPlayerPartyVoiceEligibleBinder = if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then v7.createElement(l_LocalPlayerPartyVoiceEligibleBinder_0, {
            onChange = v121
        }) else nil, 
        Divider9 = if l_GetFFlagSystemTrayEnabled_0() then v88({
            style = v100, 
            layoutOrder = v103(v25.LaunchAtStartupDivider)
        }) else nil, 
        LaunchAtStartup = if l_GetFFlagSystemTrayEnabled_0() then v7.createElement(v27, {
            style = v100, 
            header = v98.launchAtStartupHeader, 
            description = v98.launchAtStartupDescription, 
            layoutOrder = v103(v25.LaunchAtStartup), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v97.state.isLaunchAtStartupEnabled, 
                onActivated = v97.onLaunchAtStartupActivated, 
                size = l_InputSize_0.Large, 
                label = ""
            })
        }) else nil, 
        Divider10 = if l_GetFFlagSystemTrayEnabled_0() then v88({
            style = v100, 
            layoutOrder = v103(v25.MinimizeToTrayDivider)
        }) else nil, 
        MinimizeToTray = if l_GetFFlagSystemTrayEnabled_0() then v7.createElement(v27, {
            style = v100, 
            header = v98.minimizeToTrayHeader, 
            description = v98.minimizeToTrayDescription, 
            layoutOrder = v103(v25.MinimizeToTray), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v97.state.isMinimizeToTrayEnabled, 
                onActivated = v97.onMinimizeToTrayActivated, 
                size = l_InputSize_0.Large, 
                label = ""
            })
        }) else nil
    });
end;
v61.render = function(v122) --[[ Line: 753 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), l_UserInputService_0 (copy), l_withStyle_0 (copy)
    return v21({
        accessibilityDescription = "Feature.Accessibility.Description.Main", 
        reducedMotionHeader = "Feature.Accessibility.Heading.ReducedMotion", 
        reducedMotionDescription = "Feature.Accessibility.Description.ReducedMotion", 
        preferredTransparencyHeader = "Feature.Accessibility.Heading.PreferredTransparency", 
        preferredTransparencyDescription = "Feature.Accessibility.Description.PreferredTransparency", 
        preferredTransparencyOpaque = "Feature.Accessibility.PreferredTransparency.Opaque", 
        preferredTransparencyTransparent = "Feature.Accessibility.PreferredTransparency.Transparent", 
        preferredTextSizeHeader = "Feature.Accessibility.Heading.PreferredTextSize", 
        preferredTextSizeDescription = "Feature.Accessibility.Description.PreferredTextSize", 
        preferredTextSizeLargest = "Feature.Accessibility.PreferredTextSize.Largest", 
        preferredTextSizeDefault = "Feature.Accessibility.PreferredTextSize.Default", 
        uiNavigationKeyBindHeader = "Feature.Accessibility.Heading.UiNavigationKeyBind", 
        uiNavigationKeyBindDescription = {
            "Feature.Accessibility.Description.UiNavigationKeyBind"; 
            uiNavigationKey = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        }, 
        deviceLevelThemeHeading = "Feature.Accessibility.Heading.DeviceLevelTheme", 
        deviceLevelThemeDescription = "Feature.Accessibility.Description.DeviceLevelTheme", 
        deviceLevelThemeDark = "Feature.Accessibility.DeviceLevelTheme.Dark", 
        deviceLevelThemeLight = "Feature.Accessibility.DeviceLevelTheme.Light", 
        deviceLevelThemeSystem = "Feature.Accessibility.DeviceLevelTheme.System", 
        launchAtStartupHeader = "Feature.Accessibility.Heading.LaunchAtStartup", 
        launchAtStartupDescription = "Feature.Accessibility.Description.LaunchAtStartup", 
        minimizeToTrayHeader = "Feature.Accessibility.Heading.MinimizeToTray", 
        minimizeToTrayDescription = "Feature.Accessibility.Description.MinimizeToTray"
    })(function(v123) --[[ Line: 780 ]]
        -- upvalues: l_withStyle_0 (ref), v122 (copy)
        return l_withStyle_0(function(v124) --[[ Line: 781 ]]
            -- upvalues: v122 (ref), v123 (copy)
            return v122:renderWithProviders(v123, v124.Theme.BackgroundDefault, v124);
        end);
    end);
end;
v61.willUnmount = function(v125) --[[ Line: 787 ]] --[[ Name: willUnmount ]]
    v125:eventDisconnect();
end;
v61 = v10.connect(function(v126, _) --[[ Line: 791 ]]
    -- upvalues: v35 (copy)
    return {
        formFactor = v126.FormFactor, 
        platform = v126.Platform, 
        screenSize = if v35 then v126.ScreenSize else nil
    };
end)(v61);
local function v137(v128) --[[ Line: 800 ]] --[[ Name: DeviceSettingsPageContentContainer ]]
    -- upvalues: v6 (copy), l_ThemeContext_0 (copy), v35 (copy), l_useLocalUserId_0 (copy), v50 (copy), v52 (copy), l_DeviceLevelThemeKey_0 (copy), v36 (copy), v53 (copy), v37 (copy), l_Logger_0 (copy), l_useTokens_0 (copy), v33 (copy), l_FFlagVRUseStandardDeviceSettingPageContent_0 (copy), l_useIsSpatial_0 (copy), v61 (ref)
    local v129 = v6.useContext(l_ThemeContext_0);
    local v130 = if v35 then l_useLocalUserId_0() else nil;
    local v133 = v6.useCallback(function(v131) --[[ Line: 803 ]]
        -- upvalues: v50 (ref), v52 (ref), l_DeviceLevelThemeKey_0 (ref), v36 (ref), v53 (ref), v37 (ref), l_Logger_0 (ref)
        if v50() then
            v52(v131, {});
            return;
        else
            local v132 = nil;
            if v131 == l_DeviceLevelThemeKey_0.System then
                v132 = v36 and v53(v36) or nil;
            elseif v131 == l_DeviceLevelThemeKey_0.Light then
                v132 = v37 and v37.Light or nil;
            elseif v131 == l_DeviceLevelThemeKey_0.Dark then
                v132 = v37 and v37.Dark or nil;
            end;
            l_Logger_0:info("The user selected theme: " .. v131 .. ". Setting theme to: " .. tostring(v132));
            if v36 and v132 then
                v36:setTheme(v132);
            end;
            return;
        end;
    end, {
        v129
    });
    local v134 = l_useTokens_0();
    local v135 = UDim.new(0, v134.Size.Size_1200);
    local v136 = v33.Dictionary.join(v128, {
        themeSelectedCallback = v133, 
        themeCellHeight = v135, 
        userId = v130, 
        isSpatial = l_FFlagVRUseStandardDeviceSettingPageContent_0 and l_useIsSpatial_0()
    });
    return v6.createElement(v61, v136);
end;
local _ = nil;
return if v35 then l_RoactServices_0.connect({
    roactAnalytics = v9
})(v137) else l_RoactServices_0.connect({
    roactAnalytics = v9
})(v61);