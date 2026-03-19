local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.Constants);
local v2 = require(l_script_FirstAncestor_0.Utils.observeCurrentContextId);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = nil;
    v2(function(v5) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v4 (ref), v3 (copy)
        local v6 = v5 == v1.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
        if v6 ~= v4 then
            v4 = v6;
            v3(v4);
        end;
    end);
end;