local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v5) --[[ Line: 19 ]] --[[ Name: useEntities ]]
    -- upvalues: v2 (copy)
    return (v2.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v5 (copy)
        local v6 = {};
        for _, v8 in v5 do
            v6[v8.id] = v8;
        end;
        return {
            entitiesMap = v6
        };
    end, {
        v5
    }));
end;