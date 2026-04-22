local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
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
local l_ReducerUtils_0 = v9.Utils.ReducerUtils;
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
local l_SetLastToggledLookType_0 = v8.State.Actions.SetLastToggledLookType;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v7.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_LAYERED_MAKEUP_ORDER_0 = v7.Constants.LAYERED_MAKEUP_ORDER;
local l_MAKEUP_LOOK_ASSET_TYPES_0 = v7.Constants.MAKEUP_LOOK_ASSET_TYPES;
local l_LOOK_TYPE_0 = v7.Constants.LOOK_TYPE;
local l_CharacterHistoryStateChangeButtonActivated_0 = v7.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCatalogMakeupSupport_0 = v6.FFlagAXCatalogMakeupSupport;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesForMIS_0 = v6.FFlagAXDurablesForMIS;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v6.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v6.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagAXCustomizeMakeupSupport_0 = v6.FFlagAXCustomizeMakeupSupport;
local v54 = 0;
local function v68(v55, v56) --[[ Line: 142 ]] --[[ Name: formatItem ]]
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
local function v75(v69, v70, v71) --[[ Line: 245 ]] --[[ Name: formatItemFromLookOutfit ]]
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
local function v82(v76, v77) --[[ Line: 284 ]] --[[ Name: formatBundleFromLookOutfit ]]
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
local function v90(v83, v84, v85) --[[ Line: 316 ]] --[[ Name: removeItem ]]
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
local function _(v91) --[[ Line: 340 ]] --[[ Name: isAnimationOrEmoteItem ]]
    -- upvalues: v26 (copy)
    if v91.itemType == v26.ItemType.Asset and v91.itemSubType == v26.AssetTypeIdStrings.EmoteAnimation then
        return true;
    elseif v91.itemType == v26.ItemType.Bundle and v91.itemSubType == tostring(v26.BundleTypeIdStrings.Animations) then
        return true;
    else
        return false;
    end;
end;
local function v96(v93) --[[ Line: 354 ]] --[[ Name: getTryOnItemsContainsRecolorableBody ]]
    -- upvalues: v26 (copy)
    for _, v95 in v93 do
        if v95.itemType == "Bundle" and v26.BundleTypeIdStringToNameForBackend[v95.itemSubType] == "Body" and v95.isRecolorable then
            return true;
        end;
    end;
    return false;
