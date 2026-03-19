local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v7 = require(l_Modules_0.Common.RoactRodux);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v9 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.Luobu.Constants);
local v12 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v13 = v4.PureComponent:extend("TencentHelpWrapper");
v13.validateProps = v5.strictInterface({
    guiService = v5.union(v5.Instance, v5.table), 
    linking = v5.table, 
    openId = v5.string, 
    userId = v5.string
});
v13.render = function(v14) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_UserInputService_0 (copy), v12 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v16 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v16 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    if v16 then
        v14:broadcastNotification();
        return nil;
    else
        local l_linking_0 = v14.props.linking;
        local l_openId_0 = v14.props.openId;
        local l_userId_0 = v14.props.userId;
        local v20 = string.format("%s?sign=%s&uid=%s&c1=%s", "https://www.700chat.com/xv/web/static/chat/index.html", "37ef9b97d27505cf7010cde71be4b531abd89bc57750c3c8ec20dfdeab0d5d2d38342d82206c7c73b17486525a9637055bb161", l_openId_0, l_userId_0);
        v12(l_linking_0, v20);
        return;
    end;
end;
v13.broadcastNotification = function(v21) --[[ Line: 46 ]] --[[ Name: broadcastNotification ]]
    -- upvalues: v9 (copy), l_HttpService_0 (copy), v11 (copy)
    local l_SDK_OPEN_URL_0 = v9.SDK_OPEN_URL;
    local v23 = l_HttpService_0:JSONEncode({
        type = v11.TENCENT_SMART_HELP_CENTER
    });
    v21.props.guiService:BroadcastNotification(v23, l_SDK_OPEN_URL_0);
end;
v13 = l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    linking = l_AppLinking_0
})(v13);
return (v7.connect(function(v24, _) --[[ Line: 59 ]]
    return {
        userId = v24.LocalUserId, 
        openId = v24.Luobu.MSDKAuth.openId
    };
end)(v13));