local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local _ = require(l_Parent_0.Style.StyleTypes);
local v6 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local _ = require(l_Parent_0.ImageSet.ImagesTypes);
return function(v8) --[[ Line: 55 ]] --[[ Name: ScrollBar ]]
    -- upvalues: v4 (copy), l_UserInputService_0 (copy), v6 (copy)
    local l_userInteractionEnabled_0 = v8.userInteractionEnabled;
    local l_width_0 = v8.width;
    local l_anchorPoint_0 = v8.anchorPoint;
    local l_position_0 = v8.position;
    local l_zIndex_0 = v8.zIndex;
    local l_transparency_0 = v8.transparency;
    local l_backgroundColor_0 = v8.backgroundColor;
    local l_paddingStartEnd_0 = v8.paddingStartEnd;
    local l_handleWidth_0 = v8.handleWidth;
    local l_handleColor_0 = v8.handleColor;
    local l_handleCornerRadius_0 = v8.handleCornerRadius;
    local l_handleIcon_0 = v8.handleIcon;
    local l_handleIconSize_0 = v8.handleIconSize;
    local l_handleIconColor_0 = v8.handleIconColor;
    local l_onDragging_0 = v8.onDragging;
    local l_viewSize_0 = v8.viewSize;
    local l_canvasSize_0 = v8.canvasSize;
    local l_canvasPosition_0 = v8.canvasPosition;
    local v27, v28 = v4.useState(false);
    local v29, v30 = v4.useBinding(0);
    local v31, v32 = v4.useState(false);
    local v33 = v4.useRef(0);
    local v34 = v4.useRef(0);
    local v36 = v4.useCallback(function(v35) --[[ Line: 83 ]]
        -- upvalues: v30 (copy)
        v30(v35.AbsoluteSize.Y);
    end, {
        v30
    });
    local v39 = v4.useCallback(function(v37) --[[ Line: 87 ]]
        -- upvalues: v28 (copy)
        local l_Parent_3 = v37.Parent;
        if l_Parent_3 ~= nil and math.ceil(v37.AbsoluteSize.Y) < l_Parent_3.AbsoluteSize.Y then
            v28(true);
            return;
        else
            v28(false);
            return;
        end;
    end, {
        v28
    });
    local v42 = v4.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v4 (ref), l_viewSize_0 (copy), l_canvasSize_0 (copy), l_handleWidth_0 (copy)
        return v4.joinBindings({
            viewSize = l_viewSize_0, 
            canvasSize = l_canvasSize_0
        }):map(function(v40) --[[ Line: 100 ]]
            -- upvalues: l_handleWidth_0 (ref)
            local v41 = math.clamp(v40.viewSize.Y / v40.canvasSize.Y, 0, 1);
            return UDim2.new(0, l_handleWidth_0, v41, 0);
        end);
    end, {
        l_handleWidth_0, 
        l_viewSize_0, 
        l_canvasSize_0
    });
    local v45 = v4.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v4 (ref), l_canvasPosition_0 (copy), l_canvasSize_0 (copy)
        return v4.joinBindings({
            canvasPosition = l_canvasPosition_0, 
            canvasSize = l_canvasSize_0
        }):map(function(v43) --[[ Line: 112 ]]
            local v44 = v43.canvasPosition.Y / v43.canvasSize.Y;
            return UDim2.fromScale(0.5, v44);
        end);
    end, {
        l_canvasSize_0, 
        l_canvasPosition_0
    });
    local v48 = v4.useCallback(function(_, v47) --[[ Line: 120 ]]
        -- upvalues: v27 (copy), l_userInteractionEnabled_0 (copy), v31 (copy), v33 (copy), v34 (copy), l_canvasPosition_0 (copy), v32 (copy)
        if not v27 or not l_userInteractionEnabled_0 or v31 then
            return;
        else
            if v47 and v47.UserInputType == Enum.UserInputType.MouseButton1 then
                v33.current = v47.Position.Y;
                v34.current = l_canvasPosition_0:getValue().Y;
                v32(true);
            end;
            return;
        end;
    end, {
        v27, 
        l_userInteractionEnabled_0, 
        v31, 
        v33, 
        v34, 
        l_canvasPosition_0, 
        v32
    });
    local v55 = v4.useCallback(function(v49) --[[ Line: 141 ]]
        -- upvalues: l_userInteractionEnabled_0 (copy), v31 (copy), v33 (copy), v29 (copy), l_paddingStartEnd_0 (copy), l_viewSize_0 (copy), v34 (copy), l_canvasSize_0 (copy), l_onDragging_0 (copy)
        if not l_userInteractionEnabled_0 or not v31 then
            return;
        elseif v49.UserInputType ~= Enum.UserInputType.MouseMovement then
            return;
        else
            local v50 = (v49.Position.Y - v33.current) / (v29:getValue() - l_paddingStartEnd_0);
            local l_Y_0 = l_viewSize_0:getValue().Y;
            local l_current_0 = v34.current;
            local l_Y_1 = l_canvasSize_0:getValue().Y;
            local v54 = math.clamp(l_current_0 + v50 * l_Y_1, 0, l_Y_1 - l_Y_0);
            l_onDragging_0(v54);
            return;
        end;
    end, {
        l_userInteractionEnabled_0, 
        v31, 
        v33, 
        v29, 
        l_paddingStartEnd_0, 
        l_viewSize_0, 
        v34, 
        l_canvasSize_0, 
        l_onDragging_0
    });
    local v57 = v4.useCallback(function(v56) --[[ Line: 172 ]]
        -- upvalues: l_userInteractionEnabled_0 (copy), v31 (copy), v32 (copy)
        if not l_userInteractionEnabled_0 or not v31 then
            return;
        elseif v56 and v56.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return;
        else
            v32(false);
            return;
        end;
    end, {
        l_userInteractionEnabled_0, 
        v31, 
        v32
    });
    v4.useEffect(function() --[[ Line: 184 ]]
        -- upvalues: v27 (copy), v31 (copy), l_UserInputService_0 (ref), v55 (copy), v57 (copy)
        if not v27 or not v31 then
            return function() --[[ Line: 186 ]]

            end;
        else
            local v58 = l_UserInputService_0.InputChanged:Connect(v55);
            local v59 = l_UserInputService_0.InputEnded:Connect(v57);
            local v60 = l_UserInputService_0.WindowFocusReleased:Connect(v57);
            return function() --[[ Line: 193 ]]
                -- upvalues: v58 (copy), v59 (copy), v60 (copy)
                v58:Disconnect();
                v59:Disconnect();
                v60:Disconnect();
            end;
        end;
    end, {
        v27, 
        v31, 
        v55, 
        v57
    });
    local l_l_transparency_0_0 = l_transparency_0;
    if not v27 then
        l_l_transparency_0_0 = 1;
    elseif v31 then
        l_l_transparency_0_0 = 0;
    end;
    return v4.createElement("CanvasGroup", {
        Selectable = false, 
        Size = UDim2.new(0, l_width_0, 1, 0), 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        GroupTransparency = l_l_transparency_0_0, 
        BackgroundColor3 = if l_backgroundColor_0 then l_backgroundColor_0.Color else nil, 
        BackgroundTransparency = if l_backgroundColor_0 then l_backgroundColor_0.Transparency else 1, 
        BorderSizePixel = 0, 
        ZIndex = l_zIndex_0
    }, {
        Padding = if l_paddingStartEnd_0 then v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_paddingStartEnd_0), 
            PaddingBottom = UDim.new(0, l_paddingStartEnd_0)
        }) else nil, 
        Track = v4.createElement("Frame", {
            Selectable = false, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            [v4.Change.AbsoluteSize] = v36
        }, {
            TrackUICorner = if l_handleCornerRadius_0 then v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_handleCornerRadius_0)
            }) else nil, 
            Handle = v4.createElement("Frame", {
                Active = v27 and l_userInteractionEnabled_0, 
                Selectable = false, 
                Size = v42, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = v45, 
                BackgroundColor3 = if l_handleColor_0 then l_handleColor_0.Color else nil, 
                BackgroundTransparency = if l_handleColor_0 then l_handleColor_0.Transparency else 0, 
                BorderSizePixel = 0, 
                [v4.Change.AbsoluteSize] = v39, 
                [v4.Event.InputBegan] = v48
            }, {
                HandleUICorner = if l_handleCornerRadius_0 then v4.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_handleCornerRadius_0)
                }) else nil, 
                Icon = if l_handleIcon_0 then v4.createElement(v6.Label, {
                    Selectable = false, 
                    Size = UDim2.fromOffset(l_handleIconSize_0, l_handleIconSize_0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = l_handleIcon_0, 
                    ImageColor3 = if l_handleIconColor_0 then l_handleIconColor_0.Color else nil, 
                    ImageTransparency = if l_handleIconColor_0 then l_handleIconColor_0.Transparency else nil, 
                    BackgroundTransparency = 1
                }) else nil
            })
        })
    });
end;