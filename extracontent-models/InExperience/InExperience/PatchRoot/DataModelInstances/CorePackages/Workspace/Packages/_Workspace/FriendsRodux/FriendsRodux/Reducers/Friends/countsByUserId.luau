local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.roduxFriendsTypes);
local v5 = {};
return function(v6) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy)
    local l_friendsNetworking_0 = v6.friendsNetworking;
    return v2.createReducer(v5, {
        [l_friendsNetworking_0.GetFriendsCountFromUserId.Succeeded.name] = function(v8, v9) --[[ Line: 12 ]]
            -- upvalues: v3 (ref)
            local v10 = tostring(v9.namedIds.users);
            return v3.Dictionary.union(v8, {
                [v10] = v9.responseBody.count
            });
        end
    });
end;