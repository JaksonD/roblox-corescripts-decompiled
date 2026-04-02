local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
return v1.memo(function(v5) --[[ Line: 23 ]] --[[ Name: EvidenceField ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Text_0 (copy)
    return v1.createElement(l_View_0, {
        tag = "size-full-0 auto-y col", 
        LayoutOrder = v5.layoutOrder
    }, {
        Label = v1.createElement(l_Text_0, {
            tag = "auto-xy text-title-medium text-align-x-left text-wrap content-emphasis", 
            Text = ("%*:"):format(v5.fieldLabel), 
            LayoutOrder = 1
        }), 
        Value = v1.createElement(l_Text_0, {
            tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
            Text = v5.fieldValue, 
            LayoutOrder = 2
        })
    });
end);