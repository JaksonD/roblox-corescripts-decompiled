local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
local v4 = require(l_Modules_0.LuaApp.Actions.SetFriendRequestsCount);
local v5 = require(l_Modules_0.LuaApp.Actions.SetUnreadMessageCount);
local v6 = require(l_Modules_0.LuaApp.Actions.SetEmailNotificationCount);
local v7 = require(l_Modules_0.LuaApp.Actions.SetPasswordNotificationCount);
local v8 = require(l_Modules_0.Luobu.Actions.SetTencentNoticeBadgeCount);
local v9 = require(l_Modules_0.Luobu.Actions.DecrementUnreadTencentNoticeCount);
return function(v10, v11) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    v10 = v10 or {
        TopBarNotificationIcon = 0, 
        MorePageMessages = 0, 
        MorePageFriends = 0, 
        MorePageEmailSettings = 0, 
        MorePagePasswordSettings = 0, 
        MorePageSettings = 0, 
        MorePageTencentUnreadNotice = 0
    };
    if v11.type == v3.name then
        v10.TopBarNotificationIcon = v11.notificationCount;
        return v10;
    elseif v11.type == v4.name then
        return v2.Dictionary.join(v10, {
            MorePageFriends = v11.count
        });
    elseif v11.type == v5.name then
        return v2.Dictionary.join(v10, {
            MorePageMessages = v11.count
        });
    elseif v11.type == v6.name then
        return v2.Dictionary.join(v10, {
            MorePageEmailSettings = v11.count, 
            MorePageSettings = v11.count + v10.MorePagePasswordSettings
        });
    elseif v11.type == v7.name then
        return v2.Dictionary.join(v10, {
            MorePagePasswordSettings = v11.count, 
            MorePageSettings = v11.count + v10.MorePageEmailSettings
        });
    elseif v11.type == v8.name then
        return v2.Dictionary.join(v10, {
            MorePageTencentUnreadNotice = v11.count
        });
    elseif v11.type == v9.name then
        local v12 = v10.MorePageTencentUnreadNotice - 1;
        return v2.Dictionary.join(v10, {
            MorePageTencentUnreadNotice = v12 > 0 and v12 or 0
        });
    else
        return v10;
    end;
end;