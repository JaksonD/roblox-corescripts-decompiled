local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.wiring.isWirable);
local _ = require(l_script_FirstAncestor_0.wiring.types);
return function(v3) --[[ Line: 8 ]] --[[ Name: toWirableInstance ]]
    -- upvalues: v1 (copy)
    if v3 and v1(v3) then
        return v3;
    else
        return nil;
    end;
end;