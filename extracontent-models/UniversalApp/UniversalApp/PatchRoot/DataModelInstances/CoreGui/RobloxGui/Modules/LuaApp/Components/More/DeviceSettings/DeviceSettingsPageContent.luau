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
local v44 = require(l_Modules_0.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate);
local l_GetFFlagEnableReadAloudInUA_0 = v42.GetFFlagEnableReadAloudInUA;
local l_GetFFlagSystemTrayEnabled_0 = v42.GetFFlagSystemTrayEnabled;
local l_FFlagVRUseStandardDeviceSettingPageContent_0 = v42.FFlagVRUseStandardDeviceSettingPageContent;
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local v49 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableThemeUpdatedLoggingFix);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default;
local v51 = require(l_Parent_0.ApplyThemeSelection);
local v52 = require(l_Modules_0.LuaApp.Components.EventReceivers.GetSystemTheme);
local v53 = l_default_1 and l_default_1.getHasPartyVoiceVolume();
local l_DeviceLevelThemeKey_0 = v24.DeviceLevelThemeKey;
local l_LAYOUT_ORDER_0 = v24.LAYOUT_ORDER;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local function _() --[[ Line: 82 ]] --[[ Name: createLayoutOrderGenerator ]]
    -- upvalues: v35 (copy), l_LAYOUT_ORDER_0 (copy)
    local v57 = 0;
    return function(v58) --[[ Line: 84 ]]
        -- upvalues: v35 (ref), l_LAYOUT_ORDER_0 (ref), v57 (ref)
        if v35 and v58 then
            return l_LAYOUT_ORDER_0[v58];
        else
            v57 = v57 + 1;
            return v57;
        end;
    end;
