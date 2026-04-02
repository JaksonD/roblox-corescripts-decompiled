local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.RoduxSquads);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useCurrentSquadSelector_0 = v4.Hooks.useCurrentSquadSelector;
useCurrentSquadMember = function(v7) --[[ Line: 15 ]] --[[ Name: useCurrentSquadMember ]]
    -- upvalues: l_useCurrentSquadSelector_0 (copy), v1 (copy), v2 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v8 = l_useCurrentSquadSelector_0();
    local v9 = v1.useMemo(function() --[[ Line: 17 ]]
        -- upvalues: v8 (copy)
        if v8 then
            return v8.members;
        else
            return {};
        end;
    end, {
        v8
    });
    return (v1.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: v2 (ref), v9 (copy), v7 (copy)
        local v11 = v2.List.findWhere(v9, function(v10) --[[ Line: 26 ]]
            -- upvalues: v7 (ref)
            return v10.userId == v7;
        end);
        if v11 then
            return v9[v11];
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v9, 
        v7
    } else l_dependencyArray_0(v9, v7)));
end;
return useCurrentSquadMember;