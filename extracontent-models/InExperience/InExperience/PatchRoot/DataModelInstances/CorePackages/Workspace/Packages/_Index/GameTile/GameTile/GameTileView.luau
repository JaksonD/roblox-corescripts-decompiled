local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_useCursor_0 = v4.App.SelectionCursor.useCursor;
local v9 = require(l_script_FirstAncestor_0.Footer.RightAlignedButtonWrapper);
local v10 = require(l_script_FirstAncestor_0.ZoomAnimatedFrame);
local v11 = require(l_script_FirstAncestor_0.GameTileViewConfig);
local l_FFlagLuaAppGameTileInteractionFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileInteractionFeedback;
local l_FFlagLuaAppMigrateGameTileHoverFixes_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v15) --[[ Line: 82 ]] --[[ Name: GameTileView ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v11 (copy), l_useCursor_0 (copy), l_FFlagLuaAppMigrateGameTileHoverFixes_0 (copy), v2 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v10 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_LoadableImage_0 (copy), v9 (copy)
    local v16 = l_useDesignTokens_0();
    local v17 = if v15.isUnifiedGameTile then v15.numLinesForTitle or 1 else nil;
    local v18 = v15.numLinesForMetadata or 1;
    local l_textSizeOffset_0 = v15.textSizeOffset;
    local v20 = l_useTokens_0();
    local v21 = v11.getElementSizes(v16, l_textSizeOffset_0, if v15.isUnifiedGameTile then v17 else nil, if v15.isUnifiedGameTile then v20 else nil, v15.isUnifiedGameTile and true or nil, v18);
    local v22 = if v20 and v15.isUnifiedGameTile then v20.Radius.Medium else v16.Global.Space_100;
    local v23 = UDim.new(0, v22);
    local v24 = l_useCursor_0(v23);
    local v25 = if v20 and v15.isUnifiedGameTile then v20.Typography.TitleMedium else v16.Semantic.Typography.Subheader;
    local l_FontSize_0 = v25.FontSize;
    local v27 = if v20 and v15.isUnifiedGameTile then v20.Color.Content.Emphasis else v16.Semantic.Color.Text.Emphasis;
    local l_Space_50_0 = v16.Global.Space_50;
    local v29 = if v15.isUnifiedGameTile then v15.hoverPadding or v16.Global.Space_150 else v16.Global.Space_150;
    local v30 = v15.hidePlayButton and 0 or v21.playButtonHeight;
    local v31 = nil;
    v31 = if v15.isUnifiedGameTile then if v15.isContained then v15.containmentSidePadding or v20.Padding.Medium else 0 else if v15.isContained then v16.Global.Space_150 else 0;
    local v32 = (not not v15.hidePlayButton or v15.isContained and v15.isUnifiedGameTile) and 0 or v16.Global.Space_150;
    local l_isHovered_0 = v15.isHovered;
    local v34 = l_FFlagLuaAppMigrateGameTileHoverFixes_0 and l_isHovered_0 and v15.isUnifiedGameTile;
    local v35 = UDim.new(1, -if v15.isUnifiedGameTile then v31 else v16.Global.Space_150 + v31);
    local v36 = v15.Size or UDim2.fromScale(1, 1);
    if l_isHovered_0 then
        v36 = v36 + UDim2.fromOffset(v29 * 2, v29 * 2);
    end;
    local v37 = v11.getFooterHeight(v16, v15.isContained, v15.footerMetadata == nil, v15.title == nil, l_textSizeOffset_0, v15.extraFooterSpace, v17, v20, v15.isUnifiedGameTile, v15.numLinesForMetadata);
    local v38 = if not not v15.title or v15.footerMetadata then v21.footerTopPadding else 0;
    local v39 = if v15.title and v15.footerMetadata then v21.paddingAboveMetadata else 0;
    local v40 = if v15.title then v21.titleHeight else 0;
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    v41 = v2.useRef(false);
    v42 = v2.useCallback(function(...) --[[ Line: 170 ]]
        -- upvalues: v41 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v15 (copy)
        v41.current = false;
        if l_FFlagLuaAppGameTileInteractionFeedback_0 and v15.onGuiStateChanged then
            v15.onGuiStateChanged(...);
        end;
    end, {
        v15.onGuiStateChanged
    });
    v43 = v2.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v15 (copy), v41 (ref)
        if v15.onTouchLongPress and not v15.isDisabled then
            local l_current_0 = v41.current;
            v41.current = true;
            if l_current_0 == false then
                v15.onTouchLongPress();
            end;
        end;
    end, {
        v15.onTouchLongPress, 
        v15.isDisabled
    });
    local v45 = v2.useCallback(function() --[[ Line: 187 ]]
        -- upvalues: v41 (ref), v15 (copy)
        if v41.current then
            v41.current = false;
            return;
        else
            if v15.onActivated and not v15.isDisabled then
                v15.onActivated();
            end;
            return;
        end;
    end, {
        v15.onActivated, 
        v15.isDisabled
    });
    return v2.createElement(v10, {
        isZoomEnabled = l_isHovered_0, 
        expansionOffsetX = l_Space_50_0 * 2, 
        expansionOffsetTop = l_Space_50_0, 
        expansionOffsetBottom = v30 + v32 + (v15.hidePlayButton and 0 or l_Space_50_0) / (v15.imageAspectRatio or 1) + l_Space_50_0 + if v15.hideMetadata and v15.footerMetadata then v21.metadataHeight else 0, 
        reducedMotion = v15.reducedMotion
    }, {
        HoverShadow = l_isHovered_0 and v2.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v29 + 18, 1, v29 + 20), 
            Image = l_Images_0["component_assets/dropshadow_56_8"], 
            ImageColor3 = v16.Semantic.Color.Common.DropShadow.Color3, 
            ImageTransparency = v16.Semantic.Color.Common.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(35, 35, 37, 37), 
            ZIndex = -1
        }) or nil, 
        GameTileContent = v2.createElement("TextButton", {
            SelectionOrder = v15.SelectionOrder, 
            ref = v15.forwardRef, 
            Size = v36, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            SelectionImageObject = v24, 
            Active = not v15.isDisabled, 
            [v2.Change.GuiState] = v42, 
            [v2.Event.Activated] = v45, 
            [v2.Event.SelectionGained] = v15.onSelectionGained, 
            [v2.Event.SelectionLost] = v15.onSelectionLost, 
            [v2.Event.TouchLongPress] = v43, 
            ClipsDescendants = false, 
            Text = "", 
            BackgroundTransparency = if v20 and v15.isUnifiedGameTile then l_isHovered_0 and v20.Color.Surface.Surface_100.Transparency or 1 else l_isHovered_0 and v16.Semantic.Color.BackgroundUi.Default.Transparency or 1, 
            BackgroundColor3 = if v20 and v15.isUnifiedGameTile then v20.Color.Surface.Surface_100.Color3 else v16.Semantic.Color.BackgroundUi.Default.Color3, 
            AutoButtonColor = false, 
            Selectable = v15.Selectable, 
            [v2.Tag] = "data-testid=--game-tile"
        }, {
            UIPadding = l_isHovered_0 and v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v29), 
                PaddingTop = UDim.new(0, v29), 
                PaddingRight = UDim.new(0, v29), 
                PaddingBottom = UDim.new(0, v29)
            }) or nil, 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = if l_FFlagLuaAppMigrateGameTileHoverFixes_0 and v15.isUnifiedGameTile then v23 else v23 + UDim.new(0, v29)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ThumbnailFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                LayoutOrder = 1, 
                ZIndex = -1
            }, {
                Thumbnail = if v15.thumbnailComponent then v15.thumbnailComponent else v2.createElement(l_LoadableImage_0, {
                    BackgroundTransparency = 1, 
                    Image = v15.image, 
                    Size = UDim2.new(1, 0, 1, (not v15.isContained or v34) and 0 or v22), 
                    cornerRadius = v23, 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true, 
                    ZIndex = -2, 
                    ScaleType = if not v15.isContained or v34 then nil else Enum.ScaleType.Tile, 
                    TileSize = if not v15.isContained or v34 then nil else UDim2.new(1, 0, 1, -v22)
                }), 
                ContainedBackgroundTop = if not v15.isContained or v34 then nil else v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v37 - v22), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 0, 
                    ZIndex = -1, 
                    BackgroundColor3 = if v15.isUnifiedGameTile and v20 then v20.Color.Surface.Surface_100.Color3 else v16.Semantic.Color.BackgroundUi.Default.Color3, 
                    BorderSizePixel = 0
                }), 
                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = v15.imageAspectRatio or 1
                }), 
                ThumbnailOverlay = v15.thumbnailOverlay, 
                OverflowMenu = v15.overflowMenu
            }), 
            BottomContent = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v37), 
                LayoutOrder = 2, 
                BackgroundTransparency = v15.isContained and 0 or 1, 
                BackgroundColor3 = if v20 and v15.isUnifiedGameTile then v20.Color.Surface.Surface_100.Color3 else v16.Semantic.Color.BackgroundUi.Default.Color3, 
                BorderSizePixel = 0
            }, {
                UICorner = if v15.isContained then v2.createElement("UICorner", {
                    CornerRadius = v23
                }) else nil, 
                TextWrapper = v2.createElement(v9, {
                    Button = v15.rightCornerButton, 
                    Padding = UDim.new(0, v15.isContained and 0 or v16.Global.Space_150), 
                    Content = v2.createElement(v2.Fragment, nil, {
                        Title = v15.title and v2.createElement("TextLabel", {
                            Position = UDim2.new(0, v31, 0, v38), 
                            Size = UDim2.new(1, -2 * v31, 0, v40), 
                            BackgroundTransparency = 1, 
                            Text = v15.title, 
                            Font = v25.Font, 
                            TextSize = l_FontSize_0, 
                            TextTransparency = v27.Transparency, 
                            TextColor3 = v27.Color3, 
                            TextWrapped = if v17 and v15.isUnifiedGameTile then v17 > 1 else false, 
                            TextTruncate = Enum.TextTruncate.SplitWord, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = if v15.isUnifiedGameTile then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
                            LayoutOrder = 3
                        }) or nil, 
                        Metadata = v15.footerMetadata and v2.createElement("Frame", {
                            Position = UDim2.new(0, v31, 0, v40 + v38 + v39), 
                            Size = UDim2.new(v35, UDim.new(0, v21.metadataHeight)), 
                            ClipsDescendants = false, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 5
                        }, {
                            MetadataContent = v15.footerMetadata
                        }), 
                        ExtraContent = v15.extraFooterContent and v15.extraFooterSpace and v2.createElement("Frame", {
                            Size = UDim2.new(1, -v31 * 2, 0, v15.extraFooterSpace), 
                            Position = UDim2.new(0, v31, 0, v40 + v38 + v39 + v21.metadataHeight), 
                            BackgroundTransparency = 1
                        }, {
                            v15.extraFooterContent
                        })
                    })
                })
            }) or nil, 
            PaddingAboveActionRow = l_isHovered_0 and v2.createElement("Frame", {
                LayoutOrder = 6, 
                Size = UDim2.fromOffset(0, v32), 
                BackgroundTransparency = 1
            }) or nil, 
            ActionRow = l_isHovered_0 and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v30), 
                BackgroundTransparency = 1, 
                LayoutOrder = 7
            }, {
                Content = v15.hoverActionRow
            }) or nil
        })
    });
end;