end;
local v60 = v7.PureComponent:extend("DeviceSettingsPageContent");
if v35 then
    v60.validateProps = v11.strictInterface({
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
    v60.validateProps = v11.strictInterface({
        formFactor = v11.string, 
        platform = v11.EnumItem, 
        isSpatial = v11.optional(v11.boolean), 
        roactAnalytics = v11.union(v11.Instance, v11.table)
    });
end;
v60.eventDisconnect = function(v61) --[[ Line: 117 ]] --[[ Name: eventDisconnect ]]
    -- upvalues: l_GetFFlagEnableReadAloudInUA_0 (copy)
    if v61.onReducedMotionChangedSignal then
        v61.onReducedMotionChangedSignal:Disconnect();
        v61.onReducedMotionChangedSignal = nil;
    end;
    if v61.onPreferredTransparencyChangedSignal then
        v61.onPreferredTransparencyChangedSignal:Disconnect();
        v61.onPreferredTransparencyChangedSignal = nil;
    end;
    if v61.onPreferredTextSizeChangedSignal then
        v61.onPreferredTextSizeChangedSignal:Disconnect();
        v61.onPreferredTextSizeChangedSignal = nil;
    end;
    if v61.onUiNavigationKeyBindEnabledChanged then
        v61.onUiNavigationKeyBindEnabledChanged:Disconnect();
        v61.onUiNavigationKeyBindEnabledChanged = nil;
    end;
    if v61.onKeyboardEnabledChangedSignal then
        v61.onKeyboardEnabledChangedSignal:Disconnect();
        v61.onKeyboardEnabledChangedSignal = nil;
    end;
    if l_GetFFlagEnableReadAloudInUA_0() and v61.onReadAloudChangedSignal then
        v61.onReadAloudChangedSignal:Disconnect();
        v61.onReadAloudChangedSignal = nil;
    end;
end;
v60.init = function(v62) --[[ Line: 145 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagSystemTrayEnabled_0 (copy), l_AppStorageService_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), l_GetFFlagEnableReadAloudInUA_0 (copy), l_LocalStorageKey_0 (copy), v26 (copy), v23 (copy), v25 (copy)
    local function _(v63) --[[ Line: 146 ]] --[[ Name: preferredTransparencySliderValueFromValue ]]
        return 10 - math.clamp(math.floor(v63 * 10 + 0.5), 0, 10);
    end;
    local function _(v65) --[[ Line: 150 ]] --[[ Name: preferredTextSizeSliderValueFromValue ]]
        return v65.Value - 1;
    end;
    local function _(v67) --[[ Line: 154 ]] --[[ Name: appStorageItem ]]
        -- upvalues: l_GetFFlagSystemTrayEnabled_0 (ref), l_AppStorageService_0 (ref)
        if l_GetFFlagSystemTrayEnabled_0() then
            if l_AppStorageService_0:GetItem(v67) == "true" then
                return true;
            else
                return false;
            end;
        else
            return nil;
        end;
    end;
    local v69 = {
        keyboardEnabled = l_UserInputService_0.KeyboardEnabled, 
        reducedMotionEnabled = l_UserGameSettings_0.ReducedMotion, 
        preferredTransparencyValue = 10 - math.clamp(math.floor(l_UserGameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10), 
        preferredTextSizeValue = l_UserGameSettings_0.PreferredTextSize.Value - 1, 
        uiNavigationKeyBindEnabled = l_UserGameSettings_0.UiNavigationKeyBindEnabled, 
        readAloudEnabled = if l_GetFFlagEnableReadAloudInUA_0() then l_UserGameSettings_0.ReadAloud else nil, 
        isLocalPlayerPartyVoiceEligible = false
    };
    local l_LaunchAtStartup_0 = l_LocalStorageKey_0.LaunchAtStartup;
    v69.isLaunchAtStartupEnabled = if l_GetFFlagSystemTrayEnabled_0() then l_AppStorageService_0:GetItem(l_LaunchAtStartup_0) == "true" else nil;
    l_LaunchAtStartup_0 = l_LocalStorageKey_0.MinimizeToTray;
    v69.isMinimizeToTrayEnabled = if l_GetFFlagSystemTrayEnabled_0() then l_AppStorageService_0:GetItem(l_LaunchAtStartup_0) == "true" else nil;
    v62.state = v69;
    if l_GetFFlagSystemTrayEnabled_0() then
        v62.onLaunchAtStartupActivated = function() --[[ Line: 179 ]]
            -- upvalues: v62 (copy), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            local v71 = not v62.state.isLaunchAtStartupEnabled;
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.LaunchAtStartup, (tostring(v71)));
            l_AppStorageService_0:Flush();
            v62:setState({
                isLaunchAtStartupEnabled = v71
            });
        end;
        v62.onMinimizeToTrayActivated = function() --[[ Line: 191 ]]
            -- upvalues: v62 (copy), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            local v72 = not v62.state.isMinimizeToTrayEnabled;
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.MinimizeToTray, (tostring(v72)));
            l_AppStorageService_0:Flush();
            v62:setState({
                isMinimizeToTrayEnabled = v72
            });
        end;
    end;
    v62.onReducedMotionActivated = function() --[[ Line: 204 ]]
        -- upvalues: v62 (copy), l_UserGameSettings_0 (ref), v26 (ref), v23 (ref)
        local l_reducedMotionEnabled_0 = v62.state.reducedMotionEnabled;
        local v74 = not v62.state.reducedMotionEnabled;
        l_UserGameSettings_0.ReducedMotion = v74;
        v26(v62.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "ReducedMotion", tostring(l_reducedMotionEnabled_0), (tostring(v74)));
    end;
    v62.onReducedMotionChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 217 ]]
        -- upvalues: v62 (copy), l_UserGameSettings_0 (ref)
        v62:setState({
            reducedMotionEnabled = l_UserGameSettings_0.ReducedMotion
        });
    end);
    if l_GetFFlagEnableReadAloudInUA_0() then
        v62.onReadAloudActivated = function() --[[ Line: 224 ]]
            -- upvalues: v62 (copy), l_UserGameSettings_0 (ref), v26 (ref), v23 (ref), v25 (ref)
            local l_readAloudEnabled_0 = v62.state.readAloudEnabled;
            local v76 = not v62.state.readAloudEnabled;
            l_UserGameSettings_0.ReadAloud = v76;
            v26(v62.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, v25.ReadAloud, tostring(l_readAloudEnabled_0), (tostring(v76)));
        end;
        v62.onReadAloudChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("ReadAloud"):Connect(function() --[[ Line: 237 ]]
            -- upvalues: v62 (copy), l_UserGameSettings_0 (ref)
            v62:setState({
                readAloudEnabled = l_UserGameSettings_0.ReadAloud
            });
        end);
    end;
    v62.onPreferredTransparencyValueChanged = function(v77) --[[ Line: 244 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v26 (ref), v62 (copy), v23 (ref)
        local l_PreferredTransparency_0 = l_UserGameSettings_0.PreferredTransparency;
        local v79 = (10 - math.clamp(math.floor(v77), 0, 10)) / 10;
        l_UserGameSettings_0.PreferredTransparency = v79;
        v26(v62.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "PreferredTransparency", tostring(l_PreferredTransparency_0), (tostring(v79)));
    end;
    v62.onPreferredTransparencyChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 258 ]]
        -- upvalues: v62 (copy), l_UserGameSettings_0 (ref)
        v62:setState({
            preferredTransparencyValue = 10 - math.clamp(math.floor(l_UserGameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10)
        });
    end);
    v62.onPreferredTextSizeValueChanged = function(v80) --[[ Line: 266 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v26 (ref), v62 (copy), v23 (ref)
        local l_PreferredTextSize_0 = l_UserGameSettings_0.PreferredTextSize;
        local v82 = Enum.PreferredTextSize:GetEnumItems()[v80 + 1];
        l_UserGameSettings_0.PreferredTextSize = v82;
        v26(v62.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "PreferredTextSize", tostring(l_PreferredTextSize_0), (tostring(v82)));
    end;
    v62.onPreferredTextSizeChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ Line: 279 ]]
        -- upvalues: v62 (copy), l_UserGameSettings_0 (ref)
        v62:setState({
            preferredTextSizeValue = l_UserGameSettings_0.PreferredTextSize.Value - 1
        });
    end);
    v62.onUiNavigationKeyBindActivated = function() --[[ Line: 285 ]]
        -- upvalues: v62 (copy), l_UserGameSettings_0 (ref), v26 (ref), v23 (ref)
        local l_uiNavigationKeyBindEnabled_0 = v62.state.uiNavigationKeyBindEnabled;
        local v84 = not v62.state.uiNavigationKeyBindEnabled;
        l_UserGameSettings_0.UiNavigationKeyBindEnabled = v84;
        v26(v62.props.roactAnalytics.EventStream, v23.Context.AccessibilitySettingsPage, "UiNavigationKeyBind", tostring(l_uiNavigationKeyBindEnabled_0), (tostring(v84)));
    end;
    v62.onUiNavigationKeyBindEnabledChanged = l_UserGameSettings_0:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function() --[[ Line: 299 ]]
        -- upvalues: v62 (copy), l_UserGameSettings_0 (ref)
        v62:setState({
            uiNavigationKeyBindEnabled = l_UserGameSettings_0.UiNavigationKeyBindEnabled
        });
    end);
    v62.onKeyboardEnabledChangedSignal = l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 306 ]]
        -- upvalues: v62 (copy), l_UserInputService_0 (ref)
        v62:setState({
            keyboardEnabled = l_UserInputService_0.KeyboardEnabled
        });
    end);
