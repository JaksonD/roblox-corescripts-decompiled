local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SessionService_0 = game:GetService("SessionService");
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.AXCommon);
local l_ItemTypeEnum_0 = v5.Enums.ItemTypeEnum;
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local v9 = require(l_Parent_0.React);
local v10 = require(l_script_FirstAncestor_0.Hooks.useConvertedItemData);
local _ = require(l_script_FirstAncestor_0.Types);
local v12 = require(l_script_FirstAncestor_0.Constants);
local l_AssetLocalizationKeys_0 = v12.AssetLocalizationKeys;
local l_BundleLocalizationKeys_0 = v12.BundleLocalizationKeys;
local l_PriceStatusLocalizationKeys_0 = v12.PriceStatusLocalizationKeys;
local v16 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_addUnifiedEventLogging_0 = v16.addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = v16.UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local _ = require(l_script_FirstAncestor_0.Enums.ViewType);
local v21 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v23 = require(l_script_FirstAncestor_0.Utils.getItemThumbnailUrl);
local v24 = require(l_script_FirstAncestor_0.Utils.getCatalogCardItemType);
local v25 = require(l_script_FirstAncestor_0.Utils.getPriceLineContent);
local l_getPriceInRobux_0 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils).getPriceInRobux;
local v27 = require(l_script_FirstAncestor_0.Utils.getPriceStatus);
local v28 = require(l_Parent_0.Cryo);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_useItemSelectionStore_0 = require(l_script_FirstAncestor_0.Contexts.ItemSelectionStoreContext).useItemSelectionStore;
local _ = require(l_script_FirstAncestor_0.Stores.createItemSelectionStore);
local l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase;
local l_CatalogItemCardStatusIconTypeEnum_0 = v5.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
return function(v34, v35, _, v37, v38) --[[ Line: 52 ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), l_ItemTypeEnum_0 (copy), l_BundleLocalizationKeys_0 (copy), l_AssetLocalizationKeys_0 (copy), v28 (copy), l_PriceStatusLocalizationKeys_0 (copy), l_useLocalization_0 (copy), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (copy), l_useItemSelectionStore_0 (copy), l_useSignalState_0 (copy), v9 (copy), v27 (copy), v21 (copy), l_getPriceInRobux_0 (copy), v23 (copy), v24 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_RetrievalStatus_0 (copy), v25 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_SessionService_0 (copy), l_ItemCardThumbnail_0 (copy)
    local v39 = l_useTokens_0();
    local v40, v41 = v10(v34);
    local v42 = if v34.itemType == l_ItemTypeEnum_0.Bundle then l_BundleLocalizationKeys_0 else l_AssetLocalizationKeys_0;
    v42 = v28.Dictionary.join(v42, l_PriceStatusLocalizationKeys_0);
    local v43 = l_useLocalization_0(v42);
    local v44 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useItemSelectionStore_0() else nil;
    local v45 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useSignalState_0(v44.getItemData(v34.id)) else nil;
    local v46 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v9.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v27 (ref), v40 (copy), v21 (ref)
        return v27(v40) == v21.Owned;
    end, {
        v40
    }) else nil;
    if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then
        v9.useEffect(function() --[[ Line: 84 ]]
            -- upvalues: v40 (copy), l_getPriceInRobux_0 (ref), v27 (ref), v44 (copy), v34 (copy)
            if not v40 or not v40.timedOptions then
                return;
            else
                local v47 = l_getPriceInRobux_0(v40, v27(v40)) or 0;
                local v48 = table.clone(v40.timedOptions);
                table.insert(v48, {
                    days = 0, 
                    price = v47, 
                    selected = true
                });
                v44.setItemData(v34.id, {
                    timedOptions = v48
                });
                return;
            end;
        end, {
            v40, 
            v34.id, 
            v44
        });
    end;
    local v56 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v9.useCallback(function(v49, v50) --[[ Line: 105 ]]
        -- upvalues: v45 (copy), v44 (copy), v34 (copy)
        if not v45 or not v45.timedOptions then
            return;
        else
            local v51 = {};
            for _, v53 in v45.timedOptions do
                local v54 = {
                    days = v53.days, 
                    price = v53.price
                };
                local v55 = false;
                if v53.price == v49 then
                    v55 = true;
                    if v50 ~= nil then
                        v55 = v53.days == v50;
                    end;
                end;
                v54.selected = v55;
                table.insert(v51, v54);
            end;
            v44.setItemData(v34.id, {
                timedOptions = v51
            });
            return;
        end;
    end, {
        v34.id, 
        v45, 
        v44
    }) else nil;
    local v57 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v45 and v45.timedOptions or nil else nil;
    local v60 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v9.useMemo(function() --[[ Line: 132 ]]
        -- upvalues: v57 (copy)
        if not v57 then
            return nil;
        else
            for _, v59 in v57 do
                if v59.selected then
                    return v59.price;
                end;
            end;
            return nil;
        end;
    end, {
        v57
    }) else nil;
    if not v40 then
        return {};
    else
        local v61 = v23(v34);
        local v62 = v43[v40.itemSubType];
        local v63 = v24(v40.itemRestrictions);
        local v64 = if not (l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 and v40.timedOptions) or v46 then nil else {
            type = "icon", 
            iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable
        };
        local v65 = if v41 == l_RetrievalStatus_0.Done then v25(v40, v39, v43) else nil;
        local v66 = if v40.creator then {
            name = v40.creator.creatorName or "", 
            verified = v40.creator.creatorHasVerifiedBadge
        } else nil;
        local v67 = v9.useRef(nil);
        v9.useEffect(function() --[[ Line: 169 ]]
            -- upvalues: l_addUnifiedEventLogging_0 (ref), v67 (copy), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), v34 (copy), l_SessionService_0 (ref)
            l_addUnifiedEventLogging_0(v67, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                surface = l_UnifiedLoggingSurface_0.IN_EXPERIENCE_INSPECT_BUY, 
                elementName = "CLICK_INSPECTBUY_ITEM_" .. v34.id
            }, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end, {
            v34.id
        });
        local v68 = v9.useCallback(function() --[[ Line: 179 ]]
            -- upvalues: v37 (copy), v34 (copy)
            v37(v34);
        end, {
            v37, 
            v34
        });
        return {
            title = v40.name, 
            presentationSlot = v9.createElement(l_ItemCardThumbnail_0, {
                url = v61
            }), 
            itemSubType = v62, 
            itemType = v63, 
            creator = v66, 
            priceLineContent = v65, 
            LayoutOrder = v35, 
            Size = UDim2.fromOffset(v38, 0), 
            headerSize = UDim2.fromOffset(v38, v38), 
            footerAutomaticSize = Enum.AutomaticSize.XY, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            onActivated = v68, 
            ref = v67, 
            itemStatus = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v64 else nil, 
            isOwned = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v46 else nil, 
            timedOptions = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v57 else nil, 
            onTimedOptionPriceChanged = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v56 else nil, 
            selectedTimedOptionPrice = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v60 else nil
        };
    end;
end;