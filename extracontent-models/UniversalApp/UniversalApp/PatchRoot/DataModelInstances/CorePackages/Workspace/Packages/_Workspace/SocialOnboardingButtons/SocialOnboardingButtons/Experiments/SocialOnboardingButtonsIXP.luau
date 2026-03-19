local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Enums.ColorVariantsEnum);
local l_useUserExperiment_0 = require(l_Parent_1.RoactAppExperiment).useUserExperiment;
local l_FStringSocialOnboardingExperimentLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialOnboardingExperimentLayer;
local v5 = game:DefineFastString("SocialOnboardingEnabledVariableName", "socialOnboardingBtnsEnabled");
local v6 = game:DefineFastString("SocialOnboardingColorVariableName", "socialOnboardingBtnsColor");
local v7 = game:DefineFastString("SocialOnboardingButtonsVariableName", "socialOnboardingButtons");
local v8 = game:DefineFastString("SocialOnboardingHideAfterSignupVariableNam", "hideAfterSignup");
local function v10(v9) --[[ Line: 19 ]]
    -- upvalues: l_FStringSocialOnboardingExperimentLayer_0 (copy), v5 (copy)
    return (v9[l_FStringSocialOnboardingExperimentLayer_0] or {})[v5] or false;
end;
local function v12(v11) --[[ Line: 24 ]]
    -- upvalues: l_FStringSocialOnboardingExperimentLayer_0 (copy), v6 (copy), v2 (copy)
    return (v11[l_FStringSocialOnboardingExperimentLayer_0] or {})[v6] or v2.Default;
end;
local function v14(v13) --[[ Line: 29 ]]
    -- upvalues: l_FStringSocialOnboardingExperimentLayer_0 (copy), v7 (copy)
    return (v13[l_FStringSocialOnboardingExperimentLayer_0] or {})[v7] or "";
end;
local function v16(v15) --[[ Line: 34 ]]
    -- upvalues: l_FStringSocialOnboardingExperimentLayer_0 (copy), v8 (copy)
    return (v15[l_FStringSocialOnboardingExperimentLayer_0] or {})[v8] or false;
end;
return {
    useSocialOnboardingBtnsEnabled = function() --[[ Line: 40 ]] --[[ Name: useSocialOnboardingBtnsEnabled ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_FStringSocialOnboardingExperimentLayer_0 (copy), v10 (copy)
        return l_useUserExperiment_0({
            l_FStringSocialOnboardingExperimentLayer_0
        }, v10);
    end, 
    useSocialOnboardingBtnsColor = function() --[[ Line: 43 ]] --[[ Name: useSocialOnboardingBtnsColor ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_FStringSocialOnboardingExperimentLayer_0 (copy), v12 (copy)
        return l_useUserExperiment_0({
            l_FStringSocialOnboardingExperimentLayer_0
        }, v12);
    end, 
    useSocialOnboardingBtnsOrder = function() --[[ Line: 46 ]] --[[ Name: useSocialOnboardingBtnsOrder ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_FStringSocialOnboardingExperimentLayer_0 (copy), v14 (copy)
        return l_useUserExperiment_0({
            l_FStringSocialOnboardingExperimentLayer_0
        }, v14);
    end, 
    useSocialOnboardingBtnsHideAfterSignup = function() --[[ Line: 49 ]] --[[ Name: useSocialOnboardingBtnsHideAfterSignup ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_FStringSocialOnboardingExperimentLayer_0 (copy), v16 (copy)
        return l_useUserExperiment_0({
            l_FStringSocialOnboardingExperimentLayer_0
        }, v16);
    end
};