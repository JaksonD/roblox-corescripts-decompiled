local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v6 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
return function() --[[ Line: 13 ]]
    -- upvalues: v6 (copy), v2 (copy), v3 (copy), l_Contexts_0 (copy), l_AppPage_0 (copy)
    local v7 = v6();
    return v2.useMemo(function() --[[ Line: 16 ]]
        -- upvalues: v7 (copy), v3 (ref), l_Contexts_0 (ref), l_AppPage_0 (ref)
        if v7.profileType == v3.ProfileTypes.Community then
            return l_Contexts_0.CommunityProfile;
        elseif v7.profileType == v3.ProfileTypes.User then
            return l_Contexts_0.PlayerProfile;
        else
            return l_AppPage_0.ProfilePlatform;
        end;
    end, {
        v7.profileType
    });
end;