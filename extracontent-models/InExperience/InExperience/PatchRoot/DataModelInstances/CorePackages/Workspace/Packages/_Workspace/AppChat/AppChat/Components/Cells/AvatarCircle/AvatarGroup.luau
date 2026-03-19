local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Common.Frame);
local v4 = require(l_script_FirstAncestor_0.Components.Common.UIListLayout);
local v5 = require(script.Parent.AvatarThumbnail);
local v6 = require(script.Parent.CircleMask);
return function(v7) --[[ Line: 26 ]] --[[ Name: AvatarGroup ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v8 = #v7.thumbnails;
    local v9 = v8 / 2;
    local v10 = v8 % 2 == 0 and v9 or math.floor(v9);
    local v11 = v8 - v10;
    local v12 = {};
    local v13 = {};
    for v14, v15 in v7.thumbnails do
        local v16 = nil;
        local v17 = 0;
        local v18 = nil;
        local v19 = nil;
        if v14 <= v10 then
            v16 = UDim2.new(1 / v10, 0, 1 / v10, 0);
            v18 = v12;
            if v8 == 3 then
                v17 = 0.125;
            elseif v8 == 2 then
                v17 = 0.125;
            end;
            v19 = v2.createElement(v3, {
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, {
                border = v2.createElement(v3, {
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.new(0, 0, 1, -1), 
                    BackgroundColor3 = v7.circleDividerColor3, 
                    BackgroundTransparency = v7.circleDividerTransparency
                }), 
                borderVertical = v2.createElement(v3, {
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.new(0, -1, 0, 0), 
                    BackgroundColor3 = v7.circleDividerColor3, 
                    BackgroundTransparency = v7.circleDividerTransparency
                })
            });
        else
            v16 = UDim2.new(1 / v11, 0, 1 / v11, 0);
            v18 = v13;
            if v8 == 2 then
                v17 = -0.125;
            end;
            v19 = v2.createElement(v3, {
                ZIndex = 2
            }, {
                border = v2.createElement(v3, {
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.new(0, 0, 0, -1), 
                    BackgroundColor3 = v7.circleDividerColor3, 
                    BackgroundTransparency = v7.circleDividerTransparency
                }), 
                borderVertical = v2.createElement(v3, {
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.new(0, -1, 0, 0), 
                    BackgroundColor3 = v7.circleDividerColor3, 
                    BackgroundTransparency = v7.circleDividerTransparency
                })
            });
        end;
        v18["thumbnail-" .. tostring(v14)] = v2.createElement(v3, {
            Size = v16, 
            ClipsDescendants = true, 
            LayoutOrder = v14
        }, {
            headshotContainer = v2.createElement(v3, {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(v17, 0, 0, 0)
            }, {
                headshot = v2.createElement(v5, {
                    thumbnail = v15
                })
            }), 
            borderObject = v19
        });
    end;
    local v20 = v2.createElement(v2.Fragment, {}, {
        uiCorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        left = v2.createElement(v3, {
            Size = UDim2.new(1, -1, 1, 0), 
            Position = UDim2.fromScale(-0.5, 0)
        }, {
            elementContainer = v2.createElement(v3, {
                Size = UDim2.fromScale(1, 1)
            }, {
                layout = v2.createElement(v4, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                })
            }, v12)
        }), 
        right = v2.createElement(v3, {
            Size = UDim2.new(1, -1, 1, 0), 
            Position = UDim2.new(0.5, -2, 0, 0)
        }, {
            elementContainer = v2.createElement(v3, {
                Size = UDim2.fromScale(1, 1)
            }, {
                layout = v2.createElement(v4, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                })
            }, v13)
        })
    });
    return v2.createElement(v6, {
        circleColor3 = v7.circleColor3, 
        circleTransparency = v7.circleTransparency, 
        circleInteriorBackgroundColor3 = v7.circleInteriorBackgroundColor3, 
        circleInteriorBackgroundTransparency = v7.circleInteriorBackgroundTransparency, 
        circleDividerColor3 = v7.circleDividerColor3, 
        circleDividerTransparency = v7.circleDividerTransparency, 
        LayoutOrder = v7.LayoutOrder, 
        overlaySize = v7.overlaySize, 
        onActivated = v7.onActivated, 
        selectable = v7.selectable
    }, {
        fragment = v20
    });
end;