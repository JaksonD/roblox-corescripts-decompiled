local l_Parent_0 = script:FindFirstAncestor("PeopleService").Parent;
local v1 = require(l_Parent_0.Signals);
createPersonStore = function(v2) --[[ Line: 14 ]] --[[ Name: createPersonStore ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.createSignal(0);
    return {
        getPerson = function() --[[ Line: 18 ]] --[[ Name: getPerson ]]
            -- upvalues: v2 (copy)
            return v2;
        end, 
        getOrder = v3, 
        setOrder = v4
    };
end;
return createPersonStore;