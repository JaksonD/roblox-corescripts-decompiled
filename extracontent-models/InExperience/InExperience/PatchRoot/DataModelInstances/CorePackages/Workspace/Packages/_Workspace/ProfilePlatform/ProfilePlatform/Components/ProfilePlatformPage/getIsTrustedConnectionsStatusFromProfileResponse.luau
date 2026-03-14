local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
return function(v3) --[[ Line: 6 ]] --[[ Name: getIsTrustedConnectionsStatusFromProfileResponse ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1(v3, (("responseBody.components.%*.contextual"):format(v2.Components.Actions)));
    local v5 = false;
    if v4 ~= nil then
        v5 = table.find(v4, v2.ProfileActions.RemoveTrustedConnection) ~= nil;
    end;
    return v5;
end;