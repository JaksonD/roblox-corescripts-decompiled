local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_3.Core;
local l_Parent_4 = l_Parent_3.Parent;
local v6 = require(l_Parent_4.Cryo);
local v7 = require(l_Parent_4.React);
local v8 = require(l_Parent_4.Roact);
local v9 = require(l_Parent_3.Utility.getControlStateColor);
local v10 = require(l_Parent_3.Utility.setDefault);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Core_0.Control.Interactable);
local v13 = require(l_Core_0.Control.useControlState);
local _ = require(l_Parent_2.Style.StyleTypes);
local _ = require(l_Parent_2.Style.Fonts);
local v16 = require(l_Parent_2.SelectionCursor.useCursor);
local v17 = require(l_Parent_0.Constants);
local v18 = require(l_Parent_0.ExperienceActionRow);
local v19 = require(l_Parent_0.Enum.AspectRatioMode);
local v20 = require(l_Parent_0.getAspectRatio);
local v21 = require(l_Parent_1.VerticalTile.VerticalTile);
local v22 = require(l_Parent_1.TileContentPanel);
local v23 = require(l_Parent_1.VerticalTile.VerticalTileThumbnail);
local function v28(v24, v25, v26, v27) --[[ Line: 82 ]] --[[ Name: renderContentWithPadding ]]
    -- upvalues: v7 (copy), v6 (copy), v8 (copy)
    return v7.createElement(v24, v6.Dictionary.join({
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v26), {
        Padding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v25.Left), 
            PaddingRight = UDim.new(0, v25.Right), 
            PaddingTop = UDim.new(0, v25.Top), 
            PaddingBottom = UDim.new(0, v25.Bottom)
        }), 
        Content = v8.createFragment(v27)
    });
end;
local function _(v29, v30) --[[ Line: 106 ]] --[[ Name: getFinalAspectRatioMode ]]
    -- upvalues: v19 (copy)
    if v29 ~= nil then
        if v30 then
            return v19.Wide;
        else
            return v29;
        end;
    elseif v30 then
        return v19.Wide;
    else
        return v19.Square;
    end;
