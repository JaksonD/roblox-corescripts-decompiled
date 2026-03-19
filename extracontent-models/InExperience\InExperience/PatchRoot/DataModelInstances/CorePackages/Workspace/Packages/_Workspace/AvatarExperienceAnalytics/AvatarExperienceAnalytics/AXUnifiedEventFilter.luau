local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v1 = require(script.Parent.UnifiedEventLogEnums);
local l_MarketplaceUnifiedAction_0 = v1.MarketplaceUnifiedAction;
local l_MarketplaceUnifiedItemType_0 = v1.MarketplaceUnifiedItemType;
local l_WidgetUiTreatment_0 = v1.WidgetUiTreatment;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local v6 = require(script.Parent.sendAXCounterV2);
local v7 = game:DefineFastFlag("AXSendPurchaseAttempt", false);
local v8 = {};
local v9 = {
    AssetTypeIdStringToName = {}, 
    BundleTypeIdStringToName = {}
};
for _, v11 in (Enum.BundleType:GetEnumItems()) do
    v9.BundleTypeIdStringToName[tostring(v11.Value)] = v11.Name;
end;
for _, v13 in (Enum.AvatarAssetType:GetEnumItems()) do
    v9.AssetTypeIdStringToName[tostring(v13.Value)] = v13.Name;
end;
v8.hasOrganicData = function(v14) --[[ Line: 102 ]] --[[ Name: hasOrganicData ]]
    if v14.assetType or v14.bundleType or v14.organicItemPrice or v14.organicItemWearAfterPurchase or v14.organicItemSaveToMyAvatars or v14.organicAssetIds or v14.organicBundleIds then
        return true;
    else
        return false;
    end;
end;
v8.hasWidgetData = function(v15) --[[ Line: 118 ]] --[[ Name: hasWidgetData ]]
    if v15.widgetId or v15.widgetType or v15.assetIds or v15.bundleIds or v15.widgetItemIds or v15.organicResultIds or v15.widgetItemPrice or v15.uiTreatmentType or v15.themeId or v15.widgetItemWearAfterPurchase or v15.widgetItemSaveToMyAvatars then
        return true;
    else
        return false;
    end;
end;
v8.hasUiElementData = function(v16) --[[ Line: 139 ]] --[[ Name: hasUiElementData ]]
    if v16.elementName then
        return true;
    else
        return false;
    end;
