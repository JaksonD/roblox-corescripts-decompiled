game:DefineFastFlag("InternationalNamesIXPSetupEnabled_v2", false);
game:DefineFastFlag("InternationalNamesIXPEnabled", false);
game:DefineFastFlag("InternationalNamesEnabledForAll", false);
local v0 = game:DefineFastString("InternationalNamesIXPLayer", "Social.InternationalDisplayName");
local v1 = game:DefineFastString("InternationalNamesIXPExperimentDefinition", "enableInternationalNames");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local function v5() --[[ Line: 16 ]] --[[ Name: internationalNamesIXPSetupEnabled ]]
    return game:GetFastFlag("InternationalNamesIXPSetupEnabled_v2");
end;
local function _() --[[ Line: 20 ]] --[[ Name: internationalNamesExperimentEnabled ]]
    return game:GetFastFlag("InternationalNamesIXPEnabled");
end;
local function _() --[[ Line: 24 ]] --[[ Name: internationalNamesEnabledForAll ]]
    return game:GetFastFlag("InternationalNamesEnabledForAll");
end;
local function v10(v8) --[[ Line: 28 ]] --[[ Name: isExperimentEnabled ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v9 = (v8 or {})[v0] or {};
    return game:GetFastFlag("InternationalNamesIXPEnabled") and v9[v1] == true or game:GetFastFlag("InternationalNamesEnabledForAll");
end;
return {
    FFlagIsSetupEnabled = v5, 
    FFlagIsExperimentEnabled = v10, 
    useIsExperimentEnabled = function(v11) --[[ Line: 41 ]] --[[ Name: useIsExperimentEnabled ]]
        -- upvalues: l_useUserExperiment_0 (copy), v0 (copy), v10 (copy)
        local v12 = v11 or {
            isExposureEnabled = false
        };
        return l_useUserExperiment_0({
            v0
        }, v10, v12.isExposureEnabled);
    end, 
    logExposure = function() --[[ Line: 45 ]] --[[ Name: logExposure ]]
        -- upvalues: l_IXPService_0 (copy), v0 (copy)
        l_IXPService_0:LogUserLayerExposure(v0);
    end
};