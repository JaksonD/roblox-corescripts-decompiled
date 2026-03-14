local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
return v2.memo(function(v9) --[[ Line: 21 ]] --[[ Name: ContinueButtonCta ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), v2 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    return v2.createElement(l_Button_0, {
        text = l_translations_0.continueButton, 
        onActivated = v9.goToNextPage, 
        variant = l_ButtonVariant_0.Emphasis, 
        size = l_InputSize_0.Medium, 
        isDisabled = v9.isDisabled or false, 
        width = UDim.new(1, 0), 
        LayoutOrder = v9.layoutOrder or 1, 
        testId = "continue-button"
    });
end);