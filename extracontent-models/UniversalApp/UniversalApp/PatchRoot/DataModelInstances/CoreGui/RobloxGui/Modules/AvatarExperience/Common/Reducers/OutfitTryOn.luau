local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v10 = require(l_CorePackages_0.Packages.tutils);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnColorUpdated);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.SetEquippedInTryOnManager);
local v15 = require(l_Modules_0.AvatarExperience.Common.Actions.SetSelectedTimedOption);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveUnselectedItemsFromTryOn);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local v18 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookItemsFromTryOn);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn);
local v20 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v21 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v22 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAdjustableTryOnIds);
local v23 = require(l_Modules_0.AvatarExperience.Common.Actions.AddSelectedBundleInfo);
local v24 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOutfitTryOns);
local v25 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v29 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLook);
local v30 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookFromTryOn);
local l_TryOnClassicHeadShape_0 = v5.Actions.TryOnClassicHeadShape;
local v32 = require(l_Modules_0.AvatarExperience.Common.Actions.NavigatedToNonTryOnPage);
local v33 = require(l_Modules_0.AvatarExperience.Common.Actions.NavigatedToTryOnPage);
local v34 = require(l_Modules_0.AvatarExperience.Common.Actions.DefaultTryOnBodyColorsToggled);
local l_findItemInTryOnItems_0 = v7.Utils.findItemInTryOnItems;
local l_getTryOnItemReducerKey_0 = v7.Utils.getTryOnItemReducerKey;
local l_getFilteredTryOnItems_0 = v8.Utils.TryOns.getFilteredTryOnItems;
local l_removeMakeupAssetsFromTryOnsIfOverLimit_0 = v8.Utils.TryOns.removeMakeupAssetsFromTryOnsIfOverLimit;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v7.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_LAYERED_MAKEUP_ORDER_0 = v7.Constants.LAYERED_MAKEUP_ORDER;
local l_MAKEUP_LOOK_ASSET_TYPES_0 = v7.Constants.MAKEUP_LOOK_ASSET_TYPES;
local l_LOOK_TYPE_0 = v7.Constants.LOOK_TYPE;
local l_CharacterHistoryStateChangeButtonActivated_0 = v7.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCatalogMakeupSupport_0 = v6.FFlagAXCatalogMakeupSupport;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesSupport_0 = v6.FFlagAXDurablesSupport;
local l_FFlagAXDurablesForMIS_0 = v6.FFlagAXDurablesForMIS;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v6.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v6.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagAXCustomizeMakeupSupport_0 = v6.FFlagAXCustomizeMakeupSupport;
local v54 = 0;
local function v68(v55, v56) --[[ Line: 141 ]] --[[ Name: formatItem ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v26 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v3 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), v54 (ref)
    local v57 = v55.receivedBundleInfo and true or false;
    local l_bundleInfo_0 = v55.bundleInfo;
    if l_FFlagAXMISEnableMultiShopping_0 and v55.bundleItems and not v57 then
        local v59 = {};
        for _, v61 in v55.bundleItems do
            if l_FFlagDynamicHeadsMigration_0 and v61.type == v26.ItemType.Asset then
                local v62 = v61.assetType or v55.itemSubType == v26.BundleTypeIdStrings.DynamicHead and v26.AssetTypeIdStrings.DynamicHead;
                if v62 then
                    local v63 = {
                        assetType = v62
                    };
                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v61.meta and v61.meta.headShape ~= nil then
                        v63.headShape = v61.meta.headShape;
                    end;
                    if l_FFlagHeadRefinementFacialAnimationToggle_0 and v61.meta and v61.meta.staticFacialAnimation ~= nil then
                        v63.staticFacialAnimation = v61.meta.staticFacialAnimation;
                    end;
                    v59[v61.id] = v63;
                end;
            elseif v61.type == v26.ItemType.Asset and v61.assetType then
                local v64 = {
                    assetType = v61.assetType
                };
                if l_FFlagParseHeadShapeFromAPIResponse_0 and v61.meta and v61.meta.headShape ~= nil then
                    v64.headShape = v61.meta.headShape;
                end;
                if l_FFlagHeadRefinementFacialAnimationToggle_0 and v61.meta and v61.meta.staticFacialAnimation ~= nil then
                    v64.staticFacialAnimation = v61.meta.staticFacialAnimation;
                end;
                v59[v61.id] = v64;
            end;
        end;
        l_bundleInfo_0 = v59;
        v57 = true;
    end;
    local v65 = {
        version = "1", 
        itemId = v55.itemId, 
        itemType = v55.itemType, 
        itemSubType = v55.itemSubType, 
        selectedInTryOnManager = v55.selectedInTryOnManager, 
        isUnequipped = v56, 
        receivedBundleInfo = v57, 
        bundleInfo = if l_FFlagAXMISEnableMultiShopping_0 then l_bundleInfo_0 else v55.bundleInfo, 
        widgetInfo = v55.widgetInfo, 
        isRecolorable = v55.isRecolorable, 
        selectedTimedOptionIndex = if l_FFlagAXDurablesForMIS_0 then v55.selectedTimedOptionIndex else nil
    };
    if v26.AssetTypeIdToAccessoryTypeEnum[v55.itemSubType] then
        local v66 = {
            order = v55.overrideOrder or v26.LayeredClothingOrder[v55.itemSubType], 
            isLayered = v26.LayeredAssetTypes[v55.itemSubType] ~= nil
        };
        v65 = v3.Dictionary.join(v65, v66);
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v55.itemSubType] then
        local v67 = {
            order = v55.overrideOrder or l_LAYERED_MAKEUP_ORDER_0[v55.itemSubType], 
            isLayered = true
        };
        v65 = v3.Dictionary.join(v65, v67);
    end;
    if not v56 then
        v65.itemRecency = v54;
        v54 = v54 + 1;
    end;
    return v65;
