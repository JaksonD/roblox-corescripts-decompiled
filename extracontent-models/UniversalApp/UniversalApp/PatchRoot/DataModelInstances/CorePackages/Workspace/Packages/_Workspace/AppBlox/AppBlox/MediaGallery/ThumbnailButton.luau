local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.UIBlox);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_ControlState_0 = v3.Core.Control.Enum.ControlState;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_getIconSize_0 = v3.App.ImageSet.getIconSize;
local l_withStyle_0 = v3.Core.Style.withStyle;
local v14 = require(script.Parent.HoverButtonBackground);
local v15 = l_getIconSize_0(l_IconSize_0.Large);
local v16 = UDim2.fromScale(0.4, 0.512);
local v17 = UDim2.fromOffset(64, 48);
local v18 = UDim2.fromScale(0.25, 0.33);
local v19 = v1.Component:extend("ThumbnailButton");
v19.validateProps = v2.strictInterface({
    layoutOrder = v2.optional(v2.number), 
    size = v2.optional(v2.UDim2), 
    anchorPoint = v2.optional(v2.Vector2), 
    position = v2.optional(v2.UDim2), 
    itemKey = v2.any, 
    imageId = v2.optional(v2.string), 
    isVideo = v2.optional(v2.boolean), 
    useScaledPlayButton = v2.optional(v2.boolean), 
    isSelected = v2.optional(v2.boolean), 
    userInteractionEnabled = v2.optional(v2.boolean), 
    onActivated = v2.optional(v2.callback), 
    onPlayActivated = v2.optional(v2.callback)
});
v19.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    imageId = "", 
    isVideo = false, 
    isSelected = false, 
    userInteractionEnabled = true
};
v19.init = function(v20) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_ControlState_0 (copy)
    v20:setState({
        controlState = l_ControlState_0.Initialize
    });
    v20.onStateChanged = function(_, v22) --[[ Line: 62 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            controlState = v22
        });
    end;
    v20.onActivated = function() --[[ Line: 68 ]]
        -- upvalues: v20 (copy)
        if v20.props.onActivated then
            v20.props.onActivated(v20.props.itemKey);
        end;
    end;
    v20.onPlayActivated = function() --[[ Line: 74 ]]
        -- upvalues: v20 (copy)
        if v20.props.onPlayActivated then
            v20.props.onPlayActivated(v20.props.itemKey);
        end;
    end;
end;
v19.renderButton = function(v23) --[[ Line: 81 ]] --[[ Name: renderButton ]]
    -- upvalues: v16 (copy), v17 (copy), l_withStyle_0 (copy), l_ControlState_0 (copy), v1 (copy), l_Interactable_0 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_Images_0 (copy), l_ImageSetLabel_0 (copy), v18 (copy), v14 (copy)
    local l_useScaledPlayButton_0 = v23.props.useScaledPlayButton;
    local v25 = nil;
    v25 = if l_useScaledPlayButton_0 then v16 else v17;
    return l_withStyle_0(function(v26) --[[ Line: 90 ]]
        -- upvalues: v23 (copy), l_ControlState_0 (ref), v1 (ref), l_Interactable_0 (ref), l_LoadableImage_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v25 (ref), l_useScaledPlayButton_0 (copy), l_Images_0 (ref), l_ImageSetLabel_0 (ref), v18 (ref), v14 (ref)
        local l_layoutOrder_0 = v23.props.layoutOrder;
        local l_anchorPoint_0 = v23.props.anchorPoint;
        local l_position_0 = v23.props.position;
        local l_size_0 = v23.props.size;
        local l_isSelected_0 = v23.props.isSelected;
        local l_imageId_0 = v23.props.imageId;
        local l_isVideo_0 = v23.props.isVideo;
        local l_userInteractionEnabled_0 = v23.props.userInteractionEnabled;
        local v35 = v23.state.controlState == l_ControlState_0.Hover;
        local v36 = l_isSelected_0 and v26.Theme.BackgroundDefault or v26.Theme.BackgroundUIDefault;
        return v1.createElement(l_Interactable_0, {
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            AutoButtonColor = false, 
            BackgroundColor3 = v36.Color, 
            BackgroundTransparency = v36.Transparency, 
            onStateChanged = v23.onStateChanged, 
            userInteractionEnabled = l_userInteractionEnabled_0, 
            [v1.Event.Activated] = v23.onActivated
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Tile = v1.createElement(l_LoadableImage_0, {
                Size = UDim2.fromScale(1, 1), 
                cornerRadius = UDim.new(0, 8), 
                Image = l_imageId_0, 
                useShimmerAnimationWhileLoading = true, 
                ZIndex = -1
            }), 
            PlayButton = if l_isVideo_0 then v1.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                size = v25, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = if l_useScaledPlayButton_0 then nil else l_Images_0["icons/common/play"], 
                onActivated = v23.onPlayActivated
            }) else nil, 
            PlayIcon = if l_isVideo_0 and l_useScaledPlayButton_0 then v1.createElement(l_ImageSetLabel_0, {
                Size = v18, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = l_Images_0["icons/common/play"], 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }) else nil, 
            HoverBackground = v35 and v1.createElement(v14) or nil
        });
    end);
end;
v19.renderEmptyState = function(v37) --[[ Line: 151 ]] --[[ Name: renderEmptyState ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v15 (copy), l_Images_0 (copy)
    return l_withStyle_0(function(v38) --[[ Line: 152 ]]
        -- upvalues: v37 (copy), v1 (ref), l_ImageSetLabel_0 (ref), v15 (ref), l_Images_0 (ref)
        local l_layoutOrder_1 = v37.props.layoutOrder;
        local l_anchorPoint_1 = v37.props.anchorPoint;
        local l_position_1 = v37.props.position;
        local l_size_1 = v37.props.size;
        return v1.createElement("Frame", {
            LayoutOrder = l_layoutOrder_1, 
            Size = l_size_1, 
            AnchorPoint = l_anchorPoint_1, 
            Position = l_position_1, 
            BackgroundColor3 = v38.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v38.Theme.BackgroundUIDefault.Transparency
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Icon = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(v15, v15), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = l_Images_0["icons/imageUnavailable"], 
                ImageColor3 = v38.Theme.UIDefault.Color, 
                ImageTransparency = v38.Theme.UIDefault.Transparency, 
                BackgroundTransparency = 1
            })
        });
    end);
end;
v19.render = function(v43) --[[ Line: 182 ]] --[[ Name: render ]]
    if v43.props.imageId == "" then
        return v43:renderEmptyState();
    else
        return v43:renderButton();
    end;
end;
return v19;