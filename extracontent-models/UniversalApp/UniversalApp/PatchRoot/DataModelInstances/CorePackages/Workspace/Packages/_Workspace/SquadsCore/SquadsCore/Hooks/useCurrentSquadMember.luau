local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCurrentSquadSelector_0 = require(l_Parent_0.RoduxSquads).Hooks.useCurrentSquadSelector;
useCurrentSquadMember = function(v5) --[[ Line: 13 ]] --[[ Name: useCurrentSquadMember ]]
    -- upvalues: l_useCurrentSquadSelector_0 (copy), v1 (copy), v2 (copy), l_dependencyArray_0 (copy)
    local v6 = l_useCurrentSquadSelector_0();
    local v7 = v1.useMemo(function() --[[ Line: 15 ]]
        -- upvalues: v6 (copy)
        if v6 then
            return v6.members;
        else
            return {};
        end;
    end, {
        v6
    });
    return (v1.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v2 (ref), v7 (copy), v5 (copy)
        local v9 = v2.List.findWhere(v7, function(v8) --[[ Line: 23 ]]
            -- upvalues: v5 (ref)
            return v8.userId == v5;
        end);
        if v9 then
            return v7[v9];
        else
            return nil;
        end;
    end, l_dependencyArray_0(v7, v5)));
end;
return useCurrentSquadMember;