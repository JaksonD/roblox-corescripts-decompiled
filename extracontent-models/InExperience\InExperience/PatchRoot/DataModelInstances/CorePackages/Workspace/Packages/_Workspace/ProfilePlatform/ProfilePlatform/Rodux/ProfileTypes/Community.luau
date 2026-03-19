local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v5 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local v6 = require(l_script_FirstAncestor_0.Rodux.ProfileTypes.mergeProfileStateAndResponse);
return v2.createReducer({}, {
    [v5.Succeeded.name] = function(v7, v8) --[[ Line: 13 ]]
        -- upvalues: v3 (copy), v6 (copy)
        local l_responseBody_0 = v8.responseBody;
        if l_responseBody_0.profileType ~= v3.ProfileTypes.Community then
            return v7;
        else
            return v6(v7, l_responseBody_0);
        end;
    end
});