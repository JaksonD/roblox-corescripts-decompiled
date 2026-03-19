local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactNavigation);
local v7 = require(l_Parent_0.UIBlox);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useEffect_0 = v5.useEffect;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_DarkTheme_0 = v7.App.Style.Themes.DarkTheme;
local l_useStyle_0 = v7.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local v15 = require(l_script_FirstAncestor_0.Context.LoginContextProvider);
local v16 = require(l_script_FirstAncestor_0.Navigators.LoginSwitchNavigator);
local v17 = {
    LIGHT = "lightcontent", 
    DEFAULT = "default"
};
local function v19(v18) --[[ Line: 33 ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy), l_NotificationType_0 (copy)
    if l_UserInputService_0:GetPlatform() == Enum.Platform.IOS then
        l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
            style = v18
        }), l_NotificationType_0.SET_STATUS_BAR_STYLE);
    end;
end;
local v21 = l_memoize_0(function(v20) --[[ Line: 45 ]]
    -- upvalues: v6 (copy)
    return v6.createAppContainer(v20);
end);
return function(v22) --[[ Line: 49 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useStyle_0 (copy), v21 (copy), v16 (copy), l_useEffect_0 (copy), l_DarkTheme_0 (copy), v17 (copy), v19 (copy), v5 (copy), v15 (copy)
    local v23 = l_useNavigation_0();
    local v24 = l_useStyle_0();
    local v25 = v21(v16);
    l_useEffect_0(function() --[[ Line: 56 ]]
        -- upvalues: v24 (copy), l_DarkTheme_0 (ref), v17 (ref), v19 (ref)
        local v26 = if v24.Theme == l_DarkTheme_0 then v17.LIGHT else v17.DEFAULT;
        v19(v26);
        return function() --[[ Line: 60 ]]
            -- upvalues: v19 (ref), v17 (ref)
            v19(v17.DEFAULT);
        end;
    end, {});
    return v5.createElement(v15, {
        parentNavigation = v23, 
        monoDeps = v22.monoDeps
    }, {
        NavigationAppContainer = v5.createElement(v25)
    });
end;