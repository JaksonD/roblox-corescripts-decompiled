local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.RoactRodux);
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = v2.PureComponent:extend("NoticeListCell");
v5.validateProps = v4.strictInterface({
    screenWidth = v4.number, 
    Size = v4.UDim2, 
    Position = v4.UDim2, 
    LayoutOrder = v4.number, 
    onActivated = v4.callback, 
    item = v4.table, 
    dateText = v4.string, 
    noticeReadStatus = v4.table
});
v5.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    LayoutOrder = 1
};
v5.eventDisconnect = function(v6) --[[ Line: 36 ]] --[[ Name: eventDisconnect ]]
    if v6.onAbsolutePositionChanged then
        v6.onAbsolutePositionChanged:disconnect();
        v6.onAbsolutePositionChanged = nil;
    end;
end;
v5.onButtonUp = function(v7) --[[ Line: 43 ]] --[[ Name: onButtonUp ]]
    if v7.state.buttonPressed then
        v7:setState({
            buttonPressed = false
        });
    end;
    v7:eventDisconnect();
end;
v5.onButtonDown = function(v8) --[[ Line: 52 ]] --[[ Name: onButtonDown ]]
    if v8.state.buttonPressed then
        return;
    else
        v8:eventDisconnect();
        local l_current_0 = v8.buttonRef.current;
        if l_current_0 then
            v8.onAbsolutePositionChanged = l_current_0:GetPropertyChangedSignal("AbsolutePosition"):connect(function() --[[ Line: 59 ]]
                -- upvalues: v8 (copy)
                v8:onButtonUp();
            end);
        end;
        v8:setState({
            buttonPressed = true
        });
        return;
    end;
end;
v5.init = function(v10) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v10.state = {
        buttonPressed = false
    };
    v10.buttonRef = v2.createRef();
    v10.onButtonInputBegan = function(_, v12) --[[ Line: 73 ]]
        -- upvalues: v10 (copy)
        local v13 = v12.UserInputState == Enum.UserInputState.Begin;
        local v14 = v12.UserInputType == Enum.UserInputType.Touch;
        local v15 = v12.UserInputType == Enum.UserInputType.MouseButton1;
        if v13 and (v14 or v15) then
            v10:onButtonDown();
        end;
    end;
    v10.onButtonInputEnded = function() --[[ Line: 81 ]]
        -- upvalues: v10 (copy)
        v10:onButtonUp();
    end;
    v10.onButtonActivated = function() --[[ Line: 84 ]]
        -- upvalues: v10 (copy)
        v10:onButtonUp();
        local l_onActivated_0 = v10.props.onActivated;
        if l_onActivated_0 then
            l_onActivated_0();
        end;
    end;
end;
local function _(v17) --[[ Line: 94 ]] --[[ Name: trimDescriptionText ]]
    if v17 == nil or v17 == "" then
        return "";
    else
        return v17:sub(1, (string.find(v17, "\n")));
    end;
end;
v5.render = function(v19) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy)
    local l_buttonPressed_0 = v19.state.buttonPressed;
    local l_screenWidth_0 = v19.props.screenWidth;
    local l_Size_0 = v19.props.Size;
    local l_Position_0 = v19.props.Position;
    local l_LayoutOrder_0 = v19.props.LayoutOrder;
    local l_item_0 = v19.props.item;
    local l_title_0 = l_item_0.title;
    local l_noticeReadStatus_0 = v19.props.noticeReadStatus;
    local v28 = l_item_0.hasRead or l_noticeReadStatus_0[l_item_0.noticeId];
    local v29 = l_screenWidth_0 - 24 - 12;
    local l_content_0 = v19.props.item.content;
    local v31 = (not (l_content_0 ~= nil) or l_content_0 == "") and "" or l_content_0:sub(1, (string.find(l_content_0, "\n")));
    return l_withStyle_0(function(v32) --[[ Line: 114 ]]
        -- upvalues: l_buttonPressed_0 (copy), v28 (copy), v2 (ref), l_Size_0 (copy), l_Position_0 (copy), l_LayoutOrder_0 (copy), v19 (copy), l_title_0 (copy), v29 (copy), v31 (copy)
        local v33 = l_buttonPressed_0 and v32.Theme.BackgroundOnPress or v32.Theme.BackgroundDefault;
        local v34 = v28 and v32.Theme.TextDefault or v32.Theme.TextEmphasis;
        local l_Font_0 = v32.Font.Header2.Font;
        local v36 = v32.Font.BaseSize * v32.Font.Header2.RelativeSize;
        local l_Font_1 = v32.Font.CaptionBody.Font;
        local v38 = v32.Font.BaseSize * v32.Font.CaptionBody.RelativeSize;
        local l_Font_2 = v32.Font.CaptionBody.Font;
        local v40 = v32.Font.BaseSize * v32.Font.CaptionBody.RelativeSize;
        return v2.createElement("ImageButton", {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AutoButtonColor = false, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundColor3 = v33.Color, 
            BackgroundTransparency = v33.Transparency, 
            BorderSizePixel = 0, 
            [v2.Event.InputBegan] = v19.onButtonInputBegan, 
            [v2.Event.InputEnded] = v19.onButtonInputEnded, 
            [v2.Event.Activated] = v19.onButtonActivated, 
            [v2.Ref] = v19.buttonRef
        }, {
            TitleText = v2.createElement("TextLabel", {
                Size = UDim2.new(0.5, 0, 0, 22), 
                Position = UDim2.fromOffset(24, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_title_0, 
                Font = l_Font_0, 
                TextSize = v36, 
                TextColor3 = v34.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextTransparency = v34.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            DescriptionText = v2.createElement("TextLabel", {
                Size = UDim2.fromOffset(v29, 22), 
                Position = UDim2.fromOffset(24, 36), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v31, 
                Font = l_Font_1, 
                TextSize = v38, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextColor3 = v34.Color, 
                TextTransparency = v34.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            DateLabel = v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                Size = UDim2.new(0, 100, 0, 22), 
                Position = UDim2.new(1, -12, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v19.props.dateText, 
                Font = l_Font_2, 
                TextSize = v40, 
                TextColor3 = v34.Color, 
                TextTransparency = v34.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
v5.willUnmount = function(v41) --[[ Line: 186 ]] --[[ Name: willUnmount ]]
    v41:eventDisconnect();
end;
return (v1.connect(function(v42) --[[ Line: 190 ]] --[[ Name: mapStateToProps ]]
    return {
        screenWidth = v42.ScreenSize.X, 
        noticeReadStatus = v42.Luobu.TencentNoticeReadStatus
    };
end)(v5));