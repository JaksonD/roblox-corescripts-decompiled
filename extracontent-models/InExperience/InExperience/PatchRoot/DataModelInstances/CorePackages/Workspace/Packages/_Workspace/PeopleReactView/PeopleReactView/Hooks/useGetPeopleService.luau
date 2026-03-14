local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.PeopleService);
return function(v3) --[[ Line: 7 ]] --[[ Name: useGetPeopleService ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (v1.useMemo(function() --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v3 (copy)
        return v2.getService(v3);
    end, {}));
end;