end;
local function v87(v85) --[[ Line: 313 ]] --[[ Name: Divider ]]
    -- upvalues: v7 (copy)
    local l_style_0 = v85.style;
    return v7.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_style_0.Theme.Divider.Color, 
        BackgroundTransparency = l_style_0.Theme.Divider.Transparency, 
        LayoutOrder = v85.layoutOrder
    });
end;
local function v95(v88, v89) --[[ Line: 324 ]] --[[ Name: getThemeDropdownProperties ]]
    -- upvalues: v35 (copy), v37 (copy), l_default_0 (copy), v34 (copy), l_DeviceLevelThemeKey_0 (copy), v49 (copy)
    local v90 = nil;
    local v91 = nil;
    if v35 and v37 then
        local l_result_0 = l_default_0:decodeInternal(v34.DeviceLevelThemeLocalStorageKey).result;
        local v93 = l_result_0 and l_result_0[v89] or nil;
        if v93 then
            local v94 = v37.getSystemThemeEnum(v93);
            if v94 == v37.Light then
                v90 = l_DeviceLevelThemeKey_0.Light;
                v91 = v88.deviceLevelThemeLight;
            elseif v94 == v37.Dark then
                v90 = l_DeviceLevelThemeKey_0.Dark;
                v91 = v88.deviceLevelThemeDark;
            elseif v94 == v37.SystemLight or v94 == v37.SystemDark then
                v90 = l_DeviceLevelThemeKey_0.System;
                v91 = v88.deviceLevelThemeSystem;
            end;
        end;
    end;
    if v49() and v35 and (v91 == nil or v91 == "") then
        v91 = v88.deviceLevelThemeLight or v88.deviceLevelThemeDark or v88.deviceLevelThemeSystem or "";
    end;
    if v49() and v91 == nil then
        v91 = "";
    end;
    return v90, v91;
