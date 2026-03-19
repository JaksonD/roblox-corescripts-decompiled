local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.avatarEditorPropertyChanged);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.clickNavigationTab);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.clickShopForMore);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.avatarEditorOpenedFromLandingPage);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.catalogToAvatarBackButton);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.catalogToAvatarButton);
local l_AnalyticsService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_Constants_0 = v14.Constants;
local v16 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXImproveSlotBasedEditorPerformance);
local v17 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
local l_reportAvatarEventCounterV1_0 = v14.reportAvatarEventCounterV1;
local l_FFlagAXEditorSubcategoryFilters_0 = v13.FFlagAXEditorSubcategoryFilters;
local l_FFlagAXMigrateReportAvatarEventCounter_0 = v13.FFlagAXMigrateReportAvatarEventCounter;
local v21 = {};
local v22 = nil;
local function v99(v23) --[[ Line: 33 ]] --[[ Name: getAvatarEditorAnalyticsInner ]]
    -- upvalues: v3 (copy), v10 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (copy), l_reportAvatarEventCounterV1_0 (copy), l_Constants_0 (copy), v17 (copy), v12 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v4 (copy), v5 (copy), v7 (copy), v8 (copy), v6 (copy), l_ImpressionEnums_0 (copy), v16 (copy), v22 (ref)
    local v24 = {};
    local function _(v25, v26, v27, v28, v29, v30) --[[ Line: 36 ]] --[[ Name: sendEvent ]]
        -- upvalues: v3 (ref), v23 (copy)
        v3(v23.EventStream, v25, v29, v26, v27, v28, v30);
    end;
    v24.equipAsset = function(v32, v33, v34, v35, _, v37) --[[ Line: 49 ]] --[[ Name: equipAsset ]]
        -- upvalues: v10 (ref), v3 (ref), v23 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v17 (ref)
        local v38 = v10.AssetTypeIdStringToName[v35] or "UnknownAssetTypeId: " .. v35;
        v3(v23.EventStream, "EquipAsset", v38, v32, v33, v34, v37);
        if l_FFlagAXMigrateReportAvatarEventCounter_0 then
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXEquipAsset);
            return;
        else
            v17(v23, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXEquipAsset);
            return;
        end;
    end;
    v24.unequipAsset = function(v39, v40, v41, v42, _, v44) --[[ Line: 69 ]] --[[ Name: unequipAsset ]]
        -- upvalues: v10 (ref), v3 (ref), v23 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v17 (ref)
        local v45 = v10.AssetTypeIdStringToName[v42] or "UnknownAssetTypeId: " .. v42;
        v3(v23.EventStream, "UnequipAsset", v45, v39, v40, v41, v44);
        if l_FFlagAXMigrateReportAvatarEventCounter_0 then
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXUnequipAsset);
            return;
        else
            v17(v23, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXUnequipAsset);
            return;
        end;
    end;
    v24.clickNavigationTab = function(v46, v47, v48) --[[ Line: 89 ]] --[[ Name: clickNavigationTab ]]
        -- upvalues: v12 (ref), l_FFlagAXEditorSubcategoryFilters_0 (ref), v4 (ref), v23 (copy)
        local v49 = v12()[v46];
        if v49 then
            local v50 = v49.Subcategories and v49.Subcategories[v47];
            local v51 = if l_FFlagAXEditorSubcategoryFilters_0 and v48 and v50 and v50.SubcategoryFilters then v50.SubcategoryFilters[v48] else nil;
            local v52 = v49 and v49.Name or "";
            local v53 = v50 and v50.Name or "";
            local v54 = if l_FFlagAXEditorSubcategoryFilters_0 and v51 then v51.Name else "";
            v4(v23.EventStream, "clickNavigationTab", v52, v53, if l_FFlagAXEditorSubcategoryFilters_0 then v54 else nil);
        end;
    end;
    v24.setAvatarHeadSize = function(v55, v56, v57) --[[ Line: 114 ]] --[[ Name: setAvatarHeadSize ]]
        -- upvalues: v3 (ref), v23 (copy)
        v3(v23.EventStream, "SetHeadSize", "HeadSize", v55, v56, v57, nil);
    end;
    v24.setAvatarHeight = function(v58, v59, v60) --[[ Line: 118 ]] --[[ Name: setAvatarHeight ]]
        -- upvalues: v3 (ref), v23 (copy)
        v3(v23.EventStream, "SetHeight", "Height", v58, v59, v60, nil);
    end;
    v24.setAvatarWidth = function(v61, v62, v63) --[[ Line: 122 ]] --[[ Name: setAvatarWidth ]]
        -- upvalues: v3 (ref), v23 (copy)
        v3(v23.EventStream, "SetWidth", "Width", v61, v62, v63, nil);
    end;
    v24.setAvatarBodyType = function(v64, v65, v66) --[[ Line: 126 ]] --[[ Name: setAvatarBodyType ]]
        -- upvalues: v3 (ref), v23 (copy)
        v3(v23.EventStream, "SetBodyType", "BodyType", v64, v65, v66, nil);
    end;
    v24.setAvatarProportion = function(v67, v68, v69) --[[ Line: 130 ]] --[[ Name: setAvatarProportion ]]
        -- upvalues: v3 (ref), v23 (copy)
        v3(v23.EventStream, "SetProportion", "Proportion", v67, v68, v69, nil);
    end;
    v24.toggleAvatarType = function(v70, v71, v72) --[[ Line: 134 ]] --[[ Name: toggleAvatarType ]]
        -- upvalues: v3 (ref), v23 (copy)
        v3(v23.EventStream, "SetAvatarType", "AvatarType", v70, v71, v72, nil);
    end;
    v24.setBodyColors = function(v73, v74, v75) --[[ Line: 138 ]] --[[ Name: setBodyColors ]]
        -- upvalues: v3 (ref), v23 (copy)
        local v76 = v73[next(v73)] or "empty";
        for _, v78 in v73 do
            v76 = v78 == v76 and v76 or "mixed";
        end;
        v3(v23.EventStream, "SetBodyColors", "BodyColors", v76, v74, v75, nil);
    end;
    v24.setBodyColor3s = function(v79, v80, v81) --[[ Line: 148 ]] --[[ Name: setBodyColor3s ]]
        -- upvalues: v3 (ref), v23 (copy)
        local v82 = v79[next(v79)]:ToHex() or "empty";
        for _, v84 in v79 do
            v82 = v84:ToHex() == v82 and v82 or "mixed";
        end;
        v3(v23.EventStream, "SetBodyColor3s", "BodyColor3s", v82, v80, v81, nil);
    end;
    v24.clickShopForMore = function(v85, v86) --[[ Line: 158 ]] --[[ Name: clickShopForMore ]]
        -- upvalues: v12 (ref), v5 (ref), v23 (copy)
        local v87 = v12()[v85];
        if v87 then
            local v88 = v87.Subcategories and v87.Subcategories[v86];
            local v89 = v87 and v87.Name or "";
            local v90 = v88 and v88.Name or "";
            v5(v23.EventStream, "ClickShopForMore", v89, v90);
        end;
    end;
    v24.catalogToAvatarBackButton = function() --[[ Line: 168 ]] --[[ Name: catalogToAvatarBackButton ]]
        -- upvalues: v7 (ref), v23 (copy)
        v7(v23.EventStream, "ClickCatalogToAvatarBackButton");
    end;
    v24.catalogToAvatarButton = function() --[[ Line: 172 ]] --[[ Name: catalogToAvatarButton ]]
        -- upvalues: v8 (ref), v23 (copy)
        v8(v23.EventStream, "ClickCatalogToAvatarButton");
    end;
    v24.avatarEditorOpenedFromLandingPage = function() --[[ Line: 176 ]] --[[ Name: avatarEditorOpenedFromLandingPage ]]
        -- upvalues: v6 (ref), v23 (copy)
        v6(v23.EventStream, "AvatarEditorLandingPageButtonClicked");
    end;
    v24.outfitCreated = function(_) --[[ Line: 180 ]] --[[ Name: outfitCreated ]]
        -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v17 (ref), v23 (copy)
        if l_FFlagAXMigrateReportAvatarEventCounter_0 then
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume);
            return;
        else
            v17(v23, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume);
            return;
        end;
    end;
    v24.outfitClicked = function(v92, _, v94) --[[ Line: 191 ]] --[[ Name: outfitClicked ]]
        -- upvalues: l_ImpressionEnums_0 (ref), v23 (copy)
        local v95 = {
            surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
            actionType = l_ImpressionEnums_0.ActionType.ITEM_CLICK, 
            contentType = l_ImpressionEnums_0.MarketplaceItemType.CHARACTER, 
            characterType = if v94 then l_ImpressionEnums_0.CharacterType.CREATION else l_ImpressionEnums_0.CharacterType.PURCHASED, 
            itemId = v92
        };
        v23.EventStream:sendTelemetryEvent("clickToWearOutfit", "marketplaceOrganicFELog", v95);
    end;
    v24.colorPickerChanged = function(_, _, _) --[[ Line: 206 ]] --[[ Name: colorPickerChanged ]]
        -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v17 (ref), v23 (copy)
        if l_FFlagAXMigrateReportAvatarEventCounter_0 then
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXColorPickerChanged);
            return;
        else
            v17(v23, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXColorPickerChanged);
            return;
        end;
    end;
    if v16 then
        v22 = v24;
    end;
    return v24;
end;
v21.mock = function(v100) --[[ Line: 226 ]] --[[ Name: mock ]]
    -- upvalues: v99 (copy)
    return (v99(v100));
end;
v21.get = function(_) --[[ Line: 230 ]] --[[ Name: get ]]
    -- upvalues: v16 (copy), v22 (ref), l_AnalyticsService_0 (copy), v99 (copy)
    if v16 and v22 then
        return v22;
    else
        return (v99(l_AnalyticsService_0));
    end;
end;
return v21;