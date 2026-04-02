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
local l_FFlagAXDurablesSupport_0 = v6.FFlagAXDurablesSupport;
local l_FFlagAXDurablesForMIS_0 = v6.FFlagAXDurablesForMIS;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v6.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v6.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagAXCustomizeMakeupSupport_0 = v6.FFlagAXCustomizeMakeupSupport;
local v55 = 0;
local function v69(v56, v57) --[[ Line: 143 ]] --[[ Name: formatItem ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v26 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v3 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), v55 (ref)
    local v58 = v56.receivedBundleInfo and true or false;
    local l_bundleInfo_0 = v56.bundleInfo;
    if l_FFlagAXMISEnableMultiShopping_0 and v56.bundleItems and not v58 then
        local v60 = {};
        for _, v62 in v56.bundleItems do
            if l_FFlagDynamicHeadsMigration_0 and v62.type == v26.ItemType.Asset then
                local v63 = v62.assetType or v56.itemSubType == v26.BundleTypeIdStrings.DynamicHead and v26.AssetTypeIdStrings.DynamicHead;
                if v63 then
                    local v64 = {
                        assetType = v63
                    };
                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v62.meta and v62.meta.headShape ~= nil then
                        v64.headShape = v62.meta.headShape;
                    end;
                    if l_FFlagHeadRefinementFacialAnimationToggle_0 and v62.meta and v62.meta.staticFacialAnimation ~= nil then
                        v64.staticFacialAnimation = v62.meta.staticFacialAnimation;
                    end;
                    v60[v62.id] = v64;
                end;
            elseif v62.type == v26.ItemType.Asset and v62.assetType then
                local v65 = {
                    assetType = v62.assetType
                };
                if l_FFlagParseHeadShapeFromAPIResponse_0 and v62.meta and v62.meta.headShape ~= nil then
                    v65.headShape = v62.meta.headShape;
                end;
                if l_FFlagHeadRefinementFacialAnimationToggle_0 and v62.meta and v62.meta.staticFacialAnimation ~= nil then
                    v65.staticFacialAnimation = v62.meta.staticFacialAnimation;
                end;
                v60[v62.id] = v65;
            end;
        end;
        l_bundleInfo_0 = v60;
        v58 = true;
    end;
    local v66 = {
        version = "1", 
        itemId = v56.itemId, 
        itemType = v56.itemType, 
        itemSubType = v56.itemSubType, 
        selectedInTryOnManager = v56.selectedInTryOnManager, 
        isUnequipped = v57, 
        receivedBundleInfo = v58, 
        bundleInfo = if l_FFlagAXMISEnableMultiShopping_0 then l_bundleInfo_0 else v56.bundleInfo, 
        widgetInfo = v56.widgetInfo, 
        isRecolorable = v56.isRecolorable, 
        selectedTimedOptionIndex = if l_FFlagAXDurablesForMIS_0 then v56.selectedTimedOptionIndex else nil
    };
    if v26.AssetTypeIdToAccessoryTypeEnum[v56.itemSubType] then
        local v67 = {
            order = v56.overrideOrder or v26.LayeredClothingOrder[v56.itemSubType], 
            isLayered = v26.LayeredAssetTypes[v56.itemSubType] ~= nil
        };
        v66 = v3.Dictionary.join(v66, v67);
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v56.itemSubType] then
        local v68 = {
            order = v56.overrideOrder or l_LAYERED_MAKEUP_ORDER_0[v56.itemSubType], 
            isLayered = true
        };
        v66 = v3.Dictionary.join(v66, v68);
    end;
    if not v57 then
        v66.itemRecency = v55;
        v55 = v55 + 1;
    end;
    return v66;
