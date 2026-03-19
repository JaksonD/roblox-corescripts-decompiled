local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Rodux);
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
local v5 = require(l_Modules_0.LuaApp.Actions.SetFriendRequestsCount);
local v6 = require(l_Modules_0.LuaApp.Actions.SetUnreadMessageCount);
local v7 = require(l_Modules_0.LuaApp.Actions.SetEmailNotificationCount);
local v8 = require(l_Modules_0.LuaApp.Actions.SetPasswordNotificationCount);
local v9 = require(l_Modules_0.Luobu.Actions.SetTencentNoticeBadgeCount);
local v10 = require(l_Modules_0.Luobu.Actions.DecrementUnreadTencentNoticeCount);
local v11 = require(l_Modules_0.LuaApp.Components.EventReceivers.EventNetworking);
if settings():GetFFlag("FixCountOfUnreadNotificationError") then
    return v1.createReducer({
        TopBarNotificationIcon = 0, 
        MorePageMessages = 0, 
        MorePageFriends = 0, 
        MorePageEmailSettings = 0, 
        MorePagePasswordSettings = 0, 
        MorePageSettings = 0, 
        MorePageTencentUnreadNotice = 0
    }, {
        [v4.name] = function(v12, v13) --[[ Line: 30 ]]
            -- upvalues: v3 (copy)
            return v3.Dictionary.join(v12, {
                TopBarNotificationIcon = v13.notificationCount
            });
        end, 
        [v5.name] = function(v14, v15) --[[ Line: 35 ]]
            -- upvalues: v3 (copy)
            return v3.Dictionary.join(v14, {
                MorePageFriends = v15.count
            });
        end, 
        [v11.FriendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(v16, v17) --[[ Line: 41 ]]
            -- upvalues: v3 (copy)
            return v3.Dictionary.join(v16, {
                MorePageFriends = v17.responseBody.count
            });
        end, 
        [v6.name] = function(v18, v19) --[[ Line: 46 ]]
            -- upvalues: v3 (copy)
            return v3.Dictionary.join(v18, {
                MorePageMessages = v19.count
            });
        end, 
        [v7.name] = function(v20, v21) --[[ Line: 51 ]]
            -- upvalues: v3 (copy)
            return v3.Dictionary.join(v20, {
                MorePageEmailSettings = v21.count, 
                MorePageSettings = v21.count + v20.MorePagePasswordSettings
            });
        end, 
        [v8.name] = function(v22, v23) --[[ Line: 57 ]]
            -- upvalues: v3 (copy)
            return v3.Dictionary.join(v22, {
                MorePagePasswordSettings = v23.count, 
                MorePageSettings = v23.count + v22.MorePageEmailSettings
            });
        end, 
        [v9.name] = function(v24, v25) --[[ Line: 63 ]]
            -- upvalues: v3 (copy)
            return v3.Dictionary.join(v24, {
                MorePageTencentUnreadNotice = v25.count
            });
        end, 
        [v10.name] = function(v26, _) --[[ Line: 68 ]]
            -- upvalues: v3 (copy)
            local v28 = v26.MorePageTencentUnreadNotice - 1;
            return v3.Dictionary.join(v26, {
                MorePageTencentUnreadNotice = v28 > 0 and v28 or 0
            });
        end
    });
else
    return function(v29, v30) --[[ Line: 76 ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
        v29 = v29 or {
            TopBarNotificationIcon = 0, 
            MorePageMessages = 0, 
            MorePageFriends = 0, 
            MorePageEmailSettings = 0, 
            MorePagePasswordSettings = 0, 
            MorePageSettings = 0, 
            MorePageTencentUnreadNotice = 0
        };
        if v30.type == v4.name then
            v29.TopBarNotificationIcon = v30.notificationCount;
            return v29;
        elseif v30.type == v5.name then
            return v3.Dictionary.join(v29, {
                MorePageFriends = v30.count
            });
        elseif v30.type == v6.name then
            return v3.Dictionary.join(v29, {
                MorePageMessages = v30.count
            });
        elseif v30.type == v7.name then
            return v3.Dictionary.join(v29, {
                MorePageEmailSettings = v30.count, 
                MorePageSettings = v30.count + v29.MorePagePasswordSettings
            });
        elseif v30.type == v8.name then
            return v3.Dictionary.join(v29, {
                MorePagePasswordSettings = v30.count, 
                MorePageSettings = v30.count + v29.MorePageEmailSettings
            });
        elseif v30.type == v9.name then
            return v3.Dictionary.join(v29, {
                MorePageTencentUnreadNotice = v30.count
            });
        elseif v30.type == v10.name then
            local v31 = v29.MorePageTencentUnreadNotice - 1;
            return v3.Dictionary.join(v29, {
                MorePageTencentUnreadNotice = v31 > 0 and v31 or 0
            });
        else
            return v29;
        end;
    end;
end;