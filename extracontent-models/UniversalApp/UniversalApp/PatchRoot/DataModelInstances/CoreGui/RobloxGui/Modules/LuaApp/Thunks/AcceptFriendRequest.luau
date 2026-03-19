local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.FriendsPostAcceptFriendRequest);
local v4 = require(l_Modules_0.LuaApp.Actions.AddFriendStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v8, v9) --[[ Line: 10 ]] --[[ Name: AcceptFriendRequest ]]
    -- upvalues: v7 (copy), l_PerformFetch_0 (copy), v3 (copy), v4 (copy), v5 (copy), v2 (copy)
    v7.isType(v9, "string", "Thunks.AcceptFriendRequest.userId");
    return l_PerformFetch_0.Single("luaapp.friends.acceptfriendrequest." .. v9, function(v10) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v8 (copy), v9 (copy), v4 (ref), v5 (ref), v2 (ref)
        return v3(v8, v9):andThen(function(_) --[[ Line: 14 ]]
            -- upvalues: v10 (copy), v4 (ref), v9 (ref)
            v10:dispatch(v4(v9, Enum.FriendStatus.Friend));
        end, function(v12) --[[ Line: 16 ]]
            -- upvalues: v10 (copy), v5 (ref), v2 (ref)
            v10:dispatch(v5(v12));
            return v2.reject(v12);
        end);
    end);
end;