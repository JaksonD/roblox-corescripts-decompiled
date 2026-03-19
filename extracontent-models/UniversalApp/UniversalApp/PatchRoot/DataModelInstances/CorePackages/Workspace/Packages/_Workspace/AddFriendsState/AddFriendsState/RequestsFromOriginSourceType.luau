local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriendsState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Networking.FriendsNetworking);
return v2.createReducer({}, {
    [v5.GetFriendRequests.Succeeded.name] = function(v6, v7) --[[ Line: 16 ]]
        -- upvalues: v4 (copy), l_getDeepValue_0 (copy)
        local l_data_0 = v7.responseBody.data;
        local v12 = v4.List.foldLeft(l_data_0, function(v9, v10) --[[ Line: 19 ]]
            -- upvalues: l_getDeepValue_0 (ref)
            local v11 = l_getDeepValue_0(v10, "friendRequest.originSourceType");
            v9[tostring(v10.id)] = v11;
            return v9;
        end, {});
        return (v4.Dictionary.join(v6 or {}, v12));
    end
});