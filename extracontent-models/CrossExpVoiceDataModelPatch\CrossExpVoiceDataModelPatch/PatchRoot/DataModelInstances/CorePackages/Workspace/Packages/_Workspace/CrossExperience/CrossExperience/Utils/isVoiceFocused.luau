local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.Constants);
local v2 = nil;
local v3 = false;
local function _() --[[ Line: 7 ]]
    -- upvalues: v3 (ref), v2 (ref)
    if not v3 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_0 and l_result_0 then
            v2 = l_result_0;
        end;
        v3 = true;
    end;
    return v2;
end;
return function() --[[ Line: 20 ]]
    -- upvalues: v3 (ref), v2 (ref), v1 (copy)
    if not v3 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 9 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_1 and l_result_1 then
            v2 = l_result_1;
        end;
        v3 = true;
    end;
    local l_v2_0 = v2;
    if not l_v2_0 then
        return false;
    else
        return l_v2_0:GetFocusedContextId() == v1.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
    end;
end;