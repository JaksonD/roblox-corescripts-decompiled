local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_2.App.ImageSet.Images);
local v8 = require(l_Parent_0.ItemRestrictionStatus);
local v9 = require(l_Parent_0.ItemTileStatusIcon);
local v10 = require(l_Parent_0.ItemTileStatus);
local v11 = require(l_Parent_1.Enum.ItemTileEnums);
local v12 = require(l_Parent_0.ItemIcon);
local v13 = require(l_Parent_1.BaseTile.Tile);
local v14 = v4.PureComponent:extend("ItemTile");
local function v16(v15) --[[ Line: 22 ]] --[[ Name: tileBannerUseValidator ]]
    if v15.bannerText and v15.footer then
        return false, "A custom footer and bannerText can't be used together";
    else
        return true;
    end;
end;
v14.validateProps = v6.strictInterface({
    footer = v6.optional(v6.table), 
    name = v6.optional(v6.string), 
    nameTextColor = v6.optional(v6.Color3), 
    nameTextTransparency = v6.optional(v6.number), 
    subtitle = v6.optional(v6.string), 
    titleTextLineCount = v6.optional(v6.integer), 
    innerPadding = v6.optional(v6.integer), 
    titleTopPadding = v6.optional(v6.integer), 
    subtitleTopPadding = v6.optional(v6.integer), 
    footerTopPadding = v6.optional(v6.integer), 
    onActivated = v6.optional(v6.callback), 
    thumbnail = v6.optional(v6.string), 
    backgroundImage = v6.optional(v6.union(v6.string, v6.table)), 
    bannerText = v6.optional(v6.string), 
    itemIconType = v6.optional(v11.ItemIconType.isEnumValue), 
    isSelected = v6.optional(v6.boolean), 
    Selectable = v6.optional(v6.boolean), 
    multiSelect = v6.optional(v6.boolean), 
    isPremium = v6.optional(v6.boolean), 
    restrictionTypes = v6.optional(v6.map(v11.Restriction.isEnumValue, v6.boolean)), 
    restrictionInfo = v6.optional(v6.table), 
    hasRoundedCorners = v6.optional(v6.boolean), 
    statusText = v6.optional(v6.string), 
    statusStyle = v6.optional(v11.StatusStyle.isEnumValue), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    thumbnailRef = v6.optional(v6.table), 
    textButtonRef = v6.optional(v6.table), 
    inputBindings = v6.optional(v6.table), 
    useMaxTitleHeight = v6.optional(v6.boolean), 
    addSubtitleSpace = v6.optional(v6.boolean), 
    titleFontStyle = v6.optional(v6.table), 
    renderTileInset = v6.optional(v6.callback), 
    hasVerifiedBadge = v6.optional(v6.boolean), 
    [v4.Tag] = v6.optional(v6.string), 
    aspectRatio = v6.optional(v6.number), 
    scaleType = v6.optional(v6.enum(Enum.ScaleType)), 
    onThumbnailLoaded = v6.optional(v6.callback), 
    isRoactGamepadEnabled = v6.optional(v6.boolean)
});
v14.defaultProps = {
    titleTextLineCount = 2, 
    innerPadding = 8, 
    isSelected = false, 
    multiSelect = false, 
    isPremium = false, 
    hasRoundedCorners = true, 
    Selectable = false, 
    isRoactGamepadEnabled = true
};
local function _(v17) --[[ Line: 155 ]] --[[ Name: isIconStatusStyle ]]
    -- upvalues: v11 (copy)
    local v18 = true;
    if v17 ~= v11.StatusStyle.PendingIcon then
        v18 = v17 == v11.StatusStyle.AlertIcon;
    end;
    return v18;
