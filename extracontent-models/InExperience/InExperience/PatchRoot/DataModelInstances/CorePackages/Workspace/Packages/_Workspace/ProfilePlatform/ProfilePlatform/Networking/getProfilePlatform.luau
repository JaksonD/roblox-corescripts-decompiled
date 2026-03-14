local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Http);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableLazyLoadingComponents);
local _ = require(l_Parent_0.SocialCommon);
local _ = require(l_script_FirstAncestor_0.Types.Component);
return v1.POST({
    Name = "GetProfile"
}, function(v8, v9) --[[ Line: 28 ]]
    -- upvalues: v3 (copy), v5 (copy)
    return v8(v3.Url.APIS_URL .. "profile-platform-api"):path("v1"):path("profiles"):path("get"):body({
        profileType = v9.profileType, 
        profileId = v9.profileId, 
        components = v9.components, 
        includeComponentOrdering = v9.includeComponentOrdering, 
        onlyEssentialComponents = if v5 then v9.onlyEssentialComponents else nil
    });
end);