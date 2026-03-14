local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_View_0 = v2.View;
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v8 = require(l_script_FirstAncestor_0.Bedui.SingleStepInnerContentRenderer);
return v3.memo(function(v9) --[[ Line: 23 ]] --[[ Name: SingleStepContainer ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy), v8 (copy)
    local v10 = l_useTokens_0();
    local v11 = v9.contentConfig or v9.node.innerContentConfig;
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-medium"
    }, {
        Title = v3.createElement(l_Text_0, {
            Text = v9.node.title, 
            fontStyle = v10.Typography.HeadingLarge, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            tag = "auto-xy padding-bottom-medium", 
            LayoutOrder = 0
        }), 
        Subtitle = if v9.node.subtitle and #v9.node.subtitle > 0 then v3.createElement(l_Text_0, {
            Text = v9.node.subtitle, 
            fontStyle = v10.Typography.LabelLarge, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            tag = "auto-xy padding-bottom-medium", 
            LayoutOrder = 1
        }) else nil, 
        InnerContent = v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 2
        }, {
            InnerContentRenderer = v3.createElement(v8, {
                contentConfig = v11, 
                formDataKeysWithError = v9.formDataKeysWithError
            })
        })
    });
end);