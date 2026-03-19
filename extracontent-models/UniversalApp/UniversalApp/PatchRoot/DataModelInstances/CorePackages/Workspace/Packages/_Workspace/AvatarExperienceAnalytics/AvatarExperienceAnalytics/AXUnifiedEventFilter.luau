local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v1 = require(script.Parent.UnifiedEventLogEnums);
local l_MarketplaceUnifiedAction_0 = v1.MarketplaceUnifiedAction;
local l_MarketplaceUnifiedItemType_0 = v1.MarketplaceUnifiedItemType;
local l_WidgetUiTreatment_0 = v1.WidgetUiTreatment;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local v6 = require(script.Parent.sendAXCounterV2);
local v7 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXWidgetTypeAnalytics_0 = v7.FFlagAXWidgetTypeAnalytics;
local l_FFlagAXWidgetImpressionThemeId_0 = v7.FFlagAXWidgetImpressionThemeId;
local v10 = game:DefineFastFlag("AXSendPurchaseAttempt", false);
local v11 = {};
local v12 = {
    AssetTypeIdStringToName = {}, 
    BundleTypeIdStringToName = {}
};
for _, v14 in (Enum.BundleType:GetEnumItems()) do
    v12.BundleTypeIdStringToName[tostring(v14.Value)] = v14.Name;
end;
for _, v16 in (Enum.AvatarAssetType:GetEnumItems()) do
    v12.AssetTypeIdStringToName[tostring(v16.Value)] = v16.Name;
end;
v11.hasOrganicData = function(v17) --[[ Line: 106 ]] --[[ Name: hasOrganicData ]]
    if v17.assetType or v17.bundleType or v17.organicItemPrice or v17.organicItemWearAfterPurchase or v17.organicItemSaveToMyAvatars or v17.organicAssetIds or v17.organicBundleIds then
        return true;
    else
        return false;
    end;
end;
v11.hasWidgetData = function(v18) --[[ Line: 122 ]] --[[ Name: hasWidgetData ]]
    if v18.widgetId or v18.widgetType or v18.assetIds or v18.bundleIds or v18.widgetItemIds or v18.organicResultIds or v18.widgetItemPrice or v18.uiTreatmentType or v18.themeId or v18.widgetItemWearAfterPurchase or v18.widgetItemSaveToMyAvatars then
        return true;
    else
        return false;
    end;
end;
v11.hasUiElementData = function(v19) --[[ Line: 143 ]] --[[ Name: hasUiElementData ]]
    if v19.elementName then
        return true;
    else
        return false;
    end;
