local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Fragment_0 = v2.Fragment;
local l_useState_0 = v2.useState;
local l_useCallback_0 = v2.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_Parent_0.Foundation);
local l_Checkbox_0 = v7.Checkbox;
local l_InputSize_0 = v7.Enums.InputSize;
local v10 = require(l_script_FirstAncestor_0.Components.cta.ContinueButtonCta);
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
return v2.memo(function(v14) --[[ Line: 28 ]] --[[ Name: UnderstandImportanceContinueCta ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v2 (copy), l_Fragment_0 (copy), l_Checkbox_0 (copy), l_InputSize_0 (copy), v10 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v16, v17 = l_useState_0(false);
    local v19 = l_useCallback_0(function(v18) --[[ Line: 32 ]]
        -- upvalues: v17 (copy)
        v17(v18);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {} else l_dependencyArray_0());
    return v2.createElement(l_Fragment_0, nil, {
        AcknowledgementCheckbox = v2.createElement(l_Checkbox_0, {
            isChecked = v16, 
            size = l_InputSize_0.Small, 
            onActivated = v19, 
            label = l_translations_0.acknowledgementCheckboxLabel, 
            LayoutOrder = 1
        }), 
        ContinueButton = v2.createElement(v10, {
            moderationDetail = v14.moderationDetail, 
            dispatch = v14.dispatch, 
            isDisabled = not v16, 
            LogoutThunk = v14.LogoutThunk, 
            goToNextPage = v14.goToNextPage, 
            layoutOrder = 2
        })
    });
end);