local l_script_FirstAncestor_0 = script:FindFirstAncestor("ApolloPresence");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_fragments_0 = require(l_Parent_0.ApolloLocalState).fragments;
local v3 = require(l_script_FirstAncestor_0.Formatters);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: updateUserPresenceCache ]]
    -- upvalues: l_fragments_0 (copy), v3 (copy)
    return (v4.cache:writeFragment({
        id = v4.cache:identify({
            __typename = "UserPresence", 
            id = v5.id
        }), 
        fragment = l_fragments_0.userPresenceAllFields, 
        data = v3.formatUserPresence(v5)
    }));
end;