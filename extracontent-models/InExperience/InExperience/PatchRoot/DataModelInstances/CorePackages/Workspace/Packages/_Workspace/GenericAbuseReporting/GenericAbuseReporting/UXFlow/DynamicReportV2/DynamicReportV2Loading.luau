local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Radius_0 = v1.Enums.Radius;
local l_Sheet_0 = v1.Sheet;
local l_Skeleton_0 = v1.Skeleton;
local l_View_0 = v1.View;
return v2.memo(function(_) --[[ Line: 20 ]] --[[ Name: DynamicReportV2Loading ]]
    -- upvalues: v2 (copy), l_Sheet_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_View_0 (copy)
    return v2.createElement(v2.Fragment, nil, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, 24), 
            radius = l_Radius_0.Medium
        })), 
        Content = v2.createElement(l_Sheet_0.Content, nil, v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-medium"
        }, {
            Title = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.8, 0, 0, 40), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            }), 
            Item1 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, 50), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            }), 
            Item2 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, 50), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 3
            }), 
            Item3 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, 50), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 4
            }), 
            Item4 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, 50), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 5
            }), 
            Item5 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, 50), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 6
            })
        }))
    });
end);