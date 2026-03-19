local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.Hooks.useBackgroundExperience);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v2 = v1();
    local v3 = v2 and v2.jobId;
    local v4 = false;
    if v3 ~= nil then
        v4 = v3 ~= "";
    end;
    return v4;
end;