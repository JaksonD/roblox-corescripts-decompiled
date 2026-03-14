local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useTimeoutBannerProps);
local v3 = require(script.Parent.TimeoutBanner);
return v1.memo(function(v4) --[[ Line: 16 ]] --[[ Name: TimeoutBannerContainer ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local v5 = v2(v4);
    return v1.createElement(v3, v5);
end);