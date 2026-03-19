local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v7 = require(l_Modules_0.Common.memoize);
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local v10 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v15 = require(l_Modules_0.LuaApp.Components.More.MoreList);
local v16 = require(l_Modules_0.LuaApp.Components.More.MoreItemContainer);
local v17 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v19 = require(l_CorePackages_0.Packages.React);
local v20 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v21 = require(l_Modules_0.LuaApp.Hooks.useSettingsPageItems);
local l_useBillingTabVisibility_0 = require(l_CorePackages_0.Workspace.Packages.SettingsTabVisibility).useBillingTabVisibility;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v24 = require(l_Modules_0.LuaApp.Components.More.MoreSectionList);
local v25 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_SetShowAgeVerificationOverlay_0 = v25.AgeVerificationOverlay.SetShowAgeVerificationOverlay;
local l_SetVoiceChatOptInStatus_0 = v25.OptInStatus.SetVoiceChatOptInStatus;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableParentalControlExperiment);
local l_GetFFlagEnableGateNotificationPreferencesTab_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableGateNotificationPreferencesTab;
local v30 = require(l_Modules_0.LuaApp.Flags.FFlagEnableBillingTabHideLogic);
local v31 = v4.PureComponent:extend("SettingsPage");
v31.init = function(v32) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v16 (copy), v7 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), v30 (copy), v9 (copy), v3 (copy)
    v32.renderItem = function(v33, v34) --[[ Line: 63 ]]
        -- upvalues: v4 (ref), v16 (ref)
        return v4.createElement(v16, {
            item = v33, 
            layoutInfo = v34
        });
    end;
    v32.getSettingsPageItemList = v7(function(v35, v36, v37, v38) --[[ Line: 71 ]]
        -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (ref), v32 (copy), v30 (ref), v9 (ref), v3 (ref)
        local v39 = if l_GetFFlagEnableGateNotificationPreferencesTab_0() then {
            enableNotificationPreferencesTab = v32.props.enableNotificationPreferencesTab, 
            hideBillingTab = if v30 then v38 else nil
        } else if v30 then {
            hideBillingTab = v38
        } else nil;
        local v40 = v9.GetItemsInPage(v36, nil, nil, v39, v37);
        return v3.List.map(v40, function(v41) --[[ Line: 86 ]]
            -- upvalues: v9 (ref), v35 (copy), v3 (ref)
            local l_contents_0 = v41.contents;
            local v43 = {};
            for v44, v45 in ipairs(l_contents_0) do
                if v45.itemType == v9.ItemType.Settings_AccountInfo and v45.badgeCount ~= v35 then
                    v45 = v3.Dictionary.join(v45, {
                        badgeCount = v35
                    });
                end;
                v43[v44] = v45;
            end;
            return v43;
        end);
    end);
    if game:GetEngineFeature("VoiceChatSupported") then
        v32.props.setShowAgeVerificationOverlay();
    end;
    v32.props.setVoiceChatOptInStatus();
