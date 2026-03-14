local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = v4.Focusable;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.ThumbnailSide);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Style.withStyle;
local v15 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1), 
    NumberSequenceKeypoint.new(0.5, 1), 
    NumberSequenceKeypoint.new(1, 0.1)
});
local v16 = v3.PureComponent:extend("PageButton");
v16.validateProps = v6.strictInterface({
    Size = v6.UDim2, 
    backgroundImage = v6.string, 
    icon = v6.union(v6.string, v6.table), 
    text = v6.string, 
    transparencyModifier = v6.number, 
    onActivated = v6.callback, 
    getThumbnail = v6.optional(v6.callback), 
    thumbnailImageYInsetScale = v6.optional(v6.number), 
    thumbnailImage = v6.optional(v6.string), 
    thumbnailSize = v6.optional(v6.integer), 
    thumbnailScaleOffset = v6.optional(v6.Vector2), 
    ignoreThumbnail = v6.optional(v6.boolean), 
    thumbnailZoom = v6.optional(v6.number), 
    extraThumbnails = v6.optional(v6.array(v6.strictInterface({
        side = v11.isEnumValue, 
        image = v6.string, 
        imageRectSize = v6.optional(v6.Vector2), 
        imageRectOffset = v6.optional(v6.Vector2), 
        paddingTopScale = v6.optional(v6.number), 
        paddingBottomScale = v6.optional(v6.number), 
        paddingSideScale = v6.optional(v6.number)
    }))), 
    iconBeforeText = v6.optional(v6.boolean), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    [v3.Children] = v6.optional(v6.table), 
    forwardRef = v6.optional(v6.table), 
    dropShadowTransparency = v6.optional(v6.number), 
    dropShadowOffset = v6.optional(v6.Vector2), 
    dropShadowColor = v6.optional(v6.Color3)
});
v16.defaultProps = {
    transparencyModifier = 0, 
    thumbnailScaleOffset = Vector2.new(0, 0), 
    thumbnailZoom = 1, 
    dropShadowTransparency = 0.6, 
    dropShadowOffset = Vector2.new(2, 2), 
    dropShadowColor = Color3.new(0, 0, 0)
};
v16.calculateShadowPosition = function(v17, v18) --[[ Line: 82 ]] --[[ Name: calculateShadowPosition ]]
    return UDim2.new(v17.props.dropShadowOffset.X / v18.X, 0, 1 + v17.props.dropShadowOffset.Y / v18.Y, 0);
end;
v16.init = function(v19) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    local v20, v21 = v3.createBinding(Vector2.new(1, 1));
    v19.buttonSize = v20;
    v19.updateButtonSize = v21;
    v19:setState({
        imageButtonWidth = 0
    });
end;
v16.renderSideThumbnail = function(v22, v23) --[[ Line: 98 ]] --[[ Name: renderSideThumbnail ]]
    -- upvalues: v11 (copy), v3 (copy)
    if not v22.props.extraThumbnails then
        return nil;
    else
        local v24 = nil;
        for _, v26 in v22.props.extraThumbnails do
            if v26.side == v23 then
                v24 = v26;
                break;
            end;
        end;
        if not v24 then
            return nil;
        else
            local v27 = nil;
            local v28 = nil;
            if v23 == v11.Left then
                v28 = Vector2.new(0, 0);
                v27 = UDim2.fromScale(v24.paddingSideScale, v24.paddingTopScale);
            else
                v28 = Vector2.new(1, 0);
                v27 = UDim2.fromScale(1 - v24.paddingSideScale, v24.paddingTopScale);
            end;
            return v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                Image = v24.image, 
                ImageRectSize = v24.imageRectSize, 
                ImageRectOffset = v24.imageRectOffset, 
                AnchorPoint = v28, 
                Position = v27, 
                Size = v22.buttonSize:map(function(v29) --[[ Line: 132 ]]
                    -- upvalues: v24 (ref)
                    local v30 = v29.Y * (1 - v24.paddingTopScale - v24.paddingBottomScale);
                    local v31 = v24.imageRectSize.X * v30 / v24.imageRectSize.Y;
                    return UDim2.fromOffset(v31, v30);
                end)
            });
        end;
    end;
end;
v16.calcNormalizedSize = function(_, v33, v34) --[[ Line: 140 ]] --[[ Name: calcNormalizedSize ]]
    if v33.X > v33.Y then
        return Vector2.new(v34 * v33.Y / v33.X, v34);
    else
        return Vector2.new(v34, v34 * v33.X / v33.Y);
    end;
end;
v16.shouldUseImageRectSizeAndOffset = function(v35) --[[ Line: 148 ]] --[[ Name: shouldUseImageRectSizeAndOffset ]]
    local v36 = false;
    if v35.props.thumbnailZoom > 1 then
        v36 = v35.props.thumbnailSize;
    end;
    return v36;
