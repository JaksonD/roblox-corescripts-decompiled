local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_Icon_0 = v4.Icon;
local l_IconSize_0 = v4.Enums.IconSize;
local l_Text_0 = v4.Text;
local l_useTokens_0 = v4.Hooks.useTokens;
local v10 = require(l_Parent_0.BuilderIcons);
local l_TriangleExclamation_0 = v10.Icon.TriangleExclamation;
local l_IconVariant_0 = v10.IconVariant;
return v3.memo(function(v13) --[[ Line: 28 ]] --[[ Name: SuspensionDurationAlert ]]
    -- upvalues: l_useTokens_0 (copy), l_useNotApprovedPageContext_0 (copy), v3 (copy), l_View_0 (copy), l_Icon_0 (copy), l_TriangleExclamation_0 (copy), l_IconSize_0 (copy), l_IconVariant_0 (copy), l_Text_0 (copy)
    local v14 = l_useTokens_0();
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y row gap-medium padding-medium align-y-center stroke-thick stroke-default radius-medium bg-shift-100", 
        LayoutOrder = v13.layoutOrder, 
        testId = "suspension-duration-alert"
    }, {
        Icon = v3.createElement(l_Icon_0, {
            name = l_TriangleExclamation_0, 
            size = l_IconSize_0.Medium, 
            variant = l_IconVariant_0.Filled, 
            style = v14.Color.System.Warning, 
            LayoutOrder = 1
        }), 
        Text = v3.createElement(l_View_0, {
            tag = "auto-xy row gap-xsmall", 
            LayoutOrder = 2
        }, {
            Label = v3.createElement(l_Text_0, {
                tag = "auto-xy text-title-medium content-emphasis text-align-x-left text-wrap", 
                Text = l_translations_0.suspensionLabel, 
                LayoutOrder = 1
            }), 
            Value = v3.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = v13.timeRemaining, 
                LayoutOrder = 2
            })
        })
    });
end);