local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.Hooks.useGetPeopleService);
return function(v5, v6) --[[ Line: 9 ]] --[[ Name: useInExperienceCombinedName ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v7 = v4("PeopleListStore");
    local v8 = v2.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v7 (copy), v5 (copy)
        return v7.getProfile(v5);
    end, {
        v5
    });
    return v3.useSignalBinding(v8):map(function(v9) --[[ Line: 18 ]]
        -- upvalues: v6 (copy)
        if v9 and string.len(v9) > 0 then
            return v9;
        else
            return v6;
        end;
    end);
end;