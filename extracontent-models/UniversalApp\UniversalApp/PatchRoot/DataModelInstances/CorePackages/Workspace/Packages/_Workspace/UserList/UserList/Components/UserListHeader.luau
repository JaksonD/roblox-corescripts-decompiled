local l_Parent_0 = script:FindFirstAncestor("UserList").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Enums_0 = v2.Enums;
local l_Icon_0 = v2.Icon;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_IconButton_0 = v2.IconButton;
local l_IconName_0 = l_Enums_0.IconName;
local l_IconSize_0 = l_Enums_0.IconSize;
local l_IconVariant_0 = l_Enums_0.IconVariant;
return function(v11) --[[ Line: 26 ]] --[[ Name: UserListHeader ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Text_0 (copy), l_Enums_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_IconVariant_0 (copy), l_IconButton_0 (copy)
    return v1.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-xxsmall align-x-left", 
        LayoutOrder = v11.layoutOrder
    }, {
        HeaderRow = v1.createElement(l_View_0, {
            tag = "size-full-0 auto-y row align-y-center flex-x-between padding-right-xsmall", 
            LayoutOrder = 1
        }, {
            TitleRow = v1.createElement(l_View_0, {
                tag = "auto-xy row align-y-center gap-xxsmall", 
                onActivated = if v11.onTitleActivated then v11.onTitleActivated else nil, 
                LayoutOrder = 1
            }, {
                Title = v11.title and v1.createElement(l_Text_0, {
                    tag = "text-title-large auto-xy text-align-x-left content-emphasis", 
                    Text = v11.title, 
                    stateLayer = {
                        affordance = l_Enums_0.StateLayerAffordance.None
                    }, 
                    LayoutOrder = 1
                }), 
                Chevron = v11.hasChevron and v1.createElement(l_Icon_0, {
                    name = l_IconName_0.ChevronLargeRight, 
                    size = l_IconSize_0.Small, 
                    variant = l_IconVariant_0.Filled, 
                    LayoutOrder = 2
                })
            }), 
            TrailingIcon = v11.trailingIcon and v11.onTrailingIconActivated and v1.createElement(l_IconButton_0, {
                icon = v11.trailingIcon, 
                size = l_IconSize_0.Small, 
                onActivated = v11.onTrailingIconActivated, 
                LayoutOrder = 2
            })
        }), 
        Subtitle = v11.subtitle and v1.createElement(l_Text_0, {
            tag = "text-body-medium auto-xy text-align-x-left content-default text-wrap", 
            Text = v11.subtitle, 
            LayoutOrder = 2
        })
    });
end;