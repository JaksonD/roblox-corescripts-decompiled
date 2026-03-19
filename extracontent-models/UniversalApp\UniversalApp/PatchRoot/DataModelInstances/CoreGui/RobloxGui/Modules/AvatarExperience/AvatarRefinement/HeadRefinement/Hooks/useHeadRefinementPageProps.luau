local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Dash);
local v6 = require(l_CorePackages_0.Packages.SignalsReact);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local l_SetDynamicHeadShape_0 = v7.Thunks.SetDynamicHeadShape;
local l_SetStaticFacialAnimation_0 = v7.Thunks.SetStaticFacialAnimation;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagDynamicHeadsMigration_0 = v10.FFlagDynamicHeadsMigration;
local l_FFlagAXAddFacesToHeadList_0 = v10.FFlagAXAddFacesToHeadList;
local l_FFlagAXLogFacialAnimationToggle_0 = v10.FFlagAXLogFacialAnimationToggle;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v10.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagRemoveClassicHeadsAndFaces_0 = v10.FFlagRemoveClassicHeadsAndFaces;
local v16 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v17 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_GetUserOwnedClassicHeads_0 = v7.Thunks.GetUserOwnedClassicHeads;
local l_TryOnClassicHeadShape_0 = v7.Actions.TryOnClassicHeadShape;
local l_SetLastSelectedHeadShape_0 = v7.Actions.SetLastSelectedHeadShape;
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local l_HeadShape_0 = v7.Enums.HeadShape;
local l_HeadShapeProperties_0 = v7.Enums.HeadShapeProperties;
local l_Counters_0 = v7.Counters;
local v26 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v26.Enums.AvatarScreen;
local l_UnifiedLoggingSurface_0 = v26.Enums.UnifiedLoggingSurface;
local l_useRoactService_0 = v16.useRoactService;
local l_useSelector_0 = v17.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v17.Hooks.RoactRodux.useDispatch;
local v32 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_sendAXCounterV2_0 = v32.sendAXCounterV2;
local l_sendUnifiedEventLog_0 = v32.sendUnifiedEventLog;
local l_UnifiedEventLogEnums_0 = v32.UnifiedEventLogEnums;
local v36 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v37 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v38 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v39 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShape);
local v40 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectFacialAnimationForHeadAdjustment);
local l_getEquippedHeadShapeName_0 = v7.Utils.getEquippedHeadShapeName;
local l_getDefaultSelectedHeadShapeName_0 = v7.Utils.getDefaultSelectedHeadShapeName;
local v43 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v47(v46) --[[ Line: 61 ]] --[[ Name: selectLocalUserId ]]
    return v46.LocalUserId;
end;
local function v49(v48) --[[ Line: 65 ]] --[[ Name: selectEquippedAssets ]]
    return v48.AvatarExperience.AvatarEditor.Character.EquippedAssets;
end;
local function v51(v50) --[[ Line: 69 ]] --[[ Name: selectOutfitTryOn ]]
    return v50.AvatarExperience.AvatarScene.OutfitTryOn;
end;
local function v53(v52) --[[ Line: 73 ]] --[[ Name: selectAvailableHeadShapes ]]
    return v52.AvatarExperience.AvatarScene.HeadRefinement and v52.AvatarExperience.AvatarScene.HeadRefinement.availableHeadShapes;
end;
local function v55(v54) --[[ Line: 78 ]] --[[ Name: selectLastSelectedHeadShape ]]
    return v54.AvatarExperience.AvatarScene.HeadRefinement and v54.AvatarExperience.AvatarScene.HeadRefinement.lastSelectedHeadShape;
end;
local function v57(v56) --[[ Line: 83 ]] --[[ Name: selectEntryPage ]]
    return v56.AvatarExperience.LayeredClothingSort.EntryPage;
end;
local function v59(v58) --[[ Line: 87 ]] --[[ Name: selectAssetInfos ]]
    return v58.AvatarExperience.Common.AssetInfos;
end;
local function v61(v60) --[[ Line: 91 ]] --[[ Name: selectBundleInfos ]]
    return v60.AvatarExperience.Common.BundleInfos;
