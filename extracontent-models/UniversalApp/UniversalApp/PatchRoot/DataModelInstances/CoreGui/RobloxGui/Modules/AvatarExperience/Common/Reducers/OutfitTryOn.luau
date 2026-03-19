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
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v7.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_LAYERED_MAKEUP_ORDER_0 = v7.Constants.LAYERED_MAKEUP_ORDER;
local l_CharacterHistoryStateChangeButtonActivated_0 = v7.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCatalogMakeupSupport_0 = v6.FFlagAXCatalogMakeupSupport;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesSupport_0 = v6.FFlagAXDurablesSupport;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v6.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v6.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagAXCustomizeMakeupSupport_0 = v6.FFlagAXCustomizeMakeupSupport;
local v50 = 0;
local function v64(v51, v52) --[[ Line: 133 ]] --[[ Name: formatItem ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v26 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v3 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), v50 (ref)
    local v53 = v51.receivedBundleInfo and true or false;
    local l_bundleInfo_0 = v51.bundleInfo;
    if l_FFlagAXMISEnableMultiShopping_0 and v51.bundleItems and not v53 then
        local v55 = {};
        for _, v57 in v51.bundleItems do
            if l_FFlagDynamicHeadsMigration_0 and v57.type == v26.ItemType.Asset then
                local v58 = v57.assetType or v51.itemSubType == v26.BundleTypeIdStrings.DynamicHead and v26.AssetTypeIdStrings.DynamicHead;
                if v58 then
                    local v59 = {
                        assetType = v58
                    };
                    if l_FFlagParseHeadShapeFromAPIResponse_0 and v57.meta and v57.meta.headShape ~= nil then
                        v59.headShape = v57.meta.headShape;
                    end;
                    if l_FFlagHeadRefinementFacialAnimationToggle_0 and v57.meta and v57.meta.staticFacialAnimation ~= nil then
                        v59.staticFacialAnimation = v57.meta.staticFacialAnimation;
                    end;
                    v55[v57.id] = v59;
                end;
            elseif v57.type == v26.ItemType.Asset and v57.assetType then
                local v60 = {
                    assetType = v57.assetType
                };
                if l_FFlagParseHeadShapeFromAPIResponse_0 and v57.meta and v57.meta.headShape ~= nil then
                    v60.headShape = v57.meta.headShape;
                end;
                if l_FFlagHeadRefinementFacialAnimationToggle_0 and v57.meta and v57.meta.staticFacialAnimation ~= nil then
                    v60.staticFacialAnimation = v57.meta.staticFacialAnimation;
                end;
                v55[v57.id] = v60;
            end;
        end;
        l_bundleInfo_0 = v55;
        v53 = true;
    end;
    local v61 = {
        version = "1", 
        itemId = v51.itemId, 
        itemType = v51.itemType, 
        itemSubType = v51.itemSubType, 
        selectedInTryOnManager = v51.selectedInTryOnManager, 
        isUnequipped = v52, 
        receivedBundleInfo = v53, 
        bundleInfo = if l_FFlagAXMISEnableMultiShopping_0 then l_bundleInfo_0 else v51.bundleInfo, 
        widgetInfo = v51.widgetInfo, 
        isRecolorable = v51.isRecolorable
    };
    if v26.AssetTypeIdToAccessoryTypeEnum[v51.itemSubType] then
        local v62 = {
            order = v51.overrideOrder or v26.LayeredClothingOrder[v51.itemSubType], 
            isLayered = v26.LayeredAssetTypes[v51.itemSubType] ~= nil
        };
        v61 = v3.Dictionary.join(v61, v62);
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v51.itemSubType] then
        local v63 = {
            order = v51.overrideOrder or l_LAYERED_MAKEUP_ORDER_0[v51.itemSubType], 
            isLayered = true
        };
        v61 = v3.Dictionary.join(v61, v63);
    end;
    if not v52 then
        v61.itemRecency = v50;
        v50 = v50 + 1;
    end;
    return v61;
