local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v11 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v12 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaHomeSubTab_0 = v13.FFlagAppIaHomeSubTab;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon);
local v16 = game:DefineFastFlag("AppChatUniversalAppNavbarNewConfig", false);
local l_getAppChatNavbarItemConfig_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Utils.getAppChatNavbarItemConfig;
local v18 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagEnableAndroidTvAppPolicies_0 = v13.FFlagEnableAndroidTvAppPolicies;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotLocalIcon);
local v23 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v24 = {
    {
        page = v5.Home, 
        titleLocalizationKey = "CommonUI.Features.Label.Home", 
        iconImage = l_Images_0["icons/menu/home_on"], 
        actionType = nil
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        titleLocalizationKey = "CommonUI.Features.Label.Avatar", 
        iconComponent = v15, 
        actionType = Enum.AppShellActionType.TapAvatarTab
    }, 
    {
        page = v5.ViewFriends, 
        titleLocalizationKey = "Feature.SocialTab.Label.Connect", 
        iconImage = l_Images_0["icons/menu/friendsOn"], 
        actionType = Enum.AppShellActionType.TapChatTab
    }
};
local function v42() --[[ Line: 54 ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), v22 (copy), v5 (copy), l_Images_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), v11 (copy), v12 (copy), v16 (copy), l_getAppChatNavbarItemConfig_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), l_FlyoutSidePanelIXP_0 (copy)
    local function v28(v25) --[[ Line: 55 ]]
        -- upvalues: l_useStyle_0 (ref), v6 (ref), v22 (ref)
        local l_Tokens_0 = l_useStyle_0().Tokens;
        local v27 = if v25.isChecked then l_Tokens_0.Semantic.Color.Text.Emphasis else l_Tokens_0.Semantic.Color.Text.Default;
        return v6.createElement(v22, {
            Size = l_Tokens_0.Global.Size_350, 
            ZIndex = 0, 
            BackgroundColor3 = v27.Color3, 
            BackgroundTransparency = v27.Transparency
        });
    end;
    local v29 = {
        page = v5.Home, 
        iconImage = l_Images_0["icons/menu/home_off"], 
        iconCheckedImage = l_Images_0["icons/menu/home_on"], 
        labelText = "CommonUI.Features.Label.Home", 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = nil
    };
    local v30 = {
        page = v5.Games, 
        iconImage = l_Images_0["icons/menu/charts_off"], 
        iconCheckedImage = l_Images_0["icons/menu/charts_on"], 
        labelText = "CommonUI.Features.Label.Charts", 
        actionType = Enum.AppShellActionType.TapGamePageTab, 
        badgeCount = nil
    };
    local v31 = if l_FFlagAppIaHomeSubTab_0 then {
        page = v11.Constants.HomeContainerName, 
        subTabPages = v12.Constants.HOME_CONTAINER_SUB_TAB_PAGES, 
        iconImage = l_Images_0["icons/menu/home_off"], 
        iconCheckedImage = l_Images_0["icons/menu/home_on"], 
        labelText = "CommonUI.Features.Label.Home", 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = nil
    } else nil;
    local v34 = {
        page = v5.AvatarExperienceRoot, 
        renderIcon = function(v32, _) --[[ Line: 96 ]] --[[ Name: renderIcon ]]
            -- upvalues: v6 (ref), v28 (copy)
            return v6.createElement(v28, {
                isChecked = v32
            });
        end, 
        labelText = "CommonUI.Features.Label.Avatar", 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = nil
    };
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    if v16 then
        local v38 = l_getAppChatNavbarItemConfig_0();
        v35 = l_Images_0[v38.icon.off];
        v36 = l_Images_0[v38.icon.on];
        v37 = v38.label;
    else
        v35 = l_Images_0["icons/menu/chat_off"];
        v36 = l_Images_0["icons/menu/chat_on"];
        v37 = "CommonUI.Features.Label.Chat";
    end;
    local v39 = {
        page = v5.Chat, 
        iconImage = v35, 
        iconCheckedImage = v36, 
        labelText = v37, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = nil
    };
    local v40 = {
        page = v5.More, 
        iconImage = l_Images_0["icons/menu/more_off"], 
        iconCheckedImage = l_Images_0["icons/menu/more_on"], 
        labelText = "CommonUI.Features.Label.More", 
        actionType = nil, 
        badgeCount = nil
    };
    local v41 = nil;
    if l_FFlagEnableLeftNavOnConsole_0 then
        v41 = {
            page = v5.ViewFriends, 
            labelText = "Feature.SocialTab.Label.Connect", 
            iconImage = l_Images_0["icons/menu/friends"], 
            iconCheckedImage = l_Images_0["icons/menu/friendsOn"], 
            actionType = Enum.AppShellActionType.TapChatTab, 
            badgeCount = nil
        };
    end;
    if l_IsVRAppBuild_0() then
        v34.isSecondary = true;
        return {
            v29, 
            v39, 
            v40, 
            v34
        };
    elseif l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
        return {
            v29, 
            v34, 
            v41, 
            v40
        };
    elseif l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then
        return {
            v31, 
            v34, 
            v39, 
            v40
        };
    else
        return {
            v29, 
            v30, 
            v34, 
            v39, 
            v40
        };
    end;
end;
getBottomBarItems = function() --[[ Line: 159 ]] --[[ Name: getBottomBarItems ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), v24 (copy), v42 (copy)
    if not l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
        return v24;
    else
        return (v42());
    end;
end;
return function() --[[ Line: 169 ]]
    -- upvalues: l_GuiService_0 (copy), v23 (copy), v4 (copy), v5 (copy), v18 (copy), l_FFlagEnableAndroidTvAppPolicies_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy)
    local v43 = {};
    local v44 = getBottomBarItems();
    if not l_GuiService_0:IsTenFootInterface() then
        local l_getCanSeeChatTab_0 = v23.getAppFeaturePolicies().getCanSeeChatTab;
        if l_getCanSeeChatTab_0 and not l_getCanSeeChatTab_0() then
            v44 = v4.List.filter(v44, function(v46) --[[ Line: 177 ]]
                -- upvalues: v5 (ref)
                return v46.page ~= v5.Chat;
            end);
        end;
    end;
    if v18 then
        v44 = v4.List.filter(v44, function(v47) --[[ Line: 184 ]]
            -- upvalues: v5 (ref)
            return v47.page ~= v5.More;
        end);
    end;
    if l_FFlagEnableAndroidTvAppPolicies_0 then
        local l_getHidesGamesTab_0 = v23.getAppFeaturePolicies().getHidesGamesTab;
        if l_getHidesGamesTab_0 and l_getHidesGamesTab_0() then
            v44 = v4.List.filter(v44, function(v49) --[[ Line: 192 ]]
                -- upvalues: v5 (ref)
                return v49.page ~= v5.Games;
            end);
        end;
    end;
    for v50, v51 in ipairs(v44) do
        if l_FFlagAppIaHomeSubTab_0 and v51.subTabPages then
            for _, v53 in ipairs(v51.subTabPages) do
                v43[v53] = v50;
            end;
        else
            v43[v51.page] = v50;
        end;
    end;
    return v44, v43;
end;