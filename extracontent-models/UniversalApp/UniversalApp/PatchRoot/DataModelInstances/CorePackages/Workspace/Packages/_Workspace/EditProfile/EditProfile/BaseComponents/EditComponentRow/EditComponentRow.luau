local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Radius_0 = v2.Enums.Radius;
local l_Skeleton_0 = v2.Skeleton;
local l_IconName_0 = v2.Enums.IconName;
local l_IconSize_0 = v2.Enums.IconSize;
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v11) --[[ Line: 26 ]] --[[ Name: EditComponentRow ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Text_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = string.gsub(v11.currentValue, "\n", " ");
    return v1.createElement(l_View_0, {
        tag = "row size-full-1100 padding-medium align-y-center flex-x-between gap-medium", 
        LayoutOrder = v11.layoutOrder, 
        onActivated = v11.onActivated, 
        ref = v11.forwardRef
    }, {
        TitleText = v1.createElement(l_Text_0, {
            tag = "text-title-medium content-emphasis auto-xy", 
            Text = v11.label, 
            LayoutOrder = 1
        }), 
        EditButton = if v11.shouldShimmer then v1.createElement(l_Skeleton_0, {
            LayoutOrder = 3, 
            Size = UDim2.new(0.3, 0, 0, v12.Size.Size_400), 
            radius = l_Radius_0.Medium
        }) else v1.createElement(l_View_0, {
            tag = "row size-0-full fill align-y-center align-x-right gap-xsmall", 
            LayoutOrder = 2
        }, {
            CurrentText = v1.createElement(l_View_0, {
                tag = "row size-0-full fill align-y-center align-x-right", 
                LayoutOrder = 1
            }, {
                v1.createElement(l_Text_0, {
                    tag = "text-body-small text-truncate-end size-0-full auto-x", 
                    Text = v13
                })
            }), 
            EditIcon = v1.createElement(l_Icon_0, {
                name = l_IconName_0.ChevronLargeRight, 
                size = l_IconSize_0.Medium, 
                LayoutOrder = 2
            })
        })
    });
end;