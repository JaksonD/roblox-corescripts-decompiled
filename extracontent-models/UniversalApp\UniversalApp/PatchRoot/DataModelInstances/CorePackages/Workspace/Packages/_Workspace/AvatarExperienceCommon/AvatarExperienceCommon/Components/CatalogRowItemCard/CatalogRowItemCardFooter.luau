local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Text_0 = v3.Text;
local v6 = require(l_Parent_0.VerifiedBadges);
local v7 = require(l_Parent_0.AvatarExperienceUIKit);
local l_ItemCardPriceLine_0 = v7.ItemCardComponents.ItemCardPriceLine;
local l_ItemCardTitle_0 = v7.ItemCardComponents.ItemCardTitle;
local v10 = require(l_Parent_0.Cryo);
local v11 = require(l_script_FirstAncestor_0.Components.WearTime.WearTimeSelectedOptionInList);
local l_FFlagAXDurablesForMIS_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDurablesForMIS;
local _ = require(l_script_FirstAncestor_0.Types.TimedOptionType);
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
return function(v16) --[[ Line: 49 ]] --[[ Name: CatalogRowItemCardFooter ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v2 (copy), v10 (copy), v3 (copy), l_ItemCardPriceLine_0 (copy), l_ItemCardTitle_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), v6 (copy), v11 (copy)
    local v17 = l_useTokens_0();
    local v18 = nil;
    local v19 = nil;
    if l_FFlagAXDurablesForMIS_0 then
        v18 = v16.selectedTimedOptionPrice;
        v19 = v16.setSelectedTimedOptionPrice;
    end;
    local v24 = v2.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v16 (copy), v10 (ref), l_FFlagAXDurablesForMIS_0 (ref), v18 (ref), v2 (ref), v3 (ref), l_ItemCardPriceLine_0 (ref)
        local v20 = {};
        if v16.priceLineContent and #v16.priceLineContent > 0 then
            for v21, v22 in v16.priceLineContent do
                local v23 = v10.Dictionary.omit(v22, {
                    "strikethrough"
                });
                if l_FFlagAXDurablesForMIS_0 and v18 and v22.type == "price" then
                    v23 = v10.Dictionary.join(v23, {
                        price = v18
                    });
                end;
                v20[("PriceLine%*"):format(v21)] = v2.createElement(v3.View, {
                    tag = "auto-xy", 
                    LayoutOrder = v21
                }, {
                    ItemCardPriceLine = v2.createElement(l_ItemCardPriceLine_0, {
                        content = v23
                    }), 
                    Strikethrough = if v22.strikethrough then v2.createElement(v3.View, {
                        tag = "bg-system-neutral anchor-center-center position-center-center size-full-50"
                    }) else nil
                });
            end;
        end;
        return v20;
    end, {
        v16.priceLineContent, 
        if l_FFlagAXDurablesForMIS_0 then v18 else nil
    });
    local v25 = nil;
    if l_FFlagAXDurablesForMIS_0 then
        v25 = v16.priceLineContent and #v16.priceLineContent > 0 or v16.timedOptions;
    end;
    return v2.createElement(v3.View, {
        Size = v16.Size, 
        AutomaticSize = v16.AutomaticSize, 
        LayoutOrder = v16.LayoutOrder, 
        tag = "fill self-stretch"
    }, {
        TopSection = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            TopLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v17.Gap.XSmall)
            }), 
            ItemCardFooterTitle = v2.createElement(l_ItemCardTitle_0, {
                title = v16.title or "", 
                LayoutOrder = 1
            }), 
            ItemCardFooterInfo = if not not v16.itemSubType or v16.creatorName then v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                ItemCardFooterInfoLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, v17.Gap.XXSmall)
                }), 
                ItemSubType = if v16.itemSubType then v2.createElement(l_Text_0, {
                    textStyle = v17.Color.Content.Default, 
                    fontStyle = v17.Typography.BodyMedium, 
                    LayoutOrder = 1, 
                    Text = v16.itemSubType, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                }) else nil, 
                Spacer = if v16.itemSubType then v2.createElement(l_Icon_0, {
                    name = "icons/controls/keys/period", 
                    size = l_IconSize_0.Small, 
                    LayoutOrder = 2
                }) else nil, 
                CreatorName = if v16.creatorName then v2.createElement(l_Text_0, {
                    tag = "fill self-stretch", 
                    textStyle = v17.Color.Content.Default, 
                    fontStyle = v17.Typography.BodyMedium, 
                    LayoutOrder = 3, 
                    Text = if v16.creatorHasVerifiedBadge then ("%*%*"):format(v16.creatorName, v6.emoji.verified) else v16.creatorName, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                }) else nil
            }) else nil, 
            BundleParts = if v16.bundlePartsText then v2.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundColor3 = v17.Color.Surface.Surface_100.Color3, 
                BackgroundTransparency = v17.Color.Surface.Surface_100.Transparency, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v17.Radius.Small)
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v17.Padding.XSmall), 
                    PaddingLeft = UDim.new(0, v17.Padding.XSmall), 
                    PaddingRight = UDim.new(0, v17.Padding.XSmall), 
                    PaddingBottom = UDim.new(0, v17.Padding.XSmall)
                }), 
                Text = v2.createElement(l_Text_0, {
                    textStyle = v17.Color.Content.Default, 
                    fontStyle = v17.Typography.BodySmall, 
                    Text = v16.bundlePartsText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                })
            }) else nil
        }), 
        BottomPrice = if not l_FFlagAXDurablesForMIS_0 and v16.priceLineContent and #v16.priceLineContent > 0 then v2.createElement(v3.View, {
            tag = "auto-xy row gap-xsmall position-bottom-left anchor-bottom-left"
        }, v24) else nil, 
        BottomContent = if l_FFlagAXDurablesForMIS_0 and v25 then v2.createElement(v3.View, {
            tag = "auto-xy row gap-xsmall align-y-center position-bottom-left anchor-bottom-left"
        }, v10.Dictionary.join(v24, {
            WearTimeOptions = if v16.timedOptions then v2.createElement(v3.View, {
                tag = "auto-xy padding-left-small", 
                LayoutOrder = 100
            }, {
                WearTimeSelectedOptionInList = v2.createElement(v11, {
                    options = v16.timedOptions, 
                    selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v16.selectedTimedOptionIndexInReducer else nil, 
                    onOptionActivated = function(v26) --[[ Line: 220 ]] --[[ Name: onOptionActivated ]]
                        -- upvalues: v16 (copy), v19 (ref)
                        local v27 = v16.timedOptions[v26];
                        if v27 then
                            if v19 then
                                v19(v27.price);
                            end;
                            if v16.onTimedOptionPriceChanged then
                                local v28 = if v27.days == 0 then nil else v27.days;
                                v16.onTimedOptionPriceChanged(v27.price, v28);
                            end;
                        end;
                    end
                })
            }) else nil
        })) else nil
    });
end;