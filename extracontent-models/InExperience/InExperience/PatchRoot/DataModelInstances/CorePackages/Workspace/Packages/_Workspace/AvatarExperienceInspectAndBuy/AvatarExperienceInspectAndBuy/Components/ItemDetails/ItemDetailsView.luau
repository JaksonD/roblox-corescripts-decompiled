local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_script_FirstAncestor_0.Components.ItemDetails.BundleAssetsList);
local l_Enums_0 = v4.Enums;
local v7 = require(l_script_FirstAncestor_0.Components.Common.ItemHeader);
local v8 = require(l_script_FirstAncestor_0.Hooks.useConvertedItemData);
local v9 = require(l_script_FirstAncestor_0.Hooks.useItemExperienceInfo);
local v10 = require(l_script_FirstAncestor_0.Components.ItemDetails.ControlBar);
local v11 = require(l_script_FirstAncestor_0.Components.ItemDetails.ResellableInstancesLabel);
local v12 = require(l_script_FirstAncestor_0.Components.ItemDetails.ItemInfoLabels);
local l_NumberLocalization_0 = require(l_Parent_0.Localization).NumberLocalization;
local v14 = require(l_script_FirstAncestor_0.Hooks.useItemStatusLocalization);
local v15 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils);
local l_isCollectible_0 = v15.isCollectible;
local l_isInExperienceCreationPlayable_0 = v15.isInExperienceCreationPlayable;
local l_isTradeable_0 = v15.isTradeable;
local l_getCreatorName_0 = v15.getCreatorName;
local l_getOriginalPrice_0 = v15.getOriginalPrice;
local l_getQuantitySold_0 = v15.getQuantitySold;
local v22 = require(l_script_FirstAncestor_0.Components.ItemsView.ViewportLayout);
local v23 = require(l_script_FirstAncestor_0.Utils.getItemThumbnailUrl);
local v24 = require(l_script_FirstAncestor_0.Components.Common.SubheaderLabelPrice);
local v25 = require(l_script_FirstAncestor_0.Utils.getPriceStatus);
local l_getPriceInRobux_0 = v15.getPriceInRobux;
local v27 = require(l_script_FirstAncestor_0.Utils.isItemAvailableForTryOn);
local v28 = require(l_script_FirstAncestor_0.Components.Common.BackButton);
local v29 = require(l_script_FirstAncestor_0.Utils.formatNumber);
local v30 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXFormatPDPPriceLabel_0 = v30.FFlagAXFormatPDPPriceLabel;
local l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 = v30.FFlagAXHideInspectAndBuyPriceIfUnavailable;
local _ = require(l_script_FirstAncestor_0.Types);
local v34 = require(l_script_FirstAncestor_0.Enums.ViewType);
local l_useTokens_0 = v4.Hooks.useTokens;
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local _ = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_FFlagIBV2Attribution_0 = require(l_Parent_0.SharedFlags).FFlagIBV2Attribution;
local function v41(v39, v40) --[[ Line: 75 ]]
    -- upvalues: v34 (copy)
    if v39 == v34.WideLandscape then
        return {
            PaddingTop = UDim.new(0, v40.Padding.XSmall), 
            PaddingLeft = UDim.new(0, v40.Padding.Medium), 
            PaddingRight = UDim.new(0, v40.Padding.Medium), 
            PaddingBottom = UDim.new(0, v40.Padding.XXLarge)
        };
    elseif v39 == v34.Wide then
        return {
            PaddingTop = UDim.new(0, v40.Padding.XSmall), 
            PaddingBottom = UDim.new(0, v40.Padding.XLarge), 
            PaddingLeft = UDim.new(0, v40.Margin.Large * 2), 
            PaddingRight = UDim.new(0, v40.Margin.Large * 2)
        };
    else
        return {
            PaddingTop = UDim.new(0, v40.Padding.XSmall), 
            PaddingBottom = UDim.new(0, v40.Padding.XLarge), 
            PaddingLeft = UDim.new(0, v40.Padding.XXLarge), 
            PaddingRight = UDim.new(0, v40.Padding.XXLarge)
        };
    end;
end;
local function v44(v42, v43) --[[ Line: 105 ]]
    -- upvalues: v34 (copy)
    if v42 == v34.WideLandscape then
        return {
            left = UDim.new(0, v43.Padding.Large), 
            right = UDim.new(0, v43.Padding.Large), 
            bottom = UDim.new(0, v43.Padding.XXLarge)
        };
    else
        return {
            bottom = UDim.new(0, v43.Padding.XXLarge)
        };
    end;
end;
local function v48(v45, v46, v47) --[[ Line: 125 ]]
    -- upvalues: v34 (copy)
    if v45 == v34.Compact then
        return UDim2.new(1, 0, 1, -v46.buyActionBarOffset - v46.backButtonOffset - v47.Padding.Small);
    else
        return UDim2.new(1, 0, 1, -v46.backButtonOffset - v47.Padding.Small);
    end;