end;
local function v71(v65, v66, v67) --[[ Line: 235 ]] --[[ Name: formatItemFromLookOutfit ]]
    -- upvalues: v26 (copy), v3 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v50 (ref)
    local v68 = {
        version = "1", 
        itemId = v65.itemId, 
        itemType = v65.itemType, 
        itemSubType = v65.itemSubType, 
        selectedInTryOnManager = v65.isNotSelectable ~= true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        lookId = v67
    };
    if v26.AssetTypeIdToAccessoryTypeEnum[v65.itemSubType] then
        local v69 = {
            order = v65.order or v26.LayeredClothingOrder[v65.itemSubType], 
            isLayered = v26.LayeredAssetTypes[v65.itemSubType] ~= nil
        };
        v68 = v3.Dictionary.join(v68, v69);
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v65.itemSubType] then
        local v70 = {
            order = v65.order or l_LAYERED_MAKEUP_ORDER_0[v65.itemSubType], 
            isLayered = true
        };
        v68 = v3.Dictionary.join(v68, v70);
    end;
    v68.itemRecency = if not (v66 ~= v26.LookType.Avatar) or l_FFlagAXCatalogMakeupSupport_0 and v66 == v26.LookType.Makeup then v65.tryOnItemOrder else v50;
    v50 = v50 + 1;
    return v68;