end;
return function(v32) --[[ Line: 122 ]] --[[ Name: ExperienceTileV3 ]]
    -- upvalues: v11 (copy), v10 (copy), v17 (copy), v6 (copy), v7 (copy), v19 (copy), v20 (copy), v28 (copy), v23 (copy), v8 (copy), v22 (copy), v18 (copy), v13 (copy), v16 (copy), v9 (copy), v12 (copy), v21 (copy)
    local v33 = v11();
    local v34 = v10(v32.footerHeight, v17.DEFAULT_FOOTER_HEIGHT);
    local v35 = v10(v32.isHoverEnabled, false);
    local v36 = v10(v32.hasBackground, true);
    local v37 = v17.getDefaultStyleProps(v33);
    local v38 = v6.Dictionary.join(v37, v32.styleProps or {});
    local l_backgroundColor_0 = v38.backgroundColor;
    local l_border_0 = v38.border;
    local l_dropShadow_0 = v38.dropShadow;
    local l_topContentPadding_0 = v38.topContentPadding;
    local l_bottomContentPadding_0 = v38.bottomContentPadding;
    local l_overlayColors_0 = v38.overlayColors;
    local l_selectionCursorPadding_0 = v38.selectionCursorPadding;
    local l_contentTitlePadding_0 = v38.contentTitlePadding;
    local l_contentTitleFont_0 = v38.contentTitleFont;
    local v48 = v10(v32.contentTextLineCount, v17.DEFAULT_TEXT_LINE_COUNT);
    local v53 = v7.useCallback(function(v49) --[[ Line: 140 ]]
        -- upvalues: v33 (copy), v32 (copy), v19 (ref), v20 (ref), v28 (ref), l_topContentPadding_0 (copy), v7 (ref), v23 (ref), l_border_0 (copy), v36 (copy), v8 (ref)
        v49 = v49 and not v33.Settings.ReducedMotion;
        local l_thumbnailAspectRatioOverride_0 = v32.thumbnailAspectRatioOverride;
        local l_v49_0 = v49;
        local v52 = if l_thumbnailAspectRatioOverride_0 ~= nil then if l_v49_0 then v19.Wide else l_thumbnailAspectRatioOverride_0 else if l_v49_0 then v19.Wide else v19.Square;
        l_thumbnailAspectRatioOverride_0 = v20(v52);
        l_v49_0 = if v52 == v19.Wide then v32.wideThumbnail else v32.thumbnail;
        return v28("Frame", l_topContentPadding_0, {
            Size = UDim2.new(1, 0, l_thumbnailAspectRatioOverride_0, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            ZIndex = 3
        }, {
            Thumbnail = v7.createElement(v23, {
                aspectRatio = l_thumbnailAspectRatioOverride_0, 
                border = l_border_0, 
                isTopRounded = true, 
                isBottomRounded = not v36, 
                thumbnail = l_v49_0
            }), 
            TopContentOverlay = if v32.renderTopContentOverlay ~= nil then v8.createFragment((v32.renderTopContentOverlay(v49, l_border_0))) else nil
        });
    end, {
        v32.renderTopContentOverlay, 
        v32.wideThumbnail, 
        v32.thumbnail, 
        v32.thumbnailAspectRatioOverride, 
        l_topContentPadding_0, 
        l_border_0, 
        v36
    });
    local v56 = v7.useCallback(function(v54) --[[ Line: 174 ]]
        -- upvalues: v48 (copy), l_contentTitleFont_0 (copy), v33 (copy), l_contentTitlePadding_0 (copy), v34 (copy), l_bottomContentPadding_0 (copy), v32 (copy), v28 (ref), l_border_0 (copy), v7 (ref), v22 (ref)
        local v55 = math.floor(v48 * l_contentTitleFont_0.RelativeSize * v33.Font.BaseSize + l_contentTitlePadding_0) + v34 + l_bottomContentPadding_0.Top + l_bottomContentPadding_0.Bottom;
        if v32.renderBottomContent ~= nil then
            return v28("Frame", l_bottomContentPadding_0, {
                Size = UDim2.new(1, 0, 0, v55)
            }, {
                BottomContent = v32.renderBottomContent(v54, l_border_0)
            });
        else
            return v7.createElement(v22, {
                contentTitle = v32.experienceName, 
                panelHeight = UDim.new(0, v55), 
                outerPadding = l_bottomContentPadding_0, 
                footerHeight = UDim.new(0, v34), 
                textLineCount = v48, 
                titleFont = l_contentTitleFont_0, 
                titlePadding = l_contentTitlePadding_0, 
                contentFooter = if v54 then v32.footer else nil, 
                hasSidePadding = true
            });
        end;
    end, {
        v32.experienceName, 
        v32.renderBottomContent, 
        v32.footer, 
        v48, 
        l_contentTitlePadding_0, 
        l_bottomContentPadding_0, 
        v34, 
        l_contentTitleFont_0, 
        l_border_0, 
        v33
    });
    local v59 = v7.useCallback(function(v57) --[[ Line: 213 ]]
        -- upvalues: v32 (copy), v7 (ref), v18 (ref), v34 (copy), l_bottomContentPadding_0 (copy), v28 (ref)
        if v32.renderBottomContent ~= nil then
            return nil;
        elseif v57 then
            if v32.renderActionRow ~= nil then
                return v32.renderActionRow();
            else
                return v7.createElement(v18, v32.actionRowProps);
            end;
        else
            local v58 = v34 + l_bottomContentPadding_0.Top + l_bottomContentPadding_0.Bottom;
            return v28("Frame", l_bottomContentPadding_0, {
                Size = UDim2.new(1, 0, 0, v58), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1)
            }, {
                FooterContent = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Footer = v32.footer
                })
            });
        end;
    end, {
        v32.footer, 
        v32.actionRowProps, 
        v32.renderBottomContent, 
        v32.renderActionRow, 
        l_bottomContentPadding_0, 
        v34
    });
    local v60, v61 = v13();
    local v62 = v16(l_border_0.CornerRadius);
    local v63 = v9(v60, l_overlayColors_0);
    local v64 = nil;
    local v65 = nil;
    if v63 ~= nil then
        v64 = v63.Color;
        v65 = v63.Transparency;
    else
        v64 = nil;
        v65 = 1;
    end;
    return v28(v12, l_selectionCursorPadding_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        SelectionImageObject = v62, 
        onStateChanged = v61, 
        isDisabled = v32.isDisabled, 
        [v7.Event.Activated] = v32.onActivated, 
        [v7.Event.SelectionGained] = v32.onSelectionGained, 
        [v7.Event.SelectionLost] = v32.onSelectionLost
    }, {
        VerticalTile = v7.createElement(v21, {
            hasBackground = v36, 
            hasOutline = v10(v32.hasOutline, true), 
            isHoverEnabled = v35, 
            hoverDelay = v32.hoverDelay, 
            onHoverChanged = v32.onHoverChanged, 
            isOverlayVisible = false, 
            isActive = false, 
            renderTopContent = v53, 
            renderBottomContent = v56, 
            renderFooterRow = v59, 
            reservedBottomHeight = 0, 
            backgroundColor = l_backgroundColor_0, 
            border = l_border_0, 
            dropShadow = l_dropShadow_0
        }), 
        OverlayColor = v7.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v64, 
            ZIndex = 10, 
            BackgroundTransparency = v65
        }, {
            Corner = v7.createElement("UICorner", {
                CornerRadius = l_border_0.CornerRadius
            })
        })
    });
end;