end;
local function _(v49) --[[ Line: 138 ]]
    -- upvalues: v34 (copy)
    if v49 == v34.Wide then
        return 2.5;
    else
        return 2;
    end;
end;
return function(v51) --[[ Line: 145 ]] --[[ Name: ItemDetailsView ]]
    -- upvalues: l_useTokens_0 (copy), v8 (copy), l_FFlagIBV2Attribution_0 (copy), v9 (copy), v25 (copy), v34 (copy), v14 (copy), v41 (copy), l_isCollectible_0 (copy), l_getQuantitySold_0 (copy), l_getOriginalPrice_0 (copy), l_isTradeable_0 (copy), l_isInExperienceCreationPlayable_0 (copy), v3 (copy), v4 (copy), l_Enums_0 (copy), v28 (copy), v48 (copy), v22 (copy), v23 (copy), v7 (copy), v44 (copy), v24 (copy), l_getCreatorName_0 (copy), l_FFlagAXFormatPDPPriceLabel_0 (copy), v29 (copy), l_getPriceInRobux_0 (copy), l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 (copy), v10 (copy), l_NumberLocalization_0 (copy), l_LocalizationService_0 (copy), v27 (copy), v11 (copy), v12 (copy), v5 (copy)
    local v52 = l_useTokens_0();
    local v53 = v8(v51.item);
    local v54 = if l_FFlagIBV2Attribution_0 and v53 then v53.creatingUniverseId else nil;
    local v55 = if l_FFlagIBV2Attribution_0 then v9(v54) else nil;
    local v56 = v25(v53);
    local v57 = v51.view == v34.WideLandscape;
    local v58 = v51.view == v34.Compact;
    local v59 = v51.view == v34.Wide;
    local v60 = v14(v53);
    local v61 = v41(v51.view, v52);
    local v62 = v51.buyActionBarOffset or 0;
    local l_Size_1000_0 = v52.Size.Size_1000;
    local v64 = {
        {
            key = "Category", 
            isVisible = true, 
            labelProps = {
                leftLabel = v60.category, 
                rightLabel = if v53 then v60[v53.itemSubType] else ""
            }
        }, 
        {
            key = "QuantitySold", 
            isVisible = l_isCollectible_0(v53), 
            labelProps = {
                leftLabel = v60.quantitySold, 
                rightLabel = l_getQuantitySold_0(v53, v51.formatNumber)
            }
        }, 
        {
            key = "OriginalPrice", 
            isVisible = l_isCollectible_0(v53), 
            labelProps = {
                leftLabel = v60.originalPrice, 
                rightLabel = l_getOriginalPrice_0(v53, v60.na, v51.formatNumber)
            }
        }, 
        {
            key = "Tradeable", 
            isVisible = l_isCollectible_0(v53), 
            labelProps = {
                leftLabel = v60.tradeable, 
                rightLabel = if l_isTradeable_0(v53) then v60.yes else v60.no
            }
        }
    };
    if l_FFlagIBV2Attribution_0 then
        table.insert(v64, {
            key = "MadeIn", 
            isVisible = l_isInExperienceCreationPlayable_0(v55), 
            labelProps = {
                leftLabel = v60.madein, 
                rightLabel = v3.createElement(v4.View, {
                    LayoutOrder = 2, 
                    tag = "auto-xy", 
                    onActivated = function() --[[ Line: 203 ]] --[[ Name: onActivated ]]
                        -- upvalues: v51 (copy), v55 (copy)
                        if v51.openAttributionOverlay then
                            v51.openAttributionOverlay(v55);
                        end;
                    end
                }, {
                    AttributionLabel = v3.createElement(v4.View, {
                        tag = "auto-xy row gap-small align-y-center"
                    }, {
                        ExperienceName = v55 and v3.createElement(v4.Text, {
                            LayoutOrder = 1, 
                            tag = "auto-xy text-title-medium content-default", 
                            Text = v55.name
                        }) or nil, 
                        ArrowIcon = v55 and v3.createElement(v4.Icon, {
                            LayoutOrder = 2, 
                            name = l_Enums_0.IconName.ArrowSmallRight, 
                            variant = l_Enums_0.IconVariant.Filled, 
                            size = l_Enums_0.IconSize.Medium, 
                            style = v52.Color.Content.Default
                        }) or nil
                    })
                })
            }
        });
    end;
    return v3.createElement(v4.View, {
        tag = "size-full"
    }, {
        ButtonContainer = v3.createElement(v4.View, {}, {
            BackButton = v3.createElement(v28, {
                onBackButtonClick = v51.onItemDetailsClosed, 
                Size = UDim2.new(0, l_Size_1000_0, 1, 0), 
                Position = UDim2.new(0, v52.Padding.Small, 0, v52.Padding.Small)
            })
        }), 
        ScrollingFrame = v3.createElement("ScrollingFrame", {
            Size = v48(v51.view, {
                buyActionBarOffset = v62, 
                backButtonOffset = l_Size_1000_0
            }, v52), 
            Position = UDim2.new(0, 0, 0, l_Size_1000_0 + v52.Padding.Medium), 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarThickness = 0, 
            BorderSizePixel = 0
        }, {
            UIPadding = v3.createElement("UIPadding", v61), 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v52.Padding.Small)
            }), 
            ViewportLayout = if not not v58 or v59 then v3.createElement(v22, {
                view = v51.view, 
                LayoutOrder = 1, 
                thumbnailUrl = v23(v51.item) or "", 
                viewportProps = {
                    Size = UDim2.new(0, v52.Size.Size_3000 * (v51.view == v34.Wide and 2.5 or 2), 0, v52.Size.Size_3000 * (v51.view == v34.Wide and 2.5 or 2))
                }, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                renderTryOnViewport = v51.renderTryOnViewport, 
                tryOnState = v51.tryOnState
            }) else nil, 
            Header = v3.createElement(v7, {
                LayoutOrder = 1, 
                headerHeight = v52.Size.Size_1300, 
                purchaseButtonProps = v51.purchaseButtonProps, 
                padding = v44(v51.view, v52), 
                header = v3.createElement(v4.Text, {
                    LayoutOrder = 1, 
                    tag = "auto-xy text-heading-small content-emphasis text-truncate-end", 
                    Text = v53 and v53.name or ""
                }), 
                subheader = if v59 then v3.createElement(v24, {
                    subheaderText = {
                        leftSlotLabel = l_getCreatorName_0(v53), 
                        rightSlotPrice = if l_FFlagAXFormatPDPPriceLabel_0 then v29(l_getPriceInRobux_0(v53, v56)) else tostring(l_getPriceInRobux_0(v53, v56))
                    }, 
                    priceStatus = if l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 then v56 else nil, 
                    LayoutOrder = 2
                }) else v3.createElement(v4.Text, {
                    LayoutOrder = 2, 
                    tag = "auto-xy text-body-large content-emphasis text-truncate-end", 
                    Text = l_getCreatorName_0(v53)
                })
            }), 
            DetailsContainer = v3.createElement(v4.View, {
                tag = "auto-xy col align-x-left align-y-top gap-small", 
                LayoutOrder = 2
            }, {
                UIPadding = if v57 then v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v52.Padding.Large), 
                    PaddingRight = UDim.new(0, v52.Padding.Large)
                }) else nil, 
                ControlBar = v3.createElement(v10, {
                    LayoutOrder = 1, 
                    favoritesBadge = {
                        text = if v53 and v53.favoritesDetails and v53.favoritesDetails.numFavorites then l_NumberLocalization_0.abbreviate(v53.favoritesDetails.numFavorites, l_LocalizationService_0.RobloxLocaleId) else nil, 
                        iconVariant = if v53 and v53.favoritesDetails and v53.favoritesDetails.isFavorited then l_Enums_0.IconVariant.Filled else l_Enums_0.IconVariant.Regular, 
                        onActivated = function() --[[ Line: 334 ]] --[[ Name: onActivated ]]
                            -- upvalues: v53 (copy), v51 (copy)
                            if v53 and v53.favoritesDetails then
                                v51.onToggleFavorite(v51.item, v53.favoritesDetails.isFavorited or false);
                            end;
                        end, 
                        LayoutOrder = 1
                    }, 
                    tryOnBadge = if v53 and v27(v51.localPlayerModel, v53) then {
                        text = v60.tryOn, 
                        iconVariant = if v51.tryOnState.isTryOnEnabled then l_Enums_0.IconVariant.Filled else l_Enums_0.IconVariant.Regular, 
                        onActivated = function() --[[ Line: 347 ]] --[[ Name: onActivated ]]
                            -- upvalues: v53 (copy), v51 (copy)
                            if v53 then
                                v51.onToggleTryOn({
                                    itemId = v53.id, 
                                    itemType = v53.itemType, 
                                    itemSubType = v53.itemSubType, 
                                    assetsInBundle = v53.assetsInBundle
                                });
                            end;
                        end, 
                        LayoutOrder = 2
                    } else nil
                }), 
                DescriptionLabel = v3.createElement(v4.Text, {
                    LayoutOrder = 3, 
                    tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-wrap padding-bottom-large padding-top-large", 
                    Text = if v53 then v53.description else ""
                }), 
                ResellableInstancesLabel = if l_isCollectible_0(v53) and v53 and v53.collectibleItemDetails and v53.collectibleItemDetails.resellableCount > 0 then v3.createElement(v11, {
                    ownedItemsLabel = v60.ownedItems, 
                    padding = {
                        top = UDim.new(0, v52.Padding.Large)
                    }, 
                    LayoutOrder = 3
                }) else nil, 
                ItemInfoLabels = v3.createElement(v12, {
                    LayoutOrder = 5, 
                    itemInfoLabels = v64
                }), 
                BundleAssetsList = if v53 and v53.assetsInBundle and #v53.assetsInBundle > 0 then v3.createElement(v5, {
                    itemData = v53, 
                    headerLabel = v60.includedParts, 
                    view = v51.view, 
                    LayoutOrder = 6
                }) else nil
            })
        })
    });
end;