end;
local function v78(v72, v73) --[[ Line: 274 ]] --[[ Name: formatBundleFromLookOutfit ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v26 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), v50 (ref)
    local v74 = {
        version = "1", 
        selectedInTryOnManager = v72.isNotSelectable ~= true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        itemType = v72.itemType, 
        itemId = v72.itemId, 
        itemSubType = if l_FFlagAXMISEnableMultiShopping_0 then v72.itemSubType else nil, 
        lookId = v73
    };
    local v75 = {};
    for _, v77 in v72.items do
        v75[v77.itemId] = {
            assetType = v77.itemSubType, 
            order = v26.LayeredClothingOrder[v77.itemSubType] or l_FFlagAXCustomizeMakeupSupport_0 and l_LAYERED_MAKEUP_ORDER_0[v77.itemSubType], 
            headShape = if l_FFlagParseHeadShapeFromAPIResponse_0 then v77.headShape else nil
        };
    end;
    v74.bundleInfo = v75;
    v74.itemRecency = v72.tryOnItemOrder or v50;
    v50 = v50 + 1;
    return v74;
end;
local function v86(v79, v80, v81) --[[ Line: 306 ]] --[[ Name: removeItem ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
    local v82 = l_getTryOnItemReducerKey_0(v81.itemId, v81.itemType);
    local v83 = v80[v82];
    v83.isUnequipped = true;
    local v84 = v81.itemSubType == v26.AssetTypeIdStrings.Face;
    local v85 = false;
    if v81.itemType == v26.ItemType.Bundle then
        v85 = v26.BundleTypeIdStringToNameForBackend[v81.itemSubType] == "Body";
    end;
    return v3.Dictionary.join(v79, {
        TryOnItems = v3.Dictionary.join(v80, {
            [v82] = v3.None
        }), 
        LastToggledItem = v83, 
        LastTryOnClassicHeadShape = if v84 then v3.None else nil, 
        BodyColor3s = if v85 then v3.None else nil, 
        BodyPartColorRangeIds = if v85 then v3.None else nil
    });
end;
local function _(v87) --[[ Line: 330 ]] --[[ Name: isAnimationOrEmoteItem ]]
    -- upvalues: v26 (copy)
    if v87.itemType == v26.ItemType.Asset and v87.itemSubType == v26.AssetTypeIdStrings.EmoteAnimation then
        return true;
    elseif v87.itemType == v26.ItemType.Bundle and v87.itemSubType == tostring(v26.BundleTypeIdStrings.Animations) then
        return true;
    else
        return false;
    end;
end;
local function v92(v89) --[[ Line: 344 ]] --[[ Name: getTryOnItemsContainsRecolorableBody ]]
    -- upvalues: v26 (copy)
    for _, v91 in v89 do
        if v91.itemType == "Bundle" and v26.BundleTypeIdStringToNameForBackend[v91.itemSubType] == "Body" and v91.isRecolorable then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v93) --[[ Line: 357 ]] --[[ Name: getTryOnItemsContainLookItem ]]
    for _, v95 in v93 do
        if v95.lookId then
            return true;
        end;
    end;
    return false;
end;
local function v110(v97) --[[ Line: 368 ]] --[[ Name: reconcileAllTryOnState ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v3 (copy), v92 (copy), v10 (copy)
    local v98 = false;
    local l_TryOnItems_0 = v97.TryOnItems;
    local v100 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v101;
        for _, v103 in l_TryOnItems_0 do
            if v103.lookId then
                v101 = true;
                v98 = true;
            end;
            if v98 then
                break;
            end;
        end;
        if not v98 then
            v101 = false;
        end;
        v98 = false;
        v100 = if v101 then v97.LookId else v3.None;
    end;
    local v104 = v92(l_TryOnItems_0);
    if l_FFlagAXMISEnableMultiShopping_0 then
        v104 = v104 or v100 ~= nil;
    end;
    local v105 = if v104 then v97.BodyColor3s else v3.None;
    local v106 = if v104 then v97.BodyPartColorRangeIds else v3.None;
    local v107 = if v104 then v97.DefaultTryOnBodyColorsToggled else false;
    local v108 = if l_FFlagAXMISEnableMultiShopping_0 then v10.fieldCount(l_TryOnItems_0) == 0 else nil;
    local v109 = if l_FFlagAXMISEnableMultiShopping_0 then if v108 then v3.None else v97.LookType else nil;
    return v3.Dictionary.join(v97, {
        BodyColor3s = v105, 
        BodyPartColorRangeIds = v106, 
        DefaultTryOnBodyColorsToggled = v107, 
        LookId = if l_FFlagAXMISEnableMultiShopping_0 then v100 else nil, 
        LookType = if l_FFlagAXMISEnableMultiShopping_0 then v109 else nil, 
        ShouldTryOnWithoutEquippedItems = if l_FFlagAXMISEnableMultiShopping_0 then not v108 and v97.ShouldTryOnWithoutEquippedItems else nil
    });
end;
local v111 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v4.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
local v112 = {
    TryOnItems = {}, 
    DefaultTryOnBodyColorsToggled = false, 
    LookId = nil, 
    LookType = nil, 
    LastTryOnClassicHeadShape = nil, 
    OutfitIdMap = {}, 
    AdjustableTryOnIds = if v111 then {} else nil, 
    ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
};
return v2.createReducer(v112, {
    [v13.name] = function(v113, v114) --[[ Line: 419 ]]
        -- upvalues: v112 (copy)
        local v115 = table.clone(v113 or v112);
        v115.BodyColor3s = v114.colors;
        v115.BodyPartColorRangeIds = v114.bodyPartColorRangeIds;
        return v115;
    end, 
    [v12.name] = function(v116, v117) --[[ Line: 426 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v110 (copy), v86 (copy), v27 (copy), v64 (copy), l_getFilteredTryOnItems_0 (copy), v26 (copy), v3 (copy), v92 (copy)
        local v118 = v116 or v112;
        local v119 = v118.TryOnItems or {};
        local v120 = v118.LookId ~= nil;
        local v121 = l_getTryOnItemReducerKey_0(v117.itemId, v117.itemType);
        if if l_FFlagAXMISEnableMultiShopping_0 then v119[v121] ~= nil else v119[v121] ~= nil and not v120 then
            if l_FFlagAXMISEnableMultiShopping_0 then
                return v110(v86(v118, v119, v117));
            else
                return v86(v118, v119, v117);
            end;
        else
            if l_FFlagAXMISEnableMultiShopping_0 and v117.resetTryOnsBeforeToggleOn then
                v119 = {};
            end;
            local v122 = v27.filterTryOns(v119, v117);
            local v123 = v64(v117, false);
            if l_FFlagAXMISEnableMultiShopping_0 then
                v122 = l_getFilteredTryOnItems_0(v119, v123);
            end;
            local v124 = nil;
            if v123.itemType == v26.ItemType.Asset and v123.itemSubType == v26.AssetTypeIdStrings.EmoteAnimation or v123.itemType == v26.ItemType.Bundle and v123.itemSubType == tostring(v26.BundleTypeIdStrings.Animations) then
                v124 = v123;
            end;
            if not l_FFlagAXMISEnableMultiShopping_0 and v120 then
                return v3.Dictionary.join(v118, {
                    TryOnItems = {
                        [v117.itemId] = v123
                    }, 
                    LastToggledItem = v123, 
                    LastAnimOrEmoteToggledItem = v124, 
                    LookId = v3.None, 
                    BodyColor3s = {}, 
                    BodyPartColorRangeIds = v3.None, 
                    DefaultTryOnBodyColorsToggled = false
                });
            else
                local v125 = v3.Dictionary.join(v122, {
                    [v121] = v123
                });
                local v126 = v92(v125);
                local v127 = if v126 then v118.BodyColor3s else v3.None;
                local v128 = if v126 then v118.BodyPartColorRangeIds else v3.None;
                local v129 = if v126 then v118.DefaultTryOnBodyColorsToggled else false;
                local v130 = v3.Dictionary.join(v118, {
                    TryOnItems = v125, 
                    LastToggledItem = v123, 
                    LastAnimOrEmoteToggledItem = v124, 
                    BodyColor3s = v127, 
                    BodyPartColorRangeIds = v128, 
                    DefaultTryOnBodyColorsToggled = v129
                });
                if l_FFlagAXMISEnableMultiShopping_0 then
                    v130 = v3.Dictionary.join(v130, {
                        TryOnItems = v125, 
                        LastToggledItem = v123, 
                        LastAnimOrEmoteToggledItem = v124
                    });
                    return v110(v130);
                else
                    return v130;
                end;
            end;
        end;
    end, 
    [l_TryOnClassicHeadShape_0.name] = function(v131, v132) --[[ Line: 521 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v131, {
            LastTryOnClassicHeadShape = if v132.headShape then v132.headShape else v3.None
        });
    end, 
    [v11.name] = function(v133, v134) --[[ Line: 527 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), v71 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v78 (copy), v3 (copy)
        local v135 = v133 or v112;
        local v136 = {};
        for _, v138 in v134.assetItemIdTypeAndSubtype do
            v136[l_getTryOnItemReducerKey_0(v138.itemId, v138.itemType)] = v71(v138, v134.lookType, if l_FFlagAXMISEnableMultiShopping_0 then v134.lookId else nil);
        end;
        if v134.bundleItemIdTypeAndSubtype ~= nil then
            for _, v140 in v134.bundleItemIdTypeAndSubtype do
                v136[l_getTryOnItemReducerKey_0(v140.itemId, v140.itemType)] = v78(v140, if l_FFlagAXMISEnableMultiShopping_0 then v134.lookId else nil);
            end;
        end;
        return v3.Dictionary.join(v135, {
            TryOnItems = v136, 
            LookId = if v134.lookId then v134.lookId else v3.None, 
            LookAnalyticsInfo = if v134.analyticsInfo then v134.analyticsInfo else v3.None, 
            LookType = v134.lookType, 
            BodyColor3s = if v134.bodyColor3s then v134.bodyColor3s else v3.None, 
            BodyPartColorRangeIds = if v134.bodyPartColorRangeIds then v134.bodyPartColorRangeIds else v3.None, 
            DefaultTryOnBodyColorsToggled = v3.None, 
            Scale = if v134.scale then v134.scale else v3.None, 
            ShouldTryOnWithoutEquippedItems = if l_FFlagAXMISEnableMultiShopping_0 then v134.lookId ~= nil else nil
        });
    end, 
    [v14.name] = function(v141, v142) --[[ Line: 563 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v143 = v141 or v112;
        local v144 = v143.TryOnItems or {};
        local v145 = l_getTryOnItemReducerKey_0(v142.itemId, v142.itemType);
        if v144[v145] == nil then
            return v143;
        else
            return v3.Dictionary.join(v143, {
                TryOnItems = v3.Dictionary.join(v144, {
                    [v145] = v3.Dictionary.join(v144[v145], {
                        selectedInTryOnManager = v142.selectedInTryOnManager
                    })
                })
            });
        end;
    end, 
    [v15.name] = l_FFlagAXDurablesSupport_0 and function(v146, v147) --[[ Line: 582 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy)
        local v148 = v146 or v112;
        local v149 = v148.TryOnItems or {};
        local v150 = l_getTryOnItemReducerKey_0(v147.itemId, v147.itemType);
        if v149[v150] == nil then
            return v148;
        else
            return v3.Dictionary.join(v148, {
                TryOnItems = v3.Dictionary.join(v149, {
                    [v150] = v3.Dictionary.join(v149[v150], {
                        selectedTimedOptionIndex = v147.selectedTimedOptionIndex
                    })
                })
            });
        end;
    end or nil, 
    [v16.name] = function(v151, _) --[[ Line: 601 ]]
        -- upvalues: v112 (copy), v3 (copy)
        local v153 = v151 or v112;
        local v154 = v153.TryOnItems or {};
        local v155 = {};
        for v156, v157 in v154 do
            if v157.selectedInTryOnManager then
                v155[v156] = v157;
            end;
        end;
        return v3.Dictionary.join(v153, {
            TryOnItems = v155
        });
    end, 
    [v30.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v158, v159) --[[ Line: 618 ]]
        -- upvalues: v112 (copy), v3 (copy)
        local v160 = v158 or v112;
        local v161 = v160.TryOnItems or {};
        local v162 = {};
        for v163, v164 in v161 do
            if v164.lookId ~= v159.lookId then
                v162[v163] = v164;
            end;
        end;
        return v3.Dictionary.join(v160, {
            TryOnItems = v162, 
            LookId = v3.None, 
            LookType = v3.None, 
            LookAnalyticsInfo = v3.None, 
            BodyColor3s = v3.None, 
            BodyPartColorRangeIds = v3.None, 
            Scale = v3.None, 
            ShouldTryOnWithoutEquippedItems = false
        });
    end or nil, 
    [v17.name] = function(v165, v166) --[[ Line: 640 ]]
        -- upvalues: v112 (copy), l_findItemInTryOnItems_0 (copy), v110 (copy), v86 (copy)
        local v167 = v165 or v112;
        local v168 = v167.TryOnItems or {};
        local v169 = nil;
        v169 = l_findItemInTryOnItems_0(v168, v166.itemId, v166.itemType);
        if v169 ~= nil then
            return v110(v86(v167, v168, v169));
        else
            return v167;
        end;
    end, 
    [v18.name] = function(v170, v171) --[[ Line: 653 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
        local v172 = v170 or v112;
        if v171.lookId == v172.LookId then
            local v173 = v172.TryOnItems or {};
            for _, v175 in v171.assetIds do
                local v176 = l_getTryOnItemReducerKey_0(v175, v26.ItemType.Asset);
                if v173[v176] ~= nil then
                    v173 = v3.Dictionary.join(v173, {
                        [v176] = v3.None
                    });
                end;
            end;
            if v171.bundleIds ~= nil then
                for _, v178 in v171.bundleIds do
                    local v179 = l_getTryOnItemReducerKey_0(v178, v26.ItemType.Bundle);
                    if v173[v179] ~= nil then
                        v173 = v3.Dictionary.join(v173, {
                            [v179] = v3.None
                        });
                    end;
                end;
            end;
            v172 = v3.Dictionary.join(v172, {
                TryOnItems = v173, 
                LookId = v3.None, 
                LookType = v3.None, 
                BodyColor3s = v3.None, 
                BodyPartColorRangeIds = v3.None, 
                Scale = v3.None, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
            });
        end;
        return v172;
    end, 
    [v19.name] = function(v180, v181) --[[ Line: 692 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v182 = v180 or v112;
        local v183 = v182.TryOnItems or {};
        local _ = nil;
        local v185 = nil;
        v185 = l_getTryOnItemReducerKey_0(v181.itemId, v26.ItemType.Bundle);
        if v183[v185] then
            local v186 = table.clone(v182.OutfitIdMap or {});
            v186[v181.itemId] = v181.outfitId;
            local l_v185_0 = v185;
            return v3.Dictionary.join(v182, {
                TryOnItems = v3.Dictionary.join(v183, {
                    [l_v185_0] = v3.Dictionary.join(v183[l_v185_0], {
                        receivedBundleInfo = true
                    })
                }), 
                OutfitIdMap = v186
            });
        else
            return v182;
        end;
    end, 
    [v20.name] = function(v188, v189) --[[ Line: 721 ]]
        -- upvalues: v3 (copy), v112 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
        if v188 then
            local v190 = not v188.LookId and v189.retainTryOnColor;
            return v3.Dictionary.join(v112, {
                LastTryOnClassicHeadShape = v188.LastTryOnClassicHeadShape, 
                DefaultTryOnBodyColorsToggled = if v190 then v188.DefaultTryOnBodyColorsToggled else nil, 
                BodyColor3s = if v190 then v188.BodyColor3s else nil, 
                BodyPartColorRangeIds = if v190 then v188.BodyPartColorRangeIds else nil, 
                OutfitIdMap = if v188 then v188.OutfitIdMap else {}, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
            });
        else
            return v112;
        end;
    end, 
    [v32.name] = function(v191, _) --[[ Line: 740 ]]
        -- upvalues: v112 (copy)
        local v193 = table.clone(v112);
        if v191 and v191.OutfitIdMap then
            v193.OutfitIdMap = v191.OutfitIdMap;
        end;
        return v193;
    end, 
    [v33.name] = function(v194, _) --[[ Line: 748 ]]
        -- upvalues: v112 (copy)
        local v196 = table.clone(v112);
        if v194 and v194.OutfitIdMap then
            v196.OutfitIdMap = v194.OutfitIdMap;
        end;
        return v196;
    end, 
    [v34.name] = function(v197, v198) --[[ Line: 756 ]]
        -- upvalues: v112 (copy)
        local v199 = table.clone(v197 or v112);
        v199.DefaultTryOnBodyColorsToggled = v198.state;
        return v199;
    end, 
    [v21.name] = function(v200, v201) --[[ Line: 763 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local l_itemIdToOrderMap_0 = v201.itemIdToOrderMap;
        local v203 = v200 or v112;
        for v204, v205 in l_itemIdToOrderMap_0 do
            local v206 = v203.TryOnItems or {};
            local v207 = l_getTryOnItemReducerKey_0(v204, v26.ItemType.Asset);
            if v206[v207] and v206[v207].itemType ~= v26.ItemType.Bundle then
                v203 = v3.Dictionary.join(v203, {
                    TryOnItems = v3.Dictionary.join(v206, {
                        [v207] = v3.Dictionary.join(v206[v207], {
                            order = v205
                        })
                    })
                });
            elseif not v206[v207] then
                for v208, v209 in v206 do
                    if v209.bundleInfo and v209.bundleInfo[v204] and v209.itemId ~= tostring(v26.BlockyBundleId) then
                        local l_bundleInfo_1 = v209.bundleInfo;
                        local v211 = v3.Dictionary.join(l_bundleInfo_1, {
                            [v204] = v3.Dictionary.join(l_bundleInfo_1[v204], {
                                order = v205
                            })
                        });
                        v203 = v3.Dictionary.join(v200, {
                            TryOnItems = v3.Dictionary.join(v206, {
                                [v208] = v3.Dictionary.join(v206[v208], {
                                    bundleInfo = v211
                                })
                            })
                        });
                        break;
                    end;
                end;
            end;
        end;
        return v203;
    end, 
    [v25.name] = function(v212, v213) --[[ Line: 822 ]]
        -- upvalues: v112 (copy), v3 (copy)
        local v214 = v212 or v112;
        local v215 = v214.TryOnItems or {};
        for v216, v217 in v215 do
            if v217.itemType == "Asset" then
                if v217.itemId == v213.itemId then
                    return v3.Dictionary.join(v214, {
                        TryOnItems = v3.Dictionary.join(v215, {
                            [v216] = v3.Dictionary.join(v217, {
                                position = v213.position, 
                                rotation = v213.rotation, 
                                scale = v213.scale
                            })
                        })
                    });
                end;
            elseif v217.itemType == "Bundle" then
                for v218, v219 in v215 do
                    if v219.bundleInfo and v219.bundleInfo[v213.itemId] then
                        local l_bundleInfo_2 = v219.bundleInfo;
                        local v221 = v3.Dictionary.join(l_bundleInfo_2, {
                            [v213.itemId] = v3.Dictionary.join(l_bundleInfo_2[v213.itemId], {
                                position = v213.position, 
                                rotation = v213.rotation, 
                                scale = v213.scale
                            })
                        });
                        return v3.Dictionary.join(v212, {
                            TryOnItems = v3.Dictionary.join(v215, {
                                [v218] = v3.Dictionary.join(v215[v218], {
                                    bundleInfo = v221
                                })
                            })
                        });
                    end;
                end;
            end;
        end;
        return v214;
    end, 
    [v23.name] = function(v222, v223) --[[ Line: 867 ]]
        -- upvalues: v112 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v3 (copy)
        local v224 = v222 or v112;
        local v225 = v224.TryOnItems or {};
        local v226 = l_getTryOnItemReducerKey_0(v223.bundleId, v26.ItemType.Bundle);
        if v225[v226] then
            return v3.Dictionary.join(v224, {
                TryOnItems = v3.Dictionary.join(v225, {
                    [v226] = v3.Dictionary.join(v225[v226], {
                        bundleInfo = v223.bundleInfo
                    })
                })
            });
        else
            return v224;
        end;
    end, 
    [v24.name] = function(_, v228) --[[ Line: 886 ]]
        return v228.outfitTryOns;
    end, 
    [v29.name] = function(v229, v230) --[[ Line: 890 ]]
        -- upvalues: v112 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v3 (copy)
        local v231 = v229 or v112;
        if v230.lookId == v231.LookId then
            local v232 = {};
            if l_FFlagAXMISEnableMultiShopping_0 then
                local v233 = v231.TryOnItems or {};
                for v234, v235 in v233 do
                    if v235.lookId ~= v230.lookId then
                        v232[v234] = v235;
                    end;
                end;
            end;
            v231 = v3.Dictionary.join(v231, {
                TryOnItems = v232, 
                LookId = v3.None, 
                LookType = v3.None, 
                BodyColor3s = v3.None, 
                BodyPartColorRangeIds = v3.None, 
                Scale = v3.None, 
                ShouldTryOnWithoutEquippedItems = not l_FFlagAXMISEnableMultiShopping_0 and nil
            });
        end;
        return v231;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v236, v237) --[[ Line: 918 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v237.tryOn and v237.tryOn.OutfitTryOn then
            return table.clone(v237.tryOn.OutfitTryOn);
        else
            return v236;
        end;
    end, 
    [v22.name] = v111 and function(v238, v239) --[[ Line: 929 ]]
        -- upvalues: v112 (copy)
        local v240 = table.clone(v238 or v112);
        v240.AdjustableTryOnIds = v239.adjustableTryOnIds;
        return v240;
    end or nil
});