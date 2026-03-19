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
local l_FFlagAXLogFacialAnimationToggle_0 = v10.FFlagAXLogFacialAnimationToggle;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v10.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagRemoveClassicHeadsAndFaces_0 = v10.FFlagRemoveClassicHeadsAndFaces;
local v15 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v16 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_GetUserOwnedClassicHeads_0 = v7.Thunks.GetUserOwnedClassicHeads;
local l_TryOnClassicHeadShape_0 = v7.Actions.TryOnClassicHeadShape;
local l_SetLastSelectedHeadShape_0 = v7.Actions.SetLastSelectedHeadShape;
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local l_HeadShape_0 = v7.Enums.HeadShape;
local l_HeadShapeProperties_0 = v7.Enums.HeadShapeProperties;
local l_Counters_0 = v7.Counters;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v25.Enums.AvatarScreen;
local l_UnifiedLoggingSurface_0 = v25.Enums.UnifiedLoggingSurface;
local l_useRoactService_0 = v15.useRoactService;
local l_useSelector_0 = v16.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v16.Hooks.RoactRodux.useDispatch;
local v31 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_sendAXCounterV2_0 = v31.sendAXCounterV2;
local l_sendUnifiedEventLog_0 = v31.sendUnifiedEventLog;
local l_UnifiedEventLogEnums_0 = v31.UnifiedEventLogEnums;
local v35 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v37 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v38 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShape);
local v39 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectFacialAnimationForHeadAdjustment);
local l_getEquippedHeadShapeName_0 = v7.Utils.getEquippedHeadShapeName;
local l_getDefaultSelectedHeadShapeName_0 = v7.Utils.getDefaultSelectedHeadShapeName;
local v42 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v46(v45) --[[ Line: 60 ]] --[[ Name: selectLocalUserId ]]
    return v45.LocalUserId;
end;
local function v48(v47) --[[ Line: 64 ]] --[[ Name: selectEquippedAssets ]]
    return v47.AvatarExperience.AvatarEditor.Character.EquippedAssets;
end;
local function v50(v49) --[[ Line: 68 ]] --[[ Name: selectOutfitTryOn ]]
    return v49.AvatarExperience.AvatarScene.OutfitTryOn;
end;
local function v52(v51) --[[ Line: 72 ]] --[[ Name: selectAvailableHeadShapes ]]
    return v51.AvatarExperience.AvatarScene.HeadRefinement and v51.AvatarExperience.AvatarScene.HeadRefinement.availableHeadShapes;
end;
local function v54(v53) --[[ Line: 77 ]] --[[ Name: selectLastSelectedHeadShape ]]
    return v53.AvatarExperience.AvatarScene.HeadRefinement and v53.AvatarExperience.AvatarScene.HeadRefinement.lastSelectedHeadShape;
end;
local function v56(v55) --[[ Line: 82 ]] --[[ Name: selectEntryPage ]]
    return v55.AvatarExperience.LayeredClothingSort.EntryPage;
end;
local function v58(v57) --[[ Line: 86 ]] --[[ Name: selectAssetInfos ]]
    return v57.AvatarExperience.Common.AssetInfos;
end;
local function v60(v59) --[[ Line: 90 ]] --[[ Name: selectBundleInfos ]]
    return v59.AvatarExperience.Common.BundleInfos;
