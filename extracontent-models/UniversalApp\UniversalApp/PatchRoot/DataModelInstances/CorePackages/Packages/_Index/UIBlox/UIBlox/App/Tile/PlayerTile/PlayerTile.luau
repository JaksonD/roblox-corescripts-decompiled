local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v7 = require(l_Parent_1.Cryo);
local l_Dictionary_0 = v7.Dictionary;
local l_List_0 = v7.List;
local v10 = require(l_script_FirstAncestor_0.ImageSet.Images);
local v11 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v12 = require(l_Core_0.Control.Enum.ControlState);
local v13 = require(l_Core_0.Style.withStyle);
local v14 = require(l_Core_0.Button.getContentStyle);
local v15 = require(l_script_FirstAncestor_0.Tile.PlayerTile.PlayerTileButton);
local v16 = require(l_script_FirstAncestor_0.Indicator.PlayerContext);
local v17 = require(l_Parent_0.Utility.SpringAnimatedItem);
local v18 = require(l_Core_0.Style.Validator.validateFontInfo);
local v19 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v20 = require(l_script_FirstAncestor_0.Tile.BaseTile.Tile);
local v21 = v5.PureComponent:extend("PlayerTile");
local v22 = v4.union(v4.string, v11);
v21.validateProps = v4.strictInterface({
    title = v4.optional(v4.string), 
    subtitle = v4.optional(v4.string), 
    subtitleFontStyle = v4.optional(v4.union(v18, v19)), 
    hasVerifiedBadge = v4.optional(v4.boolean), 
    Selectable = v4.optional(v4.boolean), 
    thumbnail = v4.optional(v4.union(v4.string, v4.table)), 
    buttons = v4.optional(v4.array(v4.strictInterface({
        icon = v4.optional(v22), 
        onActivated = v4.optional(v4.callback), 
        isSecondary = v4.optional(v4.boolean), 
        isDisabled = v4.optional(v4.boolean)
    }))), 
    relevancyInfo = v4.strictInterface({
        text = v4.optional(v4.string), 
        icon = v4.optional(v4.union(v4.string, v4.table)), 
        iconSize = v4.optional(v4.UDim2), 
        iconColor = v4.optional(v4.Color3), 
        iconTransparency = v4.optional(v4.number), 
        onActivated = v4.optional(v4.callback), 
        fontStyle = v4.optional(v4.union(v18, v19)), 
        horizontalAlignment = v4.optional(v4.EnumItem), 
        textXAlignment = v4.optional(v4.EnumItem)
    }), 
    tileSize = v4.optional(v4.UDim2), 
    thumbnailFrameSize = v4.optional(v4.UDim2), 
    isCircular = v4.optional(v4.boolean), 
    horizontalAlignment = v4.optional(v4.EnumItem), 
    footerTopPadding = v4.optional(v4.integer), 
    onActivated = v4.optional(v4.callback), 
    forwardedRef = v4.optional(v4.table), 
    openTypeFeatures = v4.optional(v4.string), 
    isRoactGamepadEnabled = v4.optional(v4.boolean), 
    buttonRef = v4.optional(v4.table)
});
v21.defaultProps = {
    buttons = {}, 
    relevancyInfo = {}, 
    tileSize = UDim2.new(0, 150, 0, 150), 
    onActivated = function() --[[ Line: 88 ]] --[[ Name: onActivated ]]

    end, 
    Selectable = false, 
    isCircular = false, 
    openTypeFeatures = nil, 
    isRoactGamepadEnabled = true
};
local v23 = {
    dampingRatio = 1, 
    frequency = 4
};
local v24 = {
    [v12.Default] = "SystemPrimaryContent"
};
local v25 = v10["component_assets/vignette_246"];
local function _(v26) --[[ Line: 107 ]] --[[ Name: footer ]]
    -- upvalues: v13 (copy), l_Object_0 (copy), v5 (copy), v16 (copy)
    return v13(function(v27) --[[ Line: 108 ]]
        -- upvalues: l_Object_0 (ref), v26 (copy), v5 (ref), v16 (ref)
        local l_Tokens_0 = v27.Tokens;
        local v29 = l_Object_0.assign({}, {
            fontStyle = if v26.playerContext.onActivated then l_Tokens_0.Semantic.Typography.CaptionHeader else l_Tokens_0.Semantic.Typography.CaptionBody, 
            iconTextSpacing = l_Tokens_0.Global.Space_50, 
            iconPadding = 0, 
            iconSize = UDim2.fromOffset(l_Tokens_0.Global.Size_150, l_Tokens_0.Global.Size_150), 
            textHeight = l_Tokens_0.Global.Size_350, 
            horizontalAlignment = v26.horizontalAlignment, 
            textXAlignment = v26.textXAlignment
        }, v26.playerContext);
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            PlayerContext = v5.createElement(v16, v29)
        });
    end);
