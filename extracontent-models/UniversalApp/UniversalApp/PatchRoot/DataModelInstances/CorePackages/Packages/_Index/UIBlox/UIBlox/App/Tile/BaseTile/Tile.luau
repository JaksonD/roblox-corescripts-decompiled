local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.RoactGamepad);
local v5 = require(l_Parent_3.React);
local v6 = require(l_Parent_3.Cryo);
local v7 = require(l_Parent_3.t);
local v8 = require(l_Parent_2.Core.Style.withStyle);
local v9 = require(l_Parent_2.Core.Style.Validator.validateFontInfo);
local v10 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v11 = require(l_Parent_2.Core.Text.GetTextSize);
local v12 = require(l_Parent_2.Core.Text.GetWrappedTextWithIcon);
local v13 = require(l_Parent_2.Core.Style.withTextSizeOffset);
local v14 = require(l_Parent_1.SelectionImage.CursorKind);
local v15 = require(l_Parent_1.SelectionImage.withSelectionCursorProvider);
local v16 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v17 = require(l_Parent_0.TileName);
local v18 = require(l_Parent_0.TileThumbnail);
local v19 = require(l_Parent_0.TileBanner);
local v20 = require(l_Parent_1.Text.StyledTextLabel);
local v21 = require(l_Parent_2.App.ImageSet.Images);
local v22 = require(l_Parent_2.Core.Control.Interactable);
local v23 = UDim.new(0, 10);
local v24 = v5.PureComponent:extend("Tile");
local v25 = v7.strictInterface({
    footer = v7.optional(v7.table), 
    name = v7.optional(v7.string), 
    nameTextColor = v7.optional(v7.Color3), 
    nameTextTransparency = v7.optional(v7.number), 
    nameOverThumbnail = v7.optional(v7.boolean), 
    titleRichText = v7.optional(v7.boolean), 
    subtitle = v7.optional(v7.string), 
    hasVerifiedBadge = v7.optional(v7.boolean), 
    titleTextLineCount = v7.optional(v7.integer), 
    innerPadding = v7.optional(v7.number), 
    titleTopPadding = v7.optional(v7.number), 
    subtitleTopPadding = v7.optional(v7.number), 
    footerTopPadding = v7.optional(v7.number), 
    onActivated = v7.optional(v7.callback), 
    thumbnail = v7.optional(v7.union(v7.string, v7.table)), 
    thumbnailSize = v7.optional(v7.UDim2), 
    thumbnailFrameSize = v7.optional(v7.UDim2), 
    thumbnailColor = v7.optional(v7.Color3), 
    thumbnailTransparency = v7.optional(v7.number), 
    thumbnailAspectRatio = v7.optional(v7.number), 
    thumbnailScaleType = v7.optional(v7.enum(Enum.ScaleType)), 
    bannerText = v7.optional(v7.string), 
    backgroundImage = v7.optional(v7.union(v7.string, v7.table)), 
    isSelected = v7.optional(v7.boolean), 
    Selectable = v7.optional(v7.boolean), 
    multiSelect = v7.optional(v7.boolean), 
    isDisabled = v7.optional(v7.boolean), 
    hasRoundedCorners = v7.optional(v7.boolean), 
    titleIcon = v7.optional(v7.table), 
    thumbnailOverlayComponents = v7.optional(v7.table), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    thumbnailRef = v7.optional(v7.table), 
    textButtonRef = v7.optional(v7.table), 
    inputBindings = v7.optional(v7.table), 
    useMaxTitleHeight = v7.optional(v7.boolean), 
    addSubtitleSpace = v7.optional(v7.boolean), 
    titleFontStyle = v7.optional(v7.union(v9, v10)), 
    subtitleFontStyle = v7.optional(v7.union(v9, v10)), 
    renderTileInset = v7.optional(v7.callback), 
    [v5.Tag] = v7.optional(v7.string), 
    cursor = v7.optional(v7.any), 
    isCircular = v7.optional(v7.boolean), 
    horizontalAlignment = v7.optional(v7.EnumItem), 
    openTypeFeatures = v7.optional(v7.string), 
    onThumbnailLoaded = v7.optional(v7.callback), 
    isRoactGamepadEnabled = v7.optional(v7.boolean)
});
v24.validateProps = v7.intersection(v25, function(v26) --[[ Line: 175 ]] --[[ Name: tileBannerUseValidator ]]
    if v26.bannerText and v26.footer then
        return false, "A custom footer and bannerText can't be used together";
    else
        return true;
    end;
end);
v24.defaultProps = {
    titleTextLineCount = 2, 
    innerPadding = 8, 
    titleTopPadding = 0, 
    subtitleTopPadding = 0, 
    footerTopPadding = 0, 
    isSelected = false, 
    multiSelect = false, 
    isDisabled = false, 
    hasRoundedCorners = true, 
    Selectable = false, 
    isCircular = false, 
    horizontalAlignment = nil, 
    thumbnailFrameSize = UDim2.new(1, 0, 1, 0), 
    titleRichText = false, 
    isRoactGamepadEnabled = true
};
v24.init = function(v27) --[[ Line: 203 ]] --[[ Name: init ]]
    v27.state = {
        tileWidth = 0, 
        tileHeight = 0
    };
    v27.onAbsoluteSizeChange = function(v28) --[[ Line: 209 ]]
        -- upvalues: v27 (copy)
        local l_X_0 = v28.AbsoluteSize.X;
        local l_Y_0 = v28.AbsoluteSize.Y;
        v27:setState({
            tileWidth = l_X_0, 
            tileHeight = l_Y_0
        });
    end;