end;
local function v75(v69, v70, v71) --[[ Line: 244 ]] --[[ Name: formatItemFromLookOutfit ]]
    -- upvalues: v26 (copy), v3 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v54 (ref)
    local v72 = {
        version = "1", 
        itemId = v69.itemId, 
        itemType = v69.itemType, 
        itemSubType = v69.itemSubType, 
        selectedInTryOnManager = v69.isNotSelectable ~= true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        lookId = v71
    };
    if v26.AssetTypeIdToAccessoryTypeEnum[v69.itemSubType] then
        local v73 = {
            order = v69.order or v26.LayeredClothingOrder[v69.itemSubType], 
            isLayered = v26.LayeredAssetTypes[v69.itemSubType] ~= nil
        };
        v72 = v3.Dictionary.join(v72, v73);
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v69.itemSubType] then
        local v74 = {
            order = v69.order or l_LAYERED_MAKEUP_ORDER_0[v69.itemSubType], 
            isLayered = true
        };
        v72 = v3.Dictionary.join(v72, v74);
    end;
    v72.itemRecency = if not (v70 ~= v26.LookType.Avatar) or l_FFlagAXCatalogMakeupSupport_0 and v70 == v26.LookType.Makeup then v69.tryOnItemOrder else v54;
    v54 = v54 + 1;
    return v72;
