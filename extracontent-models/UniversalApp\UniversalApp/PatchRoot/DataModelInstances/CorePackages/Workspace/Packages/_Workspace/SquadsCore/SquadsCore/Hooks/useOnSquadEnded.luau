local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadId);
local v3 = require(l_Parent_0.React);
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_usePrevious_0 (copy), v3 (copy)
    local v6 = v2() or "";
    local v7 = l_usePrevious_0(v6) or "";
    v3.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v6 (copy), v7 (copy), v5 (copy)
        if v6 ~= v7 and v7 ~= "" and v5 then
            v5();
        end;
    end, {
        v6, 
        v5
    });
end;