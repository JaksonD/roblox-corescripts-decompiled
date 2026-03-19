local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useCallback_0 = v2.useCallback;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local v6 = require(l_Parent_0.Foundation);
local l_Button_0 = v6.Button;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
local l_View_0 = v6.View;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local v12 = require(l_script_FirstAncestor_0.Components.cta.ReactivationCoachmark);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapReactivationNotice);
return v2.memo(function(v15) --[[ Line: 30 ]] --[[ Name: ContinueButtonCta ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), l_useState_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v14 (copy), v2 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), v12 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v17, v18 = l_useState_0(nil);
    local v19 = l_useRef_0(nil);
    local v21 = l_useCallback_0(function(v20) --[[ Line: 38 ]]
        -- upvalues: v19 (copy), v18 (copy)
        v19.current = v20;
        v18(v20);
    end, {});
    if v14 then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = v15.layoutOrder or 1, 
            ref = v21
        }, {
            Button = v2.createElement(l_Button_0, {
                text = l_translations_0.continueButton, 
                onActivated = v15.goToNextPage, 
                variant = l_ButtonVariant_0.Emphasis, 
                size = l_InputSize_0.Medium, 
                isDisabled = v15.isDisabled or false, 
                width = UDim.new(1, 0), 
                testId = "continue-button"
            }), 
            Coachmark = v17 and v2.createElement(v12, {
                moderationDetail = v15.moderationDetail, 
                anchorRef = v19, 
                hasNavigatedForward = v15.hasNavigatedForward
            })
        });
    else
        return v2.createElement(l_Button_0, {
            text = l_translations_0.continueButton, 
            onActivated = v15.goToNextPage, 
            variant = l_ButtonVariant_0.Emphasis, 
            size = l_InputSize_0.Medium, 
            isDisabled = v15.isDisabled or false, 
            width = UDim.new(1, 0), 
            LayoutOrder = v15.layoutOrder or 1, 
            testId = "continue-button"
        });
    end;
end);