local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_ImageSetLabel_0 = v1.UIBlox.Core.ImageSet.ImageSetLabel;
local v4 = l_Roact_0.PureComponent:extend("AvatarCircle");
v4.PresetSize = {
    Size36x36 = "Size36x36", 
    Size48x48 = "Size48x48"
};
local v5 = {
    [v4.PresetSize.Size36x36] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png", 
    [v4.PresetSize.Size48x48] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
};
v4.defaultProps = {
    thumbnails = {}, 
    onActivated = nil, 
    circleColor3 = Color3.new(0.9, 0.9, 0.9), 
    circleTransparency = 0, 
    circleInteriorBackgroundColor3 = Color3.new(0.8, 0.8, 0.8), 
    circleInteriorBackgroundTransparency = 0, 
    circleDividerColor3 = Color3.new(0.7, 0.7, 0.7), 
    circleDividerTransparency = 0, 
    overlaySize = v4.PresetSize.Size48x48, 
    presenceImage = nil, 
    presenceIndicatorSize = 14
};
local function v7(v6) --[[ Line: 43 ]] --[[ Name: createAlignedContainerElement ]]
    -- upvalues: l_Roact_0 (copy)
    return {
        layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = v6, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
end;
v4.generateThumbnails = function(v8, v9) --[[ Line: 54 ]] --[[ Name: generateThumbnails ]]
    -- upvalues: l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v7 (copy)
    local v10 = #v9;
    local v11 = v10 / 2;
    local v12 = v10 % 2 == 0 and v11 or math.floor(v11);
    local v13 = v10 - v12;
    local v14 = nil;
    if v10 == 1 then
        v14 = if v8.props.showNewPresenceImage then l_Roact_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v8.props.presenceIndicatorSize, 0, v8.props.presenceIndicatorSize), 
            BackgroundTransparency = 1, 
            Image = v8.props.presenceImage, 
            ImageColor3 = v8.props.presenceImageColor3, 
            ImageTransparency = v8.props.presenceImageTransparency
        }) else l_Roact_0.createElement("ImageLabel", {
            Size = UDim2.new(0, v8.props.presenceIndicatorSize, 0, v8.props.presenceIndicatorSize), 
            BackgroundTransparency = 1, 
            Image = v8.props.presenceImage
        });
    end;
    local v15 = v7(Enum.HorizontalAlignment.Right);
    local v16 = v7(Enum.HorizontalAlignment.Left);
    local v17 = v7(Enum.HorizontalAlignment.Center);
    for v18, v19 in ipairs(v9) do
        local v20 = nil;
        local v21 = 0;
        local v22 = nil;
        local v23 = nil;
        if v10 == 1 then
            v20 = UDim2.new(1, 0, 1, 0);
            v22 = v17;
        elseif v18 <= v12 then
            v20 = UDim2.new(1 / v12, 0, 1 / v12, 0);
            v22 = v15;
            if v10 == 3 then
                v21 = 0.125;
            elseif v10 == 2 then
                v21 = 0.125;
            end;
            v23 = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                border = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.new(0, 0, 1, -1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v8.props.circleDividerColor3, 
                    BackgroundTransparency = v8.props.circleDividerTransparency
                }), 
                borderVertical = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.new(0, -1, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v8.props.circleDividerColor3, 
                    BackgroundTransparency = v8.props.circleDividerTransparency
                })
            });
        else
            v20 = UDim2.new(1 / v13, 0, 1 / v13, 0);
            v22 = v16;
            if v10 == 2 then
                v21 = -0.125;
            end;
            v23 = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                border = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.new(0, 0, 0, -1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v8.props.circleDividerColor3, 
                    BackgroundTransparency = v8.props.circleDividerTransparency
                }), 
                borderVertical = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.new(0, -1, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v8.props.circleDividerColor3, 
                    BackgroundTransparency = v8.props.circleDividerTransparency
                })
            });
        end;
        v22["thumbnail-" .. tostring(v18 + 1)] = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v20, 
            ClipsDescendants = true, 
            LayoutOrder = #v22 + 1
        }, {
            headshotContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(v21, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                headshot = l_Roact_0.createElement("ImageLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v19
                })
            }), 
            borderObject = v23
        });
    end;
    return {
        rightElements = v16, 
        leftElements = v15, 
        centerElements = v17, 
        presenceIndicator = v14
    };
end;
v4.render = function(v24) --[[ Line: 195 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_Roact_0 (copy)
    local l_thumbnails_0 = v24.props.thumbnails;
    local v26 = v5[v24.props.overlaySize];
    local v27 = v24:generateThumbnails(l_thumbnails_0);
    return l_Roact_0.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v24.props.circleInteriorBackgroundColor3, 
        BackgroundTransparency = v24.props.circleInteriorBackgroundTransparency, 
        BorderSizePixel = 0, 
        Image = "", 
        AutoButtonColor = false, 
        ClipsDescendants = true, 
        [l_Roact_0.Event.Activated] = v24.props.onActivated
    }, {
        imageMask = l_Roact_0.createElement("ImageLabel", {
            Image = v26, 
            ImageColor3 = v24.props.circleColor3, 
            ImageTransparency = v24.props.circleTransparency, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            presenceFrame = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                presenceIndicator = v27.presenceIndicator
            })
        }), 
        center = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            elementContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v27.centerElements)
        }), 
        left = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, -1, 1, 0), 
            Position = UDim2.new(-0.5, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            elementContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v27.leftElements)
        }), 
        right = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, -1, 1, 0), 
            Position = UDim2.new(0.5, -2, 0, 0), 
            BackgroundTransparency = 1
        }, {
            elementContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v27.rightElements)
        })
    });
end;
return v4;