end;
local function v102(v97) --[[ Line: 367 ]] --[[ Name: getTryOnItemsMakeupAndAvatarLookIds ]]
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
local function v116(v103) --[[ Line: 384 ]] --[[ Name: reconcileAllTryOnState ]]
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
    local v115 = if l_FFlagAXMISEnableMultiShopping_0 then if not v113 and v106 then l_LOOK_TYPE_0.Makeup else v3.None else nil;
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
    LastToggledLookType = nil, 
    LastTryOnClassicHeadShape = nil, 
    OutfitIdMap = {}, 
    AdjustableTryOnIds = if v117 then {} else nil, 
    ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
};
return v2.createReducer(v118, {
    [v13.name] = function(v119, v120) --[[ Line: 443 ]]
        -- upvalues: v118 (copy)
        local v121 = table.clone(v119 or v118);
        v121.BodyColor3s = v120.colors;
        v121.BodyPartColorRangeIds = v120.bodyPartColorRangeIds;
        return v121;
    end, 
    [v12.name] = function(v122, v123) --[[ Line: 450 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v116 (copy), v90 (copy), l_ReducerUtils_0 (copy), v68 (copy), l_getFilteredTryOnItems_0 (copy), v26 (copy), v3 (copy), v96 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_removeMakeupAssetsFromTryOnsIfOverLimit_0 (copy)
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
            local v128 = l_ReducerUtils_0.filterTryOns(v125, v123);
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
    [l_TryOnClassicHeadShape_0.name] = function(v137, v138) --[[ Line: 549 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v137, {
            LastTryOnClassicHeadShape = if v138.headShape then v138.headShape else v3.None
        });
    end, 
    [v11.name] = function(v139, v140) --[[ Line: 555 ]]
        -- upvalues: v118 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_LOOK_TYPE_0 (copy), l_MAKEUP_LOOK_ASSET_TYPES_0 (copy), l_getTryOnItemReducerKey_0 (copy), v75 (copy), v82 (copy), v3 (copy)
        local v141 = v139 or v118;
        local v142 = {};
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v140.lookType == l_LOOK_TYPE_0.Makeup then
            v142 = table.clone(v141.TryOnItems);
            for v143, v144 in v142 do
                if l_MAKEUP_LOOK_ASSET_TYPES_0[v144.itemSubType] then
                    v142[v143] = nil;
                end;
            end;
        end;
        for _, v146 in v140.assetItemIdTypeAndSubtype do
            v142[l_getTryOnItemReducerKey_0(v146.itemId, v146.itemType)] = v75(v146, v140.lookType, if l_FFlagAXMISEnableMultiShopping_0 then v140.lookId else nil);
        end;
        if v140.bundleItemIdTypeAndSubtype ~= nil then
            for _, v148 in v140.bundleItemIdTypeAndSubtype do
                v142[l_getTryOnItemReducerKey_0(v148.itemId, v148.itemType)] = v82(v148, if l_FFlagAXMISEnableMultiShopping_0 then v140.lookId else nil);
            end;
        end;
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v140.lookType == l_LOOK_TYPE_0.Makeup then
            return v3.Dictionary.join(v141, {
                TryOnItems = v142, 
                MakeupLookId = if v140.lookId then v140.lookId else v3.None, 
                MakeupLookType = v140.lookType, 
                LastToggledLookType = v140.lookType, 
                MakeupLookAnalyticsInfo = if v140.analyticsInfo then v140.analyticsInfo else v3.None
            });
        else
            return v3.Dictionary.join(v141, {
                TryOnItems = v142, 
                LookId = if v140.lookId then v140.lookId else v3.None, 
                LookAnalyticsInfo = if v140.analyticsInfo then v140.analyticsInfo else v3.None, 
                LookType = v140.lookType, 
                MakeupLookId = v3.None, 
                MakeupLookType = v3.None, 
                MakeupLookAnalyticsInfo = v3.None, 
                LastToggledLookType = if l_FFlagAXMISEnableMultiShopping_0 then v140.lookType else nil, 
                BodyColor3s = if v140.bodyColor3s then v140.bodyColor3s else v3.None, 
                BodyPartColorRangeIds = if v140.bodyPartColorRangeIds then v140.bodyPartColorRangeIds else v3.None, 
                DefaultTryOnBodyColorsToggled = v3.None, 
                Scale = if v140.scale then v140.scale else v3.None, 
                ShouldTryOnWithoutEquippedItems = if l_FFlagAXMISEnableMultiShopping_0 then v140.lookId ~= nil else nil
            });
        end;
    end, 
    [v14.name] = function(v149, v150) --[[ Line: 622 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v151 = v149 or v118;
        local v152 = v151.TryOnItems or {};
        local v153 = l_getTryOnItemReducerKey_0(v150.itemId, v150.itemType);
        if v152[v153] == nil then
            return v151;
        else
            return v3.Dictionary.join(v151, {
                TryOnItems = v3.Dictionary.join(v152, {
                    [v153] = v3.Dictionary.join(v152[v153], {
                        selectedInTryOnManager = v150.selectedInTryOnManager
                    })
                })
            });
        end;
    end, 
    [v15.name] = function(v154, v155) --[[ Line: 640 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v156 = v154 or v118;
        local v157 = v156.TryOnItems or {};
        local v158 = l_getTryOnItemReducerKey_0(v155.itemId, v155.itemType);
        if v157[v158] == nil then
            return v156;
        else
            return v3.Dictionary.join(v156, {
                TryOnItems = v3.Dictionary.join(v157, {
                    [v158] = v3.Dictionary.join(v157[v158], {
                        selectedTimedOptionIndex = v155.selectedTimedOptionIndex
                    })
                })
            });
        end;
    end, 
    [v16.name] = function(v159, _) --[[ Line: 658 ]]
        -- upvalues: v118 (copy), v3 (copy)
        local v161 = v159 or v118;
        local v162 = v161.TryOnItems or {};
        local v163 = {};
        for v164, v165 in v162 do
            if v165.selectedInTryOnManager then
                v163[v164] = v165;
            end;
        end;
        return v3.Dictionary.join(v161, {
            TryOnItems = v163
        });
    end, 
    [v30.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v166, v167) --[[ Line: 675 ]]
        -- upvalues: v118 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v3 (copy)
        local v168 = v166 or v118;
        local v169 = v168.TryOnItems or {};
        local v170 = {};
        for v171, v172 in v169 do
            if v172.lookId ~= v167.lookId then
                v170[v171] = v172;
            end;
        end;
        if l_FFlagAXCatalogMakeupSupport_0 and v168.MakeupLookId == v167.lookId then
            return v3.Dictionary.join(v168, {
                TryOnItems = v170, 
                MakeupLookId = v3.None, 
                MakeupLookType = v3.None, 
                MakeupLookAnalyticsInfo = v3.None, 
                LastToggledLookType = v3.None
            });
        else
            return v3.Dictionary.join(v168, {
                TryOnItems = v170, 
                LookId = v3.None, 
                LookType = v3.None, 
                LookAnalyticsInfo = v3.None, 
                BodyColor3s = v3.None, 
                BodyPartColorRangeIds = v3.None, 
                Scale = v3.None, 
                LastToggledLookType = v3.None, 
                ShouldTryOnWithoutEquippedItems = false
            });
        end;
    end or nil, 
    [v17.name] = function(v173, v174) --[[ Line: 709 ]]
        -- upvalues: v118 (copy), l_findItemInTryOnItems_0 (copy), v116 (copy), v90 (copy)
        local v175 = v173 or v118;
        local v176 = v175.TryOnItems or {};
        local v177 = nil;
        v177 = l_findItemInTryOnItems_0(v176, v174.itemId, v174.itemType);
        if v177 ~= nil then
            return v116(v90(v175, v176, v177));
        else
            return v175;
        end;
    end, 
    [v18.name] = function(v178, v179) --[[ Line: 722 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
        local v180 = v178 or v118;
        if v179.lookId == v180.LookId then
            local v181 = v180.TryOnItems or {};
            for _, v183 in v179.assetIds do
                local v184 = l_getTryOnItemReducerKey_0(v183, v26.ItemType.Asset);
                if v181[v184] ~= nil then
                    v181 = v3.Dictionary.join(v181, {
                        [v184] = v3.None
                    });
                end;
            end;
            if v179.bundleIds ~= nil then
                for _, v186 in v179.bundleIds do
                    local v187 = l_getTryOnItemReducerKey_0(v186, v26.ItemType.Bundle);
                    if v181[v187] ~= nil then
                        v181 = v3.Dictionary.join(v181, {
                            [v187] = v3.None
                        });
                    end;
                end;
            end;
            v180 = v3.Dictionary.join(v180, {
                TryOnItems = v181, 
                LookId = v3.None, 
                LookType = v3.None, 
                BodyColor3s = v3.None, 
                BodyPartColorRangeIds = v3.None, 
                Scale = v3.None, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
            });
        end;
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v179.lookId == v180.MakeupLookId then
            local v188 = v180.TryOnItems or {};
            for _, v190 in v179.assetIds do
                local v191 = l_getTryOnItemReducerKey_0(v190, v26.ItemType.Asset);
                if v188[v191] ~= nil then
                    v188 = v3.Dictionary.join(v188, {
                        [v191] = v3.None
                    });
                end;
            end;
            if v179.bundleIds ~= nil then
                for _, v193 in v179.bundleIds do
                    local v194 = l_getTryOnItemReducerKey_0(v193, v26.ItemType.Bundle);
                    if v188[v194] ~= nil then
                        v188 = v3.Dictionary.join(v188, {
                            [v194] = v3.None
                        });
                    end;
                end;
            end;
            v180 = v3.Dictionary.join(v180, {
                TryOnItems = v188, 
                MakeupLookId = v3.None, 
                MakeupLookType = v3.None
            });
        end;
        return v180;
    end, 
    [v19.name] = function(v195, v196) --[[ Line: 795 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v197 = v195 or v118;
        local v198 = v197.TryOnItems or {};
        local _ = nil;
        local v200 = nil;
        v200 = l_getTryOnItemReducerKey_0(v196.itemId, v26.ItemType.Bundle);
        if v198[v200] then
            local v201 = table.clone(v197.OutfitIdMap or {});
            v201[v196.itemId] = v196.outfitId;
            local l_v200_0 = v200;
            return v3.Dictionary.join(v197, {
                TryOnItems = v3.Dictionary.join(v198, {
                    [l_v200_0] = v3.Dictionary.join(v198[l_v200_0], {
                        receivedBundleInfo = true
                    })
                }), 
                OutfitIdMap = v201
            });
        else
            return v197;
        end;
    end, 
    [v20.name] = function(v203, v204) --[[ Line: 824 ]]
        -- upvalues: v3 (copy), v118 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
        if v203 then
            local v205 = not v203.LookId and v204.retainTryOnColor;
            return v3.Dictionary.join(v118, {
                LastTryOnClassicHeadShape = v203.LastTryOnClassicHeadShape, 
                DefaultTryOnBodyColorsToggled = if v205 then v203.DefaultTryOnBodyColorsToggled else nil, 
                BodyColor3s = if v205 then v203.BodyColor3s else nil, 
                BodyPartColorRangeIds = if v205 then v203.BodyPartColorRangeIds else nil, 
                OutfitIdMap = if v203 then v203.OutfitIdMap else {}, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil, 
                LastToggledLookType = if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then v3.None else nil
            });
        else
            return v118;
        end;
    end, 
    [v32.name] = function(v206, _) --[[ Line: 846 ]]
        -- upvalues: v118 (copy)
        local v208 = table.clone(v118);
        if v206 and v206.OutfitIdMap then
            v208.OutfitIdMap = v206.OutfitIdMap;
        end;
        return v208;
    end, 
    [v33.name] = function(v209, _) --[[ Line: 854 ]]
        -- upvalues: v118 (copy)
        local v211 = table.clone(v118);
        if v209 and v209.OutfitIdMap then
            v211.OutfitIdMap = v209.OutfitIdMap;
        end;
        return v211;
    end, 
    [v34.name] = function(v212, v213) --[[ Line: 862 ]]
        -- upvalues: v118 (copy)
        local v214 = table.clone(v212 or v118);
        v214.DefaultTryOnBodyColorsToggled = v213.state;
        return v214;
    end, 
    [v21.name] = function(v215, v216) --[[ Line: 869 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local l_itemIdToOrderMap_0 = v216.itemIdToOrderMap;
        local v218 = v215 or v118;
        for v219, v220 in l_itemIdToOrderMap_0 do
            local v221 = v218.TryOnItems or {};
            local v222 = l_getTryOnItemReducerKey_0(v219, v26.ItemType.Asset);
            if v221[v222] and v221[v222].itemType ~= v26.ItemType.Bundle then
                v218 = v3.Dictionary.join(v218, {
                    TryOnItems = v3.Dictionary.join(v221, {
                        [v222] = v3.Dictionary.join(v221[v222], {
                            order = v220
                        })
                    })
                });
            elseif not v221[v222] then
                for v223, v224 in v221 do
                    if v224.bundleInfo and v224.bundleInfo[v219] and v224.itemId ~= tostring(v26.BlockyBundleId) then
                        local l_bundleInfo_1 = v224.bundleInfo;
                        local v226 = v3.Dictionary.join(l_bundleInfo_1, {
                            [v219] = v3.Dictionary.join(l_bundleInfo_1[v219], {
                                order = v220
                            })
                        });
                        v218 = v3.Dictionary.join(v215, {
                            TryOnItems = v3.Dictionary.join(v221, {
                                [v223] = v3.Dictionary.join(v221[v223], {
                                    bundleInfo = v226
                                })
                            })
                        });
                        break;
                    end;
                end;
            end;
        end;
        return v218;
    end, 
    [v25.name] = function(v227, v228) --[[ Line: 928 ]]
        -- upvalues: v118 (copy), v3 (copy)
        local v229 = v227 or v118;
        local v230 = v229.TryOnItems or {};
        for v231, v232 in v230 do
            if v232.itemType == "Asset" then
                if v232.itemId == v228.itemId then
                    return v3.Dictionary.join(v229, {
                        TryOnItems = v3.Dictionary.join(v230, {
                            [v231] = v3.Dictionary.join(v232, {
                                position = v228.position, 
                                rotation = v228.rotation, 
                                scale = v228.scale
                            })
                        })
                    });
                end;
            elseif v232.itemType == "Bundle" then
                for v233, v234 in v230 do
                    if v234.bundleInfo and v234.bundleInfo[v228.itemId] then
                        local l_bundleInfo_2 = v234.bundleInfo;
                        local v236 = v3.Dictionary.join(l_bundleInfo_2, {
                            [v228.itemId] = v3.Dictionary.join(l_bundleInfo_2[v228.itemId], {
                                position = v228.position, 
                                rotation = v228.rotation, 
                                scale = v228.scale
                            })
                        });
                        return v3.Dictionary.join(v227, {
                            TryOnItems = v3.Dictionary.join(v230, {
                                [v233] = v3.Dictionary.join(v230[v233], {
                                    bundleInfo = v236
                                })
                            })
                        });
                    end;
                end;
            end;
        end;
        return v229;
    end, 
    [v23.name] = function(v237, v238) --[[ Line: 973 ]]
        -- upvalues: v118 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v239 = v237 or v118;
        local v240 = v239.TryOnItems or {};
        local v241 = l_getTryOnItemReducerKey_0(v238.bundleId, v26.ItemType.Bundle);
        if v240[v241] then
            return v3.Dictionary.join(v239, {
                TryOnItems = v3.Dictionary.join(v240, {
                    [v241] = v3.Dictionary.join(v240[v241], {
                        bundleInfo = v238.bundleInfo
                    })
                })
            });
        else
            return v239;
        end;
    end, 
    [v24.name] = function(_, v243) --[[ Line: 992 ]]
        return v243.outfitTryOns;
    end, 
    [v29.name] = function(v244, v245) --[[ Line: 996 ]]
        -- upvalues: v118 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v3 (copy)
        local v246 = v244 or v118;
        if v245.lookId == v246.LookId or l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v245.lookId == v246.MakeupLookId then
            local v247 = {};
            if l_FFlagAXMISEnableMultiShopping_0 then
                local v248 = v246.TryOnItems or {};
                for v249, v250 in v248 do
                    if v250.lookId ~= v245.lookId then
                        v247[v249] = v250;
                    end;
                end;
            end;
            if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then
                if v245.lookId == v246.LookId then
                    v246 = v3.Dictionary.join(v246, {
                        TryOnItems = v247, 
                        LookId = v3.None, 
                        LookType = v3.None, 
                        BodyColor3s = v3.None, 
                        BodyPartColorRangeIds = v3.None, 
                        Scale = v3.None, 
                        ShouldTryOnWithoutEquippedItems = false, 
                        LastToggledLookType = v3.None
                    });
                end;
                if v245.lookId == v246.MakeupLookId then
                    return (v3.Dictionary.join(v246, {
                        TryOnItems = v247, 
                        MakeupLookId = v3.None, 
                        MakeupLookType = v3.None, 
                        LastToggledLookType = v3.None
                    }));
                end;
            else
                v246 = v3.Dictionary.join(v246, {
                    TryOnItems = v247, 
                    LookId = v3.None, 
                    LookType = v3.None, 
                    BodyColor3s = v3.None, 
                    BodyPartColorRangeIds = v3.None, 
                    Scale = v3.None, 
                    ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
                });
            end;
        end;
        return v246;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v251, v252) --[[ Line: 1056 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v252.tryOn and v252.tryOn.OutfitTryOn then
            return table.clone(v252.tryOn.OutfitTryOn);
        else
            return v251;
        end;
    end, 
    [v22.name] = v117 and function(v253, v254) --[[ Line: 1067 ]]
        -- upvalues: v118 (copy)
        local v255 = table.clone(v253 or v118);
        v255.AdjustableTryOnIds = v254.adjustableTryOnIds;
        return v255;
    end or nil, 
    [l_SetLastToggledLookType_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v256, v257) --[[ Line: 1074 ]]
        -- upvalues: v118 (copy), v3 (copy)
        local v258 = v256 or v118;
        return v3.Dictionary.join(v258, {
            LastToggledLookType = v257.lastToggledLookType
        });
    end or nil
});