end;
local function _(v31) --[[ Line: 137 ]] --[[ Name: thumbnailOverlayComponents ]]
    -- upvalues: v13 (copy), v14 (copy), v24 (copy), v5 (copy), v7 (copy), v17 (copy), v23 (copy), v25 (copy), l_List_0 (copy), v15 (copy)
    return v13(function(v32) --[[ Line: 138 ]]
        -- upvalues: v14 (ref), v24 (ref), v31 (copy), v5 (ref), v7 (ref), v17 (ref), v23 (ref), v25 (ref), l_List_0 (ref), v15 (ref)
        local l_Tokens_1 = v32.Tokens;
        local l_Space_100_0 = l_Tokens_1.Global.Space_100;
        local l_Space_100_1 = l_Tokens_1.Global.Space_100;
        local l_Size_450_0 = l_Tokens_1.Global.Size_450;
        local v37 = v14(v24, v31.controlState, v32);
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            ButtonBackgroundGradient = not v31.isCircular and not v7.isEmpty(v31.buttons) and v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_Size_450_0 + l_Space_100_0 * 2), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                LayoutOrder = 1
            }, {
                UIGradient = v5.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v32.Theme.BackgroundUIContrast.Color), 
                        ColorSequenceKeypoint.new(1, v32.Theme.BackgroundUIContrast.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(1, v32.Theme.BackgroundUIContrast.Transparency)
                    })
                }), 
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            }), 
            HoverTransparency = v5.createElement(v17.AnimatedImageLabel, {
                springOptions = v23, 
                animatedValues = {
                    imageTransparency = v31.mouseEntered and 0.6 or 1
                }, 
                mapValuesToProps = function(v38) --[[ Line: 177 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        ImageTransparency = v38.imageTransparency
                    };
                end, 
                regularProps = {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v25.Image, 
                    ImageRectSize = v25.ImageRectSize, 
                    ImageRectOffset = v25.ImageRectOffset, 
                    ImageColor3 = v37.Color, 
                    ImageTransparency = 0, 
                    LayoutOrder = 2, 
                    [v5.Event.MouseEnter] = v31.hoverMouseEnter, 
                    [v5.Event.MouseLeave] = v31.hoverMouseLeave
                }
            }, {
                corner = v5.createElement("UICorner", {
                    CornerRadius = if v31.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
                })
            }), 
            ButtonContainer = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 2
            }, {
                PlayerTileButtons = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 1, 0), 
                    Size = UDim2.new(0, v31.tileSize.X.Offset - l_Space_100_0 * 2, 0, l_Size_450_0), 
                    AnchorPoint = Vector2.new(1, 1), 
                    LayoutOrder = 3, 
                    ZIndex = 2
                }, l_List_0.join(l_List_0.map(v31.buttons, function(v39) --[[ Line: 215 ]]
                    -- upvalues: v5 (ref), v15 (ref), l_Size_450_0 (copy), l_Space_100_0 (copy), v31 (ref)
                    return v5.createElement(v15, {
                        buttonHeight = l_Size_450_0, 
                        outerButtonPadding = l_Space_100_0, 
                        tileSize = v31.tileSize, 
                        icon = v39.icon, 
                        isSecondary = v39.isSecondary, 
                        isDisabled = v39.isDisabled, 
                        onActivated = v39.onActivated, 
                        mouseEnter = v31.hoverMouseEnter, 
                        mouseLeave = v31.hoverMouseLeave, 
                        isRoactGamepadEnabled = v31.isRoactGamepadEnabled
                    });
                end), {
                    v5.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = UDim.new(0, l_Space_100_1), 
                        FillDirection = Enum.FillDirection.Horizontal
                    })
                })), 
                UIPadding = v5.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, l_Space_100_0), 
                    PaddingRight = UDim.new(0, l_Space_100_0)
                })
            })
        });
    end);