end;
v60.renderWithProviders = function(v96, v97, _, v99) --[[ Line: 366 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FormFactor_0 (copy), v35 (copy), l_LAYOUT_ORDER_0 (copy), v41 (copy), v24 (copy), v95 (copy), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (copy), v7 (copy), v25 (copy), v44 (copy), v27 (copy), l_Toggle_0 (copy), l_InputSize_0 (copy), v87 (copy), v20 (copy), l_Slider_0 (copy), v14 (copy), v28 (copy), v53 (copy), v29 (copy), v30 (copy), l_DropdownMenu_0 (copy), l_DeviceLevelThemeKey_0 (copy), l_GetFFlagEnableReadAloudInUA_0 (copy), l_LocalPlayerPartyVoiceEligibleBinder_0 (copy), l_GetFFlagSystemTrayEnabled_0 (copy)
    local v100 = v96.props.formFactor == l_FormFactor_0.WIDE;
    local v101 = 0;
    local v102;
    do
        local l_v101_0 = v101;
        v102 = function(v104) --[[ Line: 84 ]]
            -- upvalues: v35 (ref), l_LAYOUT_ORDER_0 (ref), l_v101_0 (ref)
            if v35 and v104 then
                return l_LAYOUT_ORDER_0[v104];
            else
                l_v101_0 = l_v101_0 + 1;
                return l_v101_0;
            end;
        end;
    end;
    v101 = v96.props.userId;
    local l_isSpatial_0 = v96.props.isSpatial;
    local v106 = not l_isSpatial_0;
    local v107 = not l_isSpatial_0;
    local v108 = v41() and v96.state.keyboardEnabled;
    local l_BaseSize_0 = v99.Font.BaseSize;
    local v110 = l_BaseSize_0 * v99.Font.Body.RelativeSize;
    local v111 = l_BaseSize_0 * v99.Font.CaptionBody.RelativeSize;
    local l_Font_0 = v99.Font.Body.Font;
    local l_Font_1 = v99.Font.CaptionBody.Font;
    local v114 = v99.Tokens.Global.Stroke_100 * v24.CONTEXTUAL_SLIDER_BASE_WIDTH;
    local v115 = nil;
    local v116 = nil;
    if v35 then
        local v117, v118 = v95(v97, v101);
        v115 = v117;
        v116 = v118;
    end;
    local function v120(v119) --[[ Line: 391 ]]
        -- upvalues: l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (ref), v96 (copy)
        if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then
            v96:setState({
                isLocalPlayerPartyVoiceEligible = v119
            });
        end;
    end;
    return v7.createFragment({
        Frame = v7.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v102(v25.SettingDescription)
        }, {
            UIPadding = if not v44 then v7.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 25)
            }) else nil, 
            SettingDescriptionText = v7.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v97.accessibilityDescription, 
                Font = l_Font_0, 
                TextSize = v110, 
                TextColor3 = v99.Theme.TextDefault.Color, 
                TextTransparency = v99.Theme.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true
            })
        }), 
        ReducedMotion = if v106 then v7.createElement(v27, {
            style = v99, 
            header = v97.reducedMotionHeader, 
            description = v97.reducedMotionDescription, 
            layoutOrder = v102(v25.ReducedMotion), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v96.state.reducedMotionEnabled, 
                onActivated = v96.onReducedMotionActivated, 
                label = "", 
                size = l_InputSize_0.Large
            })
        }) else nil, 
        Divider1 = if v106 then v87({
            style = v99, 
            layoutOrder = v102(v25.PreferredTransparencyDivider)
        }) else nil, 
        PreferredTransparency = if v107 then v7.createElement(v27, {
            style = v99, 
            header = v97.preferredTransparencyHeader, 
            description = v97.preferredTransparencyDescription, 
            layoutOrder = v102(v25.PreferredTransparency), 
            topToBottom = not v100, 
            Control = v7.createElement("Frame", {
                Size = if v100 then UDim2.new(0, v114, 0, 0) else UDim2.fromScale(1, 0), 
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
                    value = v96.state.preferredTransparencyValue, 
                    onValueChanged = v96.onPreferredTransparencyValueChanged, 
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
                        Text = v97.preferredTransparencyTransparent, 
                        Font = l_Font_1, 
                        TextSize = v111, 
                        TextColor3 = v99.Theme.TextMuted.Color, 
                        TextTransparency = v99.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    RightText = v7.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v97.preferredTransparencyOpaque, 
                        Font = l_Font_1, 
                        TextSize = v111, 
                        TextColor3 = v99.Theme.TextMuted.Color, 
                        TextTransparency = v99.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        LayoutOrder = 2
                    })
                })
            })
        }) else nil, 
        Divider2 = if v107 then v87({
            style = v99, 
            layoutOrder = v102(v25.PreferredTextSizeDivider)
        }) else nil, 
        PreferredTextSize = v7.createElement(v27, {
            style = v99, 
            header = v97.preferredTextSizeHeader, 
            description = v97.preferredTextSizeDescription, 
            layoutOrder = v102(v25.PreferredTextSize), 
            topToBottom = not v100, 
            Control = v7.createElement("Frame", {
                Size = if v100 then UDim2.new(0, v114, 0, 0) else UDim2.fromScale(1, 0), 
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
                    value = v96.state.preferredTextSizeValue, 
                    onValueChanged = v96.onPreferredTextSizeValueChanged, 
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
                        Text = v97.preferredTextSizeDefault, 
                        Font = l_Font_1, 
                        TextSize = v111, 
                        TextColor3 = v99.Theme.TextMuted.Color, 
                        TextTransparency = v99.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    RightText = v7.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v97.preferredTextSizeLargest, 
                        Font = l_Font_1, 
                        TextSize = v111, 
                        TextColor3 = v99.Theme.TextMuted.Color, 
                        TextTransparency = v99.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        LayoutOrder = 2
                    })
                })
            })
        }), 
        Divider3 = if v108 then v87({
            style = v99, 
            layoutOrder = v102(v25.UINavigationKeyBindDivider)
        }) else nil, 
        UiNavigationKeyBind = if v108 then v7.createElement(v27, {
            style = v99, 
            header = v97.uiNavigationKeyBindHeader, 
            description = v97.uiNavigationKeyBindDescription, 
            layoutOrder = v102(v25.UINavigationKeyBind), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v96.state.uiNavigationKeyBindEnabled, 
                onActivated = v96.onUiNavigationKeyBindActivated, 
                label = "", 
                size = l_InputSize_0.Large
            })
        }) else nil, 
        Divider4 = v87({
            style = v99, 
            layoutOrder = v102(v25.ReducedMotionDivider)
        }), 
        MasterVolume = v7.createElement(v28, {
            layoutOrder = v102(v25.MasterVolume)
        }), 
        Divider5 = if v53 and (not l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() or v96.state.isLocalPlayerPartyVoiceEligible) then v87({
            style = v99, 
            layoutOrder = v102(v25.PartyVoiceVolumeDivider)
        }) else nil, 
        PartyVoiceVolume = if v53 and (not l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() or v96.state.isLocalPlayerPartyVoiceEligible) then v7.createElement(v29, {
            layoutOrder = v102(v25.PartyVoiceVolume)
        }) else nil, 
        Divider6 = v87({
            style = v99, 
            layoutOrder = v102(v25.HapticsDivider)
        }), 
        HapticsToggle = v7.createElement(v30, {
            layoutOrder = v102(v25.Haptics)
        }), 
        Divider7 = if v35 then v87({
            style = v99, 
            layoutOrder = v102(v25.DeviceLevelThemeDivider)
        }) else nil, 
        DeviceLevelThemeDropdown = if v35 then v7.createElement(v27, {
            style = v99, 
            header = v97.deviceLevelThemeHeading, 
            description = v97.deviceLevelThemeDescription, 
            layoutOrder = v102(v25.DeviceLevelTheme), 
            zIndex = 2, 
            topToBottom = not v100, 
            Control = v7.createElement("Frame", {
                Size = if v100 then UDim2.new(0, v114, 0, v96.props.themeCellHeight.Offset) else UDim2.new(1, 0, 0, v96.props.themeCellHeight.Offset), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                v7.createElement(l_DropdownMenu_0, {
                    placeholder = v116, 
                    onChange = v96.props.themeSelectedCallback, 
                    height = v96.props.themeCellHeight, 
                    screenSize = v96.props.screenSize, 
                    errorState = false, 
                    showDropShadow = false, 
                    dropdownMenuListPositionFixed = true, 
                    defaultKey = v115, 
                    cellDatas = {
                        {
                            key = l_DeviceLevelThemeKey_0.System, 
                            text = v97.deviceLevelThemeSystem
                        }, 
                        {
                            key = l_DeviceLevelThemeKey_0.Dark, 
                            text = v97.deviceLevelThemeDark
                        }, 
                        {
                            key = l_DeviceLevelThemeKey_0.Light, 
                            text = v97.deviceLevelThemeLight
                        }
                    }
                })
            })
        }) else nil, 
        Divider8 = if l_GetFFlagEnableReadAloudInUA_0() then v87({
            style = v99, 
            layoutOrder = v102(v25.ReadAloudDivider)
        }) else nil, 
        ReadAloud = if l_GetFFlagEnableReadAloudInUA_0() then v7.createElement(v27, {
            style = v99, 
            header = "Read Aloud", 
            description = "Experimental feature to allow text to be read aloud when right clicking.", 
            layoutOrder = v102(v25.ReadAloud), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v96.state.readAloudEnabled, 
                onActivated = v96.onReadAloudActivated, 
                size = l_InputSize_0.Large, 
                label = ""
            })
        }) else nil, 
        LocalPlayerPartyVoiceEligibleBinder = if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then v7.createElement(l_LocalPlayerPartyVoiceEligibleBinder_0, {
            onChange = v120
        }) else nil, 
        Divider9 = if l_GetFFlagSystemTrayEnabled_0() then v87({
            style = v99, 
            layoutOrder = v102(v25.LaunchAtStartupDivider)
        }) else nil, 
        LaunchAtStartup = if l_GetFFlagSystemTrayEnabled_0() then v7.createElement(v27, {
            style = v99, 
            header = v97.launchAtStartupHeader, 
            description = v97.launchAtStartupDescription, 
            layoutOrder = v102(v25.LaunchAtStartup), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v96.state.isLaunchAtStartupEnabled, 
                onActivated = v96.onLaunchAtStartupActivated, 
                size = l_InputSize_0.Large, 
                label = ""
            })
        }) else nil, 
        Divider10 = if l_GetFFlagSystemTrayEnabled_0() then v87({
            style = v99, 
            layoutOrder = v102(v25.MinimizeToTrayDivider)
        }) else nil, 
        MinimizeToTray = if l_GetFFlagSystemTrayEnabled_0() then v7.createElement(v27, {
            style = v99, 
            header = v97.minimizeToTrayHeader, 
            description = v97.minimizeToTrayDescription, 
            layoutOrder = v102(v25.MinimizeToTray), 
            Control = v7.createElement(l_Toggle_0, {
                isChecked = v96.state.isMinimizeToTrayEnabled, 
                onActivated = v96.onMinimizeToTrayActivated, 
                size = l_InputSize_0.Large, 
                label = ""
            })
        }) else nil
    });
