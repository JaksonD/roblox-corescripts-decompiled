local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AnimatedVisibilityContext);
return function() --[[ Line: 11 ]] --[[ Name: useAnimatedVisibility ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useContext(v2);
    if not v3 then
        warn("useAnimatedVisibility must be used within a AnimatedVisibilityProvider");
        return nil;
    else
        return v3;
    end;
end;