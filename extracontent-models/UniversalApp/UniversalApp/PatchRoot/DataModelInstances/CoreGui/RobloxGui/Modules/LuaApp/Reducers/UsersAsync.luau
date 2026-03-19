local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Actions.ReceivedAllFriends);
local l_ReceivedUserPresence_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Actions.ReceivedUserPresence;
local v4 = require(l_Modules_0.LuaApp.Actions.RequestAllFriends);
local v5 = require(l_Modules_0.LuaApp.Actions.RequestUserPresence);
local v6 = require(l_Modules_0.Common.Immutable);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy), v5 (copy), l_ReceivedUserPresence_0 (copy)
    v7 = v7 or {};
    if v8.type == v4.name then
        return v6.JoinDictionaries(v7, {
            allFriendsIsFetching = true
        });
    elseif v8.type == v2.name then
        return v6.JoinDictionaries(v7, {
            allFriendsIsFetching = false
        });
    elseif v8.type == v5.name then
        local v9 = v7[v8.userId] or {};
        return v6.JoinDictionaries(v7, {
            [v8.userId] = v6.JoinDictionaries(v9, {
                presenceIsFetching = true
            })
        });
    else
        if v8.type == l_ReceivedUserPresence_0.name then
            local v10 = v7[v8.userId];
            if v10 then
                return v6.JoinDictionaries(v7, {
                    [v8.userId] = v6.JoinDictionaries(v10, {
                        presenceIsFetching = false
                    })
                });
            end;
        end;
        return v7;
    end;
end;