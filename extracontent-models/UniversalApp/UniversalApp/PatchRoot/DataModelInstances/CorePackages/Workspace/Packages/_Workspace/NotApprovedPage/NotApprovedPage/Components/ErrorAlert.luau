local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Icon_0 = v3.Icon;
local l_IconButton_0 = v3.IconButton;
local l_InputSize_0 = v3.Enums.InputSize;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local v12 = require(l_Parent_0.BuilderIcons);
local l_CircleX_0 = v12.Icon.CircleX;
local l_IconVariant_0 = v12.IconVariant;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
return v2.memo(function(v16) --[[ Line: 31 ]] --[[ Name: ErrorAlert ]]
    -- upvalues: l_useTokens_0 (copy), l_useNotApprovedPageContext_0 (copy), v2 (copy), l_View_0 (copy), l_Icon_0 (copy), l_CircleX_0 (copy), l_InputSize_0 (copy), l_IconVariant_0 (copy), l_Text_0 (copy), l_IconButton_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v17 = l_useTokens_0();
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    return v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y row flex-between gap-medium padding-medium radius-medium align-y-center stroke-standard stroke-system-alert", 
        backgroundStyle = {
            Color3 = v17.Color.System.Alert.Color3, 
            Transparency = 0.9
        }, 
        LayoutOrder = v16.layoutOrder or 1, 
        testId = "error-alert"
    }, {
        Container = v2.createElement(l_View_0, {
            tag = "auto-xy row gap-small align-y-center", 
            LayoutOrder = 1
        }, {
            Icon = v2.createElement(l_Icon_0, {
                name = l_CircleX_0, 
                size = l_InputSize_0.Medium, 
                variant = l_IconVariant_0.Filled, 
                style = v17.Color.System.Alert, 
                LayoutOrder = 1
            }), 
            Text = v2.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap content-emphasis", 
                Text = l_translations_0.errorMessage, 
                LayoutOrder = 2
            })
        }), 
        Button = v2.createElement(l_IconButton_0, {
            icon = "x-small", 
            variant = l_ButtonVariant_0.Utility, 
            isCircular = true, 
            onActivated = v16.onClose, 
            LayoutOrder = 2, 
            size = l_ButtonSize_0.Small
        })
    });
end);