local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.PromiseUtilities);
local v2 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAccountSettingsEmail);
local v3 = require(l_Modules_0.LuaApp.Thunks.ApiFetchPasswordStatus);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchFriendRequestsCount);
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUnreadMessageCount);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUnreadNotificationCount);
local v7 = require(l_Modules_0.LuaApp.Flags.FFlagEnablePasswordStatusRemoval);
return function(v8) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v7 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v1 (copy)
    return function(v9) --[[ Line: 14 ]]
        -- upvalues: v2 (ref), v8 (copy), v7 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v1 (ref)
        local v10 = {};
        table.insert(v10, v9:dispatch(v2(v8)));
        if not v7 then
            table.insert(v10, v9:dispatch(v3(v8)));
        end;
        table.insert(v10, v9:dispatch(v4(v8)));
        table.insert(v10, v9:dispatch(v5(v8)));
        table.insert(v10, v9:dispatch(v6(v8)));
        return v1.Batch(v10):andThen(function(v11) --[[ Line: 25 ]]
            -- upvalues: v1 (ref), v10 (copy)
            local l_failureCount_0 = v1.CountResults(v11).failureCount;
            if l_failureCount_0 ~= 0 then
                warn(string.format("%d of %d notification count fetching failed!", l_failureCount_0, #v10));
            end;
        end);
    end;
end;