end;
v8.hasItemId = function(v17) --[[ Line: 147 ]] --[[ Name: hasItemId ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy)
    local l_action_0 = v17.action;
    local l_itemId_0 = v17.itemId;
    if l_action_0 == l_MarketplaceUnifiedAction_0.UNDEFINED_ACTION or l_action_0 == l_MarketplaceUnifiedAction_0.UI_ELEMENT_CLICK or l_action_0 == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
        return true;
    else
        local v20 = false;
        if l_itemId_0 ~= nil then
            v20 = l_itemId_0 ~= "";
        end;
        return v20;
    end;
end;
v8.hasValidItemType = function(v21) --[[ Line: 163 ]] --[[ Name: hasValidItemType ]]
    -- upvalues: l_MarketplaceUnifiedItemType_0 (copy), l_MarketplaceUnifiedAction_0 (copy)
    local l_itemType_0 = v21.itemType;
    if l_itemType_0 == l_MarketplaceUnifiedItemType_0.UNDEFINED_ITEM_TYPE or l_itemType_0 == nil then
        local l_action_1 = v21.action;
        local v24 = true;
        if l_action_1 ~= l_MarketplaceUnifiedAction_0.UI_ELEMENT_CLICK then
            v24 = l_action_1 == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION;
        end;
        return v24;
    else
        local v25 = true;
        if l_itemType_0 ~= l_MarketplaceUnifiedItemType_0.ASSET then
            v25 = true;
            if l_itemType_0 ~= l_MarketplaceUnifiedItemType_0.BUNDLE then
                v25 = l_itemType_0 == l_MarketplaceUnifiedItemType_0.LOOK;
            end;
        end;
        return v25;
    end;
end;
v8.hasValidAction = function(v26) --[[ Line: 178 ]] --[[ Name: hasValidAction ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy)
    local l_action_2 = v26.action;
    local v28 = false;
    if l_action_2 ~= nil then
        v28 = l_action_2 ~= l_MarketplaceUnifiedAction_0.UNDEFINED_ACTION;
    end;
    return v28;
end;
v8.hasValidSurface = function(v29) --[[ Line: 183 ]] --[[ Name: hasValidSurface ]]
    -- upvalues: l_UnifiedLoggingSurface_0 (copy)
    local l_surface_0 = v29.surface;
    local v31 = false;
    if l_surface_0 ~= nil then
        v31 = l_surface_0 ~= l_UnifiedLoggingSurface_0.UNDEFINED_SURFACE;
    end;
    return v31;
end;
v8.hasRequestIdForWidgetLog = function(v32) --[[ Line: 188 ]] --[[ Name: hasRequestIdForWidgetLog ]]
    -- upvalues: v8 (copy)
    if v8.hasWidgetData(v32) then
        local v33 = false;
        if v32.requestId ~= nil then
            v33 = v32.requestId ~= "";
        end;
        return v33;
    else
        return true;
    end;
end;
v8.hasValidSizeAndPosition = function(v34) --[[ Line: 198 ]] --[[ Name: hasValidSizeAndPosition ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy)
    local l_action_3 = v34.action;
    if l_action_3 == l_MarketplaceUnifiedAction_0.ITEM_IMPRESSION or l_action_3 == l_MarketplaceUnifiedAction_0.ITEM_SELECTED or l_action_3 == l_MarketplaceUnifiedAction_0.ITEM_DESELECTED or l_action_3 == l_MarketplaceUnifiedAction_0.PURCHASE_SUCCESS then
        local v36 = v34.screenSizeWidth or 0;
        local v37 = v34.screenSizeHeight or 0;
        local v38 = false;
        if v36 > 0 then
            v38 = v37 > 0;
        end;
        local v39 = v34.elementSizeWidth or 0;
        local v40 = v34.elementSizeHeight or 0;
        local v41 = false;
        if v39 > 0 then
            v41 = v40 > 0;
        end;
        local v42 = v34.gridPositionRow or 0;
        local v43 = v34.gridPositionColumn or 0;
        local v44 = false;
        if v42 > 0 then
            v44 = v43 > 0;
        end;
        return v38 and v41 and v44;
    elseif l_action_3 == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
        local v45 = v34.gridPositionRow or 0;
        local v46 = v34.gridPositionColumn or 0;
        local v47 = false;
        if v45 > 0 then
            v47 = v46 == 1;
        end;
        return v47;
    else
        return true;
    end;
end;
v8.hasValidFilter = function(v48) --[[ Line: 233 ]] --[[ Name: hasValidFilter ]]
    -- upvalues: l_MarketplaceUnifiedAction_0 (copy), l_UnifiedLoggingSurface_0 (copy), v1 (copy)
    local l_surface_1 = v48.surface;
    local l_keyword_0 = v48.keyword;
    local l_category_0 = v48.category;
    local l_subcategory_0 = v48.subcategory;
    local l_filterPriceMin_0 = v48.filterPriceMin;
    local l_filterPriceMax_0 = v48.filterPriceMax;
    local l_filterPrice_0 = v48.filterPrice;
    local l_filterCreatorsName_0 = v48.filterCreatorsName;
    local l_filterCreators_0 = v48.filterCreators;
    local v58 = true;
    if l_category_0 ~= nil and l_category_0 ~= "" then
        if l_subcategory_0 ~= nil and l_subcategory_0 == "" then
            v58 = false;
        end;
    else
        local v59 = true;
        if v48.action ~= l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
            v59 = true;
            if v48.action ~= l_MarketplaceUnifiedAction_0.UI_ELEMENT_CLICK then
                v59 = v48.action == l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT;
            end;
        end;
        v58 = v59;
    end;
    local v60 = true;
    if l_keyword_0 or l_surface_1 == l_UnifiedLoggingSurface_0.SEARCH_RESULTS then
        local v61 = false;
        if l_surface_1 == l_UnifiedLoggingSurface_0.SEARCH_RESULTS then
            v61 = false;
            if l_keyword_0 ~= nil then
                v61 = l_keyword_0 ~= "";
            end;
        end;
        v60 = v61;
    end;
    local v62 = true;
    if l_filterPriceMin_0 and l_filterPriceMin_0 ~= "" or l_filterPriceMax_0 and l_filterPriceMax_0 ~= "" then
        v62 = l_filterPrice_0 == v1.FiltersPrice.PRICE_RANGE;
    end;
    local v63 = true;
    if l_filterCreatorsName_0 and l_filterCreatorsName_0 ~= "" then
        v63 = l_filterCreators_0 == v1.FiltersCreators.CREATORS_BY_USERNAME;
    end;
    return v60 and v58 and v62 and v63;
end;
v8.hasValidEntityData = function(v64) --[[ Line: 279 ]] --[[ Name: hasValidEntityData ]]
    -- upvalues: l_UnifiedLoggingSurface_0 (copy), v7 (copy), l_MarketplaceUnifiedAction_0 (copy), v8 (copy), l_MarketplaceUnifiedItemType_0 (copy), v9 (copy), l_WidgetUiTreatment_0 (copy)
    if v64.surface == l_UnifiedLoggingSurface_0.CUSTOMIZE then
        return true;
    elseif v7 and v64.action == l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT then
        return true;
    else
        local v65 = 0;
        local v66 = v8.hasOrganicData(v64);
        local v67 = v8.hasWidgetData(v64);
        local v68 = v8.hasUiElementData(v64);
        if v66 then
            v65 = v65 + 1;
        end;
        if v67 then
            v65 = v65 + 1;
        end;
        if v68 then
            v65 = v65 + 1;
        end;
        if v65 ~= 1 then
            return false;
        elseif v66 then
            local v69 = false;
            if v64.organicItemPrice ~= nil then
                v69 = v64.organicItemPrice >= 0;
            end;
            if not v69 then
                return false;
            elseif v64.itemType == l_MarketplaceUnifiedItemType_0.LOOK then
                if v64.action == l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT then
                    return true;
                else
                    local v70 = v64.organicAssetIds and v64.organicAssetIds ~= "" or false;
                    local v71 = v64.organicBundleIds and v64.organicBundleIds ~= "" or false;
                    return v70 or v71;
                end;
            else
                local v72 = v64.assetType and v9.AssetTypeIdStringToName[tostring(v64.assetType)] ~= nil;
                local v73 = v64.bundleType and v9.BundleTypeIdStringToName[tostring(v64.bundleType)] ~= nil;
                if not v72 and not v73 then
                    return false;
                else
                    return true;
                end;
            end;
        elseif v67 then
            local v74 = false;
            if v64.widgetId ~= nil then
                v74 = v64.widgetId ~= "";
            end;
            local v75 = false;
            if v64.widgetType ~= nil then
                v75 = v64.widgetType ~= "";
            end;
            local v76 = v64.widgetItemIds and v64.widgetItemIds ~= "" or false;
            local v77 = v64.assetIds and v64.assetIds ~= "" or false;
            local v78 = v64.bundleIds and v64.bundleIds ~= "" or false;
            local v79 = nil;
            v79 = v64.itemType ~= l_MarketplaceUnifiedItemType_0.LOOK or not (v64.action ~= l_MarketplaceUnifiedAction_0.PURCHASE_ATTEMPT) or v77 or v78;
            local v80 = v64.uiTreatmentType and v64.uiTreatmentType ~= l_WidgetUiTreatment_0.UNKNOWN_WIDGET_UI or false;
            local v81 = v64.widgetType == "ThemedAvatarItemsWidget";
            local v82 = false;
            if v64.themeId ~= nil then
                v82 = v64.themeId ~= "";
            end;
            local v83 = not v81 or v82;
            local v84 = false;
            if v64.widgetItemPrice ~= nil then
                v84 = v64.widgetItemPrice >= 0;
            end;
            if v64.action == l_MarketplaceUnifiedAction_0.WIDGET_IMPRESSION then
                v84 = true;
            end;
            return v74 and v75 and v76 and v79 and v80 and v83 and v84;
        elseif v68 then
            local v85 = false;
            if v64.elementName ~= nil then
                v85 = v64.elementName ~= "";
            end;
            return v85;
        else
            return false;
        end;
    end;
end;
v8.filter = function(v86) --[[ Line: 389 ]] --[[ Name: filter ]]
    -- upvalues: v8 (copy), l_MarketplaceUnifiedAction_0 (copy), v6 (copy), l_UnifiedLoggingSurface_0 (copy)
    local v87 = v8.hasItemId(v86);
    local v88 = v8.hasValidItemType(v86);
    local v89 = v8.hasValidAction(v86);
    local v90 = v8.hasValidSurface(v86);
    local v91 = v8.hasRequestIdForWidgetLog(v86);
    local v92 = v8.hasValidSizeAndPosition(v86);
    local v93 = v8.hasValidFilter(v86);
    local v94 = v8.hasValidEntityData(v86);
    local v95 = v87 and v88 and v89 and v90 and v91 and v92 and v93 and v94;
    if not v95 then
        local v96 = "";
        if not v87 then
            v96 = v96 .. "hasItemId ";
        end;
        if not v88 then
            v96 = v96 .. "hasValidItemType ";
        end;
        if not v89 then
            v96 = v96 .. "hasValidAction ";
        end;
        if not v90 then
            v96 = v96 .. "hasValidSurface ";
        end;
        if not v91 then
            v96 = v96 .. "hasRequestIdForWidgetLog ";
        end;
        if not v92 then
            v96 = v96 .. "hasValidSizeAndPosition ";
        end;
        if not v93 then
            v96 = v96 .. "hasValidFilter ";
        end;
        if not v94 then
            v96 = v96 .. "hasValidEntityData ";
        end;
        if v86.action == l_MarketplaceUnifiedAction_0.ITEM_IMPRESSION then
            warn("Failed to send unified impression event. Failing Check(s): " .. v96);
        elseif v86.action == l_MarketplaceUnifiedAction_0.ITEM_SELECTED then
            warn("Failed to send unified click event. Failing Check(s): " .. v96);
        elseif v86.action == l_MarketplaceUnifiedAction_0.PURCHASE_SUCCESS then
            warn("Failed to send unified purchase event. Failing Check(s): " .. v96);
        else
            warn("Failed to send unified event. Failing Check(s): " .. v96);
        end;
    end;
    v6("AXUnifiedFilter", {
        success = tostring(v95), 
        action = tostring(v86.action or l_MarketplaceUnifiedAction_0.UNDEFINED_ACTION), 
        surface = tostring(v86.surface or l_UnifiedLoggingSurface_0.UNDEFINED_SURFACE), 
        hasItemId = tostring(v87), 
        hasValidItemType = tostring(v88), 
        hasValidAction = tostring(v89), 
        hasValidSurface = tostring(v90), 
        hasRequestIdForWidgetLog = tostring(v91), 
        hasValidSizeAndPosition = tostring(v92), 
        hasValidFilter = tostring(v93), 
        hasValidEntityData = tostring(v94)
    });
    return v95;
end;
return v8;