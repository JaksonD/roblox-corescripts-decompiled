local l_Parent_0 = script:FindFirstAncestor("ApolloPresence").Parent;
local l_fragments_0 = require(l_Parent_0.ApolloLocalState).fragments;
return function(v2, v3) --[[ Line: 11 ]] --[[ Name: getUserPresenceByUserId ]]
    -- upvalues: l_fragments_0 (copy)
    return (v2.cache:readFragment({
        id = v2.cache:identify({
            __typename = "UserPresence", 
            id = v3.userId
        }), 
        fragment = l_fragments_0.userPresenceAllFields
    }));
end;