local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v4 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
game:DefineFastFlag("UniversalAppCameraEnabled5", false);
local v5 = require(l_Modules_0.AvatarExperience.Flags.FFlagUniversalAppCameraEnabledForAll);
local v6 = game:DefineFastString("UniversalAppCameraIXPLayer", l_AppUserLayers_0.CameraButton);
return v4.defineIXPTest({
    name = "CameraButton", 
    getDependentFlagsEnabled = function() --[[ Line: 23 ]] --[[ Name: getDependentFlagsEnabled ]]
        return game:GetEngineFeature("FacialAnimationStreaming2") and game:GetEngineFeature("VideoCaptureService");
    end, 
    layer = v6, 
    recordExposure = false, 
    getEnabledFlag = function() --[[ Line: 33 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("UniversalAppCameraEnabled5");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 37 ]] --[[ Name: getEnabledForAllFlag ]]
        -- upvalues: v5 (copy)
        return v5;
    end, 
    variables = {
        EnabledForUser = function(v7, v8) --[[ Line: 42 ]] --[[ Name: EnabledForUser ]]
            local l_cameraButtonEnabled_0 = v7.cameraButtonEnabled;
            return v8 or l_cameraButtonEnabled_0;
        end
    }
});