end;
v21.init = function(v41) --[[ Line: 247 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v12 (copy)
    v41.firstButtonIcon = v5.createRef();
    v41.secondButtonIcon = v5.createRef();
    v41.mouseEntered = false;
    v41.state = {
        controlState = v12.Initialize, 
        mouseEntered = false
    };
    v41.onStateChanged = function(v42, v43) --[[ Line: 256 ]]
        -- upvalues: v41 (copy)
        v41:setState({
            controlState = v43
        });
        if v41.props.onStateChanged then
            v41.props.onStateChanged(v42, v43);
        end;
    end;
    v41.hoverMouseEnter = function() --[[ Line: 265 ]]
        -- upvalues: v41 (copy)
        v41:setState({
            mouseEntered = true
        });
    end;
    v41.hoverMouseLeave = function() --[[ Line: 271 ]]
        -- upvalues: v41 (copy)
        v41:setState({
            mouseEntered = false
        });
    end;
end;
v21.render = function(v44) --[[ Line: 278 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), v5 (copy), v20 (copy), l_Dictionary_0 (copy), l_Object_0 (copy), v16 (copy), v10 (copy), v14 (copy), v24 (copy), v7 (copy), v17 (copy), v23 (copy), v25 (copy), l_List_0 (copy), v15 (copy)
    local l_tileSize_0 = v44.props.tileSize;
    local l_title_0 = v44.props.title;
    local l_onActivated_0 = v44.props.onActivated;
    local l_thumbnail_0 = v44.props.thumbnail;
    return v13(function(v49) --[[ Line: 284 ]]
        -- upvalues: v44 (copy), v5 (ref), l_tileSize_0 (copy), v20 (ref), l_Dictionary_0 (ref), v13 (ref), l_Object_0 (ref), v16 (ref), l_title_0 (copy), l_onActivated_0 (copy), l_thumbnail_0 (copy), v10 (ref), v14 (ref), v24 (ref), v7 (ref), v17 (ref), v23 (ref), v25 (ref), l_List_0 (ref), v15 (ref)
        local l_Tokens_2 = v49.Tokens;
        local v51 = v44.props.subtitleFontStyle or l_Tokens_2.Semantic.Typography.CaptionHeader;
        local v52 = v44.props.footerTopPadding or l_Tokens_2.Global.Space_50;
        local l_createElement_0 = v5.createElement;
        local v54 = "Frame";
        local v55 = {
            Size = l_tileSize_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v5.Ref] = v44.props.forwardedRef
        };
        local v56 = {};
        local l_createElement_1 = v5.createElement;
        local l_v20_0 = v20;
        local v59 = {
            textButtonRef = v44.props.buttonRef
        };
        local v60 = {
            playerContext = if v44.props.Selectable then l_Dictionary_0.join(v44.props.relevancyInfo, {
                Selectable = false
            }) else v44.props.relevancyInfo, 
            controlState = v44.state.controlState
        };
        local l_v60_0 = v60 --[[ copy: 12 -> 13 ]];
        v59.footer = v13(function(v62) --[[ Line: 108 ]]
            -- upvalues: l_Object_0 (ref), l_v60_0 (copy), v5 (ref), v16 (ref)
            local l_Tokens_3 = v62.Tokens;
            local v64 = l_Object_0.assign({}, {
                fontStyle = if l_v60_0.playerContext.onActivated then l_Tokens_3.Semantic.Typography.CaptionHeader else l_Tokens_3.Semantic.Typography.CaptionBody, 
                iconTextSpacing = l_Tokens_3.Global.Space_50, 
                iconPadding = 0, 
                iconSize = UDim2.fromOffset(l_Tokens_3.Global.Size_150, l_Tokens_3.Global.Size_150), 
                textHeight = l_Tokens_3.Global.Size_350, 
                horizontalAlignment = l_v60_0.horizontalAlignment, 
                textXAlignment = l_v60_0.textXAlignment
            }, l_v60_0.playerContext);
            return v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                PlayerContext = v5.createElement(v16, v64)
            });
        end);
        v59.Selectable = v44.props.Selectable;
        v59.hasRoundedCorners = true;
        v59.innerPadding = 0;
        v59.titleTopPadding = l_Tokens_2.Global.Space_100;
        v59.subtitleTopPadding = l_Tokens_2.Global.Space_25;
        v59.footerTopPadding = v52;
        v59.name = l_title_0;
        v59.nameTextColor = l_Tokens_2.Semantic.Color.Text.Emphasis.Color3;
        v59.titleRichText = true;
        v59.titleFontStyle = l_Tokens_2.Semantic.Typography.Subheader;
        v59.hasVerifiedBadge = v44.props.hasVerifiedBadge;
        v59.titleTextLineCount = 1;
        v59.subtitle = v44.props.subtitle;
        v59.subtitleFontStyle = v51;
        v59.onActivated = l_onActivated_0;
        v59.thumbnail = l_thumbnail_0;
        v59.backgroundImage = v10[v49.Theme.PlayerBackgroundDefault.Image];
        v60 = l_Dictionary_0.join(v44.props, {
            hoverMouseEnter = v44.hoverMouseEnter, 
            hoverMouseLeave = v44.hoverMouseLeave, 
            mouseEntered = v44.state.mouseEntered
        });
        v59.thumbnailOverlayComponents = v13(function(v65) --[[ Line: 138 ]]
            -- upvalues: v14 (ref), v24 (ref), v60 (copy), v5 (ref), v7 (ref), v17 (ref), v23 (ref), v25 (ref), l_List_0 (ref), v15 (ref)
            local l_Tokens_4 = v65.Tokens;
            local l_Space_100_2 = l_Tokens_4.Global.Space_100;
            local l_Space_100_3 = l_Tokens_4.Global.Space_100;
            local l_Size_450_1 = l_Tokens_4.Global.Size_450;
            local v70 = v14(v24, v60.controlState, v65);
            return v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ButtonBackgroundGradient = not v60.isCircular and not v7.isEmpty(v60.buttons) and v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_Size_450_1 + l_Space_100_2 * 2), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    LayoutOrder = 1
                }, {
                    UIGradient = v5.createElement("UIGradient", {
                        Rotation = 90, 
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v65.Theme.BackgroundUIContrast.Color), 
                            ColorSequenceKeypoint.new(1, v65.Theme.BackgroundUIContrast.Color)
                        }), 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1), 
                            NumberSequenceKeypoint.new(1, v65.Theme.BackgroundUIContrast.Transparency)
                        })
                    }), 
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                HoverTransparency = v5.createElement(v17.AnimatedImageLabel, {
                    springOptions = v23, 
                    animatedValues = {
                        imageTransparency = v60.mouseEntered and 0.6 or 1
                    }, 
                    mapValuesToProps = function(v71) --[[ Line: 177 ]] --[[ Name: mapValuesToProps ]]
                        return {
                            ImageTransparency = v71.imageTransparency
                        };
                    end, 
                    regularProps = {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Image = v25.Image, 
                        ImageRectSize = v25.ImageRectSize, 
                        ImageRectOffset = v25.ImageRectOffset, 
                        ImageColor3 = v70.Color, 
                        ImageTransparency = 0, 
                        LayoutOrder = 2, 
                        [v5.Event.MouseEnter] = v60.hoverMouseEnter, 
                        [v5.Event.MouseLeave] = v60.hoverMouseLeave
                    }
                }, {
                    corner = v5.createElement("UICorner", {
                        CornerRadius = if v60.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
                    })
                }), 
                ButtonContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 2
                }, {
                    PlayerTileButtons = v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(1, 0, 1, 0), 
                        Size = UDim2.new(0, v60.tileSize.X.Offset - l_Space_100_2 * 2, 0, l_Size_450_1), 
                        AnchorPoint = Vector2.new(1, 1), 
                        LayoutOrder = 3, 
                        ZIndex = 2
                    }, l_List_0.join(l_List_0.map(v60.buttons, function(v72) --[[ Line: 215 ]]
                        -- upvalues: v5 (ref), v15 (ref), l_Size_450_1 (copy), l_Space_100_2 (copy), v60 (ref)
                        return v5.createElement(v15, {
                            buttonHeight = l_Size_450_1, 
                            outerButtonPadding = l_Space_100_2, 
                            tileSize = v60.tileSize, 
                            icon = v72.icon, 
                            isSecondary = v72.isSecondary, 
                            isDisabled = v72.isDisabled, 
                            onActivated = v72.onActivated, 
                            mouseEnter = v60.hoverMouseEnter, 
                            mouseLeave = v60.hoverMouseLeave, 
                            isRoactGamepadEnabled = v60.isRoactGamepadEnabled
                        });
                    end), {
                        v5.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            Padding = UDim.new(0, l_Space_100_3), 
                            FillDirection = Enum.FillDirection.Horizontal
                        })
                    })), 
                    UIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, l_Space_100_2), 
                        PaddingRight = UDim.new(0, l_Space_100_2)
                    })
                })
            });
        end);
        v59.addSubtitleSpace = l_title_0 == nil;
        v59.isCircular = v44.props.isCircular;
        v59.horizontalAlignment = v44.props.horizontalAlignment;
        v59.thumbnailFrameSize = v44.props.thumbnailFrameSize;
        v59.openTypeFeatures = v44.props.openTypeFeatures;
        v56.Tile = l_createElement_1(l_v20_0, v59);
        return l_createElement_0(v54, v55, v56);
    end);
end;
return v5.forwardRef(function(v73, v74) --[[ Line: 337 ]]
    -- upvalues: v5 (copy), v21 (copy), l_Dictionary_0 (copy)
    return v5.createElement(v21, l_Dictionary_0.join(v73, {
        forwardedRef = v74
    }));
end);