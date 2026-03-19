local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Promise);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_Radius_0 = v4.Enums.Radius;
local l_Skeleton_0 = v4.Skeleton;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v8 = v2.PureComponent:extend("SendButton");
v8.defaultProps = {
    sendText = "Send", 
    sentText = "Sent!", 
    sendingText = "Sending..", 
    failedText = "Failed", 
    sentStatus = nil, 
    isLoading = false, 
    onActivated = function() --[[ Line: 27 ]] --[[ Name: onActivated ]]
        -- upvalues: v1 (copy)
        return v1.resolve();
    end
};
v8.render = function(v9) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Text_0 (copy), v2 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    return v3.Style.withStyle(function(v10) --[[ Line: 33 ]]
        -- upvalues: v9 (copy), l_Text_0 (ref), v2 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        local v11 = nil;
        v11 = if v9.props.sentStatus == "sent" then v9.props.sentText else if v9.props.sentStatus == "sending" then v9.props.sendingText else if v9.props.sentStatus == "failed" then v9.props.failedText else v9.props.sendText;
        local l_Font_0 = v10.Font.Body.Font;
        local v13 = v10.Font.BaseSize * v10.Font.Body.RelativeSize;
        local v14 = l_Text_0.GetTextWidth(v11, l_Font_0, v13);
        local v15 = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            inactiveButton = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextSize = v13, 
                TextColor3 = v10.Theme.TextDefault.Color, 
                TextTransparency = v10.Theme.TextDefault.Transparency, 
                Font = l_Font_0, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                Text = v11
            })
        });
        local v16 = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            activeButton = v2.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                ImageColor3 = v10.Theme.SecondaryDefault.Color, 
                ImageTransparency = v10.Theme.SecondaryDefault.Transparency, 
                Image = "rbxasset:///textures/ui/LuaDiscussions/buttonStroke.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 8, 8), 
                Size = UDim2.new(1, 0, 1, 0), 
                [v2.Event.Activated] = v9.props.onActivated
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                interior = v2.createElement("Frame", {
                    BackgroundColor3 = v10.Theme.BackgroundUIDefault.Color, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -2, 1, -2)
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Label = v2.createElement("TextLabel", {
                        Size = UDim2.new(0, v14, 0, v13), 
                        BackgroundTransparency = 1, 
                        Text = v11, 
                        Font = l_Font_0, 
                        TextSize = v13, 
                        TextColor3 = v10.Theme.SecondaryContent.Color, 
                        TextTransparency = v10.Theme.SecondaryContent.Transparency
                    })
                })
            })
        });
        return not v9.props.isLoading and v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v14 + 14, 0, 32)
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            element = v9.props.sentStatus and v15 or v16
        }) or v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(0, v14 + 14, 0, 32), 
            radius = l_Radius_0.Small
        });
    end);
end;
return v8;