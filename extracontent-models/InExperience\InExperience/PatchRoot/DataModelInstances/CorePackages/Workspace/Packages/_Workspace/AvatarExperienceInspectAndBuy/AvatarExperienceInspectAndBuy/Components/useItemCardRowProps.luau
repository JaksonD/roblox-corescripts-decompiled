local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SessionService_0 = game:GetService("SessionService");
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_Parent_0.Localization);
local l_ItemTypeEnum_0 = require(l_Parent_0.AXCommon).Enums.ItemTypeEnum;
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local v8 = require(l_Parent_0.React);
local v9 = require(l_script_FirstAncestor_0.Hooks.useConvertedItemData);
local _ = require(l_script_FirstAncestor_0.Types);
local v11 = require(l_script_FirstAncestor_0.Constants);
local l_AssetLocalizationKeys_0 = v11.AssetLocalizationKeys;
local l_BundleLocalizationKeys_0 = v11.BundleLocalizationKeys;
local l_PriceStatusLocalizationKeys_0 = v11.PriceStatusLocalizationKeys;
local v15 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_addUnifiedEventLogging_0 = v15.addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = v15.UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local _ = require(l_script_FirstAncestor_0.Enums.ViewType);
local _ = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v22 = require(l_script_FirstAncestor_0.Utils.getItemThumbnailUrl);
local v23 = require(l_script_FirstAncestor_0.Utils.getCatalogCardItemType);
local v24 = require(l_script_FirstAncestor_0.Utils.getPriceLineContent);
local v25 = require(l_Parent_0.Cryo);
return function(v26, v27, _, v29, v30) --[[ Line: 39 ]]
    -- upvalues: l_useTokens_0 (copy), v9 (copy), l_ItemTypeEnum_0 (copy), l_BundleLocalizationKeys_0 (copy), l_AssetLocalizationKeys_0 (copy), v25 (copy), l_PriceStatusLocalizationKeys_0 (copy), l_useLocalization_0 (copy), v22 (copy), v23 (copy), l_RetrievalStatus_0 (copy), v24 (copy), v8 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_SessionService_0 (copy), l_ItemCardThumbnail_0 (copy)
    local v31 = l_useTokens_0();
    local v32, v33 = v9(v26);
    local v34 = if v26.itemType == l_ItemTypeEnum_0.Bundle then l_BundleLocalizationKeys_0 else l_AssetLocalizationKeys_0;
    v34 = v25.Dictionary.join(v34, l_PriceStatusLocalizationKeys_0);
    local v35 = l_useLocalization_0(v34);
    if not v32 then
        return {};
    else
        local v36 = v22(v26);
        local v37 = v35[v32.itemSubType];
        local v38 = v23(v32.itemRestrictions);
        local v39 = if v33 == l_RetrievalStatus_0.Done then v24(v32, v31, v35) else nil;
        local v40 = if v32.creator then {
            name = v32.creator.creatorName or "", 
            verified = v32.creator.creatorHasVerifiedBadge
        } else nil;
        local v41 = v8.useRef(nil);
        v8.useEffect(function() --[[ Line: 74 ]]
            -- upvalues: l_addUnifiedEventLogging_0 (ref), v41 (copy), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), v26 (copy), l_SessionService_0 (ref)
            l_addUnifiedEventLogging_0(v41, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                surface = l_UnifiedLoggingSurface_0.IN_EXPERIENCE_INSPECT_BUY, 
                elementName = "CLICK_INSPECTBUY_ITEM_" .. v26.id
            }, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end, {
            v26.id
        });
        local v42 = v8.useCallback(function() --[[ Line: 84 ]]
            -- upvalues: v29 (copy), v26 (copy)
            v29(v26);
        end, {
            v29, 
            v26
        });
        return {
            title = v32.name, 
            presentationSlot = v8.createElement(l_ItemCardThumbnail_0, {
                url = v36
            }), 
            itemSubType = v37, 
            itemType = v38, 
            creator = v40, 
            priceLineContent = v39, 
            LayoutOrder = v27, 
            Size = UDim2.fromOffset(v30, 0), 
            headerSize = UDim2.fromOffset(v30, v30), 
            footerAutomaticSize = Enum.AutomaticSize.XY, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            onActivated = v42, 
            ref = v41
        };
    end;
end;