local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v2 = game:DefineFastFlag("EnableCommunityProfilePageIXPSetupEnabled_v4", false) and v1;
local v3 = game:DefineFastFlag("EnableCommunityProfilePageIXPEnabled", false);
local v4 = game:DefineFastFlag("EnableCommunityProfilePageIXPEnabledForAll", false);
local v5 = game:DefineFastString("EnableCommunityProfilePageExperimentLayer", "Social.CommunityProfileView");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local function v11(v9) --[[ Line: 20 ]] --[[ Name: isFeatureActive ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy)
    local v10 = (v9 or {})[v5] or {};
    return v4 or v3 and v10.enableCommunityProfilePage == true;
end;
return {
    EnableCommunityProfilePageExperimentLayer = v5, 
    FFlagIsSetupEnabled = v2, 
    isFeatureActive = v11, 
    useIsFeatureActive = function(v12) --[[ Line: 35 ]] --[[ Name: useIsFeatureActive ]]
        -- upvalues: l_useUserExperiment_0 (copy), v5 (copy), v11 (copy)
        return l_useUserExperiment_0({
            v5
        }, v11, if v12 then v12.isExposureEnabled else nil);
    end, 
    logExposure = function() --[[ Line: 42 ]] --[[ Name: logExposure ]]
        -- upvalues: l_IXPService_0 (copy), v5 (copy)
        l_IXPService_0:LogUserLayerExposure(v5);
    end
};