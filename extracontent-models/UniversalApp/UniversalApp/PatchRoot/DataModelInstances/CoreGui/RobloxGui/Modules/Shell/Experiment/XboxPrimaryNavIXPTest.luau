local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v2 = require(script.Parent.makeExperiment);
local v3 = game:DefineFastFlag("XboxPrimaryNavABIXPEnabled", false);
local v4 = game:DefineFastFlag("XboxPrimaryNavABIXPEnrolledForAll", false);
local v5 = game:DefineFastString("XboxPrimaryNavABIXPVariable", "tenFootPrimaryNavEnabled");
local v6 = {};
local function v8(v7) --[[ Line: 29 ]] --[[ Name: setExperimentState ]]
    -- upvalues: v6 (ref)
    v6 = v7;
end;
local function v9() --[[ Line: 33 ]] --[[ Name: isEnrolledForAll ]]
    -- upvalues: v4 (copy)
    return v4;
end;
local function v10() --[[ Line: 37 ]] --[[ Name: isEnabled ]]
    -- upvalues: v4 (copy), v3 (copy)
    return v4 or v3;
end;
local function v11() --[[ Line: 41 ]] --[[ Name: isUserEnrolled ]]
    -- upvalues: v4 (copy), v3 (copy), v6 (ref), l_AppUserLayers_0 (copy), v5 (copy)
    if v4 then
        return true;
    elseif not (v4 or v3) then
        return false;
    else
        return (v6[l_AppUserLayers_0.XboxClassicUILayer] or {})[v5] or false;
    end;
end;
local v12 = v2("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer");
return {
    isEnabled = v10, 
    isEnrolledForAll = v9, 
    isUserEnrolled = v11, 
    layer = l_AppUserLayers_0.XboxClassicUILayer, 
    experiment = v12, 
    setExperimentState = v8
};