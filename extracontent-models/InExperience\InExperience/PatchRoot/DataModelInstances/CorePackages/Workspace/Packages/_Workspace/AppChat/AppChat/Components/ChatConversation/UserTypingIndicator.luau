local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v7 = v1.PureComponent:extend("UserTypingIndicator");
local v8 = {
    dampingRatio = 1.5, 
    frequency = 1.6
};
v7.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    LayoutOrder = 1, 
    Position = UDim2.new(0, 0, 0, 0), 
    ZIndex = 1, 
    usersTyping = {}, 
    oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...", 
    twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...", 
    severalUsersTyping = "PLACEHOLDER Several users are typing...", 
    maxCharacterLength = 160, 
    height = 40
};
v7.init = function(v9) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v3 (copy), v8 (copy)
    v9.getDisplayText = function() --[[ Line: 33 ]]
        -- upvalues: v9 (copy)
        if v9.props.usersTyping then
            if #v9.props.usersTyping == 1 then
                return v9.props.oneUserTyping;
            elseif #v9.props.usersTyping == 2 then
                return v9.props.twoUsersTyping;
            elseif #v9.props.usersTyping > 2 then
                return v9.props.severalUsersTyping;
            end;
        end;
        return "";
    end;
    local v10, v11 = v1.createBinding(1);
    v9.motor = v3.createSingleMotor(1);
    v9.motor:start();
    v9.motor:onStep(v11);
    v9.animationProgress = v10;
    v9.updateAnimationGoal = function() --[[ Line: 54 ]]
        -- upvalues: v9 (copy), v3 (ref), v8 (ref)
        local v12 = #v9.props.usersTyping > 0 and 0 or 1;
        v9.motor:setGoal(v3.spring(v12, v8));
    end;
    v9.updateAnimationGoal();
end;
v7.didUpdate = function(v13, v14, _) --[[ Line: 62 ]] --[[ Name: didUpdate ]]
    if #v14.usersTyping ~= #v13.props.usersTyping then
        v13.updateAnimationGoal();
    end;
end;
v7.render = function(v16) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    return l_withStyle_0(function(v17) --[[ Line: 69 ]]
        -- upvalues: v1 (ref), v16 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        local l_Font_0 = v17.Font;
        local l_Font_1 = l_Font_0.Footer.Font;
        local v20 = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize;
        return v1.createElement("Frame", {
            AnchorPoint = v16.props.AnchorPoint, 
            BackgroundTransparency = 1, 
            LayoutOrder = v16.props.LayoutOrder, 
            Position = v16.props.Position, 
            Size = UDim2.new(1, 0, 0, v16.props.height), 
            ZIndex = v16.props.ZIndex
        }, {
            Layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            ImageContainer = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0.9, 0, 1, 0), 
                BackgroundColor3 = v17.Theme.NavigationBar.Color, 
                BorderColor3 = v17.Theme.Divider.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                Image = l_Images_0["component_assets/circle_17"], 
                ImageColor3 = v17.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v16.animationProgress:map(function(v21) --[[ Line: 104 ]]
                    return v21;
                end), 
                Position = v16.animationProgress:map(function(v22) --[[ Line: 107 ]]
                    return UDim2.new(0, 0, v22, 0);
                end)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingTop = UDim.new(0, 4), 
                    PaddingBottom = UDim.new(0, 4), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                TextLabel = v1.createElement("TextLabel", {
                    Text = v16.getDisplayText(), 
                    TextSize = v20, 
                    Font = l_Font_1, 
                    TextColor3 = v17.Theme.TextMuted.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    TextTransparency = v16.animationProgress:map(function(v23) --[[ Line: 133 ]]
                        return v23;
                    end)
                })
            })
        });
    end);
end;
v7.willUnmount = function(v24) --[[ Line: 142 ]] --[[ Name: willUnmount ]]
    if v24.motor then
        v24.motor:destroy();
    end;
end;
return v7;