end;
v24.render = function(v31) --[[ Line: 219 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), v8 (copy), v15 (copy), v21 (copy), v12 (copy), v11 (copy), v5 (copy), v4 (copy), v22 (copy), v14 (copy), v18 (copy), v23 (copy), v17 (copy), v20 (copy), v19 (copy)
    local l_footer_0 = v31.props.footer;
    local l_name_0 = v31.props.name;
    local l_subtitle_0 = v31.props.subtitle;
    local l_hasVerifiedBadge_0 = v31.props.hasVerifiedBadge;
    local l_titleTextLineCount_0 = v31.props.titleTextLineCount;
    local l_innerPadding_0 = v31.props.innerPadding;
    local l_titleTopPadding_0 = v31.props.titleTopPadding;
    local l_subtitleTopPadding_0 = v31.props.subtitleTopPadding;
    local l_footerTopPadding_0 = v31.props.footerTopPadding;
    local l_onActivated_0 = v31.props.onActivated;
    local l_thumbnail_0 = v31.props.thumbnail;
    local l_thumbnailSize_0 = v31.props.thumbnailSize;
    local l_thumbnailFrameSize_0 = v31.props.thumbnailFrameSize;
    local l_thumbnailColor_0 = v31.props.thumbnailColor;
    local l_thumbnailTransparency_0 = v31.props.thumbnailTransparency;
    local l_bannerText_0 = v31.props.bannerText;
    local l_hasRoundedCorners_0 = v31.props.hasRoundedCorners;
    local l_isSelected_0 = v31.props.isSelected;
    local l_multiSelect_0 = v31.props.multiSelect;
    local l_isDisabled_0 = v31.props.isDisabled;
    local l_titleIcon_0 = v31.props.titleIcon;
    local l_thumbnailOverlayComponents_0 = v31.props.thumbnailOverlayComponents;
    local l_backgroundImage_0 = v31.props.backgroundImage;
    local l_useMaxTitleHeight_0 = v31.props.useMaxTitleHeight;
    local l_addSubtitleSpace_0 = v31.props.addSubtitleSpace;
    local l_horizontalAlignment_0 = v31.props.horizontalAlignment;
    return v13(function(v58) --[[ Line: 247 ]]
        -- upvalues: v8 (ref), v15 (ref), v31 (copy), l_titleTextLineCount_0 (copy), l_innerPadding_0 (copy), l_titleTopPadding_0 (copy), l_addSubtitleSpace_0 (copy), l_useMaxTitleHeight_0 (copy), l_name_0 (copy), l_titleIcon_0 (copy), v21 (ref), v12 (ref), v11 (ref), l_subtitle_0 (copy), l_footer_0 (copy), l_bannerText_0 (copy), v5 (ref), l_isDisabled_0 (copy), l_onActivated_0 (copy), v4 (ref), v22 (ref), v14 (ref), l_horizontalAlignment_0 (copy), l_thumbnailFrameSize_0 (copy), v18 (ref), l_thumbnail_0 (copy), l_hasRoundedCorners_0 (copy), v23 (ref), l_isSelected_0 (copy), l_multiSelect_0 (copy), l_thumbnailOverlayComponents_0 (copy), l_thumbnailSize_0 (copy), l_thumbnailColor_0 (copy), l_thumbnailTransparency_0 (copy), l_backgroundImage_0 (copy), l_subtitleTopPadding_0 (copy), v17 (ref), l_hasVerifiedBadge_0 (copy), v20 (ref), l_footerTopPadding_0 (copy), v19 (ref)
        return v8(function(v59) --[[ Line: 248 ]]
            -- upvalues: v15 (ref), v31 (ref), l_titleTextLineCount_0 (ref), v58 (copy), l_innerPadding_0 (ref), l_titleTopPadding_0 (ref), l_addSubtitleSpace_0 (ref), l_useMaxTitleHeight_0 (ref), l_name_0 (ref), l_titleIcon_0 (ref), v21 (ref), v12 (ref), v11 (ref), l_subtitle_0 (ref), l_footer_0 (ref), l_bannerText_0 (ref), v5 (ref), l_isDisabled_0 (ref), l_onActivated_0 (ref), v4 (ref), v22 (ref), v14 (ref), l_horizontalAlignment_0 (ref), l_thumbnailFrameSize_0 (ref), v18 (ref), l_thumbnail_0 (ref), l_hasRoundedCorners_0 (ref), v23 (ref), l_isSelected_0 (ref), l_multiSelect_0 (ref), l_thumbnailOverlayComponents_0 (ref), l_thumbnailSize_0 (ref), l_thumbnailColor_0 (ref), l_thumbnailTransparency_0 (ref), l_backgroundImage_0 (ref), l_subtitleTopPadding_0 (ref), v17 (ref), l_hasVerifiedBadge_0 (ref), v20 (ref), l_footerTopPadding_0 (ref), v19 (ref)
            return v15(function(v60) --[[ Line: 249 ]]
                -- upvalues: v59 (copy), v31 (ref), l_titleTextLineCount_0 (ref), v58 (ref), l_innerPadding_0 (ref), l_titleTopPadding_0 (ref), l_addSubtitleSpace_0 (ref), l_useMaxTitleHeight_0 (ref), l_name_0 (ref), l_titleIcon_0 (ref), v21 (ref), v12 (ref), v11 (ref), l_subtitle_0 (ref), l_footer_0 (ref), l_bannerText_0 (ref), v5 (ref), l_isDisabled_0 (ref), l_onActivated_0 (ref), v4 (ref), v22 (ref), v14 (ref), l_horizontalAlignment_0 (ref), l_thumbnailFrameSize_0 (ref), v18 (ref), l_thumbnail_0 (ref), l_hasRoundedCorners_0 (ref), v23 (ref), l_isSelected_0 (ref), l_multiSelect_0 (ref), l_thumbnailOverlayComponents_0 (ref), l_thumbnailSize_0 (ref), l_thumbnailColor_0 (ref), l_thumbnailTransparency_0 (ref), l_backgroundImage_0 (ref), l_subtitleTopPadding_0 (ref), v17 (ref), l_hasVerifiedBadge_0 (ref), v20 (ref), l_footerTopPadding_0 (ref), v19 (ref)
                local l_Font_0 = v59.Font;
                local l_Theme_0 = v59.Theme;
                local l_tileHeight_0 = v31.state.tileHeight;
                local l_tileWidth_0 = v31.state.tileWidth;
                local v65 = v31.props.titleFontStyle or l_Font_0.Header2;
                local l_titleRichText_0 = v31.props.titleRichText;
                local v67 = v31.props.subtitleFontStyle or l_Font_0.CaptionHeader;
                local v68 = if v65.RelativeSize then l_Font_0.BaseSize * v65.RelativeSize else v65.FontSize;
                local v69 = if v67.RelativeSize then l_Font_0.BaseSize * v67.RelativeSize else v67.FontSize;
                local v70 = math.ceil(v68 * l_titleTextLineCount_0);
                v70 = math.ceil((v68 + v58) * l_titleTextLineCount_0);
                local v71 = l_tileHeight_0 - l_tileWidth_0 / (v31.props.thumbnailAspectRatio or 1) - l_innerPadding_0 - v70 - l_innerPadding_0 - l_titleTopPadding_0;
                local v72 = Vector2.new(0, 0);
                local v73 = 0;
                if l_addSubtitleSpace_0 then
                    v72 = Vector2.new(0, v70);
                    v73 = math.ceil(v69) + v58;
                    v71 = v71 - v73;
                else
                    if l_useMaxTitleHeight_0 then
                        v72 = Vector2.new(0, v70);
                    else
                        local v74 = l_name_0 or "";
                        local l_Font_1 = v65.Font;
                        if l_titleIcon_0 then
                            local v76 = l_titleIcon_0.ImageRectSize.X / v21.ImagesResolutionScale;
                            v74 = v12(v74, v68, l_Font_1, v76, 4);
                        end;
                        v72 = v11(v74, v68, l_Font_1, Vector2.new(l_tileWidth_0, v70));
                        v72 = Vector2.new(v72.X, (math.min(v72.Y, v70)));
                    end;
                    if l_subtitle_0 ~= nil and l_subtitle_0 ~= "" then
                        v73 = math.ceil(v69) + v58;
                        v71 = v71 - v73;
                    end;
                end;
                v71 = math.max(0, v71);
                local v77 = true;
                if l_footer_0 == nil then
                    v77 = l_bannerText_0 ~= nil;
                end;
                local l_renderTileInset_0 = v31.props.renderTileInset;
                local v79 = UDim2.new(1, 0, 0, v72.Y + v73 + l_titleTopPadding_0);
                local v80 = nil;
                if v31.props.nameOverThumbnail then
                    v79 = UDim2.new(0, l_tileWidth_0 - 10, 0, -(v72.Y + 20));
                    v80 = v5.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 10)
                    });
                end;
                local v81 = v31.props.inputBindings or not l_isDisabled_0 and l_onActivated_0 and {
                    Activate = v4.Input.onBegin(Enum.KeyCode.ButtonA, l_onActivated_0)
                } or nil;
                local l_createElement_0 = v5.createElement;
                local l_v22_0 = v22;
                local v84 = {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Selectable = v31.props.Selectable, 
                    [v5.Event.Activated] = if l_isDisabled_0 then nil else l_onActivated_0, 
                    [v5.Change.AbsoluteSize] = v31.onAbsoluteSizeChange, 
                    ref = v31.props.textButtonRef, 
                    SelectionImageObject = if v31.props.cursor then v31.props.cursor else v60(v14.RoundedRect)
                };
                local v85 = {
                    UIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_innerPadding_0), 
                        HorizontalAlignment = if not v31.props.nameOverThumbnail then l_horizontalAlignment_0 else nil
                    }), 
                    Thumbnail = v5.createElement(if v31.props.isRoactGamepadEnabled then v4.Focusable.Frame else "Frame", {
                        Size = l_thumbnailFrameSize_0, 
                        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        NextSelectionLeft = v31.props.NextSelectionLeft, 
                        NextSelectionRight = v31.props.NextSelectionRight, 
                        NextSelectionUp = v31.props.NextSelectionUp, 
                        NextSelectionDown = v31.props.NextSelectionDown, 
                        ref = v31.props.thumbnailRef, 
                        [v5.Tag] = v31.props[v5.Tag], 
                        SelectionImageObject = if v31.props.cursor then v31.props.cursor else v60(v14.RoundedRectNoInset), 
                        inputBindings = if v31.props.isRoactGamepadEnabled then v81 else nil
                    }, {
                        Image = v5.createElement(v18, {
                            Image = l_thumbnail_0, 
                            hasRoundedCorners = l_hasRoundedCorners_0, 
                            cornerRadius = if v31.props.isCircular then UDim.new(0.5, 0) else v23, 
                            isSelected = l_isSelected_0, 
                            multiSelect = l_multiSelect_0, 
                            overlayComponents = l_thumbnailOverlayComponents_0, 
                            imageSize = l_thumbnailSize_0, 
                            imageColor = l_thumbnailColor_0, 
                            imageTransparency = l_thumbnailTransparency_0, 
                            backgroundImage = l_backgroundImage_0, 
                            scaleType = v31.props.thumbnailScaleType, 
                            onThumbnailLoaded = v31.props.onThumbnailLoaded
                        }), 
                        TileInset = l_renderTileInset_0 and l_renderTileInset_0() or nil, 
                        UIAspectRatioConstraint = if v31.props.thumbnailAspectRatio ~= nil then v5.createElement("UIAspectRatioConstraint", {
                            AspectRatio = v31.props.thumbnailAspectRatio, 
                            AspectType = Enum.AspectType.ScaleWithParentSize
                        }) else nil
                    })
                };
                local l_createElement_1 = v5.createElement;
                local v87 = "Frame";
                local v88 = {
                    Size = v79, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                };
                local v89 = {
                    TitleTopPadding = v5.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_titleTopPadding_0)
                    }), 
                    UIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_subtitleTopPadding_0), 
                        HorizontalAlignment = l_horizontalAlignment_0
                    }), 
                    NameOverThumbnailPadding = v80
                };
                local v90 = false;
                if l_titleTextLineCount_0 > 0 then
                    v90 = false;
                    if l_tileWidth_0 > 0 then
                        v90 = v5.createElement(v17, {
                            titleIcon = l_titleIcon_0, 
                            name = l_name_0, 
                            nameTextColor = v31.props.nameTextColor, 
                            nameTextTransparency = v31.props.nameTextTransparency, 
                            hasVerifiedBadge = l_hasVerifiedBadge_0, 
                            maxHeight = v70, 
                            maxWidth = l_tileWidth_0, 
                            LayoutOrder = 1, 
                            useMaxHeight = l_useMaxTitleHeight_0, 
                            titleFontStyle = v65, 
                            richText = l_titleRichText_0, 
                            horizontalAlignment = l_horizontalAlignment_0
                        });
                    end;
                end;
                v89.Name = v90;
                v90 = false;
                if l_subtitle_0 ~= "" then
                    v90 = false;
                    if l_subtitle_0 ~= nil then
                        v90 = v5.createElement(v20, {
                            size = UDim2.new(0, 0, 0, v73), 
                            automaticSize = Enum.AutomaticSize.X, 
                            text = l_subtitle_0, 
                            colorStyle = l_Theme_0.TextDefault, 
                            fontStyle = v67, 
                            openTypeFeatures = v31.props.openTypeFeatures, 
                            layoutOrder = 2, 
                            fluidSizing = false, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            richText = false, 
                            lineHeight = 1
                        });
                    end;
                end;
                v89.Subtitle = v90;
                v85.TitleArea = l_createElement_1(v87, v88, v89);
                v85.FooterContainer = v77 and v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v71), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    FooterTopPadding = v5.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_footerTopPadding_0)
                    }), 
                    Banner = l_bannerText_0 and v5.createElement(v19, {
                        bannerText = l_bannerText_0
                    }), 
                    Footer = not l_bannerText_0 and l_footer_0
                });
                return l_createElement_0(l_v22_0, v84, v85);
            end);
        end);
    end);
end;
local function v94(v91) --[[ Line: 463 ]]
    -- upvalues: v16 (copy), v23 (copy), v6 (copy), v5 (copy), v24 (copy)
    local v92 = v16(v23);
    local v93 = v6.Dictionary.join({
        cursor = v92
    }, v91);
    return v5.createElement(v24, v93);
end;
return v5.forwardRef(function(v95, v96) --[[ Line: 471 ]]
    -- upvalues: v5 (copy), v94 (copy), v6 (copy)
    return v5.createElement(v94, v6.Dictionary.join(v95, {
        thumbnailRef = v96
    }));
end);