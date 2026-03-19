local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.InExperienceInterventionEventReceiver);
local v5 = require(l_script_FirstAncestor_0.Reducers.InExperienceInterventionUIStateReducer);
local v6 = require(l_script_FirstAncestor_0.InExperienceInterventionDialogManager);
local v7 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
InExperienceInterventionContainer = function() --[[ Line: 12 ]] --[[ Name: InExperienceInterventionContainer ]]
    -- upvalues: v2 (copy), v5 (copy), v7 (copy), l_useLocalization_0 (copy), v3 (copy), v4 (copy), v6 (copy)
    local v9, v10 = v2.useReducer(v5, v7.InitialUIState);
    local v11 = l_useLocalization_0(v7.localizationKeys);
    local v14 = v2.useCallback(function(v12) --[[ Line: 18 ]]
        -- upvalues: v3 (ref), v10 (copy)
        local v13 = v3.Dictionary.join(v12, {
            dispatchTimestamp = DateTime.now().UnixTimestamp
        });
        v10(v13);
    end, {
        v10
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        EventReceiver = v2.createElement(v4, {
            uiStateDispatch = v14, 
            localizedText = v11
        }), 
        DialogManager = v2.createElement(v6, {
            uiState = v9, 
            uiStateDispatch = v14
        })
    });
end;
return InExperienceInterventionContainer;