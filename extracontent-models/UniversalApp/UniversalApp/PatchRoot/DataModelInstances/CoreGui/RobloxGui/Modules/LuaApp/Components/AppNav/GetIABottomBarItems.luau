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
local l_FFlagAppIaHomeSubTab_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaHomeSubTab;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon);
local v15 = game:DefineFastFlag("AppChatUniversalAppNavbarNewConfig", false);
local l_getAppChatNavbarItemConfig_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Utils.getAppChatNavbarItemConfig;
local v17 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotLocalIcon);
local v21 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v22 = {
    {
        page = v5.Home, 
        titleLocalizationKey = "CommonUI.Features.Label.Home", 
        iconImage = l_Images_0["icons/menu/home_on"], 
        actionType = nil
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        titleLocalizationKey = "CommonUI.Features.Label.Avatar", 
        iconComponent = v14, 
        actionType = Enum.AppShellActionType.TapAvatarTab
    }, 
    {
        page = v5.ViewFriends, 
        titleLocalizationKey = "Feature.SocialTab.Label.Connect", 
        iconImage = l_Images_0["icons/menu/friendsOn"], 
        actionType = Enum.AppShellActionType.TapChatTab
    }
};
local function v40() --[[ Line: 53 ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), v20 (copy), v5 (copy), l_Images_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), v11 (copy), v12 (copy), v15 (copy), l_getAppChatNavbarItemConfig_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), l_FlyoutSidePanelIXP_0 (copy)
    local function v26(v23) --[[ Line: 54 ]]
        -- upvalues: l_useStyle_0 (ref), v6 (ref), v20 (ref)
        local l_Tokens_0 = l_useStyle_0().Tokens;
        local v25 = if v23.isChecked then l_Tokens_0.Semantic.Color.Text.Emphasis else l_Tokens_0.Semantic.Color.Text.Default;
        return v6.createElement(v20, {
            Size = l_Tokens_0.Global.Size_350, 
            ZIndex = 0, 
            BackgroundColor3 = v25.Color3, 
            BackgroundTransparency = v25.Transparency
        });
    end;
    local v27 = {
        page = v5.Home, 
        iconImage = l_Images_0["icons/menu/home_off"], 
        iconCheckedImage = l_Images_0["icons/menu/home_on"], 
        labelText = "CommonUI.Features.Label.Home", 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = nil
    };
    local v28 = {
        page = v5.Games, 
        iconImage = l_Images_0["icons/menu/charts_off"], 
        iconCheckedImage = l_Images_0["icons/menu/charts_on"], 
        labelText = "CommonUI.Features.Label.Charts", 
        actionType = Enum.AppShellActionType.TapGamePageTab, 
        badgeCount = nil
    };
    local v29 = if l_FFlagAppIaHomeSubTab_0 then {
        page = v11.Constants.HomeContainerName, 
        subTabPages = v12.Constants.HOME_CONTAINER_SUB_TAB_PAGES, 
        iconImage = l_Images_0["icons/menu/home_off"], 
        iconCheckedImage = l_Images_0["icons/menu/home_on"], 
        labelText = "CommonUI.Features.Label.Home", 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = nil
    } else nil;
    local v32 = {
        page = v5.AvatarExperienceRoot, 
        renderIcon = function(v30, _) --[[ Line: 95 ]] --[[ Name: renderIcon ]]
            -- upvalues: v6 (ref), v26 (copy)
            return v6.createElement(v26, {
                isChecked = v30
            });
        end, 
        labelText = "CommonUI.Features.Label.Avatar", 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = nil
    };
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    if v15 then
        local v36 = l_getAppChatNavbarItemConfig_0();
        v33 = l_Images_0[v36.icon.off];
        v34 = l_Images_0[v36.icon.on];
        v35 = v36.label;
    else
        v33 = l_Images_0["icons/menu/chat_off"];
        v34 = l_Images_0["icons/menu/chat_on"];
        v35 = "CommonUI.Features.Label.Chat";
    end;
    local v37 = {
        page = v5.Chat, 
        iconImage = v33, 
        iconCheckedImage = v34, 
        labelText = v35, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = nil
    };
    local v38 = {
        page = v5.More, 
        iconImage = l_Images_0["icons/menu/more_off"], 
        iconCheckedImage = l_Images_0["icons/menu/more_on"], 
        labelText = "CommonUI.Features.Label.More", 
        actionType = nil, 
        badgeCount = nil
    };
    local v39 = nil;
    if l_FFlagEnableLeftNavOnConsole_0 then
        v39 = {
            page = v5.ViewFriends, 
            labelText = "Feature.SocialTab.Label.Connect", 
            iconImage = l_Images_0["icons/menu/friends"], 
            iconCheckedImage = l_Images_0["icons/menu/friendsOn"], 
            actionType = Enum.AppShellActionType.TapChatTab, 
            badgeCount = nil
        };
    end;
    if l_IsVRAppBuild_0() then
        v32.isSecondary = true;
        return {
            v27, 
            v37, 
            v38, 
            v32
        };
    elseif l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
        return {
            v27, 
            v32, 
            v39, 
            v38
        };
    elseif l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then
        return {
            v29, 
            v32, 
            v37, 
            v38
        };
    else
        return {
            v27, 
            v28, 
            v32, 
            v37, 
            v38
        };
    end;
end;
getBottomBarItems = function() --[[ Line: 158 ]] --[[ Name: getBottomBarItems ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), v22 (copy), v40 (copy)
    if not l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
        return v22;
    else
        return (v40());
    end;
end;
return function() --[[ Line: 168 ]]
    -- upvalues: l_GuiService_0 (copy), v21 (copy), v4 (copy), v5 (copy), v17 (copy), l_FFlagAppIaHomeSubTab_0 (copy)
    local v41 = {};
    local v42 = getBottomBarItems();
    if not l_GuiService_0:IsTenFootInterface() then
        local l_getCanSeeChatTab_0 = v21.getAppFeaturePolicies().getCanSeeChatTab;
        if l_getCanSeeChatTab_0 and not l_getCanSeeChatTab_0() then
            v42 = v4.List.filter(v42, function(v44) --[[ Line: 176 ]]
                -- upvalues: v5 (ref)
                return v44.page ~= v5.Chat;
            end);
        end;
    end;
    if v17 then
        v42 = v4.List.filter(v42, function(v45) --[[ Line: 183 ]]
            -- upvalues: v5 (ref)
            return v45.page ~= v5.More;
        end);
    end;
    for v46, v47 in ipairs(v42) do
        if l_FFlagAppIaHomeSubTab_0 and v47.subTabPages then
            for _, v49 in ipairs(v47.subTabPages) do
                v41[v49] = v46;
            end;
        else
            v41[v47.page] = v46;
        end;
    end;
    return v42, v41;
end;