local l_Parent_0 = script:FindFirstAncestor("Groups").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Skeleton_0 = v2.Skeleton;
local l_Radius_0 = v2.Enums.Radius;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v7) --[[ Line: 19 ]] --[[ Name: GroupListItemSkeleton ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v8 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        tag = "row gap-large align-y-center padding-small radius-medium", 
        Size = UDim2.new(1, 0, 0, 54), 
        LayoutOrder = v7.layoutOrder
    }, {
        ThumbnailContainer = v1.createElement(l_View_0, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(38, 38)
        }, {
            ThumbnailSkeleton = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromScale(1, 1), 
                radius = l_Radius_0.Medium
            })
        }), 
        Details = v1.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "col size-full-0 auto-y fill gap-small"
        }, {
            NameSkeleton = v1.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.7, 0, 0, v8.Size.Size_350), 
                radius = l_Radius_0.Small, 
                LayoutOrder = 1
            }), 
            MetaSkeleton = v1.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.5, 0, 0, v8.Size.Size_250), 
                radius = l_Radius_0.Small, 
                LayoutOrder = 2
            })
        })
    });
end;