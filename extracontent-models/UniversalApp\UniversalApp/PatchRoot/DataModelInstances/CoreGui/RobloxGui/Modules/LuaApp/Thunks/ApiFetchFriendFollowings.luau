local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Result);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.FriendsPostFollowingExists);
local v6 = require(l_Modules_0.LuaApp.Actions.AddFriendFollowing);
return function(v7, v8) --[[ Line: 9 ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v4 (copy), v6 (copy), v2 (copy)
    return l_PerformFetch_0.Single("luaapp.friends.followings", function(v9) --[[ Line: 10 ]]
        -- upvalues: v5 (ref), v7 (copy), v8 (copy), v4 (ref), v6 (ref), v2 (ref)
        return v5(v7, v8):andThen(function(v10) --[[ Line: 11 ]]
            -- upvalues: v4 (ref), v9 (copy), v6 (ref), v2 (ref)
            if v10 and v10.responseBody and v10.responseBody.followings then
                local l_followings_0 = v10.responseBody.followings;
                if type(l_followings_0) ~= "table" then
                    return v4.error("ApiFetchFriendFollowings expects entries to be a table");
                else
                    for v12 = 1, #l_followings_0 do
                        local v13 = l_followings_0[v12];
                        if type(v13.userId) ~= "number" then
                            return v4.error("ApiFetchFriendFollowings expects entry.userId to be a number");
                        elseif type(v13.isFollowing) ~= "boolean" then
                            return v4.error("ApiFetchFriendFollowings expects entry.isFollowing to be a boolean");
                        else
                            v9:dispatch(v6(tostring(v13.userId), v13.isFollowing));
                        end;
                    end;
                    return v2.resolve(v10);
                end;
            else
                return v2.reject();
            end;
        end, function(v14) --[[ Line: 37 ]]
            -- upvalues: v2 (ref)
            return v2.reject(v14);
        end);
    end);
end;