end;
local function v76(v70, v71, v72) --[[ Line: 246 ]] --[[ Name: formatItemFromLookOutfit ]]
    -- upvalues: v26 (copy), v3 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v55 (ref)
    local v73 = {
        version = "1", 
        itemId = v70.itemId, 
        itemType = v70.itemType, 
        itemSubType = v70.itemSubType, 
        selectedInTryOnManager = v70.isNotSelectable ~= true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        lookId = v72
    };
    if v26.AssetTypeIdToAccessoryTypeEnum[v70.itemSubType] then
        local v74 = {
            order = v70.order or v26.LayeredClothingOrder[v70.itemSubType], 
            isLayered = v26.LayeredAssetTypes[v70.itemSubType] ~= nil
        };
        v73 = v3.Dictionary.join(v73, v74);
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v70.itemSubType] then
        local v75 = {
            order = v70.order or l_LAYERED_MAKEUP_ORDER_0[v70.itemSubType], 
            isLayered = true
        };
        v73 = v3.Dictionary.join(v73, v75);
    end;
    v73.itemRecency = if not (v71 ~= v26.LookType.Avatar) or l_FFlagAXCatalogMakeupSupport_0 and v71 == v26.LookType.Makeup then v70.tryOnItemOrder else v55;
    v55 = v55 + 1;
    return v73;