end;
return function() --[[ Line: 103 ]] --[[ Name: useHeadRefinementPageProps ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v46 (copy), v48 (copy), v50 (copy), v56 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v58 (copy), v60 (copy), v52 (copy), v54 (copy), v38 (copy), l_AvatarScreen_0 (copy), v4 (copy), v3 (copy), l_sendAXCounterV2_0 (copy), l_Counters_0 (copy), l_GetUserOwnedClassicHeads_0 (copy), v42 (copy), v6 (copy), l_HeadShapeProperties_0 (copy), l_getEquippedHeadShapeName_0 (copy), v37 (copy), l_getDefaultSelectedHeadShapeName_0 (copy), l_HeadShape_0 (copy), v39 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXLogFacialAnimationToggle_0 (copy), l_sendUnifiedEventLog_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_HttpService_0 (copy), l_SetStaticFacialAnimation_0 (copy), v35 (copy), v5 (copy), l_SetDynamicHeadShape_0 (copy), l_TryOnClassicHeadShape_0 (copy), v21 (copy), l_SetLastSelectedHeadShape_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), v36 (copy)
    local v61 = l_useRoactService_0(l_RoactNetworking_0);
    local v62 = l_useDispatch_0();
    local v63 = l_useSelector_0(v46);
    local v64 = l_useSelector_0(v48);
    local v65 = l_useSelector_0(v50);
    local v66 = l_useSelector_0(v56);
    local v67 = if l_FFlagDynamicHeadsMigration_0 then l_useSelector_0(v58) else nil;
    local v68 = if l_FFlagDynamicHeadsMigration_0 then l_useSelector_0(v60) else nil;
    local v69 = l_useSelector_0(v52);
    local v70 = l_useSelector_0(v54);
    local v71 = l_useSelector_0(v38);
    local l_TryOnItems_0 = v65.TryOnItems;
    local l_LookId_0 = v65.LookId;
    local v74 = v66 == l_AvatarScreen_0.Catalog;
    local v75, v76 = v4.useState(true);
    local v77 = v4.useRef(false);
    local v78 = v4.useMemo(function() --[[ Line: 129 ]]
        -- upvalues: v74 (copy), v3 (ref), l_TryOnItems_0 (copy)
        return v74 or not v3.isEmpty(l_TryOnItems_0);
    end, {
        v74, 
        l_TryOnItems_0
    });
    local v79 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 135 ]]
        -- upvalues: l_sendAXCounterV2_0 (ref), l_Counters_0 (ref)
        l_sendAXCounterV2_0(l_Counters_0.Enter);
    end, {});
    v4.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v3 (ref), v69 (copy), v61 (copy), v63 (copy), v77 (copy), v62 (copy), l_GetUserOwnedClassicHeads_0 (ref), l_sendAXCounterV2_0 (ref), v76 (copy)
        if v3.isEmpty(v69) and v61 and v63 and not v77.current then
            v62(l_GetUserOwnedClassicHeads_0(v61, v63, l_sendAXCounterV2_0));
            v77.current = true;
            return;
        else
            v76(false);
            return;
        end;
    end, {
        v69, 
        v61, 
        v63
    });
    local v80 = if l_FFlagDynamicHeadsMigration_0 then v42(false) else nil;
    local v81 = if l_FFlagDynamicHeadsMigration_0 and v80 then v6.useSignalState(v80.getInventory) else nil;
    local v82 = v4.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: l_FFlagDynamicHeadsMigration_0 (ref), l_HeadShapeProperties_0 (ref), v81 (copy)
        if l_FFlagDynamicHeadsMigration_0 then
            return l_HeadShapeProperties_0.fromInventory(v81);
        else
            return l_HeadShapeProperties_0;
        end;
    end, {
        v81
    });
    local v83 = v4.useMemo(function() --[[ Line: 163 ]]
        -- upvalues: l_getEquippedHeadShapeName_0 (ref), v64 (copy), v37 (ref)
        return l_getEquippedHeadShapeName_0(v64, v37.AssetTypeIdStrings.Head);
    end, {
        v64
    });
    local v84 = v4.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: l_getDefaultSelectedHeadShapeName_0 (ref), v78 (copy), v83 (copy), v71 (copy), v64 (copy), v70 (copy), l_HeadShape_0 (ref)
        return l_getDefaultSelectedHeadShapeName_0({
            isTryingOnItems = v78, 
            equippedHeadShapeName = v83, 
            lastTryOnHeadShapeName = v71, 
            equippedAssets = v64, 
            defaultHeadShapeName = v70 or l_HeadShape_0.Default
        });
    end, {
        v78, 
        v83, 
        v71, 
        v64, 
        v70
    });
    local v85 = l_useSelector_0(v39);
    local v86 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v85 == nil or not v85 else nil;
    local v94 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v4.useMemo(function() --[[ Line: 188 ]]
        -- upvalues: v64 (copy), v37 (ref), l_TryOnItems_0 (copy)
        if v64 then
            local v87 = v64[v37.AssetTypeIdStrings.DynamicHead];
            if v87 then
                for v88, _ in v87 do
                    return (tostring(v88));
                end;
            end;
        end;
        if l_TryOnItems_0 then
            for _, v91 in l_TryOnItems_0 do
                if v91.bundleInfo then
                    for v92, v93 in v91.bundleInfo do
                        if v93.assetType == v37.AssetTypeIdStrings.DynamicHead then
                            return (tostring(v92));
                        end;
                    end;
                elseif v91.itemSubType == v37.AssetTypeIdStrings.DynamicHead then
                    return (tostring(v91.itemId));
                end;
            end;
        end;
        return nil;
    end, {
        v64, 
        l_TryOnItems_0
    }) else nil;
    local v96 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v4.useCallback(function(v95) --[[ Line: 216 ]]
        -- upvalues: v94 (copy), l_FFlagAXLogFacialAnimationToggle_0 (ref), l_sendUnifiedEventLog_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), l_HttpService_0 (ref), v86 (copy), v62 (copy), l_SetStaticFacialAnimation_0 (ref)
        if v94 then
            if l_FFlagAXLogFacialAnimationToggle_0 then
                l_sendUnifiedEventLog_0({
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "FACIAL_ANIMATION_TOGGLE", 
                    surface = l_UnifiedLoggingSurface_0.CUSTOMIZE, 
                    itemId = v94, 
                    elementMetadata = l_HttpService_0:JSONEncode({
                        change_from_FACS_status = v86, 
                        change_to_FACS_status = v95
                    })
                });
            end;
            v62(l_SetStaticFacialAnimation_0(not v95, v94));
        end;
    end, {
        v62, 
        v94, 
        v86
    }) else nil;
    local v108 = if l_FFlagDynamicHeadsMigration_0 then v4.useMemo(function() --[[ Line: 258 ]]
        -- upvalues: v78 (copy), v3 (ref), l_TryOnItems_0 (copy), v37 (ref), v67 (copy), v68 (copy), v35 (ref), v64 (copy)
        if v78 and not v3.isEmpty(l_TryOnItems_0) then
            for _, v98 in l_TryOnItems_0 do
                if v98.itemSubType == v37.AssetTypeIdStrings.DynamicHead then
                    local v99 = if v67 and v98.itemId then v67[tostring(v98.itemId)] else nil;
                    if v99 and v99.supportsHeadShapes then
                        return true;
                    end;
                end;
                if v98.itemType == v37.ItemType.Bundle and v98.itemSubType == v37.BundleTypeIdStrings.DynamicHead and v98.bundleInfo then
                    for v100, _ in v98.bundleInfo do
                        local v102 = if v67 then v67[tostring(v100)] else nil;
                        if v102 and v102.supportsHeadShapes then
                            return true;
                        end;
                    end;
                    if v68 and v68[v98.itemId] then
                        local v103 = v68[v98.itemId];
                        if v103 and v103.supportsHeadShapes then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
        if v78 and not v3.isEmpty(l_TryOnItems_0) and v35.isTryingOnDynamicHead(l_TryOnItems_0) then
            return false;
        else
            local v104 = if v64 then v64[v37.AssetTypeIdStrings.DynamicHead] else nil;
            if v104 then
                for v105, _ in v104 do
                    local v107 = if v67 then v67[v105] else nil;
                    if v107 and v107.supportsHeadShapes then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, {
        v78, 
        l_TryOnItems_0, 
        v64, 
        v67, 
        v68
    }) else nil;
    local v115 = v4.useMemo(function() --[[ Line: 328 ]]
        -- upvalues: l_FFlagDynamicHeadsMigration_0 (ref), v5 (ref), v82 (copy), v69 (copy), v84 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref), v78 (copy), v62 (copy), l_SetDynamicHeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), v21 (ref), v37 (ref), l_SetLastSelectedHeadShape_0 (ref)
        local v109 = if l_FFlagDynamicHeadsMigration_0 then v5.keys(v82) else v69;
        local v110 = {};
        for _, v112 in v109 do
            local v113 = v82[v112];
            if v113 then
                table.insert(v110, {
                    headShapeName = v112, 
                    headShapeData = v113, 
                    isSelected = v84 == v112, 
                    onActivated = function() --[[ Line: 344 ]] --[[ Name: onActivated ]]
                        -- upvalues: v113 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref), v112 (copy), v78 (ref), l_FFlagDynamicHeadsMigration_0 (ref), v62 (ref), l_SetDynamicHeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), v21 (ref), v37 (ref), l_SetLastSelectedHeadShape_0 (ref)
                        local l_assetId_0 = v113.assetId;
                        l_sendAXCounterV2_0(l_Counters_0.HeadShapeSelect, {
                            headShapeName = v112 or "none", 
                            isTryingOnItems = v78 and "true" or "false"
                        });
                        if l_FFlagDynamicHeadsMigration_0 then
                            v62(l_SetDynamicHeadShape_0(v112, (tostring(l_assetId_0))));
                        elseif v78 then
                            v62(l_TryOnClassicHeadShape_0(v112));
                        else
                            v62(v21(v37.AssetTypeIdStrings.Head, (tostring(l_assetId_0))));
                        end;
                        if l_FFlagDynamicHeadsMigration_0 then
                            v62(l_SetLastSelectedHeadShape_0(v112));
                            return;
                        else
                            v62(l_SetLastSelectedHeadShape_0(v112));
                            return;
                        end;
                    end
                });
            end;
        end;
        return v110;
    end, {
        v69, 
        v84, 
        v62, 
        v78, 
        v82, 
        v108
    });
    local v121 = if l_FFlagRemoveClassicHeadsAndFaces_0 then v4.useMemo(function() --[[ Line: 383 ]]
        -- upvalues: v78 (copy), l_LookId_0 (copy), l_FFlagDynamicHeadsMigration_0 (ref), v36 (ref), v64 (copy), v108 (copy), v71 (copy), v35 (ref), l_TryOnItems_0 (copy), v37 (ref), v67 (copy)
        if v78 and l_LookId_0 ~= nil then
            return true;
        elseif l_FFlagDynamicHeadsMigration_0 and v36.isDynamicHeadEquipped(v64) then
            return not v108;
        elseif v78 then
            if v71 then
                return false;
            else
                local v116 = v35.isTryingOnDynamicHead(l_TryOnItems_0);
                local v117 = l_LookId_0 ~= nil;
                if v116 then
                    return not v108;
                elseif v117 then
                    for _, v119 in l_TryOnItems_0 do
                        if v119.itemSubType == v37.AssetTypeIdStrings.DynamicHead then
                            local v120 = if v67 and v119.itemId then v67[tostring(v119.itemId)] else nil;
                            if not v120 or not v120.supportsHeadShapes then
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
        v64, 
        l_TryOnItems_0, 
        v78, 
        l_LookId_0, 
        v71, 
        v108, 
        v67
    }) else v4.useMemo(function() --[[ Line: 432 ]]
        -- upvalues: v78 (copy), v35 (ref), l_TryOnItems_0 (copy), l_LookId_0 (copy), v71 (copy), v36 (ref), v64 (copy)
        if v78 then
            if v35.isTryingOnDynamicHead(l_TryOnItems_0) or l_LookId_0 ~= nil then
                return true;
            elseif v71 then
                return false;
            end;
        end;
        return v36.isDynamicHeadEquipped(v64);
    end, {
        v64, 
        l_TryOnItems_0, 
        v78, 
        l_LookId_0, 
        v71
    });
    v4.useEffect(function() --[[ Line: 448 ]]
        -- upvalues: v121 (copy), v79 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref)
        if v121 and not v79.current then
            v79.current = true;
            l_sendAXCounterV2_0(l_Counters_0.Unsupported);
        end;
    end, {
        v121
    });
    return v115, v121, v75, v86, v96;
end;