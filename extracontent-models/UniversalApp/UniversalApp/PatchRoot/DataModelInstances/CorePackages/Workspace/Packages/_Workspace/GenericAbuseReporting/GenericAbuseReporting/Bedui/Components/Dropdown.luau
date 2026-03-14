local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v8 = require(l_script_FirstAncestor_0.Bedui.Components.ComponentSubtext);
local v9 = require(l_script_FirstAncestor_0.Common.DropdownWithPopover);
local v10 = require(l_script_FirstAncestor_0.Bedui.Provider.useFormData);
return v4.memo(function(v11) --[[ Line: 24 ]] --[[ Name: Dropdown ]]
    -- upvalues: v10 (copy), v4 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v9 (copy), v8 (copy)
    local l_updateForm_0 = v10().updateForm;
    local v14 = v4.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: v2 (ref), v11 (copy)
        return v2.List.map(v11.component.dropdown.items, function(v13) --[[ Line: 28 ]]
            return {
                text = v13.label or "", 
                value = v13.formDataValue
            };
        end);
    end, {
        v11.component.dropdown.items
    });
    local v16 = v4.useCallback(function(v15) --[[ Line: 36 ]]
        -- upvalues: l_updateForm_0 (copy), v11 (copy)
        l_updateForm_0(v11.component.formDataKey, v15);
    end, {
        v11.component.formDataKey
    });
    return v4.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-small", 
        LayoutOrder = v11.layoutOrder
    }, {
        Prompt = v4.createElement(l_Text_0, {
            Text = v11.component.dropdown.prompt, 
            tag = "auto-xy", 
            LayoutOrder = 0
        }), 
        DropdownMenuContainer = v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = 1, 
            ZIndex = 3
        }, {
            DropdownWithPopover = v4.createElement(v9, {
                placeholder = v11.component.dropdown.placeholder, 
                onChange = v16, 
                cellDatas = v14, 
                errorState = v11.isErrorState, 
                layoutOrder = 1
            }), 
            ComponentSubtext = v4.createElement(v8, {
                isErrorState = v11.isErrorState, 
                isOptional = v11.component.isOptional, 
                requirementMessage = v11.component.requirementMessage, 
                layoutOrder = 2
            })
        })
    });
end);