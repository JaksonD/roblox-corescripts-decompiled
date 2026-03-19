game:DefineFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6", false);
game:DefineFastFlag("SocialNetworksInEditProfileIXPEnabled", false);
local v0 = game:DefineFastString("SocialNetworksEditProfileIXPLayer", "Social.EditProfilePage");
local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v3 = {
    Control = "control", 
    VisibilityLast = "visibilityLast", 
    VisibilityFirst = "visibilityFirst"
};
local function v4() --[[ Line: 17 ]] --[[ Name: GetFFlagSocialNetworksInEditProfileIXPSetupEnabled ]]
    return game:GetFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6");
end;
local function _() --[[ Line: 21 ]] --[[ Name: GetFFlagSocialNetworksInEditProfileIXPEnabled ]]
    return game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled");
end;
local function v7(v6) --[[ Line: 25 ]] --[[ Name: getExperimentVariant ]]
    -- upvalues: v0 (copy), v3 (copy)
    if not game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled") then
        return nil;
    else
        return ((v6 or {})[v0] or {}).editSocialNetworks or v3.Control;
    end;
end;
return {
    GetFFlagSocialNetworksInEditProfileIXPSetupEnabled = v4, 
    getExperimentVariant = v7, 
    useGetExperimentVariant = function(v8) --[[ Line: 39 ]] --[[ Name: useGetExperimentVariant ]]
        -- upvalues: l_useUserExperiment_0 (copy), v0 (copy), v7 (copy)
        return l_useUserExperiment_0({
            v0
        }, v7, v8.isExposureEnabled);
    end, 
    Variants = v3
};