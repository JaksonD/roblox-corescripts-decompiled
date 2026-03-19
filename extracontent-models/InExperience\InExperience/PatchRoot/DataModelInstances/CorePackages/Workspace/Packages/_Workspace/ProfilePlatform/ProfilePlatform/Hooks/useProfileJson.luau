local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v5 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
return function() --[[ Line: 10 ]]
    -- upvalues: v5 (copy), l_useSelector_0 (copy), v4 (copy), v3 (copy)
    local v6 = v5();
    local l_profileId_0 = v6.profileId;
    local l_profileType_0 = v6.profileType;
    return l_useSelector_0(function(v9) --[[ Line: 15 ]]
        -- upvalues: v4 (ref), v3 (ref), l_profileType_0 (copy), l_profileId_0 (copy)
        return v4(v9, (("%*.Profiles.%*.%*"):format(v3.RODUX_KEY, l_profileType_0, l_profileId_0))) or {};
    end);
end;