local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Text_0 = v2.Text;
local v5 = require(l_Parent_0.VerifiedBadges);
local v6 = require(l_Parent_0.AvatarExperienceUIKit);
local l_ItemCardPriceLine_0 = v6.ItemCardComponents.ItemCardPriceLine;
local l_ItemCardTitle_0 = v6.ItemCardComponents.ItemCardTitle;
local v9 = require(l_Parent_0.Cryo);
local l_WearTimeSelectedOptionInList_0 = require(l_Parent_0.AvatarExperienceTimedOptions).WearTimeSelectedOptionInList;
local v11 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 = v11.FFlagAXEnableTimedOptionsForCatalogRowCard;
local l_FFlagAXDurablesForMIS_0 = v11.FFlagAXDurablesForMIS;
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
return function(v16) --[[ Line: 52 ]] --[[ Name: CatalogRowItemCardFooter ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 (copy), v1 (copy), v9 (copy), l_IconSize_0 (copy), v2 (copy), l_ItemCardPriceLine_0 (copy), l_ItemCardTitle_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), v5 (copy), l_WearTimeSelectedOptionInList_0 (copy)
    local v17 = l_useTokens_0();
    local v18 = nil;
    local v19 = nil;
    if l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then
        v18 = v16.selectedTimedOptionPrice;
        v19 = v16.setSelectedTimedOptionPrice;
    end;
    local v27 = v1.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v16 (copy), v9 (ref), l_FFlagAXDurablesForMIS_0 (ref), l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 (ref), v18 (ref), v17 (copy), l_IconSize_0 (ref), v1 (ref), v2 (ref), l_ItemCardPriceLine_0 (ref)
        local v20 = {};
        if v16.priceLineContent and #v16.priceLineContent > 0 then
            for v21, v22 in v16.priceLineContent do
                local v23 = v9.Dictionary.omit(v22, {
                    "strikethrough"
                });
                if (l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0) and v18 and v22.type == "price" then
                    if v22.isOriginalPrice and v16.timedOptions then
                        local l_v18_0 = v18;
                        for _, v26 in v16.timedOptions do
                            if v26.price == v18 and v26.discountInformation then
                                l_v18_0 = v26.discountInformation.originalPrice;
                                break;
                            end;
                        end;
                        v23 = v9.Dictionary.join(v23, {
                            price = l_v18_0
                        });
                        if l_v18_0 == v18 then
                            continue;
                        end;
                    else
                        v23 = v9.Dictionary.join(v23, {
                            price = v18
                        });
                    end;
                end;
                if (l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0) and v22.strikethrough then
                    v23 = v9.Dictionary.join(v23, {
                        colorStyle = v17.Color.Content.Muted, 
                        iconSize = l_IconSize_0.XSmall, 
                        fontStyle = v17.Typography.BodySmall
                    });
                end;
                v20[("PriceLine%*"):format(v21)] = v1.createElement(v2.View, {
                    tag = "auto-xy", 
                    LayoutOrder = v21
                }, {
                    ItemCardPriceLine = v1.createElement(l_ItemCardPriceLine_0, {
                        content = v23
                    }), 
                    Strikethrough = if v22.strikethrough then v1.createElement(v2.View, {
                        tag = "bg-system-neutral anchor-center-center position-center-center size-full-50"
                    }) else nil
                });
            end;
        end;
        return v20;
    end, {
        v16.priceLineContent, 
        if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v18 else nil, 
        if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v16.timedOptions else nil, 
        if not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then v17 else nil
    });
    local v28 = nil;
    if l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0 then
        v28 = v16.priceLineContent and #v16.priceLineContent > 0 or v16.timedOptions;
    end;
    return v1.createElement(v2.View, {
        Size = v16.Size, 
        AutomaticSize = v16.AutomaticSize, 
        LayoutOrder = v16.LayoutOrder, 
        tag = "fill self-stretch"
    }, {
        TopSection = v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            TopLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v17.Gap.XSmall)
            }), 
            ItemCardFooterTitle = v1.createElement(l_ItemCardTitle_0, {
                title = v16.title or "", 
                LayoutOrder = 1
            }), 
            ItemCardFooterInfo = if not not v16.itemSubType or v16.creatorName then v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                ItemCardFooterInfoLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, v17.Gap.XXSmall)
                }), 
                ItemSubType = if v16.itemSubType then v1.createElement(l_Text_0, {
                    textStyle = v17.Color.Content.Default, 
                    fontStyle = v17.Typography.BodyMedium, 
                    LayoutOrder = 1, 
                    Text = v16.itemSubType, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                }) else nil, 
                Spacer = if v16.itemSubType then v1.createElement(l_Icon_0, {
                    name = "icons/controls/keys/period", 
                    size = l_IconSize_0.Small, 
                    LayoutOrder = 2
                }) else nil, 
                CreatorName = if v16.creatorName then v1.createElement(l_Text_0, {
                    tag = "fill self-stretch", 
                    textStyle = v17.Color.Content.Default, 
                    fontStyle = v17.Typography.BodyMedium, 
                    LayoutOrder = 3, 
                    Text = if v16.creatorHasVerifiedBadge then ("%*%*"):format(v16.creatorName, v5.emoji.verified) else v16.creatorName, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                }) else nil
            }) else nil, 
            BundleParts = if v16.bundlePartsText then v1.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundColor3 = v17.Color.Surface.Surface_100.Color3, 
                BackgroundTransparency = v17.Color.Surface.Surface_100.Transparency, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v17.Radius.Small)
                }), 
                UIPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v17.Padding.XSmall), 
                    PaddingLeft = UDim.new(0, v17.Padding.XSmall), 
                    PaddingRight = UDim.new(0, v17.Padding.XSmall), 
                    PaddingBottom = UDim.new(0, v17.Padding.XSmall)
                }), 
                Text = v1.createElement(l_Text_0, {
                    textStyle = v17.Color.Content.Default, 
                    fontStyle = v17.Typography.BodySmall, 
                    Text = v16.bundlePartsText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                })
            }) else nil
        }), 
        BottomPrice = if not (not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0) and v16.priceLineContent and #v16.priceLineContent > 0 then v1.createElement(v2.View, {
            tag = "auto-xy row gap-xsmall position-bottom-left anchor-bottom-left"
        }, v27) else nil, 
        BottomContent = if (not not l_FFlagAXDurablesForMIS_0 or l_FFlagAXEnableTimedOptionsForCatalogRowCard_0) and v28 then v1.createElement(v2.View, {
            tag = "auto-xy row gap-xsmall align-y-center position-bottom-left anchor-bottom-left"
        }, v9.Dictionary.join(v27, {
            WearTimeOptions = if v16.timedOptions and (not v16.isOwned or v16.expirationTime) then v1.createElement(v2.View, {
                tag = "auto-xy padding-left-small", 
                LayoutOrder = 100
            }, {
                WearTimeSelectedOptionInList = v1.createElement(l_WearTimeSelectedOptionInList_0, {
                    options = v16.timedOptions, 
                    selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v16.selectedTimedOptionIndexInReducer else nil, 
                    onOptionActivated = function(v29) --[[ Line: 263 ]] --[[ Name: onOptionActivated ]]
                        -- upvalues: v16 (copy), v19 (ref)
                        local v30 = v16.timedOptions[v29];
                        if v30 then
                            if v19 then
                                v19(v30.price);
                            end;
                            if v16.onTimedOptionPriceChanged then
                                local v31 = if v30.days == 0 then nil else v30.days;
                                v16.onTimedOptionPriceChanged(v30.price, v31);
                            end;
                        end;
                    end
                })
            }) else nil
        })) else nil
    });
end;