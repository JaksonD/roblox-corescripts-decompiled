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
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v16) --[[ Line: 87 ]] --[[ Name: GameTileView ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v11 (copy), l_useCursor_0 (copy), l_FFlagLuaAppMigrateGameTileHoverFixes_0 (copy), v2 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v10 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_LoadableImage_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v9 (copy)
    local v17 = l_useDesignTokens_0();
    local v18 = if v16.isUnifiedGameTile then v16.numLinesForTitle or 1 else nil;
    local v19 = v16.numLinesForMetadata or 1;
    local l_textSizeOffset_0 = v16.textSizeOffset;
    local v21 = l_useTokens_0();
    local v22 = v11.getElementSizes(v17, l_textSizeOffset_0, if v16.isUnifiedGameTile then v18 else nil, if v16.isUnifiedGameTile then v21 else nil, v16.isUnifiedGameTile and true or nil, v19);
    local v23 = if v21 and v16.isUnifiedGameTile then v21.Radius.Medium else v17.Global.Space_100;
    local v24 = UDim.new(0, v23);
    local v25 = l_useCursor_0(v24);
    local v26 = if v21 and v16.isUnifiedGameTile then v21.Typography.TitleMedium else v17.Semantic.Typography.Subheader;
    local l_FontSize_0 = v26.FontSize;
    local v28 = if v21 and v16.isUnifiedGameTile then v21.Color.Content.Emphasis else v17.Semantic.Color.Text.Emphasis;
    local l_Space_50_0 = v17.Global.Space_50;
    local v30 = if v16.isUnifiedGameTile then v16.hoverPadding or v17.Global.Space_150 else v17.Global.Space_150;
    local v31 = v16.hidePlayButton and 0 or v22.playButtonHeight;
    local v32 = nil;
    v32 = if v16.isUnifiedGameTile then if v16.isContained then v16.containmentSidePadding or v21.Padding.Medium else 0 else if v16.isContained then v17.Global.Space_150 else 0;
    local v33 = (not not v16.hidePlayButton or v16.isContained and v16.isUnifiedGameTile) and 0 or v17.Global.Space_150;
    local l_isHovered_0 = v16.isHovered;
    local v35 = l_FFlagLuaAppMigrateGameTileHoverFixes_0 and l_isHovered_0 and v16.isUnifiedGameTile;
    local v36 = UDim.new(1, -if v16.isUnifiedGameTile then v32 else v17.Global.Space_150 + v32);
    local v37 = v16.Size or UDim2.fromScale(1, 1);
    if l_isHovered_0 then
        v37 = v37 + UDim2.fromOffset(v30 * 2, v30 * 2);
    end;
    local v38 = v11.getFooterHeight(v17, v16.isContained, v16.footerMetadata == nil, v16.title == nil, l_textSizeOffset_0, v16.extraFooterSpace, v18, v21, v16.isUnifiedGameTile, v16.numLinesForMetadata);
    local v39 = if not not v16.title or v16.footerMetadata then v22.footerTopPadding else 0;
    local v40 = if v16.title and v16.footerMetadata then v22.paddingAboveMetadata else 0;
    local v41 = if v16.title then v22.titleHeight else 0;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    v42 = v2.useRef(false);
    v43 = v2.useCallback(function(...) --[[ Line: 175 ]]
        -- upvalues: v42 (ref), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v16 (copy)
        v42.current = false;
        if l_FFlagLuaAppGameTileInteractionFeedback_0 and v16.onGuiStateChanged then
            v16.onGuiStateChanged(...);
        end;
    end, {
        v16.onGuiStateChanged
    });
    v44 = v2.useCallback(function() --[[ Line: 182 ]]
        -- upvalues: v16 (copy), v42 (ref)
        if v16.onTouchLongPress and not v16.isDisabled then
            local l_current_0 = v42.current;
            v42.current = true;
            if l_current_0 == false then
                v16.onTouchLongPress();
            end;
        end;
    end, {
        v16.onTouchLongPress, 
        v16.isDisabled
    });
    local v46 = v2.useCallback(function() --[[ Line: 192 ]]
        -- upvalues: v42 (ref), v16 (copy)
        if v42.current then
            v42.current = false;
            return;
        else
            if v16.onActivated and not v16.isDisabled then
                v16.onActivated();
            end;
            return;
        end;
    end, {
        v16.onActivated, 
        v16.isDisabled
    });
    return v2.createElement(v10, {
        isZoomEnabled = l_isHovered_0, 
        expansionOffsetX = l_Space_50_0 * 2, 
        expansionOffsetTop = l_Space_50_0, 
        expansionOffsetBottom = v31 + v33 + (v16.hidePlayButton and 0 or l_Space_50_0) / (v16.imageAspectRatio or 1) + l_Space_50_0 + if v16.hideMetadata and v16.footerMetadata then v22.metadataHeight else 0, 
        reducedMotion = v16.reducedMotion
    }, {
        HoverShadow = l_isHovered_0 and v2.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v30 + 18, 1, v30 + 20), 
            Image = l_Images_0["component_assets/dropshadow_56_8"], 
            ImageColor3 = v17.Semantic.Color.Common.DropShadow.Color3, 
            ImageTransparency = v17.Semantic.Color.Common.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(35, 35, 37, 37), 
            ZIndex = -1
        }) or nil, 
        GameTileContent = v2.createElement("TextButton", {
            SelectionOrder = v16.SelectionOrder, 
            ref = v16.forwardRef, 
            Size = v37, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            SelectionImageObject = v25, 
            Active = not v16.isDisabled, 
            [v2.Change.GuiState] = v43, 
            [v2.Event.Activated] = v46, 
            [v2.Event.SelectionGained] = v16.onSelectionGained, 
            [v2.Event.SelectionLost] = v16.onSelectionLost, 
            [v2.Event.TouchLongPress] = v44, 
            ClipsDescendants = false, 
            Text = "", 
            BackgroundTransparency = if v21 and v16.isUnifiedGameTile then l_isHovered_0 and v21.Color.Surface.Surface_100.Transparency or 1 else l_isHovered_0 and v17.Semantic.Color.BackgroundUi.Default.Transparency or 1, 
            BackgroundColor3 = if v21 and v16.isUnifiedGameTile then v21.Color.Surface.Surface_100.Color3 else v17.Semantic.Color.BackgroundUi.Default.Color3, 
            AutoButtonColor = false, 
            Selectable = v16.Selectable, 
            [v2.Tag] = "data-testid=--game-tile"
        }, {
            UIPadding = l_isHovered_0 and v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v30), 
                PaddingTop = UDim.new(0, v30), 
                PaddingRight = UDim.new(0, v30), 
                PaddingBottom = UDim.new(0, v30)
            }) or nil, 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = if l_FFlagLuaAppMigrateGameTileHoverFixes_0 and v16.isUnifiedGameTile then v24 else v24 + UDim.new(0, v30)
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
                Thumbnail = if v16.thumbnailComponent then v16.thumbnailComponent else v2.createElement(l_LoadableImage_0, {
                    BackgroundTransparency = 1, 
                    Image = v16.image, 
                    Size = UDim2.new(1, 0, 1, (not v16.isContained or v35) and 0 or v23), 
                    cornerRadius = v24, 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true, 
                    ZIndex = -2, 
                    ScaleType = if not v16.isContained or v35 then nil else Enum.ScaleType.Tile, 
                    TileSize = if not v16.isContained or v35 then nil else UDim2.new(1, 0, 1, -v23), 
                    onLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v16.onTileImageLoaded else nil
                }), 
                ContainedBackgroundTop = if not v16.isContained or v35 then nil else v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v38 - v23), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 0, 
                    ZIndex = -1, 
                    BackgroundColor3 = if v16.isUnifiedGameTile and v21 then v21.Color.Surface.Surface_100.Color3 else v17.Semantic.Color.BackgroundUi.Default.Color3, 
                    BorderSizePixel = 0
                }), 
                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = v16.imageAspectRatio or 1
                }), 
                ThumbnailOverlay = v16.thumbnailOverlay, 
                OverflowMenu = v16.overflowMenu
            }), 
            BottomContent = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v38), 
                LayoutOrder = 2, 
                BackgroundTransparency = v16.isContained and 0 or 1, 
                BackgroundColor3 = if v21 and v16.isUnifiedGameTile then v21.Color.Surface.Surface_100.Color3 else v17.Semantic.Color.BackgroundUi.Default.Color3, 
                BorderSizePixel = 0
            }, {
                UICorner = if v16.isContained then v2.createElement("UICorner", {
                    CornerRadius = v24
                }) else nil, 
                TextWrapper = v2.createElement(v9, {
                    Button = v16.rightCornerButton, 
                    Padding = UDim.new(0, v16.isContained and 0 or v17.Global.Space_150), 
                    Content = v2.createElement(v2.Fragment, nil, {
                        Title = v16.title and v2.createElement("TextLabel", {
                            Position = UDim2.new(0, v32, 0, v39), 
                            Size = UDim2.new(1, -2 * v32, 0, v41), 
                            BackgroundTransparency = 1, 
                            Text = v16.title, 
                            Font = v26.Font, 
                            TextSize = l_FontSize_0, 
                            TextTransparency = v28.Transparency, 
                            TextColor3 = v28.Color3, 
                            TextWrapped = if v18 and v16.isUnifiedGameTile then v18 > 1 else false, 
                            TextTruncate = Enum.TextTruncate.SplitWord, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = if v16.isUnifiedGameTile then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
                            LayoutOrder = 3
                        }) or nil, 
                        Metadata = v16.footerMetadata and v2.createElement("Frame", {
                            Position = UDim2.new(0, v32, 0, v41 + v39 + v40), 
                            Size = UDim2.new(v36, UDim.new(0, v22.metadataHeight)), 
                            ClipsDescendants = false, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 5
                        }, {
                            MetadataContent = v16.footerMetadata
                        }), 
                        ExtraContent = v16.extraFooterContent and v16.extraFooterSpace and v2.createElement("Frame", {
                            Size = UDim2.new(1, -v32 * 2, 0, v16.extraFooterSpace), 
                            Position = UDim2.new(0, v32, 0, v41 + v39 + v40 + v22.metadataHeight), 
                            BackgroundTransparency = 1
                        }, {
                            v16.extraFooterContent
                        })
                    })
                })
            }) or nil, 
            PaddingAboveActionRow = l_isHovered_0 and v2.createElement("Frame", {
                LayoutOrder = 6, 
                Size = UDim2.fromOffset(0, v33), 
                BackgroundTransparency = 1
            }) or nil, 
            ActionRow = l_isHovered_0 and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v31), 
                BackgroundTransparency = 1, 
                LayoutOrder = 7
            }, {
                Content = v16.hoverActionRow
            }) or nil
        })
    });
end;