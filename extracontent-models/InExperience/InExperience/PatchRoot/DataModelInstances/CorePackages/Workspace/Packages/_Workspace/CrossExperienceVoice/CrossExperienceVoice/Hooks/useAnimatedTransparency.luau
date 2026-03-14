local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.Hooks.useSequentialAnimation);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v5, v6 = v1(v2);
    return v5, function(v7) --[[ Line: 8 ]] --[[ Name: animate ]]
        -- upvalues: v6 (copy), v3 (copy), v4 (copy)
        v6({
            {
                value = v7, 
                durationInMs = v3, 
                easingStyle = v4
            }
        }, nil);
    end;
end;