end;
v60.render = function(v121) --[[ Line: 750 ]] --[[ Name: render ]]
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
    })(function(v122) --[[ Line: 777 ]]
        -- upvalues: l_withStyle_0 (ref), v121 (copy)
        return l_withStyle_0(function(v123) --[[ Line: 778 ]]
            -- upvalues: v121 (ref), v122 (copy)
            return v121:renderWithProviders(v122, v123.Theme.BackgroundDefault, v123);
        end);
    end);
end;
v60.willUnmount = function(v124) --[[ Line: 784 ]] --[[ Name: willUnmount ]]
    v124:eventDisconnect();
end;
v60 = v10.connect(function(v125, _) --[[ Line: 788 ]]
    -- upvalues: v35 (copy)
    return {
        formFactor = v125.FormFactor, 
        platform = v125.Platform, 
        screenSize = if v35 then v125.ScreenSize else nil
    };
end)(v60);
local function v136(v127) --[[ Line: 797 ]] --[[ Name: DeviceSettingsPageContentContainer ]]
    -- upvalues: v6 (copy), l_ThemeContext_0 (copy), v35 (copy), l_useLocalUserId_0 (copy), v49 (copy), v51 (copy), l_DeviceLevelThemeKey_0 (copy), v36 (copy), v52 (copy), v37 (copy), l_Logger_0 (copy), l_useTokens_0 (copy), v33 (copy), l_FFlagVRUseStandardDeviceSettingPageContent_0 (copy), l_useIsSpatial_0 (copy), v60 (ref)
    local v128 = v6.useContext(l_ThemeContext_0);
    local v129 = if v35 then l_useLocalUserId_0() else nil;
    local v132 = v6.useCallback(function(v130) --[[ Line: 800 ]]
        -- upvalues: v49 (ref), v51 (ref), l_DeviceLevelThemeKey_0 (ref), v36 (ref), v52 (ref), v37 (ref), l_Logger_0 (ref)
        if v49() then
            v51(v130, {});
            return;
        else
            local v131 = nil;
            if v130 == l_DeviceLevelThemeKey_0.System then
                v131 = v36 and v52(v36) or nil;
            elseif v130 == l_DeviceLevelThemeKey_0.Light then
                v131 = v37 and v37.Light or nil;
            elseif v130 == l_DeviceLevelThemeKey_0.Dark then
                v131 = v37 and v37.Dark or nil;
            end;
            l_Logger_0:info("The user selected theme: " .. v130 .. ". Setting theme to: " .. tostring(v131));
            if v36 and v131 then
                v36:setTheme(v131);
            end;
            return;
        end;
    end, {
        v128
    });
    local v133 = l_useTokens_0();
    local v134 = UDim.new(0, v133.Size.Size_1200);
    local v135 = v33.Dictionary.join(v127, {
        themeSelectedCallback = v132, 
        themeCellHeight = v134, 
        userId = v129, 
        isSpatial = l_FFlagVRUseStandardDeviceSettingPageContent_0 and l_useIsSpatial_0()
    });
    return v6.createElement(v60, v135);
end;
local _ = nil;
return if v35 then l_RoactServices_0.connect({
    roactAnalytics = v9
})(v136) else l_RoactServices_0.connect({
    roactAnalytics = v9
})(v60);