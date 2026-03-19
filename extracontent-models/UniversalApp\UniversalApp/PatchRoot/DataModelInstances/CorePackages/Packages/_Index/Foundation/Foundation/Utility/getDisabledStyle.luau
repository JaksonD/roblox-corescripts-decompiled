local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if not v4 then
        return v3;
    else
        return {
            Color3 = v3.Color3, 
            Transparency = 1 - (1 - (v3.Transparency or 0)) * v1.DISABLED_TRANSPARENCY
        };
    end;
end;