end;
v31.render = function(v46) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), v30 (copy), v8 (copy), v4 (copy), v17 (copy), v15 (copy), v14 (copy), l_withStyle_0 (copy)
    local v47 = v46.props.formFactor == l_FormFactor_0.WIDE;
    local l_showParentalControls_0 = v46.props.showParentalControls;
    local l_settingsPageType_0 = v46.props.settingsPageType;
    local v50 = if v30 then v46.props.hideBillingTabOverride ~= nil and v46.props.hideBillingTabOverride else nil;
    local v51 = if v30 then v46.getSettingsPageItemList(v46.props.notificationCount, l_settingsPageType_0, l_showParentalControls_0, v50) else v46.getSettingsPageItemList(v46.props.notificationCount, l_settingsPageType_0, l_showParentalControls_0);
    local v52 = 0;
    local v53 = 0;
    local l_MORE_PAGE_SECTION_PADDING_0 = v8.MORE_PAGE_SECTION_PADDING;
    local l_MORE_PAGE_SECTION_PADDING_1 = v8.MORE_PAGE_SECTION_PADDING;
    if v47 then
        v52 = v8.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        v53 = v8.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        l_MORE_PAGE_SECTION_PADDING_0 = v8.MORE_PAGE_WIDE_PADDING_VERTICAL;
        l_MORE_PAGE_SECTION_PADDING_1 = v8.MORE_PAGE_WIDE_PADDING_VERTICAL;
    end;
    local v56 = v8.MORE_PAGE_CONTENT_MAX_WIDTH + v52 + v53;
    local function v59(v57) --[[ Line: 147 ]]
        -- upvalues: v4 (ref), v17 (ref), v56 (copy), v52 (ref), v53 (ref), l_MORE_PAGE_SECTION_PADDING_0 (ref), l_MORE_PAGE_SECTION_PADDING_1 (ref), v15 (ref), v51 (copy), v46 (copy), v8 (ref), v14 (ref)
        local v58 = v4.createElement(v17, {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            maxWidth = v56
        }, {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v52), 
                PaddingRight = UDim.new(0, v53), 
                PaddingTop = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_0), 
                PaddingBottom = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_1)
            }), 
            SettingsPageList = v4.createElement(v15, {
                itemList = v51, 
                renderItem = v46.renderItem, 
                rowHeight = v8.MORE_PAGE_ROW_HEIGHT
            })
        });
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v57.Color, 
            BackgroundTransparency = v57.Transparency
        }, {
            TopBar = v4.createElement(v14.Container, {
                leftItem = v14.BackButton, 
                rightItems = {
                    v14.BuyRobuxButton, 
                    v14.NotificationsButton
                }
            }), 
            PageContent = v4.createElement(v14.PageContent, {}, {
                Scroller = v58
            })
        });
    end;
    return l_withStyle_0(function(v60) --[[ Line: 189 ]]
        -- upvalues: v59 (copy)
        return v59(v60.Theme.BackgroundDefault);
    end);
end;
v31 = l_RoactAppPolicy_0.connect(function(v61, _) --[[ Line: 194 ]]
    -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy)
    return {
        settingsPageType = v61.getSettingsPageType(), 
        enableNotificationPreferencesTab = if l_GetFFlagEnableGateNotificationPreferencesTab_0() then v61.getEnableNotificationPreferencesPage() else nil
    };
end)(v31);
if v28() then
    v31 = v10.connectUserLayer({
        l_AppUserLayers_0.ParentalSpendControlsLayer
    }, function(v63, _) --[[ Line: 206 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        return {
            showParentalControls = (v63[l_AppUserLayers_0.ParentalSpendControlsLayer] or {}).showParentalSpendControls
        };
    end)(v31);
end;
v31 = v5.connect(function(v65, _) --[[ Line: 214 ]]
    local l_MorePageSettings_0 = v65.NotificationBadgeCounts.MorePageSettings;
    return {
        formFactor = v65.FormFactor, 
        notificationCount = l_MorePageSettings_0, 
        screenSize = v65.ScreenSize
    };
end, function(v68) --[[ Line: 221 ]]
    -- upvalues: l_SetShowAgeVerificationOverlay_0 (copy), l_SetVoiceChatOptInStatus_0 (copy)
    return {
        setShowAgeVerificationOverlay = function(v69, v70, v71, v72) --[[ Line: 223 ]] --[[ Name: setShowAgeVerificationOverlay ]]
            -- upvalues: v68 (copy), l_SetShowAgeVerificationOverlay_0 (ref)
            return v68(l_SetShowAgeVerificationOverlay_0(v69, v70, v71, v72));
        end, 
        setVoiceChatOptInStatus = function(v73) --[[ Line: 238 ]] --[[ Name: setVoiceChatOptInStatus ]]
            -- upvalues: v68 (copy), l_SetVoiceChatOptInStatus_0 (ref)
            return v68(l_SetVoiceChatOptInStatus_0(v73));
        end
    };
end)(v31);
v31 = l_RoactServices_0.connect({
    appUpdateService = l_AppUpdateService_0
})(v31);
return function(v74) --[[ Line: 248 ]]
    -- upvalues: v20 (copy), l_UiMode_0 (copy), v30 (copy), l_useBillingTabVisibility_0 (copy), v3 (copy), v21 (copy), v19 (copy), v24 (copy), v31 (ref)
    local v75 = v20.useUiModeInfo().uiMode == l_UiMode_0.TenFoot;
    if v30 then
        local v76 = not l_useBillingTabVisibility_0().showBillingTab;
        v74 = v3.Dictionary.join(v74 or {}, {
            hideBillingTabOverride = v76
        });
    end;
    local v77 = v74 or {};
    local v78 = v21();
    if v75 then
        return v19.createElement(v24, {
            itemList = v78
        });
    else
        return v19.createElement(v31, v77);
    end;
end;