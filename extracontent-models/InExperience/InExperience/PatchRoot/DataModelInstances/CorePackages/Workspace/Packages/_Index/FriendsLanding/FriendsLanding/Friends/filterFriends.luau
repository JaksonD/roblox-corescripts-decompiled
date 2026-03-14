local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
local v5 = require(l_script_FirstAncestor_0.Friends.filterToPresence);
local v6 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v7 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
return function(v8, v9) --[[ Line: 10 ]]
    -- upvalues: l_t_0 (copy), l_llama_0 (copy), v6 (copy), v5 (copy), v7 (copy), l_PresenceType_0 (copy)
    assert(l_t_0.table(v8), "friends should be a table");
    assert(l_t_0.string(v9), "filter should be a string");
    return l_llama_0.List.filter(v8, function(v10) --[[ Line: 14 ]]
        -- upvalues: v9 (copy), v6 (ref), v5 (ref), v7 (ref), l_PresenceType_0 (ref), l_llama_0 (ref)
        if v9 == v6.Inactive then
            return v10.isInactiveFriend;
        else
            local v11 = v5(v9);
            local v12 = v7(v10) or l_PresenceType_0.Offline;
            return l_llama_0.List.includes(v11, v12);
        end;
    end);
end;