end;
local function v82(v76, v77) --[[ Line: 283 ]] --[[ Name: formatBundleFromLookOutfit ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v26 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), v54 (ref)
    local v78 = {
        version = "1", 
        selectedInTryOnManager = v76.isNotSelectable ~= true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        itemType = v76.itemType, 
        itemId = v76.itemId, 
        itemSubType = if l_FFlagAXMISEnableMultiShopping_0 then v76.itemSubType else nil, 
        lookId = v77
    };
    local v79 = {};
    for _, v81 in v76.items do
        v79[v81.itemId] = {
            assetType = v81.itemSubType, 
            order = v26.LayeredClothingOrder[v81.itemSubType] or l_FFlagAXCustomizeMakeupSupport_0 and l_LAYERED_MAKEUP_ORDER_0[v81.itemSubType], 
            headShape = if l_FFlagParseHeadShapeFromAPIResponse_0 then v81.headShape else nil
        };
    end;
    v78.bundleInfo = v79;
    v78.itemRecency = v76.tryOnItemOrder or v54;
    v54 = v54 + 1;
    return v78;
end;
local function v90(v83, v84, v85) --[[ Line: 315 ]] --[[ Name: removeItem ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
    local v86 = l_getTryOnItemReducerKey_0(v85.itemId, v85.itemType);
    local v87 = v84[v86];
    v87.isUnequipped = true;
    local v88 = v85.itemSubType == v26.AssetTypeIdStrings.Face;
    local v89 = false;
    if v85.itemType == v26.ItemType.Bundle then
        v89 = v26.BundleTypeIdStringToNameForBackend[v85.itemSubType] == "Body";
    end;
    return v3.Dictionary.join(v83, {
        TryOnItems = v3.Dictionary.join(v84, {
            [v86] = v3.None
        }), 
        LastToggledItem = v87, 
        LastTryOnClassicHeadShape = if v88 then v3.None else nil, 
        BodyColor3s = if v89 then v3.None else nil, 
        BodyPartColorRangeIds = if v89 then v3.None else nil
    });
end;
local function _(v91) --[[ Line: 339 ]] --[[ Name: isAnimationOrEmoteItem ]]
    -- upvalues: v26 (copy)
    if v91.itemType == v26.ItemType.Asset and v91.itemSubType == v26.AssetTypeIdStrings.EmoteAnimation then
        return true;
    elseif v91.itemType == v26.ItemType.Bundle and v91.itemSubType == tostring(v26.BundleTypeIdStrings.Animations) then
        return true;
    else
        return false;
    end;
end;
local function v96(v93) --[[ Line: 353 ]] --[[ Name: getTryOnItemsContainsRecolorableBody ]]
    -- upvalues: v26 (copy)
    for _, v95 in v93 do
        if v95.itemType == "Bundle" and v26.BundleTypeIdStringToNameForBackend[v95.itemSubType] == "Body" and v95.isRecolorable then
            return true;
        end;
    end;
    return false;
end;
local function v102(v97) --[[ Line: 366 ]] --[[ Name: getTryOnItemsMakeupAndAvatarLookIds ]]
    -- upvalues: v3 (copy), l_MAKEUP_LOOK_ASSET_TYPES_0 (copy)
    local l_None_0 = v3.None;
    local l_None_1 = v3.None;
    for _, v101 in v97 do
        if v101.lookId and not l_MAKEUP_LOOK_ASSET_TYPES_0[v101.itemSubType] then
            l_None_0 = v101.lookId;
        end;
        if v101.lookId and l_MAKEUP_LOOK_ASSET_TYPES_0[v101.itemSubType] then
            l_None_1 = v101.lookId;
        end;
    end;
    return l_None_0, l_None_1;
end;
local function v116(v103) --[[ Line: 383 ]] --[[ Name: reconcileAllTryOnState ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v102 (copy), v96 (copy), v3 (copy), v10 (copy), l_LOOK_TYPE_0 (copy)
    local l_TryOnItems_0 = v103.TryOnItems;
    local v105 = nil;
    local v106 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v107, v108 = v102(l_TryOnItems_0);
        v105 = v107;
        v106 = v108;
    end;
    local v109 = v96(l_TryOnItems_0);
    if l_FFlagAXMISEnableMultiShopping_0 then
        v109 = v109 or v105 ~= nil;
    end;
    local v110 = if v109 then v103.BodyColor3s else v3.None;
    local v111 = if v109 then v103.BodyPartColorRangeIds else v3.None;
    local v112 = if v109 then v103.DefaultTryOnBodyColorsToggled else false;
    local v113 = if l_FFlagAXMISEnableMultiShopping_0 then v10.fieldCount(l_TryOnItems_0) == 0 else nil;
    local v114 = if l_FFlagAXMISEnableMultiShopping_0 then if v113 then v3.None else v103.LookType else nil;
    local v115 = if l_FFlagAXMISEnableMultiShopping_0 then if v113 then v3.None else l_LOOK_TYPE_0.Makeup else nil;
    return v3.Dictionary.join(v103, {
        BodyColor3s = v110, 
        BodyPartColorRangeIds = v111, 
        DefaultTryOnBodyColorsToggled = v112, 
        LookId = if l_FFlagAXMISEnableMultiShopping_0 then v105 else nil, 
        LookType = if l_FFlagAXMISEnableMultiShopping_0 then v114 else nil, 
        MakeupLookId = if l_FFlagAXMISEnableMultiShopping_0 then v106 else nil, 
        MakeupLookType = if l_FFlagAXMISEnableMultiShopping_0 then v115 else nil, 
        ShouldTryOnWithoutEquippedItems = if l_FFlagAXMISEnableMultiShopping_0 then not v113 and v103.ShouldTryOnWithoutEquippedItems else nil
    });
end;
local v117 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v4.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
local v118 = {
    TryOnItems = {}, 
    DefaultTryOnBodyColorsToggled = false, 
    LookId = nil, 
    LookType = nil, 
    MakeupLookId = nil, 
    MakeupLookType = nil, 
    LastTryOnClassicHeadShape = nil, 
    OutfitIdMap = {}, 
    AdjustableTryOnIds = if v117 then {} else nil, 
    ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
};
return v2.createReducer(v118, {
    [v13.name] = function(v119, v120) --[[ Line: 441 ]]
        -- upvalues: v118 (copy)
        local v121 = table.clone(v119 or v118);
        v121.BodyColor3s = v120.colors;
        v121.BodyPartColorRangeIds = v120.bodyPartColorRangeIds;
        return v121;
    end, 
    [v12.name] = function(v122, v123) --[[ Line: 448 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v116 (copy), v90 (copy), v27 (copy), v68 (copy), l_getFilteredTryOnItems_0 (copy), v26 (copy), v3 (copy), v96 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_removeMakeupAssetsFromTryOnsIfOverLimit_0 (copy)
        local v124 = v122 or v118;
        local v125 = v124.TryOnItems or {};
        local v126 = v124.LookId ~= nil;
        local v127 = l_getTryOnItemReducerKey_0(v123.itemId, v123.itemType);
        if if l_FFlagAXMISEnableMultiShopping_0 then v125[v127] ~= nil else v125[v127] ~= nil and not v126 then
            if l_FFlagAXMISEnableMultiShopping_0 then
                return v116(v90(v124, v125, v123));
            else
                return v90(v124, v125, v123);
            end;
        else
            if l_FFlagAXMISEnableMultiShopping_0 and v123.resetTryOnsBeforeToggleOn then
                v125 = {};
            end;
            local v128 = v27.filterTryOns(v125, v123);
            local v129 = v68(v123, false);
            if l_FFlagAXMISEnableMultiShopping_0 then
                v128 = l_getFilteredTryOnItems_0(v125, v129);
            end;
            local v130 = nil;
            if v129.itemType == v26.ItemType.Asset and v129.itemSubType == v26.AssetTypeIdStrings.EmoteAnimation or v129.itemType == v26.ItemType.Bundle and v129.itemSubType == tostring(v26.BundleTypeIdStrings.Animations) then
                v130 = v129;
            end;
            if not l_FFlagAXMISEnableMultiShopping_0 and v126 then
                return v3.Dictionary.join(v124, {
                    TryOnItems = {
                        [v123.itemId] = v129
                    }, 
                    LastToggledItem = v129, 
                    LastAnimOrEmoteToggledItem = v130, 
                    LookId = v3.None, 
                    BodyColor3s = {}, 
                    BodyPartColorRangeIds = v3.None, 
                    DefaultTryOnBodyColorsToggled = false
                });
            else
                local v131 = v3.Dictionary.join(v128, {
                    [v127] = v129
                });
                local v132 = v96(v131);
                local v133 = if v132 then v124.BodyColor3s else v3.None;
                local v134 = if v132 then v124.BodyPartColorRangeIds else v3.None;
                local v135 = if v132 then v124.DefaultTryOnBodyColorsToggled else false;
                local v136 = v3.Dictionary.join(v124, {
                    TryOnItems = v131, 
                    LastToggledItem = v129, 
                    LastAnimOrEmoteToggledItem = v130, 
                    BodyColor3s = v133, 
                    BodyPartColorRangeIds = v134, 
                    DefaultTryOnBodyColorsToggled = v135
                });
                if l_FFlagAXMISEnableMultiShopping_0 then
                    if l_FFlagAXCatalogMakeupSupport_0 then
                        v131 = l_removeMakeupAssetsFromTryOnsIfOverLimit_0(v131);
                    end;
                    v136 = v3.Dictionary.join(v136, {
                        TryOnItems = v131, 
                        LastToggledItem = v129, 
                        LastAnimOrEmoteToggledItem = v130
                    });
                    return v116(v136);
                else
                    return v136;
                end;
            end;
        end;
    end, 
    [l_TryOnClassicHeadShape_0.name] = function(v137, v138) --[[ Line: 547 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v137, {
            LastTryOnClassicHeadShape = if v138.headShape then v138.headShape else v3.None
        });
    end, 
    [v11.name] = function(v139, v140) --[[ Line: 553 ]]
        -- upvalues: v118 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_LOOK_TYPE_0 (copy), l_MAKEUP_LOOK_ASSET_TYPES_0 (copy), l_getTryOnItemReducerKey_0 (copy), v75 (copy), v82 (copy), v3 (copy)
        local v141 = v139 or v118;
        local v142 = {};
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then
            v142 = table.clone(v141.TryOnItems);
            if v140.lookType == l_LOOK_TYPE_0.Makeup then
                for v143, v144 in v142 do
                    if l_MAKEUP_LOOK_ASSET_TYPES_0[v144.itemSubType] then
                        v142[v143] = nil;
                    end;
                end;
            else
                for v145, v146 in v142 do
                    if not l_MAKEUP_LOOK_ASSET_TYPES_0[v146.itemSubType] then
                        v142[v145] = nil;
                    end;
                end;
            end;
        end;
        for _, v148 in v140.assetItemIdTypeAndSubtype do
            v142[l_getTryOnItemReducerKey_0(v148.itemId, v148.itemType)] = v75(v148, v140.lookType, if l_FFlagAXMISEnableMultiShopping_0 then v140.lookId else nil);
        end;
        if v140.bundleItemIdTypeAndSubtype ~= nil then
            for _, v150 in v140.bundleItemIdTypeAndSubtype do
                v142[l_getTryOnItemReducerKey_0(v150.itemId, v150.itemType)] = v82(v150, if l_FFlagAXMISEnableMultiShopping_0 then v140.lookId else nil);
            end;
        end;
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v140.lookType == l_LOOK_TYPE_0.Makeup then
            return v3.Dictionary.join(v141, {
                TryOnItems = v142, 
                MakeupLookId = if v140.lookId then v140.lookId else v3.None, 
                MakeupLookType = v140.lookType, 
                MakeupLookAnalyticsInfo = if v140.analyticsInfo then v140.analyticsInfo else v3.None, 
                ShouldTryOnWithoutEquippedItems = false
            });
        else
            return v3.Dictionary.join(v141, {
                TryOnItems = v142, 
                LookId = if v140.lookId then v140.lookId else v3.None, 
                LookAnalyticsInfo = if v140.analyticsInfo then v140.analyticsInfo else v3.None, 
                LookType = v140.lookType, 
                BodyColor3s = if v140.bodyColor3s then v140.bodyColor3s else v3.None, 
                BodyPartColorRangeIds = if v140.bodyPartColorRangeIds then v140.bodyPartColorRangeIds else v3.None, 
                DefaultTryOnBodyColorsToggled = v3.None, 
                Scale = if v140.scale then v140.scale else v3.None, 
                ShouldTryOnWithoutEquippedItems = if l_FFlagAXMISEnableMultiShopping_0 then v140.lookId ~= nil else nil
            });
        end;
    end, 
    [v14.name] = function(v151, v152) --[[ Line: 622 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v153 = v151 or v118;
        local v154 = v153.TryOnItems or {};
        local v155 = l_getTryOnItemReducerKey_0(v152.itemId, v152.itemType);
        if v154[v155] == nil then
            return v153;
        else
            return v3.Dictionary.join(v153, {
                TryOnItems = v3.Dictionary.join(v154, {
                    [v155] = v3.Dictionary.join(v154[v155], {
                        selectedInTryOnManager = v152.selectedInTryOnManager
                    })
                })
            });
        end;
    end, 
    [v15.name] = l_FFlagAXDurablesSupport_0 and function(v156, v157) --[[ Line: 641 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v158 = v156 or v118;
        local v159 = v158.TryOnItems or {};
        local v160 = l_getTryOnItemReducerKey_0(v157.itemId, v157.itemType);
        if v159[v160] == nil then
            return v158;
        else
            return v3.Dictionary.join(v158, {
                TryOnItems = v3.Dictionary.join(v159, {
                    [v160] = v3.Dictionary.join(v159[v160], {
                        selectedTimedOptionIndex = v157.selectedTimedOptionIndex
                    })
                })
            });
        end;
    end or nil, 
    [v16.name] = function(v161, _) --[[ Line: 660 ]]
        -- upvalues: v118 (copy), v3 (copy)
        local v163 = v161 or v118;
        local v164 = v163.TryOnItems or {};
        local v165 = {};
        for v166, v167 in v164 do
            if v167.selectedInTryOnManager then
                v165[v166] = v167;
            end;
        end;
        return v3.Dictionary.join(v163, {
            TryOnItems = v165
        });
    end, 
    [v30.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v168, v169) --[[ Line: 677 ]]
        -- upvalues: v118 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v3 (copy)
        local v170 = v168 or v118;
        local v171 = v170.TryOnItems or {};
        local v172 = {};
        for v173, v174 in v171 do
            if v174.lookId ~= v169.lookId then
                v172[v173] = v174;
            end;
        end;
        if l_FFlagAXCatalogMakeupSupport_0 and v170.MakeupLookId == v169.lookId then
            return v3.Dictionary.join(v170, {
                TryOnItems = v172, 
                MakeupLookId = v3.None, 
                MakeupLookType = v3.None, 
                MakeupLookAnalyticsInfo = v3.None
            });
        else
            return v3.Dictionary.join(v170, {
                TryOnItems = v172, 
                LookId = v3.None, 
                LookType = v3.None, 
                LookAnalyticsInfo = v3.None, 
                BodyColor3s = v3.None, 
                BodyPartColorRangeIds = v3.None, 
                Scale = v3.None, 
                ShouldTryOnWithoutEquippedItems = false
            });
        end;
    end or nil, 
    [v17.name] = function(v175, v176) --[[ Line: 709 ]]
        -- upvalues: v118 (copy), l_findItemInTryOnItems_0 (copy), v116 (copy), v90 (copy)
        local v177 = v175 or v118;
        local v178 = v177.TryOnItems or {};
        local v179 = nil;
        v179 = l_findItemInTryOnItems_0(v178, v176.itemId, v176.itemType);
        if v179 ~= nil then
            return v116(v90(v177, v178, v179));
        else
            return v177;
        end;
    end, 
    [v18.name] = function(v180, v181) --[[ Line: 722 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
        local v182 = v180 or v118;
        if v181.lookId == v182.LookId then
            local v183 = v182.TryOnItems or {};
            for _, v185 in v181.assetIds do
                local v186 = l_getTryOnItemReducerKey_0(v185, v26.ItemType.Asset);
                if v183[v186] ~= nil then
                    v183 = v3.Dictionary.join(v183, {
                        [v186] = v3.None
                    });
                end;
            end;
            if v181.bundleIds ~= nil then
                for _, v188 in v181.bundleIds do
                    local v189 = l_getTryOnItemReducerKey_0(v188, v26.ItemType.Bundle);
                    if v183[v189] ~= nil then
                        v183 = v3.Dictionary.join(v183, {
                            [v189] = v3.None
                        });
                    end;
                end;
            end;
            v182 = v3.Dictionary.join(v182, {
                TryOnItems = v183, 
                LookId = v3.None, 
                LookType = v3.None, 
                BodyColor3s = v3.None, 
                BodyPartColorRangeIds = v3.None, 
                Scale = v3.None, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
            });
        end;
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v181.lookId == v182.MakeupLookId then
            local v190 = v182.TryOnItems or {};
            for _, v192 in v181.assetIds do
                local v193 = l_getTryOnItemReducerKey_0(v192, v26.ItemType.Asset);
                if v190[v193] ~= nil then
                    v190 = v3.Dictionary.join(v190, {
                        [v193] = v3.None
                    });
                end;
            end;
            if v181.bundleIds ~= nil then
                for _, v195 in v181.bundleIds do
                    local v196 = l_getTryOnItemReducerKey_0(v195, v26.ItemType.Bundle);
                    if v190[v196] ~= nil then
                        v190 = v3.Dictionary.join(v190, {
                            [v196] = v3.None
                        });
                    end;
                end;
            end;
            v182 = v3.Dictionary.join(v182, {
                TryOnItems = v190, 
                MakeupLookId = v3.None, 
                MakeupLookType = v3.None, 
                ShouldTryOnWithoutEquippedItems = false
            });
        end;
        return v182;
    end, 
    [v19.name] = function(v197, v198) --[[ Line: 796 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v199 = v197 or v118;
        local v200 = v199.TryOnItems or {};
        local _ = nil;
        local v202 = nil;
        v202 = l_getTryOnItemReducerKey_0(v198.itemId, v26.ItemType.Bundle);
        if v200[v202] then
            local v203 = table.clone(v199.OutfitIdMap or {});
            v203[v198.itemId] = v198.outfitId;
            local l_v202_0 = v202;
            return v3.Dictionary.join(v199, {
                TryOnItems = v3.Dictionary.join(v200, {
                    [l_v202_0] = v3.Dictionary.join(v200[l_v202_0], {
                        receivedBundleInfo = true
                    })
                }), 
                OutfitIdMap = v203
            });
        else
            return v199;
        end;
    end, 
    [v20.name] = function(v205, v206) --[[ Line: 825 ]]
        -- upvalues: v3 (copy), v118 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
        if v205 then
            local v207 = not v205.LookId and v206.retainTryOnColor;
            return v3.Dictionary.join(v118, {
                LastTryOnClassicHeadShape = v205.LastTryOnClassicHeadShape, 
                DefaultTryOnBodyColorsToggled = if v207 then v205.DefaultTryOnBodyColorsToggled else nil, 
                BodyColor3s = if v207 then v205.BodyColor3s else nil, 
                BodyPartColorRangeIds = if v207 then v205.BodyPartColorRangeIds else nil, 
                OutfitIdMap = if v205 then v205.OutfitIdMap else {}, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
            });
        else
            return v118;
        end;
    end, 
    [v32.name] = function(v208, _) --[[ Line: 844 ]]
        -- upvalues: v118 (copy)
        local v210 = table.clone(v118);
        if v208 and v208.OutfitIdMap then
            v210.OutfitIdMap = v208.OutfitIdMap;
        end;
        return v210;
    end, 
    [v33.name] = function(v211, _) --[[ Line: 852 ]]
        -- upvalues: v118 (copy)
        local v213 = table.clone(v118);
        if v211 and v211.OutfitIdMap then
            v213.OutfitIdMap = v211.OutfitIdMap;
        end;
        return v213;
    end, 
    [v34.name] = function(v214, v215) --[[ Line: 860 ]]
        -- upvalues: v118 (copy)
        local v216 = table.clone(v214 or v118);
        v216.DefaultTryOnBodyColorsToggled = v215.state;
        return v216;
    end, 
    [v21.name] = function(v217, v218) --[[ Line: 867 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local l_itemIdToOrderMap_0 = v218.itemIdToOrderMap;
        local v220 = v217 or v118;
        for v221, v222 in l_itemIdToOrderMap_0 do
            local v223 = v220.TryOnItems or {};
            local v224 = l_getTryOnItemReducerKey_0(v221, v26.ItemType.Asset);
            if v223[v224] and v223[v224].itemType ~= v26.ItemType.Bundle then
                v220 = v3.Dictionary.join(v220, {
                    TryOnItems = v3.Dictionary.join(v223, {
                        [v224] = v3.Dictionary.join(v223[v224], {
                            order = v222
                        })
                    })
                });
            elseif not v223[v224] then
                for v225, v226 in v223 do
                    if v226.bundleInfo and v226.bundleInfo[v221] and v226.itemId ~= tostring(v26.BlockyBundleId) then
                        local l_bundleInfo_1 = v226.bundleInfo;
                        local v228 = v3.Dictionary.join(l_bundleInfo_1, {
                            [v221] = v3.Dictionary.join(l_bundleInfo_1[v221], {
                                order = v222
                            })
                        });
                        v220 = v3.Dictionary.join(v217, {
                            TryOnItems = v3.Dictionary.join(v223, {
                                [v225] = v3.Dictionary.join(v223[v225], {
                                    bundleInfo = v228
                                })
                            })
                        });
                        break;
                    end;
                end;
            end;
        end;
        return v220;
    end, 
    [v25.name] = function(v229, v230) --[[ Line: 926 ]]
        -- upvalues: v118 (copy), v3 (copy)
        local v231 = v229 or v118;
        local v232 = v231.TryOnItems or {};
        for v233, v234 in v232 do
            if v234.itemType == "Asset" then
                if v234.itemId == v230.itemId then
                    return v3.Dictionary.join(v231, {
                        TryOnItems = v3.Dictionary.join(v232, {
                            [v233] = v3.Dictionary.join(v234, {
                                position = v230.position, 
                                rotation = v230.rotation, 
                                scale = v230.scale
                            })
                        })
                    });
                end;
            elseif v234.itemType == "Bundle" then
                for v235, v236 in v232 do
                    if v236.bundleInfo and v236.bundleInfo[v230.itemId] then
                        local l_bundleInfo_2 = v236.bundleInfo;
                        local v238 = v3.Dictionary.join(l_bundleInfo_2, {
                            [v230.itemId] = v3.Dictionary.join(l_bundleInfo_2[v230.itemId], {
                                position = v230.position, 
                                rotation = v230.rotation, 
                                scale = v230.scale
                            })
                        });
                        return v3.Dictionary.join(v229, {
                            TryOnItems = v3.Dictionary.join(v232, {
                                [v235] = v3.Dictionary.join(v232[v235], {
                                    bundleInfo = v238
                                })
                            })
                        });
                    end;
                end;
            end;
        end;
        return v231;
    end, 
    [v23.name] = function(v239, v240) --[[ Line: 971 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v241 = v239 or v118;
        local v242 = v241.TryOnItems or {};
        local v243 = l_getTryOnItemReducerKey_0(v240.bundleId, v26.ItemType.Bundle);
        if v242[v243] then
            return v3.Dictionary.join(v241, {
                TryOnItems = v3.Dictionary.join(v242, {
                    [v243] = v3.Dictionary.join(v242[v243], {
                        bundleInfo = v240.bundleInfo
                    })
                })
            });
        else
            return v241;
        end;
    end, 
    [v24.name] = function(_, v245) --[[ Line: 990 ]]
        return v245.outfitTryOns;
    end, 
    [v29.name] = function(v246, v247) --[[ Line: 994 ]]
        -- upvalues: v118 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v3 (copy)
        local v248 = v246 or v118;
        if v247.lookId == v248.LookId or l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v247.lookId == v248.MakeupLookId then
            local v249 = {};
            if l_FFlagAXMISEnableMultiShopping_0 then
                local v250 = v248.TryOnItems or {};
                for v251, v252 in v250 do
                    if v252.lookId ~= v247.lookId then
                        v249[v251] = v252;
                    end;
                end;
            end;
            if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then
                if v247.lookId == v248.LookId then
                    v248 = v3.Dictionary.join(v248, {
                        TryOnItems = v249, 
                        LookId = v3.None, 
                        LookType = v3.None, 
                        BodyColor3s = v3.None, 
                        BodyPartColorRangeIds = v3.None, 
                        Scale = v3.None, 
                        ShouldTryOnWithoutEquippedItems = false
                    });
                end;
                if v247.lookId == v248.MakeupLookId then
                    return (v3.Dictionary.join(v248, {
                        TryOnItems = v249, 
                        MakeupLookId = v3.None, 
                        MakeupLookType = v3.None, 
                        ShouldTryOnWithoutEquippedItems = false
                    }));
                end;
            else
                v248 = v3.Dictionary.join(v248, {
                    TryOnItems = v249, 
                    LookId = v3.None, 
                    LookType = v3.None, 
                    BodyColor3s = v3.None, 
                    BodyPartColorRangeIds = v3.None, 
                    Scale = v3.None, 
                    ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
                });
            end;
        end;
        return v248;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v253, v254) --[[ Line: 1053 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v254.tryOn and v254.tryOn.OutfitTryOn then
            return table.clone(v254.tryOn.OutfitTryOn);
        else
            return v253;
        end;
    end, 
    [v22.name] = v117 and function(v255, v256) --[[ Line: 1064 ]]
        -- upvalues: v118 (copy)
        local v257 = table.clone(v255 or v118);
        v257.AdjustableTryOnIds = v256.adjustableTryOnIds;
        return v257;
    end or nil
});