end;
v11.hasItemId = function(v20) --[[ Line: 151 ]] --[[ Name: hasItemId ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy)
    local l_action_0 = v20.action;
    local l_itemId_0 = v20.itemId;
    if l_action_0 == l_MarketplaceUnifiedAction_0.UNDEFINED_ACTION or l_action_0 == l_MarketplaceUnifiedAction_0.UI_ELEMENT_CLICK or l_action_0 == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
        return true;
    else
        local v23 = false;
        if l_itemId_0 ~= nil then
            v23 = l_itemId_0 ~= "";
        end;
        return v23;
    end;
end;
v11.hasValidItemType = function(v24) --[[ Line: 167 ]] --[[ Name: hasValidItemType ]]
    -- upvalues: l_MarketplaceUnifiedItemType_0 (copy), l_MarketplaceUnifiedAction_0 (copy)
    local l_itemType_0 = v24.itemType;
    if l_itemType_0 == l_MarketplaceUnifiedItemType_0.UNDEFINED_ITEM_TYPE or l_itemType_0 == nil then
        local l_action_1 = v24.action;
        local v27 = true;
        if l_action_1 ~= l_MarketplaceUnifiedAction_0.UI_ELEMENT_CLICK then
            v27 = l_action_1 == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION;
        end;
        return v27;
    else
        local v28 = true;
        if l_itemType_0 ~= l_MarketplaceUnifiedItemType_0.ASSET then
            v28 = true;
            if l_itemType_0 ~= l_MarketplaceUnifiedItemType_0.BUNDLE then
                v28 = l_itemType_0 == l_MarketplaceUnifiedItemType_0.LOOK;
            end;
        end;
        return v28;
    end;
end;
v11.hasValidAction = function(v29) --[[ Line: 182 ]] --[[ Name: hasValidAction ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy)
    local l_action_2 = v29.action;
    local v31 = false;
    if l_action_2 ~= nil then
        v31 = l_action_2 ~= l_MarketplaceUnifiedAction_0.UNDEFINED_ACTION;
    end;
    return v31;
end;
v11.hasValidSurface = function(v32) --[[ Line: 187 ]] --[[ Name: hasValidSurface ]]
    -- upvalues: l_UnifiedLoggingSurface_0 (copy)
    local l_surface_0 = v32.surface;
    local v34 = false;
    if l_surface_0 ~= nil then
        v34 = l_surface_0 ~= l_UnifiedLoggingSurface_0.UNDEFINED_SURFACE;
    end;
    return v34;
end;
v11.hasRequestIdForWidgetLog = function(v35) --[[ Line: 192 ]] --[[ Name: hasRequestIdForWidgetLog ]]
    -- upvalues: v11 (copy)
    if v11.hasWidgetData(v35) then
        local v36 = false;
        if v35.requestId ~= nil then
            v36 = v35.requestId ~= "";
        end;
        return v36;
    else
        return true;
    end;
end;
v11.hasValidSizeAndPosition = function(v37) --[[ Line: 202 ]] --[[ Name: hasValidSizeAndPosition ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy)
    local l_action_3 = v37.action;
    if l_action_3 == l_MarketplaceUnifiedAction_0.ITEM_IMPRESSION or l_action_3 == l_MarketplaceUnifiedAction_0.ITEM_SELECTED or l_action_3 == l_MarketplaceUnifiedAction_0.ITEM_DESELECTED or l_action_3 == l_MarketplaceUnifiedAction_0.PURCHASE_SUCCESS then
        local v39 = v37.screenSizeWidth or 0;
        local v40 = v37.screenSizeHeight or 0;
        local v41 = false;
        if v39 > 0 then
            v41 = v40 > 0;
        end;
        local v42 = v37.elementSizeWidth or 0;
        local v43 = v37.elementSizeHeight or 0;
        local v44 = false;
        if v42 > 0 then
            v44 = v43 > 0;
        end;
        local v45 = v37.gridPositionRow or 0;
        local v46 = v37.gridPositionColumn or 0;
        local v47 = false;
        if v45 > 0 then
            v47 = v46 > 0;
        end;
        return v41 and v44 and v47;
    elseif l_action_3 == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
        local v48 = v37.gridPositionRow or 0;
        local v49 = v37.gridPositionColumn or 0;
        local v50 = false;
        if v48 > 0 then
            v50 = v49 == 1;
        end;
        return v50;
    else
        return true;
    end;
end;
v11.hasValidFilter = function(v51) --[[ Line: 237 ]] --[[ Name: hasValidFilter ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy), l_UnifiedLoggingSurface_0 (copy), v1 (copy)
    local l_surface_1 = v51.surface;
    local l_keyword_0 = v51.keyword;
    local l_category_0 = v51.category;
    local l_subcategory_0 = v51.subcategory;
    local l_filterPriceMin_0 = v51.filterPriceMin;
    local l_filterPriceMax_0 = v51.filterPriceMax;
    local l_filterPrice_0 = v51.filterPrice;
    local l_filterCreatorsName_0 = v51.filterCreatorsName;
    local l_filterCreators_0 = v51.filterCreators;
    local v61 = true;
    if l_category_0 ~= nil and l_category_0 ~= "" then
        if l_subcategory_0 ~= nil and l_subcategory_0 == "" then
            v61 = false;
        end;
    else
        local v62 = true;
        if v51.action ~= l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
            v62 = true;
            if v51.action ~= l_MarketplaceUnifiedAction_0.UI_ELEMENT_CLICK then
                v62 = v51.action == l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT;
            end;
        end;
        v61 = v62;
    end;
    local v63 = true;
    if l_keyword_0 or l_surface_1 == l_UnifiedLoggingSurface_0.SEARCH_RESULTS then
        local v64 = false;
        if l_surface_1 == l_UnifiedLoggingSurface_0.SEARCH_RESULTS then
            v64 = false;
            if l_keyword_0 ~= nil then
                v64 = l_keyword_0 ~= "";
            end;
        end;
        v63 = v64;
    end;
    local v65 = true;
    if l_filterPriceMin_0 and l_filterPriceMin_0 ~= "" or l_filterPriceMax_0 and l_filterPriceMax_0 ~= "" then
        v65 = l_filterPrice_0 == v1.FiltersPrice.PRICE_RANGE;
    end;
    local v66 = true;
    if l_filterCreatorsName_0 and l_filterCreatorsName_0 ~= "" then
        v66 = l_filterCreators_0 == v1.FiltersCreators.CREATORS_BY_USERNAME;
    end;
    return v63 and v61 and v65 and v66;
end;
v11.hasValidEntityData = function(v67) --[[ Line: 283 ]] --[[ Name: hasValidEntityData ]]
    -- upvalues: l_UnifiedLoggingSurface_0 (copy), v10 (copy), l_MarketplaceUnifiedAction_0 (copy), v11 (copy), l_MarketplaceUnifiedItemType_0 (copy), v12 (copy), l_WidgetUiTreatment_0 (copy), l_FFlagAXWidgetImpressionThemeId_0 (copy), l_FFlagAXWidgetTypeAnalytics_0 (copy)
    if v67.surface == l_UnifiedLoggingSurface_0.CUSTOMIZE then
        return true;
    elseif v10 and v67.action == l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT then
        return true;
    else
        local v68 = 0;
        local v69 = v11.hasOrganicData(v67);
        local v70 = v11.hasWidgetData(v67);
        local v71 = v11.hasUiElementData(v67);
        if v69 then
            v68 = v68 + 1;
        end;
        if v70 then
            v68 = v68 + 1;
        end;
        if v71 then
            v68 = v68 + 1;
        end;
        if v68 ~= 1 then
            return false;
        elseif v69 then
            local v72 = false;
            if v67.organicItemPrice ~= nil then
                v72 = v67.organicItemPrice >= 0;
            end;
            if not v72 then
                return false;
            elseif v67.itemType == l_MarketplaceUnifiedItemType_0.LOOK then
                if v67.action == l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT then
                    return true;
                else
                    local v73 = v67.organicAssetIds and v67.organicAssetIds ~= "" or false;
                    local v74 = v67.organicBundleIds and v67.organicBundleIds ~= "" or false;
                    return v73 or v74;
                end;
            else
                local v75 = v67.assetType and v12.AssetTypeIdStringToName[tostring(v67.assetType)] ~= nil;
                local v76 = v67.bundleType and v12.BundleTypeIdStringToName[tostring(v67.bundleType)] ~= nil;
                if not v75 and not v76 then
                    return false;
                else
                    return true;
                end;
            end;
        elseif v70 then
            local v77 = false;
            if v67.widgetId ~= nil then
                v77 = v67.widgetId ~= "";
            end;
            local v78 = false;
            if v67.widgetType ~= nil then
                v78 = v67.widgetType ~= "";
            end;
            local v79 = v67.widgetItemIds and v67.widgetItemIds ~= "" or false;
            local v80 = v67.assetIds and v67.assetIds ~= "" or false;
            local v81 = v67.bundleIds and v67.bundleIds ~= "" or false;
            local v82 = nil;
            v82 = v67.itemType ~= l_MarketplaceUnifiedItemType_0.LOOK or not (v67.action ~= l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT) or v80 or v81;
            local v83 = v67.uiTreatmentType and v67.uiTreatmentType ~= l_WidgetUiTreatment_0.UNKNOWN_WIDGET_UI or false;
            local v84 = v67.widgetType == "ThemedAvatarItemsWidget";
            local v85 = false;
            if v67.themeId ~= nil then
                v85 = v67.themeId ~= "";
            end;
            local v86 = if l_FFlagAXWidgetImpressionThemeId_0 then not v84 or v85 else not v84 or v85 or true;
            local v87 = false;
            if v67.widgetItemPrice ~= nil then
                v87 = v67.widgetItemPrice >= 0;
            end;
            if v67.action == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
                v87 = true;
                if not l_FFlagAXWidgetTypeAnalytics_0 then
                    v83 = true;
                end;
            end;
            return v77 and v78 and v79 and v82 and v83 and v86 and v87;
        elseif v71 then
            local v88 = false;
            if v67.elementName ~= nil then
                v88 = v67.elementName ~= "";
            end;
            return v88;
        else
            return false;
        end;
    end;
end;
v11.filter = function(v89) --[[ Line: 399 ]] --[[ Name: filter ]]
    -- upvalues: v11 (copy), l_MarketplaceUnifiedAction_0 (copy), v6 (copy), l_UnifiedLoggingSurface_0 (copy)
    local v90 = v11.hasItemId(v89);
    local v91 = v11.hasValidItemType(v89);
    local v92 = v11.hasValidAction(v89);
    local v93 = v11.hasValidSurface(v89);
    local v94 = v11.hasRequestIdForWidgetLog(v89);
    local v95 = v11.hasValidSizeAndPosition(v89);
    local v96 = v11.hasValidFilter(v89);
    local v97 = v11.hasValidEntityData(v89);
    local v98 = v90 and v91 and v92 and v93 and v94 and v95 and v96 and v97;
    if not v98 then
        local v99 = "";
        if not v90 then
            v99 = v99 .. "hasItemId ";
        end;
        if not v91 then
            v99 = v99 .. "hasValidItemType ";
        end;
        if not v92 then
            v99 = v99 .. "hasValidAction ";
        end;
        if not v93 then
            v99 = v99 .. "hasValidSurface ";
        end;
        if not v94 then
            v99 = v99 .. "hasRequestIdForWidgetLog ";
        end;
        if not v95 then
            v99 = v99 .. "hasValidSizeAndPosition ";
        end;
        if not v96 then
            v99 = v99 .. "hasValidFilter ";
        end;
        if not v97 then
            v99 = v99 .. "hasValidEntityData ";
        end;
        if v89.action == l_MarketplaceUnifiedAction_0.ITEM_IMPRESSION then
            warn("Failed to send unified impression event. Failing Check(s): " .. v99);
        elseif v89.action == l_MarketplaceUnifiedAction_0.ITEM_SELECTED then
            warn("Failed to send unified click event. Failing Check(s): " .. v99);
        elseif v89.action == l_MarketplaceUnifiedAction_0.PURCHASE_SUCCESS then
            warn("Failed to send unified purchase event. Failing Check(s): " .. v99);
        else
            warn("Failed to send unified event. Failing Check(s): " .. v99);
        end;
    end;
    v6("AXUnifiedFilter", {
        success = tostring(v98), 
        action = tostring(v89.action or l_MarketplaceUnifiedAction_0.UNDEFINED_ACTION), 
        surface = tostring(v89.surface or l_UnifiedLoggingSurface_0.UNDEFINED_SURFACE), 
        hasItemId = tostring(v90), 
        hasValidItemType = tostring(v91), 
        hasValidAction = tostring(v92), 
        hasValidSurface = tostring(v93), 
        hasRequestIdForWidgetLog = tostring(v94), 
        hasValidSizeAndPosition = tostring(v95), 
        hasValidFilter = tostring(v96), 
        hasValidEntityData = tostring(v97)
    });
    return v98;
end;
return v11;