end;
v14.render = function(v20) --[[ Line: 159 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v4 (copy), v12 (copy), v8 (copy), v10 (copy), v11 (copy), v9 (copy), v13 (copy), v7 (copy)
    assert(v16(v20.props));
    local l_footer_0 = v20.props.footer;
    local l_bannerText_0 = v20.props.bannerText;
    local l_hasRoundedCorners_0 = v20.props.hasRoundedCorners;
    local l_innerPadding_0 = v20.props.innerPadding;
    local l_isPremium_0 = v20.props.isPremium;
    local l_isSelected_0 = v20.props.isSelected;
    local l_multiSelect_0 = v20.props.multiSelect;
    local l_itemIconType_0 = v20.props.itemIconType;
    local l_name_0 = v20.props.name;
    local l_nameTextColor_0 = v20.props.nameTextColor;
    local l_nameTextTransparency_0 = v20.props.nameTextTransparency;
    local l_subtitle_0 = v20.props.subtitle;
    local l_titleTopPadding_0 = v20.props.titleTopPadding;
    local l_subtitleTopPadding_0 = v20.props.subtitleTopPadding;
    local l_footerTopPadding_0 = v20.props.footerTopPadding;
    local l_onActivated_0 = v20.props.onActivated;
    local l_restrictionInfo_0 = v20.props.restrictionInfo;
    local l_restrictionTypes_0 = v20.props.restrictionTypes;
    local l_statusStyle_0 = v20.props.statusStyle;
    local l_statusText_0 = v20.props.statusText;
    local l_titleTextLineCount_0 = v20.props.titleTextLineCount;
    local l_thumbnail_0 = v20.props.thumbnail;
    local l_backgroundImage_0 = v20.props.backgroundImage;
    local l_useMaxTitleHeight_0 = v20.props.useMaxTitleHeight;
    local l_addSubtitleSpace_0 = v20.props.addSubtitleSpace;
    local l_Selectable_0 = v20.props.Selectable;
    local l_titleFontStyle_0 = v20.props.titleFontStyle;
    local l_renderTileInset_0 = v20.props.renderTileInset;
    local l_aspectRatio_0 = v20.props.aspectRatio;
    local l_scaleType_0 = v20.props.scaleType;
    local v51 = false;
    local v52 = {};
    if l_itemIconType_0 then
        v51 = true;
        v52.ItemIconType = v4.createElement(v12, {
            itemIconType = l_itemIconType_0
        });
    end;
    if l_restrictionTypes_0 then
        v51 = true;
        v52.RestrictionStatus = v4.createElement(v8, {
            restrictionInfo = l_restrictionInfo_0, 
            restrictionTypes = l_restrictionTypes_0
        });
    end;
    if l_statusText_0 then
        v51 = true;
        v52.Status = v4.createElement(v10, {
            statusStyle = l_statusStyle_0, 
            statusText = l_statusText_0
        });
    end;
    local v53 = true;
    if l_statusStyle_0 ~= v11.StatusStyle.PendingIcon then
        v53 = l_statusStyle_0 == v11.StatusStyle.AlertIcon;
    end;
    if v53 then
        v51 = true;
        v52.Status = v4.createElement(v9, {
            statusStyle = l_statusStyle_0
        });
    end;
    return v4.createElement(v13, {
        bannerText = l_bannerText_0, 
        footer = l_footer_0, 
        hasRoundedCorners = l_hasRoundedCorners_0, 
        innerPadding = l_innerPadding_0, 
        isSelected = l_isSelected_0, 
        Selectable = l_Selectable_0, 
        multiSelect = l_multiSelect_0, 
        name = l_name_0, 
        nameTextColor = l_nameTextColor_0, 
        nameTextTransparency = l_nameTextTransparency_0, 
        subtitle = l_subtitle_0, 
        titleTopPadding = l_titleTopPadding_0, 
        subtitleTopPadding = l_subtitleTopPadding_0, 
        footerTopPadding = l_footerTopPadding_0, 
        onActivated = l_onActivated_0, 
        thumbnail = l_thumbnail_0, 
        backgroundImage = l_backgroundImage_0, 
        thumbnailOverlayComponents = v51 and v52 or nil, 
        titleIcon = l_isPremium_0 and v7["icons/status/premium_small"] or nil, 
        titleTextLineCount = l_titleTextLineCount_0, 
        useMaxTitleHeight = l_useMaxTitleHeight_0, 
        addSubtitleSpace = l_addSubtitleSpace_0, 
        titleFontStyle = l_titleFontStyle_0, 
        renderTileInset = l_renderTileInset_0, 
        thumbnailAspectRatio = l_aspectRatio_0, 
        thumbnailScaleType = l_scaleType_0, 
        hasVerifiedBadge = v20.props.hasVerifiedBadge, 
        NextSelectionLeft = v20.props.NextSelectionLeft, 
        NextSelectionRight = v20.props.NextSelectionRight, 
        NextSelectionUp = v20.props.NextSelectionUp, 
        NextSelectionDown = v20.props.NextSelectionDown, 
        textButtonRef = v20.props.textButtonRef, 
        inputBindings = v20.props.inputBindings, 
        ref = v20.props.thumbnailRef, 
        [v4.Tag] = v20.props[v4.Tag], 
        onThumbnailLoaded = v20.props.onThumbnailLoaded, 
        isRoactGamepadEnabled = v20.props.isRoactGamepadEnabled
    });
end;
return v4.forwardRef(function(v54, v55) --[[ Line: 270 ]]
    -- upvalues: v4 (copy), v14 (copy), v5 (copy)
    return v4.createElement(v14, v5.Dictionary.join(v54, {
        thumbnailRef = v55
    }));
end);