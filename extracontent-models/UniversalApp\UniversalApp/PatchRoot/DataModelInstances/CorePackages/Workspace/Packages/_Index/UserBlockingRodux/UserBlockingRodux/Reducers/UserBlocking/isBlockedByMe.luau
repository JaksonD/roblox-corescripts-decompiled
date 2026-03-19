local l_Parent_0 = script:FindFirstAncestor("UserBlockingRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.Cryo);
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_userBlockingNetworking_0 = v3.userBlockingNetworking;
    return v1.createReducer({}, {
        [l_userBlockingNetworking_0.BlockUserById.Succeeded.name] = function(v5, v6) --[[ Line: 13 ]]
            -- upvalues: v2 (ref)
            local v7 = tostring(v6.namedIds.users);
            return v2.Dictionary.join(v5, {
                [v7] = true
            });
        end, 
        [l_userBlockingNetworking_0.UnblockUserById.Succeeded.name] = function(v8, v9) --[[ Line: 19 ]]
            -- upvalues: v2 (ref)
            local v10 = tostring(v9.namedIds.users);
            return v2.Dictionary.join(v8, {
                [v10] = false
            });
        end, 
        [l_userBlockingNetworking_0.IsBlockedById.Succeeded.name] = function(v11, v12) --[[ Line: 25 ]]
            -- upvalues: v2 (ref)
            local v13 = tostring(v12.namedIds.users);
            local v14 = v12.responseBody or false;
            return v2.Dictionary.join(v11, {
                [v13] = v14
            });
        end
    });
end;