end;
return function() --[[ Line: 104 ]] --[[ Name: useHeadRefinementPageProps ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v47 (copy), v49 (copy), v51 (copy), v57 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v59 (copy), v61 (copy), v53 (copy), v55 (copy), v39 (copy), l_AvatarScreen_0 (copy), l_FFlagAXAddFacesToHeadList_0 (copy), v38 (copy), v4 (copy), v3 (copy), l_sendAXCounterV2_0 (copy), l_Counters_0 (copy), l_GetUserOwnedClassicHeads_0 (copy), v43 (copy), v6 (copy), l_HeadShapeProperties_0 (copy), l_getEquippedHeadShapeName_0 (copy), l_getDefaultSelectedHeadShapeName_0 (copy), l_HeadShape_0 (copy), v40 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXLogFacialAnimationToggle_0 (copy), l_sendUnifiedEventLog_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_HttpService_0 (copy), l_SetStaticFacialAnimation_0 (copy), v36 (copy), v5 (copy), l_SetDynamicHeadShape_0 (copy), l_TryOnClassicHeadShape_0 (copy), v22 (copy), l_SetLastSelectedHeadShape_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), v37 (copy)
    local v62 = l_useRoactService_0(l_RoactNetworking_0);
    local v63 = l_useDispatch_0();
    local v64 = l_useSelector_0(v47);
    local v65 = l_useSelector_0(v49);
    local v66 = l_useSelector_0(v51);
    local v67 = l_useSelector_0(v57);
    local v68 = if l_FFlagDynamicHeadsMigration_0 then l_useSelector_0(v59) else nil;
    local v69 = if l_FFlagDynamicHeadsMigration_0 then l_useSelector_0(v61) else nil;
    local v70 = l_useSelector_0(v53);
    local v71 = l_useSelector_0(v55);
    local v72 = l_useSelector_0(v39);
    local l_TryOnItems_0 = v66.TryOnItems;
    local l_LookId_0 = v66.LookId;
    local v75 = v67 == l_AvatarScreen_0.Catalog;
    local v76 = if l_FFlagAXAddFacesToHeadList_0 then v65 and v65[v38.AssetTypeIdStrings.DynamicHead] else nil;
    local v77 = if l_FFlagAXAddFacesToHeadList_0 then v76 and next(v76) else nil;
    local v78, v79 = v4.useState(true);
    local v80 = v4.useRef(false);
    local v81 = v4.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v75 (copy), v3 (ref), l_TryOnItems_0 (copy)
        return v75 or not v3.isEmpty(l_TryOnItems_0);
    end, {
        v75, 
        l_TryOnItems_0
    });
    local v82 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: l_sendAXCounterV2_0 (ref), l_Counters_0 (ref)
        l_sendAXCounterV2_0(l_Counters_0.Enter);
    end, {});
    v4.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v3 (ref), v70 (copy), v62 (copy), v64 (copy), v80 (copy), v63 (copy), l_GetUserOwnedClassicHeads_0 (ref), l_sendAXCounterV2_0 (ref), v79 (copy)
        if v3.isEmpty(v70) and v62 and v64 and not v80.current then
            v63(l_GetUserOwnedClassicHeads_0(v62, v64, l_sendAXCounterV2_0));
            v80.current = true;
            return;
        else
            v79(false);
            return;
        end;
    end, {
        v70, 
        v62, 
        v64
    });
    local v83 = if l_FFlagDynamicHeadsMigration_0 then v43(false) else nil;
    local v84 = if l_FFlagDynamicHeadsMigration_0 and v83 then v6.useSignalState(v83.getInventory) else nil;
    local v85 = v4.useMemo(function() --[[ Line: 164 ]]
        -- upvalues: l_FFlagDynamicHeadsMigration_0 (ref), l_HeadShapeProperties_0 (ref), v84 (copy), l_FFlagAXAddFacesToHeadList_0 (ref), v77 (copy)
        if l_FFlagDynamicHeadsMigration_0 then
            return l_HeadShapeProperties_0.fromInventory(v84, if l_FFlagAXAddFacesToHeadList_0 then v77 else nil);
        else
            return l_HeadShapeProperties_0;
        end;
    end, {
        v84
    });
    local v86 = v4.useMemo(function() --[[ Line: 175 ]]
        -- upvalues: l_getEquippedHeadShapeName_0 (ref), v65 (copy), v38 (ref)
        return l_getEquippedHeadShapeName_0(v65, v38.AssetTypeIdStrings.Head);
    end, {
        v65
    });
    local v87 = v4.useMemo(function() --[[ Line: 180 ]]
        -- upvalues: l_getDefaultSelectedHeadShapeName_0 (ref), v81 (copy), v86 (copy), v72 (copy), v65 (copy), v71 (copy), l_HeadShape_0 (ref)
        return l_getDefaultSelectedHeadShapeName_0({
            isTryingOnItems = v81, 
            equippedHeadShapeName = v86, 
            lastTryOnHeadShapeName = v72, 
            equippedAssets = v65, 
            defaultHeadShapeName = v71 or l_HeadShape_0.Default
        });
    end, {
        v81, 
        v86, 
        v72, 
        v65, 
        v71
    });
    local v88 = l_useSelector_0(v40);
    local v89 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v88 == nil or not v88 else nil;
    local v97 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v4.useMemo(function() --[[ Line: 200 ]]
        -- upvalues: v65 (copy), v38 (ref), l_TryOnItems_0 (copy)
        if v65 then
            local v90 = v65[v38.AssetTypeIdStrings.DynamicHead];
            if v90 then
                for v91, _ in v90 do
                    return (tostring(v91));
                end;
            end;
        end;
        if l_TryOnItems_0 then
            for _, v94 in l_TryOnItems_0 do
                if v94.bundleInfo then
                    for v95, v96 in v94.bundleInfo do
                        if v96.assetType == v38.AssetTypeIdStrings.DynamicHead then
                            return (tostring(v95));
                        end;
                    end;
                elseif v94.itemSubType == v38.AssetTypeIdStrings.DynamicHead then
                    return (tostring(v94.itemId));
                end;
            end;
        end;
        return nil;
    end, {
        v65, 
        l_TryOnItems_0
    }) else nil;
    local v99 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v4.useCallback(function(v98) --[[ Line: 228 ]]
        -- upvalues: v97 (copy), l_FFlagAXLogFacialAnimationToggle_0 (ref), l_sendUnifiedEventLog_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), l_HttpService_0 (ref), v89 (copy), v63 (copy), l_SetStaticFacialAnimation_0 (ref)
        if v97 then
            if l_FFlagAXLogFacialAnimationToggle_0 then
                l_sendUnifiedEventLog_0({
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "FACIAL_ANIMATION_TOGGLE", 
                    surface = l_UnifiedLoggingSurface_0.CUSTOMIZE, 
                    itemId = v97, 
                    elementMetadata = l_HttpService_0:JSONEncode({
                        trigger = "MANUAL_TOGGLE", 
                        change_from_FACS_status = v89, 
                        change_to_FACS_status = v98
                    })
                });
            end;
            v63(l_SetStaticFacialAnimation_0(not v98, v97));
        end;
    end, {
        v63, 
        v97, 
        v89
    }) else nil;
    local v111 = if l_FFlagDynamicHeadsMigration_0 then v4.useMemo(function() --[[ Line: 271 ]]
        -- upvalues: v81 (copy), v3 (ref), l_TryOnItems_0 (copy), v38 (ref), v68 (copy), v69 (copy), v36 (ref), v65 (copy)
        if v81 and not v3.isEmpty(l_TryOnItems_0) then
            for _, v101 in l_TryOnItems_0 do
                if v101.itemSubType == v38.AssetTypeIdStrings.DynamicHead then
                    local v102 = if v68 and v101.itemId then v68[tostring(v101.itemId)] else nil;
                    if v102 and v102.supportsHeadShapes then
                        return true;
                    end;
                end;
                if v101.itemType == v38.ItemType.Bundle and v101.itemSubType == v38.BundleTypeIdStrings.DynamicHead and v101.bundleInfo then
                    for v103, _ in v101.bundleInfo do
                        local v105 = if v68 then v68[tostring(v103)] else nil;
                        if v105 and v105.supportsHeadShapes then
                            return true;
                        end;
                    end;
                    if v69 and v69[v101.itemId] then
                        local v106 = v69[v101.itemId];
                        if v106 and v106.supportsHeadShapes then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
        if v81 and not v3.isEmpty(l_TryOnItems_0) and v36.isTryingOnDynamicHead(l_TryOnItems_0) then
            return false;
        else
            local v107 = if v65 then v65[v38.AssetTypeIdStrings.DynamicHead] else nil;
            if v107 then
                for v108, _ in v107 do
                    local v110 = if v68 then v68[v108] else nil;
                    if v110 and v110.supportsHeadShapes then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, {
        v81, 
        l_TryOnItems_0, 
        v65, 
        v68, 
        v69
    }) else nil;
    local v118 = v4.useMemo(function() --[[ Line: 341 ]]
        -- upvalues: l_FFlagDynamicHeadsMigration_0 (ref), v5 (ref), v85 (copy), v70 (copy), v87 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref), v81 (copy), v63 (copy), l_SetDynamicHeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), v22 (ref), v38 (ref), l_SetLastSelectedHeadShape_0 (ref)
        local v112 = if l_FFlagDynamicHeadsMigration_0 then v5.keys(v85) else v70;
        local v113 = {};
        for _, v115 in v112 do
            local v116 = v85[v115];
            if v116 then
                table.insert(v113, {
                    headShapeName = v115, 
                    headShapeData = v116, 
                    isSelected = v87 == v115, 
                    onActivated = function() --[[ Line: 357 ]] --[[ Name: onActivated ]]
                        -- upvalues: v116 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref), v115 (copy), v81 (ref), l_FFlagDynamicHeadsMigration_0 (ref), v63 (ref), l_SetDynamicHeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), v22 (ref), v38 (ref), l_SetLastSelectedHeadShape_0 (ref)
                        local l_assetId_0 = v116.assetId;
                        l_sendAXCounterV2_0(l_Counters_0.HeadShapeSelect, {
                            headShapeName = v115 or "none", 
                            isTryingOnItems = v81 and "true" or "false"
                        });
                        if l_FFlagDynamicHeadsMigration_0 then
                            v63(l_SetDynamicHeadShape_0(v115, (tostring(l_assetId_0))));
                        elseif v81 then
                            v63(l_TryOnClassicHeadShape_0(v115));
                        else
                            v63(v22(v38.AssetTypeIdStrings.Head, (tostring(l_assetId_0))));
                        end;
                        if l_FFlagDynamicHeadsMigration_0 then
                            v63(l_SetLastSelectedHeadShape_0(v115));
                            return;
                        else
                            v63(l_SetLastSelectedHeadShape_0(v115));
                            return;
                        end;
                    end
                });
            end;
        end;
        return v113;
    end, {
        v70, 
        v87, 
        v63, 
        v81, 
        v85, 
        v111
    });
    local v124 = if l_FFlagRemoveClassicHeadsAndFaces_0 then v4.useMemo(function() --[[ Line: 396 ]]
        -- upvalues: v81 (copy), l_LookId_0 (copy), l_FFlagDynamicHeadsMigration_0 (ref), v37 (ref), v65 (copy), v111 (copy), v72 (copy), v36 (ref), l_TryOnItems_0 (copy), v38 (ref), v68 (copy)
        if v81 and l_LookId_0 ~= nil then
            return true;
        elseif l_FFlagDynamicHeadsMigration_0 and v37.isDynamicHeadEquipped(v65) then
            return not v111;
        elseif v81 then
            if v72 then
                return false;
            else
                local v119 = v36.isTryingOnDynamicHead(l_TryOnItems_0);
                local v120 = l_LookId_0 ~= nil;
                if v119 then
                    return not v111;
                elseif v120 then
                    for _, v122 in l_TryOnItems_0 do
                        if v122.itemSubType == v38.AssetTypeIdStrings.DynamicHead then
                            local v123 = if v68 and v122.itemId then v68[tostring(v122.itemId)] else nil;
                            if not v123 or not v123.supportsHeadShapes then
                                return true;
                            else
                                return false;
                            end;
                        end;
                    end;
                    return false;
                else
                    return false;
                end;
            end;
        else
            return false;
        end;
    end, {
        v65, 
        l_TryOnItems_0, 
        v81, 
        l_LookId_0, 
        v72, 
        v111, 
        v68
    }) else v4.useMemo(function() --[[ Line: 445 ]]
        -- upvalues: v81 (copy), v36 (ref), l_TryOnItems_0 (copy), l_LookId_0 (copy), v72 (copy), v37 (ref), v65 (copy)
        if v81 then
            if v36.isTryingOnDynamicHead(l_TryOnItems_0) or l_LookId_0 ~= nil then
                return true;
            elseif v72 then
                return false;
            end;
        end;
        return v37.isDynamicHeadEquipped(v65);
    end, {
        v65, 
        l_TryOnItems_0, 
        v81, 
        l_LookId_0, 
        v72
    });
    v4.useEffect(function() --[[ Line: 461 ]]
        -- upvalues: v124 (copy), v82 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref)
        if v124 and not v82.current then
            v82.current = true;
            l_sendAXCounterV2_0(l_Counters_0.Unsupported);
        end;
    end, {
        v124
    });
    return v118, v124, v78, v89, v99;
end;