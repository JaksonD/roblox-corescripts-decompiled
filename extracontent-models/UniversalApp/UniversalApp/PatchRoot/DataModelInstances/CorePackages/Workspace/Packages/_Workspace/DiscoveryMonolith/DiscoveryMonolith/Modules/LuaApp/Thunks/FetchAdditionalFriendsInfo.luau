local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_ApiFetchUsersPresences_0 = require(l_Parent_0.UserLib).Thunks.ApiFetchUsersPresences;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v3 (copy), l_ApiFetchUsersPresences_0 (copy)
    return function(v6) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v5 (copy), v3 (ref), l_ApiFetchUsersPresences_0 (ref), v4 (copy)
        local v8 = v2.List.map(v5, function(v7) --[[ Line: 9 ]]
            return (tostring(v7.id));
        end);
        return v3.all({
            v6:dispatch(l_ApiFetchUsersPresences_0(v4, v8))
        });
    end;
end;