end;
v16.renderThumbnail = function(v37) --[[ Line: 152 ]] --[[ Name: renderThumbnail ]]
    -- upvalues: v3 (copy), v10 (copy)
    if v37.props.ignoreThumbnail then
        return nil;
    else
        local l_thumbnailImage_0 = v37.props.thumbnailImage;
        local l_getThumbnail_0 = v37.props.getThumbnail;
        local l_transparencyModifier_0 = v37.props.transparencyModifier;
        local v41 = v37:getThumbnailPosition();
        local v42 = v37:getThumbnailSize();
        local v43 = v37:getThumbnailImageRectOffset();
        local v44 = v37:getThumbnailImageRectSize();
        if l_getThumbnail_0 then
            return l_getThumbnail_0(v41, v42, v43, v44, 2, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            });
        else
            return v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                Image = l_thumbnailImage_0, 
                ImageTransparency = l_transparencyModifier_0, 
                Position = v41, 
                Size = v42, 
                ImageRectOffset = v43, 
                ImageRectSize = v44
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            });
        end;
    end;
end;
v16.getThumbnailPosition = function(v45) --[[ Line: 197 ]] --[[ Name: getThumbnailPosition ]]
    if v45:shouldUseImageRectSizeAndOffset() then
        return UDim2.fromScale(0, 0);
    else
        local l_thumbnailScaleOffset_0 = v45.props.thumbnailScaleOffset;
        return v45.buttonSize:map(function(v47) --[[ Line: 204 ]]
            -- upvalues: v45 (copy), l_thumbnailScaleOffset_0 (copy), l_thumbnailScaleOffset_0 (copy)
            local v48 = v45:calcNormalizedSize(v47, v45.props.thumbnailZoom);
            local v49 = l_thumbnailScaleOffset_0 - v48 * Vector2.new(0.5, 0.5) + Vector2.new(0.5, 0.5);
            local v50 = Vector2.new(math.max(v49.X, l_thumbnailScaleOffset_0.X - 0.5), (math.max(v49.Y, l_thumbnailScaleOffset_0.Y)));
            return UDim2.fromScale(v50.X, v50.Y);
        end);
    end;
end;
v16.getThumbnailSize = function(v51) --[[ Line: 216 ]] --[[ Name: getThumbnailSize ]]
    if v51:shouldUseImageRectSizeAndOffset() then
        return UDim2.fromScale(1, 1);
    else
        return v51.buttonSize:map(function(v52) --[[ Line: 220 ]]
            -- upvalues: v51 (copy)
            local v53 = v51:calcNormalizedSize(v52, v51.props.thumbnailZoom);
            return UDim2.fromScale(v53.X, v53.Y);
        end);
    end;
end;
v16.getThumbnailImageRectOffset = function(v54) --[[ Line: 227 ]] --[[ Name: getThumbnailImageRectOffset ]]
    if v54:shouldUseImageRectSizeAndOffset() then
        return v54.buttonSize:map(function(v55) --[[ Line: 229 ]]
            -- upvalues: v54 (copy)
            local v56 = v54:calcNormalizedSize(v55, v54.props.thumbnailZoom);
            local v57 = Vector2.new(v54.props.thumbnailSize / v56.X, v54.props.thumbnailSize / v56.Y);
            local v58 = (v54.props.thumbnailSize - v57.X) * 0.5;
            local v59 = nil;
            v59 = if v54.props.thumbnailImageYInsetScale then v54.props.thumbnailSize * v54.props.thumbnailImageYInsetScale else (v54.props.thumbnailSize - v57.Y) * 0.5;
            return (Vector2.new(v58, v59));
        end);
    else
        return nil;
    end;
end;
v16.getThumbnailImageRectSize = function(v60) --[[ Line: 255 ]] --[[ Name: getThumbnailImageRectSize ]]
    if v60:shouldUseImageRectSizeAndOffset() then
        return v60.buttonSize:map(function(v61) --[[ Line: 257 ]]
            -- upvalues: v60 (copy)
            local v62 = v60:calcNormalizedSize(v61, v60.props.thumbnailZoom);
            return Vector2.new(v60.props.thumbnailSize / v62.X, v60.props.thumbnailSize / v62.Y);
        end);
    else
        return nil;
    end;
end;
v16.renderTextComponent = function(_, v64, v65, v66, v67, v68, v69, v70) --[[ Line: 266 ]] --[[ Name: renderTextComponent ]]
    -- upvalues: v12 (copy), v3 (copy)
    local v71 = nil;
    v71 = if v64 then v70 - 48 - 30 else v70 - 20;
    if v71 <= 0 then
        return nil;
    else
        local v72, v73 = v12.getLargestPossibleOneLineTextSize(v66, v67, v65.Header1, v71);
        if v72 == nil then
            return nil;
        else
            local v74 = UDim2.fromOffset(v72.X, v72.Y);
            return v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = v74, 
                Font = v65.Header1.Font, 
                Text = v66, 
                TextColor3 = v68, 
                TextSize = v73, 
                TextTransparency = v69
            });
        end;
    end;
