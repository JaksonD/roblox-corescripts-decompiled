local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local v4 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v5 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v6 = require(l_script_FirstAncestor_0.Components.About.parseSectionsFromData);
return function() --[[ Line: 10 ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v2 (copy), v6 (copy)
    local l_profileType_0 = v5().profileType;
    local v8 = v4(v3.Components.About) or {};
    local v9 = v2.useMemo(function() --[[ Line: 15 ]]
        -- upvalues: v6 (ref), v8 (copy), l_profileType_0 (copy), v3 (ref)
        return v6(v8, l_profileType_0, if l_profileType_0 == v3.ProfileTypes.User and v8.name then ("@%*"):format(v8.name) else v8.name or "");
    end, {
        v8, 
        l_profileType_0, 
        v8.name
    });
    return {
        aboutDetails = v8, 
        aboutSections = v9
    };
end;