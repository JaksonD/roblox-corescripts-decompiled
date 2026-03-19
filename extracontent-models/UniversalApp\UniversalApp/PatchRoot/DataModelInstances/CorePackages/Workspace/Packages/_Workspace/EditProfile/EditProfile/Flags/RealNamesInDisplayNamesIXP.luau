local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local v2 = game:DefineFastString("RealNamesInDisplayNamesIXP_v1", "Social.DisplayNameSetting");
local v3 = game:DefineFastString("RealNamesInDisplayNamesExperimentDefinition", "can_see_real_names");
local v4 = game:DefineFastFlag("RealNamesInDisplayNamesEnabledForAll", false);
local l_useUserExperiment_0 = v1.useUserExperiment;
local function v7(v6) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    if v4 then
        return true;
    else
        return ((v6 or {})[v2] or {})[v3] == true;
    end;
end;
return {
    isExperimentEnabled = v7, 
    useIsExperimentEnabled = function(v8) --[[ Line: 25 ]] --[[ Name: useIsExperimentEnabled ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy), v7 (copy)
        return l_useUserExperiment_0({
            v2
        }, v7, v8.isExposureEnabled);
    end
};