end;
v16.renderWithSelectionCursor = function(v75, v76) --[[ Line: 307 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), v10 (copy), v11 (copy), v15 (copy), l_ImageSetLabel_0 (copy)
    local l_Size_0 = v75.props.Size;
    local l_backgroundImage_0 = v75.props.backgroundImage;
    local l_icon_0 = v75.props.icon;
    local l_iconBeforeText_0 = v75.props.iconBeforeText;
    local l_text_0 = v75.props.text;
    local l_transparencyModifier_1 = v75.props.transparencyModifier;
    local l_NextSelectionLeft_0 = v75.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v75.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v75.props.NextSelectionUp;
    local l_NextSelectionDown_0 = v75.props.NextSelectionDown;
    local v87 = UDim2.new(1, 0, 0.6666666666666666, 0);
    return l_withStyle_0(function(v88) --[[ Line: 322 ]]
        -- upvalues: v75 (copy), v3 (ref), l_Focusable_0 (ref), l_Size_0 (copy), l_NextSelectionLeft_0 (copy), l_NextSelectionRight_0 (copy), l_NextSelectionUp_0 (copy), l_NextSelectionDown_0 (copy), v76 (copy), l_CursorKind_0 (ref), l_backgroundImage_0 (copy), l_transparencyModifier_1 (copy), v10 (ref), v11 (ref), v15 (ref), v87 (copy), l_iconBeforeText_0 (copy), l_ImageSetLabel_0 (ref), l_icon_0 (copy), l_text_0 (copy)
        local l_Theme_0 = v88.Theme;
        local l_Font_0 = v88.Font;
        local v91 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local l_forwardRef_0 = v75.props.forwardRef;
        local l_dropShadowTransparency_0 = v75.props.dropShadowTransparency;
        local l_dropShadowColor_0 = v75.props.dropShadowColor;
        return v3.createElement(l_Focusable_0.ImageButton, {
            BackgroundTransparency = 0.9, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            Size = l_Size_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            [v3.Ref] = l_forwardRef_0, 
            SelectionImageObject = v76(l_CursorKind_0.RoundedRectNoInset), 
            [v3.Event.Activated] = v75.props.onActivated, 
            [v3.Change.AbsoluteSize] = function(v95) --[[ Line: 345 ]]
                -- upvalues: v75 (ref)
                v75:setState({
                    imageButtonWidth = v95.AbsoluteSize.X
                });
                v75.updateButtonSize(v95.AbsoluteSize);
            end
        }, {
            BackgroundImage = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_backgroundImage_0, 
                ImageTransparency = l_transparencyModifier_1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.fromScale(1, 1), 
                ScaleType = Enum.ScaleType.Crop, 
                ZIndex = 1
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            }), 
            Thumbnail = v75:renderThumbnail(), 
            LeftThumbnail = v75:renderSideThumbnail(v11.Left), 
            RightThumbnail = v75:renderSideThumbnail(v11.Right), 
            Overlay = v3.createElement("Frame", {
                BackgroundTransparency = l_transparencyModifier_1, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 3
            }, {
                Gradient = v3.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    }), 
                    Transparency = v15
                }), 
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
                })
            }), 
            ForegroundShadow = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = v75.buttonSize:map(function(v96) --[[ Line: 395 ]]
                    -- upvalues: v75 (ref)
                    return v75:calculateShadowPosition(v96);
                end), 
                Size = v75.props.iconBeforeText and UDim2.fromScale(1, 1) or v87, 
                ZIndex = 4
            }, {
                uiSizeConstraint = not v75.props.iconBeforeText and v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v10.PageButtonForegroundMinHeightPix)
                }) or nil, 
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = l_iconBeforeText_0 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 10)
                }), 
                IconShadow = v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = l_dropShadowColor_0, 
                    ImageTransparency = l_dropShadowTransparency_0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 48, 0, 48)
                }), 
                DropShadow = v75:renderTextComponent(l_iconBeforeText_0, l_Font_0, l_text_0, v91, l_dropShadowColor_0, l_dropShadowTransparency_0, v75.state.imageButtonWidth)
            }), 
            Foreground = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = v75.props.iconBeforeText and UDim2.fromScale(1, 1) or v87, 
                ZIndex = 4
            }, {
                uiSizeConstraint = not v75.props.iconBeforeText and v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v10.PageButtonForegroundMinHeightPix)
                }) or nil, 
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = l_iconBeforeText_0 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 10)
                }), 
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageTransparency = l_transparencyModifier_1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 48, 0, 48)
                }), 
                Text = v75:renderTextComponent(l_iconBeforeText_0, l_Font_0, l_text_0, v91, Color3.new(1, 1, 1), l_transparencyModifier_1, v75.state.imageButtonWidth)
            }), 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, v10.PageButtonCornerRadius)
            })
        });
    end);
end;
v16.render = function(v97) --[[ Line: 476 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v98) --[[ Line: 477 ]]
        -- upvalues: v97 (copy)
        return v97:renderWithSelectionCursor(v98);
    end);
end;
return v3.forwardRef(function(v99, v100) --[[ Line: 482 ]]
    -- upvalues: v3 (copy), v16 (copy), v2 (copy)
    return v3.createElement(v16, v2.Dictionary.join(v99, {
        forwardRef = v100
    }));
end);