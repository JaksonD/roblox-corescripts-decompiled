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
local v15 = {};
local function v21(v16, v17, v18, v19, v20) --[[ Line: 109 ]] --[[ Name: maybeLayoutForButton ]]
    -- upvalues: v3 (copy), v8 (copy)
    if v17 == nil or v20 then
        return v16;
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
                    Padding = UDim.new(0, v18 or 0), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                UIPadding = if v19 > 0 then v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v19), 
                    PaddingRight = UDim.new(0, v19), 
                    PaddingBottom = UDim.new(0, v19)
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
                }, v16)), 
                RightContent = v17
            })
        };
    end;
end;
return v3.memo(function(v22) --[[ Line: 162 ]] --[[ Name: SduiTile ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v3 (copy), l_ContentProvider_0 (copy), v11 (copy), l_useTokens_0 (copy), l_GetInputModeStore_0 (copy), v4 (copy), l_FFlagSduiTileDisableLegacyHover_0 (copy), l_ImageSetLabel_0 (copy), l_LoadableImage_0 (copy), v21 (copy), v8 (copy), v15 (copy)
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    if l_FFlagSduiServerCompat_0 then
        v23 = v22.layoutOrder;
        v24 = v22.anchorPoint;
        v25 = v22.automaticSize;
        v26 = v22.size;
        v27 = v22.zIndex;
        v28 = v22.position;
        v29 = v22.backgroundColor3;
        v30 = v22.selectionOrder;
    else
        v23 = v22.LayoutOrder;
        v24 = v22.AnchorPoint;
        v25 = v22.AutomaticSize;
        v26 = v22.Size;
        v27 = v22.ZIndex;
        v28 = v22.Position;
        v29 = v22.BackgroundColor3;
        v30 = v22.SelectionOrder;
    end;
    v3.useLayoutEffect(function() --[[ Line: 191 ]]
        -- upvalues: v22 (copy), l_ContentProvider_0 (ref)
        if v22.image then
            task.spawn(function() --[[ Line: 193 ]]
                -- upvalues: l_ContentProvider_0 (ref), v22 (ref)
                l_ContentProvider_0:PreloadAsync({
                    v22.image
                });
            end);
        end;
    end, {
        v22.image
    });
    local v31 = v11.getTextSizeStore(false).getTextSizeOffset(false);
    local v32 = l_useTokens_0();
    local v33 = v22.imageAspectRatio and v22.imageAspectRatio == 0 and 1 or v22.imageAspectRatio or 1;
    local v34 = v22.titleLines or 1;
    local v35 = v22.cornerRadius or v32.Radius.Medium;
    local v36 = v22.titleFont or v32.Typography.TitleMedium;
    local l_Emphasis_0 = v32.Color.Content.Emphasis;
    local v38 = math.ceil(v34 * (v36.LineHeight * v36.FontSize + v31));
    local v39 = v22.ctaButtonComponent ~= nil;
    local l_isContained_0 = v22.isContained;
    local l_Surface_100_0 = v32.Color.Surface.Surface_100;
    local v42 = v29 or l_Surface_100_0.Color3;
    local v43 = v22.containmentPadding or v32.Padding.Small;
    local v44, v45 = v3.useState(false);
    local v46 = if v22.isHovered ~= nil then v22.isHovered else v44;
    local v47 = v3.useCallback(function() --[[ Line: 226 ]]
        -- upvalues: l_GetInputModeStore_0 (ref), v4 (ref), v45 (copy), v22 (copy)
        if l_GetInputModeStore_0(false).getLastInputType(false) == v4.Input.Pointer then
            v45(true);
            if v22.onMouseEnter then
                v22.onMouseEnter();
                return;
            elseif v22.setCustomConditionState then
                v22.setCustomConditionState("hovered", true);
            end;
        end;
    end, {
        v22.onMouseEnter, 
        v22.setCustomConditionState
    });
    local v48 = v3.useCallback(function() --[[ Line: 239 ]]
        -- upvalues: v45 (copy), v22 (copy)
        v45(false);
        if v22.onMouseLeave then
            v22.onMouseLeave();
            return;
        else
            if v22.setCustomConditionState then
                v22.setCustomConditionState("hovered", false);
            end;
            return;
        end;
    end, {
        v22.onMouseLeave, 
        v22.setCustomConditionState
    });
    local v49 = v3.useCallback(function() --[[ Line: 248 ]]
        -- upvalues: v22 (copy)
        if v22.onSelectionGained then
            v22.onSelectionGained();
            return;
        else
            if v22.setCustomConditionState then
                v22.setCustomConditionState("selected", true);
            end;
            return;
        end;
    end, {
        v22.onSelectionGained, 
        v22.setCustomConditionState
    });
    local v50 = v3.useCallback(function() --[[ Line: 256 ]]
        -- upvalues: v22 (copy)
        if v22.onSelectionLost then
            v22.onSelectionLost();
            return;
        else
            if v22.setCustomConditionState then
                v22.setCustomConditionState("selected", false);
            end;
            return;
        end;
    end, {
        v22.onSelectionLost, 
        v22.setCustomConditionState
    });
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    if not l_FFlagSduiTileDisableLegacyHover_0 and v22.enableLegacyHoverState then
        v51 = v46;
        v52 = v22.containmentPadding or v32.Padding.Medium;
        v53 = if v46 then UDim2.new(1, v52 * 2, 1, v52 * 2) else nil;
        v54 = if v46 then UDim2.new(0, -v52, 0, -v52) else nil;
    end;
    return v3.createElement("TextButton", {
        [v3.Tag] = if v22.testId then ("data-testid=%*"):format(v22.testId) else nil, 
        ref = v22.setGuiObject, 
        Size = v53 or v26 or UDim2.new(1, 0, 1, 0), 
        Position = v54 or v28, 
        AnchorPoint = v24, 
        LayoutOrder = v23, 
        ZIndex = v27, 
        SelectionImageObject = v22.sduiContext.dependencies.cursors.tileCursor, 
        Active = v22.isDisabled, 
        [v3.Event.Activated] = v22.onActivated, 
        [v3.Event.MouseEnter] = v47, 
        [v3.Event.MouseLeave] = v48, 
        [v3.Event.SelectionGained] = v49, 
        [v3.Event.SelectionLost] = v50, 
        ClipsDescendants = false, 
        Text = "", 
        TextTransparency = 1, 
        BackgroundTransparency = (not not l_isContained_0 or v51) and 0 or 1, 
        AutoButtonColor = false, 
        AutomaticSize = v25 or Enum.AutomaticSize.Y, 
        BackgroundColor3 = v42, 
        BorderSizePixel = 0, 
        SelectionOrder = v30
    }, {
        UIPadding = if l_FFlagSduiTileDisableLegacyHover_0 then nil else if v51 then v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v52), 
            PaddingRight = UDim.new(0, v52), 
            PaddingTop = UDim.new(0, v52)
        }) else nil, 
        UICorner = if not not l_isContained_0 or not l_FFlagSduiTileDisableLegacyHover_0 and v51 then v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v35)
        }) else nil, 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v32.Gap.Medium)
        }), 
        ImageFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1 / v33, 0), 
            ZIndex = -1, 
            LayoutOrder = 1, 
            ClipsDescendants = l_isContained_0 and true or nil, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX
        }, {
            BackgroundImage = if v22.backgroundImageComponent then v22.backgroundImageComponent else if v22.backgroundImage then v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v22.backgroundImage, 
                BackgroundTransparency = 1, 
                ZIndex = -3
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v35)
                })
            }) else nil, 
            Thumbnail = if v22.imageComponent then v22.imageComponent else if v22.image then v3.createElement(l_LoadableImage_0, {
                BackgroundColor3 = v22.thumbnailBackgroundStyle and v22.thumbnailBackgroundStyle.Color3 or nil, 
                BackgroundTransparency = v22.thumbnailBackgroundStyle and v22.thumbnailBackgroundStyle.Transparency or 1, 
                Image = v22.image, 
                Size = UDim2.new(1, 0, 1, if l_isContained_0 then v35 else 0), 
                cornerRadius = UDim.new(0, v35), 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true, 
                ZIndex = -2, 
                ScaleType = if l_isContained_0 then Enum.ScaleType.Tile else nil, 
                TileSize = if l_isContained_0 then UDim2.new(1, 0, 1, -v35) else nil
            }) else nil, 
            UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = v33 or 1
            }), 
            ThumbnailOverlay = v22.thumbnailOverlayComponent, 
            HoverOverlay = if v46 then v3.createElement("Frame", {
                BackgroundColor3 = v32.Color.State.Hover.Color3, 
                BackgroundTransparency = v32.Color.State.Hover.Transparency, 
                Size = UDim2.new(1, 0, 1, if l_isContained_0 then v35 else 0)
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v35)
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
        }, (v21({
            UIPadding = if not l_isContained_0 or v39 then nil else v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v43), 
                PaddingRight = UDim.new(0, v43), 
                PaddingBottom = UDim.new(0, v43)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.Name, 
                HorizontalFlex = Enum.UIFlexAlignment.Fill
            }), 
            ["1_Title"] = if v22.titleComponent then v22.titleComponent else if v22.titleText and v22.titleText ~= "" then v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v38), 
                BackgroundTransparency = 1, 
                Text = v22.titleText, 
                Font = v36.Font, 
                TextSize = v36.FontSize, 
                TextTransparency = l_Emphasis_0.Transparency, 
                TextColor3 = l_Emphasis_0.Color3, 
                TextWrapped = v34 > 1, 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                AutomaticSize = v39 and Enum.AutomaticSize.X or nil
            }) else nil, 
            ["2_Footer"] = if v22.footerComponent then v22.footerComponent else nil, 
            Z_3_ExtraOverflow = if l_FFlagSduiTileDisableLegacyHover_0 then nil else if v51 and v22.renderLegacyHoverState then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                ZIndex = -1
            }, {
                ExtraOverflow = v22.renderLegacyHoverState(v52, v42, v35)
            }) else nil
        }, v22.ctaButtonComponent, v32.Gap.Small, if l_isContained_0 then v43 else 0, v51))), 
        ExtraChildren = if not not v22.focusNavActionsComponent or v22.children then v3.createElement(v3.Fragment, nil, v8.Dictionary.join(v22.children or v15, {
            focusNavActions = v22.focusNavActionsComponent
        })) else nil
    });
end);