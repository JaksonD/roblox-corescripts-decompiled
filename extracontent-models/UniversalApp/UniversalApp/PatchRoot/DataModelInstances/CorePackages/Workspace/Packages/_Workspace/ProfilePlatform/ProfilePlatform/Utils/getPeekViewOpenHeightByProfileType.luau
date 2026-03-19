local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Constants);
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v3 == v2.ProfileTypes.Community then
        return v1.COMMUNITY_PEEK_VIEW_OPEN_HEIGHT;
    else
        return v1.USER_PEEK_VIEW_OPEN_HEIGHT;
    end;
end;