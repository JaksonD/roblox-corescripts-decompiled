local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local l_EventConnection_0 = require(l_Parent_0.ReactUtils).EventConnection;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.t);
local v5 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v5.App.Button.IconButton;
local l_Images_0 = v5.App.ImageSet.Images;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v9 = require(script.Parent.ThumbnailButton);
local v10 = require(script.Parent.getShowItems);
local v11 = v3.Component:extend("MediaGalleryFullScreen");
v11.validateProps = v4.strictInterface({
    layoutOrder = v4.optional(v4.integer), 
    size = v4.optional(v4.UDim2), 
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    items = v4.array(v4.interface({
        imageId = v4.string, 
        isYouTubeVideo = v4.optional(v4.boolean)
    })), 
    showIndex = v4.optional(v4.integer), 
    onVideoPlayActivated = v4.optional(v4.callback)
});
v11.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    showIndex = 1
};
v11.getDerivedStateFromProps = function(v12, v13) --[[ Line: 53 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v10 (copy)
    local v14 = nil;
    if v13.items ~= v12.items then
        local v15 = v10(v12);
        v14 = {
            items = v12.items, 
            itemsToShow = v15, 
            showArrows = #v15 > 1, 
            focusIndex = math.min(v13.focusIndex or 1, #v15)
        };
    end;
    if v13.showIndex ~= v12.showIndex then
        v14 = v14 or {};
        v14.showIndex = v12.showIndex;
        v14.focusIndex = math.min(v12.showIndex, #v12.items);
    end;
    return v14;
end;
v11.init = function(v16) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v16.state = {
        items = nil, 
        itemsToShow = nil, 
        showArrows = true, 
        focusIndex = 1, 
        showIndex = 1
    };
    local v17, v18 = v3.createBinding(UDim2.fromScale(1, 1));
    v16.itemFrameSize = v17;
    v16.updateItemFrameSize = v18;
    v17, v18 = v3.createBinding(UDim2.new(0, 96, 1, 0));
    v16.arrowButtonSize = v17;
    v16.updateArrowButtonSize = v18;
    v17, v18 = v3.createBinding(UDim2.new(0.5, 0, 0.5, 0));
    v16.leftArrowPosition = v17;
    v16.updateLeftArrowPosition = v18;
    v17, v18 = v3.createBinding(UDim2.new(0.5, 0, 0.5, 0));
    v16.rightArrowPosition = v17;
    v16.updateRightArrowPosition = v18;
    v16.onResize = function(v19) --[[ Line: 90 ]]
        -- upvalues: v16 (copy)
        local l_X_0 = v19.AbsoluteSize.X;
        local l_Y_0 = v19.AbsoluteSize.Y;
        local v22 = math.floor(l_Y_0 * 1.7777777777777777);
        if l_X_0 < v22 then
            v22 = l_X_0;
            l_Y_0 = math.floor(v22 / 1.7777777777777777);
        end;
        v16.updateItemFrameSize(UDim2.new(0, v22, 0, l_Y_0));
    end;
    v16.onImageResize = function(v23) --[[ Line: 104 ]]
        -- upvalues: v16 (copy)
        local l_X_1 = v23.AbsoluteSize.X;
        local l_Y_1 = v23.AbsoluteSize.Y;
        v16.updateLeftArrowPosition(UDim2.new(0.5, -l_X_1 / 2, 0.5, 0));
        v16.updateRightArrowPosition(UDim2.new(0.5, l_X_1 / 2, 0.5, 0));
        v16.updateArrowButtonSize(UDim2.new(0, 96, 0, l_Y_1));
    end;
    v16.onUserInputBegan = function(v26) --[[ Line: 113 ]]
        -- upvalues: v16 (copy)
        if v26.UserInputType ~= Enum.UserInputType.Keyboard then
            return;
        else
            local l_focusIndex_0 = v16.state.focusIndex;
            local v28 = #v16.props.items;
            if v26.KeyCode == Enum.KeyCode.Left and l_focusIndex_0 > 1 then
                v16.showPreviousItem();
                return;
            else
                if v26.KeyCode == Enum.KeyCode.Right and l_focusIndex_0 < v28 then
                    v16.showNextItem();
                end;
                return;
            end;
        end;
    end;
    v16.showPreviousItem = function() --[[ Line: 128 ]]
        -- upvalues: v16 (copy)
        local v29 = v16.state.focusIndex - 1;
        if v29 < 1 then
            v29 = 1;
        end;
        v16:setState({
            focusIndex = v29
        });
    end;
    v16.showNextItem = function() --[[ Line: 139 ]]
        -- upvalues: v16 (copy)
        local v30 = #v16.props.items;
        local v31 = v16.state.focusIndex + 1;
        if v30 < v31 then
            v31 = v30;
        end;
        v16:setState({
            focusIndex = v31
        });
    end;
    v16.cycleNext = function() --[[ Line: 151 ]]
        -- upvalues: v16 (copy)
        local v32 = #v16.props.items;
        local v33 = v16.state.focusIndex + 1;
        if v32 < v33 then
            v33 = 1;
        end;
        v16:setState({
            focusIndex = v33
        });
    end;
    v16.onVideoPlayActivated = function(v34) --[[ Line: 163 ]]
        -- upvalues: v16 (copy)
        if v16.props.onVideoPlayActivated then
            local l_originalIndex_0 = v16.state.itemsToShow[v34].originalIndex;
            v16.props.onVideoPlayActivated(l_originalIndex_0);
        end;
    end;
end;
local function v43(_, v37, v38, v39, v40, v41, v42) --[[ Line: 172 ]] --[[ Name: renderArrowButton ]]
    -- upvalues: v3 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    return v3.createElement("Frame", {
        Size = v41, 
        AnchorPoint = v39, 
        Position = v40, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = 100
    }, {
        ArrowButton = v3.createElement(l_IconButton_0, {
            size = UDim2.fromScale(1, 1), 
            icon = l_Images_0[v37], 
            showBackground = true, 
            backgroundTransparency = 1, 
            isDisabled = v38, 
            onActivated = v42
        })
    });
end;
v11.render = function(v44) --[[ Line: 192 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v45) --[[ Line: 193 ]]
        -- upvalues: v44 (copy)
        return v44:renderWithProvider(v45);
    end);
end;
v11.renderWithProvider = function(v46, v47) --[[ Line: 198 ]] --[[ Name: renderWithProvider ]]
    -- upvalues: v3 (copy), v43 (copy), v9 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy)
    local l_layoutOrder_0 = v46.props.layoutOrder;
    local l_anchorPoint_0 = v46.props.anchorPoint;
    local l_position_0 = v46.props.position;
    local l_size_0 = v46.props.size;
    local l_itemsToShow_0 = v46.state.itemsToShow;
    local l_showArrows_0 = v46.state.showArrows;
    local l_focusIndex_1 = v46.state.focusIndex;
    local v55 = l_itemsToShow_0[l_focusIndex_1];
    local v56 = l_focusIndex_1 <= 1;
    local v57 = #l_itemsToShow_0 <= l_focusIndex_1;
    return v3.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        Size = l_size_0, 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v3.Change.AbsoluteSize] = v46.onResize
    }, {
        LeftArrow = if l_showArrows_0 then v43(v47, "icons/actions/cycleLeft", v56, Vector2.new(1, 0.5), v46.leftArrowPosition, v46.arrowButtonSize, v46.showPreviousItem) else nil, 
        FullScreenItemFrame = v3.createElement("Frame", {
            Size = UDim2.new(1, -192, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            [v3.Change.AbsoluteSize] = v46.onImageResize
        }, {
            UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.7777777777777777
            }), 
            Item = v3.createElement(v9, {
                itemKey = l_focusIndex_1, 
                imageId = v55.imageId, 
                isVideo = v55.isYouTubeVideo, 
                userInteractionEnabled = true, 
                onActivated = v46.cycleNext, 
                onPlayActivated = v55.isYouTubeVideo and v46.onVideoPlayActivated or nil
            })
        }), 
        RightArrow = if l_showArrows_0 then v43(v47, "icons/actions/cycleRight", v57, Vector2.new(0, 0.5), v46.rightArrowPosition, v46.arrowButtonSize, v46.showNextItem) else nil, 
        EventConnection = l_showArrows_0 and v3.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = v46.onUserInputBegan
        }) or nil
    });
end;
return v11;