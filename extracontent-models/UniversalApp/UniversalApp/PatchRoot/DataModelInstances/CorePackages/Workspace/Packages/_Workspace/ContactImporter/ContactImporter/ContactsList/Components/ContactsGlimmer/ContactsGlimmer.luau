local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Skeleton_0 = v1.Foundation.Skeleton;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v6 = l_Roact_0.PureComponent:extend("ContactsGlimmer");
v6.render = function(v7) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_Skeleton_0 (copy)
    local l_props_0 = v7.props;
    return l_withStyle_0(function(v9) --[[ Line: 28 ]]
        -- upvalues: l_Roact_0 (ref), l_props_0 (copy), v7 (copy), l_Skeleton_0 (ref)
        return l_Roact_0.createElement("Frame", {
            LayoutOrder = l_props_0.layoutOrder, 
            Size = UDim2.new(1, 0, 0, 72), 
            BackgroundTransparency = 1
        }, {
            entryContent = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                middleGroup = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, -68, 1, 0), 
                    BackgroundTransparency = 1, 
                    [l_Roact_0.Event.Activated] = v7.openBlankProfileView, 
                    LayoutOrder = 2, 
                    BackgroundColor3 = Color3.fromRGB(222, 22, 222)
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 10)
                    }), 
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 12)
                    }), 
                    PlayerName = l_Roact_0.createElement(l_Skeleton_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(90, 14)
                    }), 
                    ContextualInfo = l_Roact_0.createElement(l_Skeleton_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.fromOffset(160, 14)
                    })
                })
            }), 
            Divider = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v9.Theme.Divider.Color, 
                BackgroundTransparency = v9.Theme.Divider.Transparency
            })
        });
    end);
end;
return v6;