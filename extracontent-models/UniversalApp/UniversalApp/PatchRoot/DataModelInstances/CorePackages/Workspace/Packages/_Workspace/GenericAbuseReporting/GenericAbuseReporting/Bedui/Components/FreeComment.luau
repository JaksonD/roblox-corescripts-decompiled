local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_View_0 = v2.View;
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v8 = require(l_script_FirstAncestor_0.Bedui.Components.ComponentSubtext);
local v9 = require(l_script_FirstAncestor_0.Common.CommentTextField);
local v10 = require(l_script_FirstAncestor_0.Bedui.Provider.useFormData);
return v3.memo(function(v11) --[[ Line: 24 ]] --[[ Name: FreeComment ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v10 (copy), l_View_0 (copy), l_Text_0 (copy), v9 (copy), v8 (copy)
    local v12 = l_useTokens_0();
    local v13, v14 = v3.useState("");
    local l_updateForm_0 = v10().updateForm;
    local v17 = v3.useCallback(function(v16) --[[ Line: 29 ]]
        -- upvalues: v14 (copy), l_updateForm_0 (copy), v11 (copy)
        v14(v16);
        l_updateForm_0(v11.component.formDataKey, v16);
    end, {
        l_updateForm_0, 
        v11.component.formDataKey
    });
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-small", 
        LayoutOrder = v11.layoutOrder
    }, {
        Prompt = v3.createElement(l_Text_0, {
            Text = v11.component.freeComment.prompt, 
            tag = "auto-xy", 
            LayoutOrder = 0
        }), 
        FreeCommentContainer = v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium", 
            LayoutOrder = 1
        }, {
            FreeComment = v3.createElement(v9, {
                text = v13, 
                placeholderText = v11.component.freeComment.placeholder, 
                backgroundColor3 = v12.Color.Shift.Shift_100.Color3, 
                backgroundTransparency = v12.Color.Shift.Shift_100.Transparency, 
                onUpdate = v17, 
                layoutOrder = 1
            })
        }), 
        ComponentSubtext = v3.createElement(v8, {
            isErrorState = v11.isErrorState, 
            isOptional = v11.component.isOptional, 
            requirementMessage = v11.component.requirementMessage, 
            layoutOrder = 2
        })
    });
end);