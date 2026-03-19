local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
return v1.memo(function(v5) --[[ Line: 16 ]] --[[ Name: ComponentSubtext ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy)
    local v6 = l_useTokens_0();
    return v1.createElement(l_Text_0, {
        Text = v5.requirementMessage, 
        textStyle = if v5.isOptional then v6.Color.Content.Muted else v6.Color.System.Alert, 
        fontStyle = v6.Typography.CaptionMedium, 
        tag = "auto-xy", 
        Visible = not not v5.isOptional or v5.isErrorState and true or false, 
        LayoutOrder = v5.layoutOrder
    });
end);