local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_script_FirstAncestor_0.Hooks.useProfileJson);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3();
    return v2(v5, (("components.%*"):format(v4))) or {};
end;