local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.FriendsPostRequestFriendship);
local v4 = require(l_Modules_0.LuaApp.Actions.AddFriendStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v8, v9, v10) --[[ Line: 10 ]] --[[ Name: RequestFriendship ]]
    -- upvalues: v7 (copy), l_PerformFetch_0 (copy), v3 (copy), v4 (copy), v5 (copy), v2 (copy)
    v7.isType(v9, "string", "Thunks.RequestFriendship.userId");
    return l_PerformFetch_0.Single("luaapp.friends.requestfriendship." .. v9, function(v11) --[[ Line: 13 ]]
        -- upvalues: v10 (copy), v3 (ref), v8 (copy), v9 (copy), v4 (ref), v5 (ref), v2 (ref)
        local v12 = v10 or "PlayerSearch";
        return (v3(v8, v9, v12):andThen(function(v13) --[[ Line: 15 ]]
            -- upvalues: v11 (copy), v4 (ref), v9 (ref)
            if v13 and v13.responseBody and v13.responseBody.success == true then
                v11:dispatch(v4(v9, Enum.FriendStatus.FriendRequestSent));
            end;
            return v13;
        end, function(v14) --[[ Line: 20 ]]
            -- upvalues: v11 (copy), v5 (ref), v2 (ref)
            v11:dispatch(v5(v14));
            return v2.reject(v14);
        end));
    end);
end;