local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Divider_0 = v2.Divider;
local l_Icon_0 = v2.Icon;
local l_Enums_0 = v2.Enums;
return v1.memo(function(v7) --[[ Line: 23 ]] --[[ Name: InfoTableCell ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Divider_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy)
    local v8 = (v7.numColumns or 1) == 1;
    return v1.createElement(l_View_0, {
        tag = "col size-full-0 auto-y", 
        onActivated = v7.onActivated, 
        testId = v7.testId
    }, {
        TopDivider = if not v8 then v1.createElement(l_Divider_0, {
            LayoutOrder = 1
        }) else nil, 
        LabelValueContainer = v1.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = {
                ["row size-full-0 auto-y flex-x-between gap-medium padding-y-large"] = v8, 
                ["col size-full-0 auto-y padding-y-medium"] = not v8
            }
        }, {
            Label = v7.labelComponent, 
            ValueContainer = v1.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = {
                    ["row size-0-full auto-xy fill align-x-right"] = v8, 
                    ["row size-full-0 auto-y"] = not v8
                }
            }, {
                Value = v7.valueComponent, 
                ChevronIcon = if v7.onActivated then v1.createElement(l_Icon_0, {
                    name = l_Enums_0.IconName.ChevronSmallRight
                }) else nil
            })
        }), 
        BottomDivider = if not v7.isLastInSingleColumn and v8 then v1.createElement(l_Divider_0, {
            LayoutOrder = 3
        }) else nil
    });
end);