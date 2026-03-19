local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableLazyLoadingComponents);
return function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy)
    local v8 = v4(v6, (("%*"):format(v7.profileId))) or {};
    local v9 = if v5 and v7.onlyEssentialComponents then v8.componentOrdering or v7.componentOrdering else v7.componentOrdering or v8.componentOrdering;
    local v10 = v8.components or {};
    local v11 = v2.Dictionary.join(v10, v7.components);
    local v12 = {
        profileType = v7.profileType, 
        profileId = v7.profileId, 
        componentOrdering = v9, 
        components = v11
    };
    return v2.Dictionary.join(v6, {
        [v7.profileId] = v12
    });
end;