end;
local function v83(v77, v78) --[[ Line: 285 ]] --[[ Name: formatBundleFromLookOutfit ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v26 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), v55 (ref)
    local v79 = {
        version = "1", 
        selectedInTryOnManager = v77.isNotSelectable ~= true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        itemType = v77.itemType, 
        itemId = v77.itemId, 
        itemSubType = if l_FFlagAXMISEnableMultiShopping_0 then v77.itemSubType else nil, 
        lookId = v78
    };
    local v80 = {};
    for _, v82 in v77.items do
        v80[v82.itemId] = {
            assetType = v82.itemSubType, 
            order = v26.LayeredClothingOrder[v82.itemSubType] or l_FFlagAXCustomizeMakeupSupport_0 and l_LAYERED_MAKEUP_ORDER_0[v82.itemSubType], 
            headShape = if l_FFlagParseHeadShapeFromAPIResponse_0 then v82.headShape else nil
        };
    end;
    v79.bundleInfo = v80;
    v79.itemRecency = v77.tryOnItemOrder or v55;
    v55 = v55 + 1;
    return v79;
end;
local function v91(v84, v85, v86) --[[ Line: 317 ]] --[[ Name: removeItem ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
    local v87 = l_getTryOnItemReducerKey_0(v86.itemId, v86.itemType);
    local v88 = v85[v87];
    v88.isUnequipped = true;
    local v89 = v86.itemSubType == v26.AssetTypeIdStrings.Face;
    local v90 = false;
    if v86.itemType == v26.ItemType.Bundle then
        v90 = v26.BundleTypeIdStringToNameForBackend[v86.itemSubType] == "Body";
    end;
    return v3.Dictionary.join(v84, {
        TryOnItems = v3.Dictionary.join(v85, {
            [v87] = v3.None
        }), 
        LastToggledItem = v88, 
        LastTryOnClassicHeadShape = if v89 then v3.None else nil, 
        BodyColor3s = if v90 then v3.None else nil, 
        BodyPartColorRangeIds = if v90 then v3.None else nil
    });
end;
local function _(v92) --[[ Line: 341 ]] --[[ Name: isAnimationOrEmoteItem ]]
    -- upvalues: v26 (copy)
    if v92.itemType == v26.ItemType.Asset and v92.itemSubType == v26.AssetTypeIdStrings.EmoteAnimation then
        return true;
    elseif v92.itemType == v26.ItemType.Bundle and v92.itemSubType == tostring(v26.BundleTypeIdStrings.Animations) then
        return true;
    else
        return false;
    end;
end;
local function v97(v94) --[[ Line: 355 ]] --[[ Name: getTryOnItemsContainsRecolorableBody ]]
    -- upvalues: v26 (copy)
    for _, v96 in v94 do
        if v96.itemType == "Bundle" and v26.BundleTypeIdStringToNameForBackend[v96.itemSubType] == "Body" and v96.isRecolorable then
            return true;
        end;
    end;
    return false;
end;
local function v103(v98) --[[ Line: 368 ]] --[[ Name: getTryOnItemsMakeupAndAvatarLookIds ]]
    -- upvalues: v3 (copy), l_MAKEUP_LOOK_ASSET_TYPES_0 (copy)
    local l_None_0 = v3.None;
    local l_None_1 = v3.None;
    for _, v102 in v98 do
        if v102.lookId and not l_MAKEUP_LOOK_ASSET_TYPES_0[v102.itemSubType] then
            l_None_0 = v102.lookId;
        end;
        if v102.lookId and l_MAKEUP_LOOK_ASSET_TYPES_0[v102.itemSubType] then
            l_None_1 = v102.lookId;
        end;
    end;
    return l_None_0, l_None_1;
end;
local function v117(v104) --[[ Line: 385 ]] --[[ Name: reconcileAllTryOnState ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v103 (copy), v97 (copy), v3 (copy), v10 (copy), l_LOOK_TYPE_0 (copy)
    local l_TryOnItems_0 = v104.TryOnItems;
    local v106 = nil;
    local v107 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v108, v109 = v103(l_TryOnItems_0);
        v106 = v108;
        v107 = v109;
    end;
    local v110 = v97(l_TryOnItems_0);
    if l_FFlagAXMISEnableMultiShopping_0 then
        v110 = v110 or v106 ~= nil;
    end;
    local v111 = if v110 then v104.BodyColor3s else v3.None;
    local v112 = if v110 then v104.BodyPartColorRangeIds else v3.None;
    local v113 = if v110 then v104.DefaultTryOnBodyColorsToggled else false;
    local v114 = if l_FFlagAXMISEnableMultiShopping_0 then v10.fieldCount(l_TryOnItems_0) == 0 else nil;
    local v115 = if l_FFlagAXMISEnableMultiShopping_0 then if v114 then v3.None else v104.LookType else nil;
    local v116 = if l_FFlagAXMISEnableMultiShopping_0 then if not v114 and v107 then l_LOOK_TYPE_0.Makeup else v3.None else nil;
    return v3.Dictionary.join(v104, {
        BodyColor3s = v111, 
        BodyPartColorRangeIds = v112, 
        DefaultTryOnBodyColorsToggled = v113, 
        LookId = if l_FFlagAXMISEnableMultiShopping_0 then v106 else nil, 
        LookType = if l_FFlagAXMISEnableMultiShopping_0 then v115 else nil, 
        MakeupLookId = if l_FFlagAXMISEnableMultiShopping_0 then v107 else nil, 
        MakeupLookType = if l_FFlagAXMISEnableMultiShopping_0 then v116 else nil, 
        ShouldTryOnWithoutEquippedItems = if l_FFlagAXMISEnableMultiShopping_0 then not v114 and v104.ShouldTryOnWithoutEquippedItems else nil
    });
end;
local v118 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v4.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
local v119 = {
    TryOnItems = {}, 
    DefaultTryOnBodyColorsToggled = false, 
    LookId = nil, 
    LookType = nil, 
    MakeupLookId = nil, 
    MakeupLookType = nil, 
    LastToggledLookType = nil, 
    LastTryOnClassicHeadShape = nil, 
    OutfitIdMap = {}, 
    AdjustableTryOnIds = if v118 then {} else nil, 
    ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
};
return v2.createReducer(v119, {
    [v13.name] = function(v120, v121) --[[ Line: 444 ]]
        -- upvalues: v119 (copy)
        local v122 = table.clone(v120 or v119);
        v122.BodyColor3s = v121.colors;
        v122.BodyPartColorRangeIds = v121.bodyPartColorRangeIds;
        return v122;
    end, 
    [v12.name] = function(v123, v124) --[[ Line: 451 ]]
        -- upvalues: v119 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v117 (copy), v91 (copy), v27 (copy), v69 (copy), l_getFilteredTryOnItems_0 (copy), v26 (copy), v3 (copy), v97 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_removeMakeupAssetsFromTryOnsIfOverLimit_0 (copy)
        local v125 = v123 or v119;
        local v126 = v125.TryOnItems or {};
        local v127 = v125.LookId ~= nil;
        local v128 = l_getTryOnItemReducerKey_0(v124.itemId, v124.itemType);
        if if l_FFlagAXMISEnableMultiShopping_0 then v126[v128] ~= nil else v126[v128] ~= nil and not v127 then
            if l_FFlagAXMISEnableMultiShopping_0 then
                return v117(v91(v125, v126, v124));
            else
                return v91(v125, v126, v124);
            end;
        else
            if l_FFlagAXMISEnableMultiShopping_0 and v124.resetTryOnsBeforeToggleOn then
                v126 = {};
            end;
            local v129 = v27.filterTryOns(v126, v124);
            local v130 = v69(v124, false);
            if l_FFlagAXMISEnableMultiShopping_0 then
                v129 = l_getFilteredTryOnItems_0(v126, v130);
            end;
            local v131 = nil;
            if v130.itemType == v26.ItemType.Asset and v130.itemSubType == v26.AssetTypeIdStrings.EmoteAnimation or v130.itemType == v26.ItemType.Bundle and v130.itemSubType == tostring(v26.BundleTypeIdStrings.Animations) then
                v131 = v130;
            end;
            if not l_FFlagAXMISEnableMultiShopping_0 and v127 then
                return v3.Dictionary.join(v125, {
                    TryOnItems = {
                        [v124.itemId] = v130
                    }, 
                    LastToggledItem = v130, 
                    LastAnimOrEmoteToggledItem = v131, 
                    LookId = v3.None, 
                    BodyColor3s = {}, 
                    BodyPartColorRangeIds = v3.None, 
                    DefaultTryOnBodyColorsToggled = false
                });
            else
                local v132 = v3.Dictionary.join(v129, {
                    [v128] = v130
                });
                local v133 = v97(v132);
                local v134 = if v133 then v125.BodyColor3s else v3.None;
                local v135 = if v133 then v125.BodyPartColorRangeIds else v3.None;
                local v136 = if v133 then v125.DefaultTryOnBodyColorsToggled else false;
                local v137 = v3.Dictionary.join(v125, {
                    TryOnItems = v132, 
                    LastToggledItem = v130, 
                    LastAnimOrEmoteToggledItem = v131, 
                    BodyColor3s = v134, 
                    BodyPartColorRangeIds = v135, 
                    DefaultTryOnBodyColorsToggled = v136
                });
                if l_FFlagAXMISEnableMultiShopping_0 then
                    if l_FFlagAXCatalogMakeupSupport_0 then
                        v132 = l_removeMakeupAssetsFromTryOnsIfOverLimit_0(v132);
                    end;
                    v137 = v3.Dictionary.join(v137, {
                        TryOnItems = v132, 
                        LastToggledItem = v130, 
                        LastAnimOrEmoteToggledItem = v131
                    });
                    return v117(v137);
                else
                    return v137;
                end;
            end;
        end;
    end, 
    [l_TryOnClassicHeadShape_0.name] = function(v138, v139) --[[ Line: 550 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v138, {
            LastTryOnClassicHeadShape = if v139.headShape then v139.headShape else v3.None
        });
    end, 
    [v11.name] = function(v140, v141) --[[ Line: 556 ]]
        -- upvalues: v119 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_LOOK_TYPE_0 (copy), l_MAKEUP_LOOK_ASSET_TYPES_0 (copy), l_getTryOnItemReducerKey_0 (copy), v76 (copy), v83 (copy), v3 (copy)
        local v142 = v140 or v119;
        local v143 = {};
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then
            v143 = table.clone(v142.TryOnItems);
            if v141.lookType == l_LOOK_TYPE_0.Makeup then
                for v144, v145 in v143 do
                    if l_MAKEUP_LOOK_ASSET_TYPES_0[v145.itemSubType] then
                        v143[v144] = nil;
                    end;
                end;
            else
                for v146, v147 in v143 do
                    if not l_MAKEUP_LOOK_ASSET_TYPES_0[v147.itemSubType] then
                        v143[v146] = nil;
                    end;
                end;
            end;
        end;
        for _, v149 in v141.assetItemIdTypeAndSubtype do
            v143[l_getTryOnItemReducerKey_0(v149.itemId, v149.itemType)] = v76(v149, v141.lookType, if l_FFlagAXMISEnableMultiShopping_0 then v141.lookId else nil);
        end;
        if v141.bundleItemIdTypeAndSubtype ~= nil then
            for _, v151 in v141.bundleItemIdTypeAndSubtype do
                v143[l_getTryOnItemReducerKey_0(v151.itemId, v151.itemType)] = v83(v151, if l_FFlagAXMISEnableMultiShopping_0 then v141.lookId else nil);
            end;
        end;
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v141.lookType == l_LOOK_TYPE_0.Makeup then
            return v3.Dictionary.join(v142, {
                TryOnItems = v143, 
                MakeupLookId = if v141.lookId then v141.lookId else v3.None, 
                MakeupLookType = v141.lookType, 
                LastToggledLookType = v141.lookType, 
                MakeupLookAnalyticsInfo = if v141.analyticsInfo then v141.analyticsInfo else v3.None, 
                ShouldTryOnWithoutEquippedItems = false
            });
        else
            return v3.Dictionary.join(v142, {
                TryOnItems = v143, 
                LookId = if v141.lookId then v141.lookId else v3.None, 
                LookAnalyticsInfo = if v141.analyticsInfo then v141.analyticsInfo else v3.None, 
                LookType = v141.lookType, 
                LastToggledLookType = if l_FFlagAXMISEnableMultiShopping_0 then v141.lookType else nil, 
                BodyColor3s = if v141.bodyColor3s then v141.bodyColor3s else v3.None, 
                BodyPartColorRangeIds = if v141.bodyPartColorRangeIds then v141.bodyPartColorRangeIds else v3.None, 
                DefaultTryOnBodyColorsToggled = v3.None, 
                Scale = if v141.scale then v141.scale else v3.None, 
                ShouldTryOnWithoutEquippedItems = if l_FFlagAXMISEnableMultiShopping_0 then v141.lookId ~= nil else nil
            });
        end;
    end, 
    [v14.name] = function(v152, v153) --[[ Line: 627 ]]
        -- upvalues: v119 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v154 = v152 or v119;
        local v155 = v154.TryOnItems or {};
        local v156 = l_getTryOnItemReducerKey_0(v153.itemId, v153.itemType);
        if v155[v156] == nil then
            return v154;
        else
            return v3.Dictionary.join(v154, {
                TryOnItems = v3.Dictionary.join(v155, {
                    [v156] = v3.Dictionary.join(v155[v156], {
                        selectedInTryOnManager = v153.selectedInTryOnManager
                    })
                })
            });
        end;
    end, 
    [v15.name] = l_FFlagAXDurablesSupport_0 and function(v157, v158) --[[ Line: 646 ]]
        -- upvalues: v119 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v159 = v157 or v119;
        local v160 = v159.TryOnItems or {};
        local v161 = l_getTryOnItemReducerKey_0(v158.itemId, v158.itemType);
        if v160[v161] == nil then
            return v159;
        else
            return v3.Dictionary.join(v159, {
                TryOnItems = v3.Dictionary.join(v160, {
                    [v161] = v3.Dictionary.join(v160[v161], {
                        selectedTimedOptionIndex = v158.selectedTimedOptionIndex
                    })
                })
            });
        end;
    end or nil, 
    [v16.name] = function(v162, _) --[[ Line: 665 ]]
        -- upvalues: v119 (copy), v3 (copy)
        local v164 = v162 or v119;
        local v165 = v164.TryOnItems or {};
        local v166 = {};
        for v167, v168 in v165 do
            if v168.selectedInTryOnManager then
                v166[v167] = v168;
            end;
        end;
        return v3.Dictionary.join(v164, {
            TryOnItems = v166
        });
    end, 
    [v30.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v169, v170) --[[ Line: 682 ]]
        -- upvalues: v119 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v3 (copy)
        local v171 = v169 or v119;
        local v172 = v171.TryOnItems or {};
        local v173 = {};
        for v174, v175 in v172 do
            if v175.lookId ~= v170.lookId then
                v173[v174] = v175;
            end;
        end;
        if l_FFlagAXCatalogMakeupSupport_0 and v171.MakeupLookId == v170.lookId then
            return v3.Dictionary.join(v171, {
                TryOnItems = v173, 
                MakeupLookId = v3.None, 
                MakeupLookType = v3.None, 
                MakeupLookAnalyticsInfo = v3.None, 
                LastToggledLookType = v3.None
            });
        else
            return v3.Dictionary.join(v171, {
                TryOnItems = v173, 
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
    [v17.name] = function(v176, v177) --[[ Line: 716 ]]
        -- upvalues: v119 (copy), l_findItemInTryOnItems_0 (copy), v117 (copy), v91 (copy)
        local v178 = v176 or v119;
        local v179 = v178.TryOnItems or {};
        local v180 = nil;
        v180 = l_findItemInTryOnItems_0(v179, v177.itemId, v177.itemType);
        if v180 ~= nil then
            return v117(v91(v178, v179, v180));
        else
            return v178;
        end;
    end, 
    [v18.name] = function(v181, v182) --[[ Line: 729 ]]
        -- upvalues: v119 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
        local v183 = v181 or v119;
        if v182.lookId == v183.LookId then
            local v184 = v183.TryOnItems or {};
            for _, v186 in v182.assetIds do
                local v187 = l_getTryOnItemReducerKey_0(v186, v26.ItemType.Asset);
                if v184[v187] ~= nil then
                    v184 = v3.Dictionary.join(v184, {
                        [v187] = v3.None
                    });
                end;
            end;
            if v182.bundleIds ~= nil then
                for _, v189 in v182.bundleIds do
                    local v190 = l_getTryOnItemReducerKey_0(v189, v26.ItemType.Bundle);
                    if v184[v190] ~= nil then
                        v184 = v3.Dictionary.join(v184, {
                            [v190] = v3.None
                        });
                    end;
                end;
            end;
            v183 = v3.Dictionary.join(v183, {
                TryOnItems = v184, 
                LookId = v3.None, 
                LookType = v3.None, 
                BodyColor3s = v3.None, 
                BodyPartColorRangeIds = v3.None, 
                Scale = v3.None, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
            });
        end;
        if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v182.lookId == v183.MakeupLookId then
            local v191 = v183.TryOnItems or {};
            for _, v193 in v182.assetIds do
                local v194 = l_getTryOnItemReducerKey_0(v193, v26.ItemType.Asset);
                if v191[v194] ~= nil then
                    v191 = v3.Dictionary.join(v191, {
                        [v194] = v3.None
                    });
                end;
            end;
            if v182.bundleIds ~= nil then
                for _, v196 in v182.bundleIds do
                    local v197 = l_getTryOnItemReducerKey_0(v196, v26.ItemType.Bundle);
                    if v191[v197] ~= nil then
                        v191 = v3.Dictionary.join(v191, {
                            [v197] = v3.None
                        });
                    end;
                end;
            end;
            v183 = v3.Dictionary.join(v183, {
                TryOnItems = v191, 
                MakeupLookId = v3.None, 
                MakeupLookType = v3.None, 
                ShouldTryOnWithoutEquippedItems = false
            });
        end;
        return v183;
    end, 
    [v19.name] = function(v198, v199) --[[ Line: 803 ]]
        -- upvalues: v119 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v200 = v198 or v119;
        local v201 = v200.TryOnItems or {};
        local _ = nil;
        local v203 = nil;
        v203 = l_getTryOnItemReducerKey_0(v199.itemId, v26.ItemType.Bundle);
        if v201[v203] then
            local v204 = table.clone(v200.OutfitIdMap or {});
            v204[v199.itemId] = v199.outfitId;
            local l_v203_0 = v203;
            return v3.Dictionary.join(v200, {
                TryOnItems = v3.Dictionary.join(v201, {
                    [l_v203_0] = v3.Dictionary.join(v201[l_v203_0], {
                        receivedBundleInfo = true
                    })
                }), 
                OutfitIdMap = v204
            });
        else
            return v200;
        end;
    end, 
    [v20.name] = function(v206, v207) --[[ Line: 832 ]]
        -- upvalues: v3 (copy), v119 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
        if v206 then
            local v208 = not v206.LookId and v207.retainTryOnColor;
            return v3.Dictionary.join(v119, {
                LastTryOnClassicHeadShape = v206.LastTryOnClassicHeadShape, 
                DefaultTryOnBodyColorsToggled = if v208 then v206.DefaultTryOnBodyColorsToggled else nil, 
                BodyColor3s = if v208 then v206.BodyColor3s else nil, 
                BodyPartColorRangeIds = if v208 then v206.BodyPartColorRangeIds else nil, 
                OutfitIdMap = if v206 then v206.OutfitIdMap else {}, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil, 
                LastToggledLookType = if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then v3.None else nil
            });
        else
            return v119;
        end;
    end, 
    [v32.name] = function(v209, _) --[[ Line: 854 ]]
        -- upvalues: v119 (copy)
        local v211 = table.clone(v119);
        if v209 and v209.OutfitIdMap then
            v211.OutfitIdMap = v209.OutfitIdMap;
        end;
        return v211;
    end, 
    [v33.name] = function(v212, _) --[[ Line: 862 ]]
        -- upvalues: v119 (copy)
        local v214 = table.clone(v119);
        if v212 and v212.OutfitIdMap then
            v214.OutfitIdMap = v212.OutfitIdMap;
        end;
        return v214;
    end, 
    [v34.name] = function(v215, v216) --[[ Line: 870 ]]
        -- upvalues: v119 (copy)
        local v217 = table.clone(v215 or v119);
        v217.DefaultTryOnBodyColorsToggled = v216.state;
        return v217;
    end, 
    [v21.name] = function(v218, v219) --[[ Line: 877 ]]
        -- upvalues: v119 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local l_itemIdToOrderMap_0 = v219.itemIdToOrderMap;
        local v221 = v218 or v119;
        for v222, v223 in l_itemIdToOrderMap_0 do
            local v224 = v221.TryOnItems or {};
            local v225 = l_getTryOnItemReducerKey_0(v222, v26.ItemType.Asset);
            if v224[v225] and v224[v225].itemType ~= v26.ItemType.Bundle then
                v221 = v3.Dictionary.join(v221, {
                    TryOnItems = v3.Dictionary.join(v224, {
                        [v225] = v3.Dictionary.join(v224[v225], {
                            order = v223
                        })
                    })
                });
            elseif not v224[v225] then
                for v226, v227 in v224 do
                    if v227.bundleInfo and v227.bundleInfo[v222] and v227.itemId ~= tostring(v26.BlockyBundleId) then
                        local l_bundleInfo_1 = v227.bundleInfo;
                        local v229 = v3.Dictionary.join(l_bundleInfo_1, {
                            [v222] = v3.Dictionary.join(l_bundleInfo_1[v222], {
                                order = v223
                            })
                        });
                        v221 = v3.Dictionary.join(v218, {
                            TryOnItems = v3.Dictionary.join(v224, {
                                [v226] = v3.Dictionary.join(v224[v226], {
                                    bundleInfo = v229
                                })
                            })
                        });
                        break;
                    end;
                end;
            end;
        end;
        return v221;
    end, 
    [v25.name] = function(v230, v231) --[[ Line: 936 ]]
        -- upvalues: v119 (copy), v3 (copy)
        local v232 = v230 or v119;
        local v233 = v232.TryOnItems or {};
        for v234, v235 in v233 do
            if v235.itemType == "Asset" then
                if v235.itemId == v231.itemId then
                    return v3.Dictionary.join(v232, {
                        TryOnItems = v3.Dictionary.join(v233, {
                            [v234] = v3.Dictionary.join(v235, {
                                position = v231.position, 
                                rotation = v231.rotation, 
                                scale = v231.scale
                            })
                        })
                    });
                end;
            elseif v235.itemType == "Bundle" then
                for v236, v237 in v233 do
                    if v237.bundleInfo and v237.bundleInfo[v231.itemId] then
                        local l_bundleInfo_2 = v237.bundleInfo;
                        local v239 = v3.Dictionary.join(l_bundleInfo_2, {
                            [v231.itemId] = v3.Dictionary.join(l_bundleInfo_2[v231.itemId], {
                                position = v231.position, 
                                rotation = v231.rotation, 
                                scale = v231.scale
                            })
                        });
                        return v3.Dictionary.join(v230, {
                            TryOnItems = v3.Dictionary.join(v233, {
                                [v236] = v3.Dictionary.join(v233[v236], {
                                    bundleInfo = v239
                                })
                            })
                        });
                    end;
                end;
            end;
        end;
        return v232;
    end, 
    [v23.name] = function(v240, v241) --[[ Line: 981 ]]
        -- upvalues: v119 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v242 = v240 or v119;
        local v243 = v242.TryOnItems or {};
        local v244 = l_getTryOnItemReducerKey_0(v241.bundleId, v26.ItemType.Bundle);
        if v243[v244] then
            return v3.Dictionary.join(v242, {
                TryOnItems = v3.Dictionary.join(v243, {
                    [v244] = v3.Dictionary.join(v243[v244], {
                        bundleInfo = v241.bundleInfo
                    })
                })
            });
        else
            return v242;
        end;
    end, 
    [v24.name] = function(_, v246) --[[ Line: 1000 ]]
        return v246.outfitTryOns;
    end, 
    [v29.name] = function(v247, v248) --[[ Line: 1004 ]]
        -- upvalues: v119 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v3 (copy)
        local v249 = v247 or v119;
        if v248.lookId == v249.LookId or l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and v248.lookId == v249.MakeupLookId then
            local v250 = {};
            if l_FFlagAXMISEnableMultiShopping_0 then
                local v251 = v249.TryOnItems or {};
                for v252, v253 in v251 do
                    if v253.lookId ~= v248.lookId then
                        v250[v252] = v253;
                    end;
                end;
            end;
            if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then
                if v248.lookId == v249.LookId then
                    v249 = v3.Dictionary.join(v249, {
                        TryOnItems = v250, 
                        LookId = v3.None, 
                        LookType = v3.None, 
                        BodyColor3s = v3.None, 
                        BodyPartColorRangeIds = v3.None, 
                        Scale = v3.None, 
                        ShouldTryOnWithoutEquippedItems = false, 
                        LastToggledLookType = v3.None
                    });
                end;
                if v248.lookId == v249.MakeupLookId then
                    return (v3.Dictionary.join(v249, {
                        TryOnItems = v250, 
                        MakeupLookId = v3.None, 
                        MakeupLookType = v3.None, 
                        ShouldTryOnWithoutEquippedItems = false, 
                        LastToggledLookType = v3.None
                    }));
                end;
            else
                v249 = v3.Dictionary.join(v249, {
                    TryOnItems = v250, 
                    LookId = v3.None, 
                    LookType = v3.None, 
                    BodyColor3s = v3.None, 
                    BodyPartColorRangeIds = v3.None, 
                    Scale = v3.None, 
                    ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
                });
            end;
        end;
        return v249;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v254, v255) --[[ Line: 1065 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v255.tryOn and v255.tryOn.OutfitTryOn then
            return table.clone(v255.tryOn.OutfitTryOn);
        else
            return v254;
        end;
    end, 
    [v22.name] = v118 and function(v256, v257) --[[ Line: 1076 ]]
        -- upvalues: v119 (copy)
        local v258 = table.clone(v256 or v119);
        v258.AdjustableTryOnIds = v257.adjustableTryOnIds;
        return v258;
    end or nil, 
    [l_SetLastToggledLookType_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v259, v260) --[[ Line: 1083 ]]
        -- upvalues: v119 (copy), v3 (copy)
        local v261 = v259 or v119;
        return v3.Dictionary.join(v261, {
            LastToggledLookType = v260.lastToggledLookType
        });
    end or nil
});