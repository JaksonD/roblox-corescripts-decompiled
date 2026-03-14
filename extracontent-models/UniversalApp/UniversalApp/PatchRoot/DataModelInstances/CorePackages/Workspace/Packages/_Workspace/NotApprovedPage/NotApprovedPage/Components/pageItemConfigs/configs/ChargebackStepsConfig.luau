local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VERIFICATION_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.VERIFICATION_TYPES;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Foundation);
local l_Text_0 = v6.Text;
local l_View_0 = v6.View;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
return {
    getIsVisible = function(v11) --[[ Line: 67 ]] --[[ Name: getIsVisible ]]
        -- upvalues: l_VERIFICATION_TYPES_0 (copy)
        local l_verificationCategory_0 = v11.verificationCategory;
        local v13 = true;
        if l_verificationCategory_0 ~= l_VERIFICATION_TYPES_0.Parent then
            v13 = l_verificationCategory_0 == l_VERIFICATION_TYPES_0.Email;
        end;
        return v13;
    end, 
    renderComponent = v5.memo(function(v14) --[[ Line: 30 ]] --[[ Name: ChargebackSteps ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), l_VERIFICATION_TYPES_0 (copy), v5 (copy), l_View_0 (copy), v10 (copy), l_Text_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local v16 = if v14.moderationDetail.verificationCategory == l_VERIFICATION_TYPES_0.Parent then l_translations_0.parentReactivationNotice else l_translations_0.emailReactivationNotice;
        return v5.createElement(l_View_0, {
            tag = {
                ["size-full-0 auto-y col gap-small"] = true, 
                ["gap-medium"] = v10
            }, 
            LayoutOrder = v14.layoutOrder
        }, {
            Heading = v5.createElement(l_Text_0, {
                Text = l_translations_0.chargebackNextSteps, 
                tag = {
                    ["auto-xy text-title-large text-align-x-left text-wrap"] = true, 
                    ["text-heading-medium content-emphasis"] = v10
                }, 
                LayoutOrder = 1
            }), 
            Content = v5.createElement(l_Text_0, {
                Text = v16, 
                tag = {
                    ["auto-xy text-align-x-left text-wrap"] = true, 
                    ["text-body-large"] = v10, 
                    ["text-body-medium"] = not v10
                }, 
                LayoutOrder = 2
            })
        });
    end)
};