local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Responsive);
local l_GetInputModeStore_0 = v4.GetInputModeStore;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.Cryo);
local l_LoadableImage_0 = v7.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v11 = require(l_Parent_0.TextSize);
local _ = require(l_Parent_0.SduiCoreSystem);
local l_FFlagSduiTileDisableLegacyHover_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiTileDisableLegacyHover;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local v16 = {};
local function v22(v17, v18, v19, v20, v21) --[[ Line: 114 ]] --[[ Name: maybeLayoutForButton ]]
    -- upvalues: v3 (copy), v8 (copy)
    if v18 == nil or v21 then
        return v17;
    else
        return {
            Content = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    HorizontalFlex = Enum.UIFlexAlignment.None, 
                    SortOrder = Enum.SortOrder.Name, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v19 or 0), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                UIPadding = if v20 > 0 then v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v20), 
                    PaddingRight = UDim.new(0, v20), 
                    PaddingBottom = UDim.new(0, v20)
                }) else nil, 
                LeftContent = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, v8.Dictionary.join({
                    UIFlexItem = v3.createElement("UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Shrink
                    })
                }, v17)), 
                RightContent = v18
            })
        };
    end;
end;
return v3.memo(function(v23) --[[ Line: 167 ]] --[[ Name: SduiTile ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v3 (copy), l_ContentProvider_0 (copy), v11 (copy), l_useTokens_0 (copy), l_GetInputModeStore_0 (copy), v4 (copy), l_FFlagSduiTileDisableLegacyHover_0 (copy), l_ImageSetLabel_0 (copy), l_LoadableImage_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v22 (copy), v8 (copy), v16 (copy)
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    if l_FFlagSduiServerCompat_0 then
        v24 = v23.layoutOrder;
        v25 = v23.anchorPoint;
        v26 = v23.automaticSize;
        v27 = v23.size;
        v28 = v23.zIndex;
        v29 = v23.position;
        v30 = v23.backgroundColor3;
        v31 = v23.selectionOrder;
    else
        v24 = v23.LayoutOrder;
        v25 = v23.AnchorPoint;
        v26 = v23.AutomaticSize;
        v27 = v23.Size;
        v28 = v23.ZIndex;
        v29 = v23.Position;
        v30 = v23.BackgroundColor3;
        v31 = v23.SelectionOrder;
    end;
    v3.useLayoutEffect(function() --[[ Line: 196 ]]
        -- upvalues: v23 (copy), l_ContentProvider_0 (ref)
        if v23.image then
            task.spawn(function() --[[ Line: 198 ]]
                -- upvalues: l_ContentProvider_0 (ref), v23 (ref)
                l_ContentProvider_0:PreloadAsync({
                    v23.image
                });
            end);
        end;
    end, {
        v23.image
    });
    local v32 = v11.getTextSizeStore(false).getTextSizeOffset(false);
    local v33 = l_useTokens_0();
    local v34 = v23.imageAspectRatio and v23.imageAspectRatio == 0 and 1 or v23.imageAspectRatio or 1;
    local v35 = v23.titleLines or 1;
    local v36 = v23.cornerRadius or v33.Radius.Medium;
    local v37 = v23.titleFont or v33.Typography.TitleMedium;
    local l_Emphasis_0 = v33.Color.Content.Emphasis;
    local v39 = math.ceil(v35 * (v37.LineHeight * v37.FontSize + v32));
    local v40 = v23.ctaButtonComponent ~= nil;
    local l_isContained_0 = v23.isContained;
    local l_Surface_100_0 = v33.Color.Surface.Surface_100;
    local v43 = v30 or l_Surface_100_0.Color3;
    local v44 = v23.containmentPadding or v33.Padding.Small;
    local v45, v46 = v3.useState(false);
    local v47 = if v23.isHovered ~= nil then v23.isHovered else v45;
    local v48 = v3.useCallback(function() --[[ Line: 231 ]]
        -- upvalues: l_GetInputModeStore_0 (ref), v4 (ref), v46 (copy), v23 (copy)
        if l_GetInputModeStore_0(false).getLastInputType(false) == v4.Input.Pointer then
            v46(true);
            if v23.onMouseEnter then
                v23.onMouseEnter();
                return;
            elseif v23.setCustomConditionState then
                v23.setCustomConditionState("hovered", true);
            end;
        end;
    end, {
        v23.onMouseEnter, 
        v23.setCustomConditionState
    });
    local v49 = v3.useCallback(function() --[[ Line: 244 ]]
        -- upvalues: v46 (copy), v23 (copy)
        v46(false);
        if v23.onMouseLeave then
            v23.onMouseLeave();
            return;
        else
            if v23.setCustomConditionState then
                v23.setCustomConditionState("hovered", false);
            end;
            return;
        end;
    end, {
        v23.onMouseLeave, 
        v23.setCustomConditionState
    });
    local v50 = v3.useCallback(function() --[[ Line: 253 ]]
        -- upvalues: v23 (copy)
        if v23.onSelectionGained then
            v23.onSelectionGained();
            return;
        else
            if v23.setCustomConditionState then
                v23.setCustomConditionState("selected", true);
            end;
            return;
        end;
    end, {
        v23.onSelectionGained, 
        v23.setCustomConditionState
    });
    local v51 = v3.useCallback(function() --[[ Line: 261 ]]
        -- upvalues: v23 (copy)
        if v23.onSelectionLost then
            v23.onSelectionLost();
            return;
        else
            if v23.setCustomConditionState then
                v23.setCustomConditionState("selected", false);
            end;
            return;
        end;
    end, {
        v23.onSelectionLost, 
        v23.setCustomConditionState
    });
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    if not l_FFlagSduiTileDisableLegacyHover_0 and v23.enableLegacyHoverState then
        v52 = v47;
        v53 = v23.containmentPadding or v33.Padding.Medium;
        v54 = if v47 then UDim2.new(1, v53 * 2, 1, v53 * 2) else nil;
        v55 = if v47 then UDim2.new(0, -v53, 0, -v53) else nil;
    end;
    return v3.createElement("TextButton", {
        [v3.Tag] = if v23.testId then ("data-testid=%*"):format(v23.testId) else nil, 
        ref = v23.setGuiObject, 
        Size = v54 or v27 or UDim2.new(1, 0, 1, 0), 
        Position = v55 or v29, 
        AnchorPoint = v25, 
        LayoutOrder = v24, 
        ZIndex = v28, 
        SelectionImageObject = v23.sduiContext.dependencies.cursors.tileCursor, 
        Active = v23.isDisabled, 
        [v3.Event.Activated] = v23.onActivated, 
        [v3.Event.MouseEnter] = v48, 
        [v3.Event.MouseLeave] = v49, 
        [v3.Event.SelectionGained] = v50, 
        [v3.Event.SelectionLost] = v51, 
        ClipsDescendants = false, 
        Text = "", 
        TextTransparency = 1, 
        BackgroundTransparency = (not not l_isContained_0 or v52) and 0 or 1, 
        AutoButtonColor = false, 
        AutomaticSize = v26 or Enum.AutomaticSize.Y, 
        BackgroundColor3 = v43, 
        BorderSizePixel = 0, 
        SelectionOrder = v31
    }, {
        UIPadding = if l_FFlagSduiTileDisableLegacyHover_0 then nil else if v52 then v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v53), 
            PaddingRight = UDim.new(0, v53), 
            PaddingTop = UDim.new(0, v53)
        }) else nil, 
        UICorner = if not not l_isContained_0 or not l_FFlagSduiTileDisableLegacyHover_0 and v52 then v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v36)
        }) else nil, 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v33.Gap.Medium)
        }), 
        ImageFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1 / v34, 0), 
            ZIndex = -1, 
            LayoutOrder = 1, 
            ClipsDescendants = l_isContained_0 and true or nil, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX
        }, {
            BackgroundImage = if v23.backgroundImageComponent then v23.backgroundImageComponent else if v23.backgroundImage then v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v23.backgroundImage, 
                BackgroundTransparency = 1, 
                ZIndex = -3
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v36)
                })
            }) else nil, 
            Thumbnail = if v23.imageComponent then v23.imageComponent else if v23.image then v3.createElement(l_LoadableImage_0, {
                BackgroundColor3 = v23.thumbnailBackgroundStyle and v23.thumbnailBackgroundStyle.Color3 or nil, 
                BackgroundTransparency = v23.thumbnailBackgroundStyle and v23.thumbnailBackgroundStyle.Transparency or 1, 
                Image = v23.image, 
                Size = UDim2.new(1, 0, 1, if l_isContained_0 then v36 else 0), 
                cornerRadius = UDim.new(0, v36), 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true, 
                ZIndex = -2, 
                ScaleType = if l_isContained_0 then Enum.ScaleType.Tile else nil, 
                TileSize = if l_isContained_0 then UDim2.new(1, 0, 1, -v36) else nil, 
                onLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v23.onTileImageLoaded else nil
            }) else nil, 
            UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = v34 or 1
            }), 
            ThumbnailOverlay = v23.thumbnailOverlayComponent, 
            HoverOverlay = if v47 then v3.createElement("Frame", {
                BackgroundColor3 = v33.Color.State.Hover.Color3, 
                BackgroundTransparency = v33.Color.State.Hover.Transparency, 
                Size = UDim2.new(1, 0, 1, if l_isContained_0 then v36 else 0)
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v36)
                })
            }) else nil
        }), 
        BottomContent = v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 2, 
            ZIndex = 1
        }, (v22({
            UIPadding = if not l_isContained_0 or v40 then nil else v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v44), 
                PaddingRight = UDim.new(0, v44), 
                PaddingBottom = UDim.new(0, v44)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.Name, 
                HorizontalFlex = Enum.UIFlexAlignment.Fill
            }), 
            ["1_Title"] = if v23.titleComponent then v23.titleComponent else if v23.titleText and v23.titleText ~= "" then v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v39), 
                BackgroundTransparency = 1, 
                Text = v23.titleText, 
                Font = v37.Font, 
                TextSize = v37.FontSize, 
                TextTransparency = l_Emphasis_0.Transparency, 
                TextColor3 = l_Emphasis_0.Color3, 
                TextWrapped = v35 > 1, 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                AutomaticSize = v40 and Enum.AutomaticSize.X or nil
            }) else nil, 
            ["2_Footer"] = if v23.footerComponent then v23.footerComponent else nil, 
            Z_3_ExtraOverflow = if l_FFlagSduiTileDisableLegacyHover_0 then nil else if v52 and v23.renderLegacyHoverState then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                ZIndex = -1
            }, {
                ExtraOverflow = v23.renderLegacyHoverState(v53, v43, v36)
            }) else nil
        }, v23.ctaButtonComponent, v33.Gap.Small, if l_isContained_0 then v44 else 0, v52))), 
        ExtraChildren = if not not v23.focusNavActionsComponent or v23.children then v3.createElement(v3.Fragment, nil, v8.Dictionary.join(v23.children or v16, {
            focusNavActions = v23.focusNavActionsComponent
        })) else nil
    });
end);