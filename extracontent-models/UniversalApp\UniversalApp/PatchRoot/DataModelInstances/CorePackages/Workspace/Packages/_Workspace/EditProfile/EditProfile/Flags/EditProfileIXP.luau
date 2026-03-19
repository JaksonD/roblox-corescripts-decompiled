local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local l_getFStringSelfProfileView_0 = require(l_Parent_0.SharedFlags).getFStringSelfProfileView;
local l_useUserExperiment_0 = v1.useUserExperiment;
local v4 = require(script.Parent.FFlagEditProfileSetupNewExperimentFlow);
local v5 = game:DefineFastString("EditProfileExperimentKey", "can_view_edit_profile");
local function v8(v6) --[[ Line: 11 ]]
    -- upvalues: l_getFStringSelfProfileView_0 (copy), v4 (copy), v5 (copy)
    local v7 = (v6 or {})[l_getFStringSelfProfileView_0()] or {};
    if v4 then
        return v7[v5] == true;
    else
        return v7.can_view_edit_profile == true;
    end;
end;
return {
    isExperimentEnabled = v8, 
    useIsExperimentEnabled = function(v9) --[[ Line: 25 ]] --[[ Name: useIsExperimentEnabled ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_getFStringSelfProfileView_0 (copy), v8 (copy)
        return l_useUserExperiment_0({
            l_getFStringSelfProfileView_0()
        }, v8, if v9 then v9.isExposureEnabled else nil);
    end
};