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
local l_FFlagAXFixTryOnHeadShapeThumbnail_0 = v10.FFlagAXFixTryOnHeadShapeThumbnail;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v48(v47) --[[ Line: 62 ]] --[[ Name: selectLocalUserId ]]
    return v47.LocalUserId;
end;
local function v50(v49) --[[ Line: 66 ]] --[[ Name: selectEquippedAssets ]]
    return v49.AvatarExperience.AvatarEditor.Character.EquippedAssets;
end;
local function v52(v51) --[[ Line: 70 ]] --[[ Name: selectOutfitTryOn ]]
    return v51.AvatarExperience.AvatarScene.OutfitTryOn;
end;
local function v54(v53) --[[ Line: 74 ]] --[[ Name: selectAvailableHeadShapes ]]
    return v53.AvatarExperience.AvatarScene.HeadRefinement and v53.AvatarExperience.AvatarScene.HeadRefinement.availableHeadShapes;
end;
local function v56(v55) --[[ Line: 79 ]] --[[ Name: selectLastSelectedHeadShape ]]
    return v55.AvatarExperience.AvatarScene.HeadRefinement and v55.AvatarExperience.AvatarScene.HeadRefinement.lastSelectedHeadShape;
end;
local function v58(v57) --[[ Line: 84 ]] --[[ Name: selectEntryPage ]]
    return v57.AvatarExperience.LayeredClothingSort.EntryPage;
end;
local function v60(v59) --[[ Line: 88 ]] --[[ Name: selectAssetInfos ]]
    return v59.AvatarExperience.Common.AssetInfos;
end;
local function v62(v61) --[[ Line: 92 ]] --[[ Name: selectBundleInfos ]]
    return v61.AvatarExperience.Common.BundleInfos;
end;
return function() --[[ Line: 105 ]] --[[ Name: useHeadRefinementPageProps ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v48 (copy), v50 (copy), v52 (copy), v58 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v60 (copy), v62 (copy), v54 (copy), v56 (copy), v39 (copy), l_AvatarScreen_0 (copy), l_FFlagAXAddFacesToHeadList_0 (copy), v38 (copy), l_FFlagAXFixTryOnHeadShapeThumbnail_0 (copy), v4 (copy), v3 (copy), l_sendAXCounterV2_0 (copy), l_Counters_0 (copy), l_GetUserOwnedClassicHeads_0 (copy), v43 (copy), v6 (copy), l_HeadShapeProperties_0 (copy), l_getEquippedHeadShapeName_0 (copy), l_getDefaultSelectedHeadShapeName_0 (copy), l_HeadShape_0 (copy), v40 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), l_FFlagAXLogFacialAnimationToggle_0 (copy), l_sendUnifiedEventLog_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_HttpService_0 (copy), l_SetStaticFacialAnimation_0 (copy), v36 (copy), v5 (copy), l_SetDynamicHeadShape_0 (copy), l_TryOnClassicHeadShape_0 (copy), v22 (copy), l_SetLastSelectedHeadShape_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), v37 (copy)
    local v63 = l_useRoactService_0(l_RoactNetworking_0);
    local v64 = l_useDispatch_0();
    local v65 = l_useSelector_0(v48);
    local v66 = l_useSelector_0(v50);
    local v67 = l_useSelector_0(v52);
    local v68 = l_useSelector_0(v58);
    local v69 = if l_FFlagDynamicHeadsMigration_0 then l_useSelector_0(v60) else nil;
    local v70 = if l_FFlagDynamicHeadsMigration_0 then l_useSelector_0(v62) else nil;
    local v71 = l_useSelector_0(v54);
    local v72 = l_useSelector_0(v56);
    local v73 = l_useSelector_0(v39);
    local l_TryOnItems_0 = v67.TryOnItems;
    local l_LookId_0 = v67.LookId;
    local v76 = v68 == l_AvatarScreen_0.Catalog;
    local v77 = if l_FFlagAXAddFacesToHeadList_0 then v66 and v66[v38.AssetTypeIdStrings.DynamicHead] else nil;
    local v78 = if l_FFlagAXAddFacesToHeadList_0 then v77 and next(v77) else nil;
    local v79 = nil;
    if l_FFlagAXFixTryOnHeadShapeThumbnail_0 and l_TryOnItems_0 then
        for _, v81 in l_TryOnItems_0 do
            local l_bundleInfo_0 = v81.bundleInfo;
            if l_bundleInfo_0 then
                for v83, v84 in l_bundleInfo_0 do
                    if v84.assetType == v38.AssetTypeIdStrings.DynamicHead then
                        v79 = v83;
                    end;
                end;
            end;
        end;
    end;
    local v85, v86 = v4.useState(true);
    local v87 = v4.useRef(false);
    local v88 = v4.useMemo(function() --[[ Line: 154 ]]
        -- upvalues: v76 (copy), v3 (ref), l_TryOnItems_0 (copy)
        return v76 or not v3.isEmpty(l_TryOnItems_0);
    end, {
        v76, 
        l_TryOnItems_0
    });
    local v89 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 160 ]]
        -- upvalues: l_sendAXCounterV2_0 (ref), l_Counters_0 (ref)
        l_sendAXCounterV2_0(l_Counters_0.Enter);
    end, {});
    v4.useEffect(function() --[[ Line: 165 ]]
        -- upvalues: v3 (ref), v71 (copy), v63 (copy), v65 (copy), v87 (copy), v64 (copy), l_GetUserOwnedClassicHeads_0 (ref), l_sendAXCounterV2_0 (ref), v86 (copy)
        if v3.isEmpty(v71) and v63 and v65 and not v87.current then
            v64(l_GetUserOwnedClassicHeads_0(v63, v65, l_sendAXCounterV2_0));
            v87.current = true;
            return;
        else
            v86(false);
            return;
        end;
    end, {
        v71, 
        v63, 
        v65
    });
    local v90 = if l_FFlagDynamicHeadsMigration_0 then v43(false) else nil;
    local v91 = if l_FFlagDynamicHeadsMigration_0 and v90 then v6.useSignalState(v90.getInventory) else nil;
    local v92 = v4.useMemo(function() --[[ Line: 181 ]]
        -- upvalues: l_FFlagDynamicHeadsMigration_0 (ref), l_HeadShapeProperties_0 (ref), v91 (copy), l_FFlagAXAddFacesToHeadList_0 (ref), v78 (copy), l_FFlagAXFixTryOnHeadShapeThumbnail_0 (ref), v79 (ref)
        if l_FFlagDynamicHeadsMigration_0 then
            return l_HeadShapeProperties_0.fromInventory(v91, if l_FFlagAXAddFacesToHeadList_0 then v78 else nil, if l_FFlagAXFixTryOnHeadShapeThumbnail_0 then v79 else nil);
        else
            return l_HeadShapeProperties_0;
        end;
    end, {
        v91, 
        if l_FFlagAXFixTryOnHeadShapeThumbnail_0 then v79 else nil, 
        if l_FFlagAXFixTryOnHeadShapeThumbnail_0 then v78 else nil
    });
    local v93 = v4.useMemo(function() --[[ Line: 199 ]]
        -- upvalues: l_getEquippedHeadShapeName_0 (ref), v66 (copy), v38 (ref)
        return l_getEquippedHeadShapeName_0(v66, v38.AssetTypeIdStrings.Head);
    end, {
        v66
    });
    local v94 = v4.useMemo(function() --[[ Line: 204 ]]
        -- upvalues: l_getDefaultSelectedHeadShapeName_0 (ref), v88 (copy), v93 (copy), v73 (copy), v66 (copy), v72 (copy), l_HeadShape_0 (ref)
        return l_getDefaultSelectedHeadShapeName_0({
            isTryingOnItems = v88, 
            equippedHeadShapeName = v93, 
            lastTryOnHeadShapeName = v73, 
            equippedAssets = v66, 
            defaultHeadShapeName = v72 or l_HeadShape_0.Default
        });
    end, {
        v88, 
        v93, 
        v73, 
        v66, 
        v72
    });
    local v95 = l_useSelector_0(v40);
    local v96 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v95 == nil or not v95 else nil;
    local v104 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v4.useMemo(function() --[[ Line: 224 ]]
        -- upvalues: v66 (copy), v38 (ref), l_TryOnItems_0 (copy)
        if v66 then
            local v97 = v66[v38.AssetTypeIdStrings.DynamicHead];
            if v97 then
                for v98, _ in v97 do
                    return (tostring(v98));
                end;
            end;
        end;
        if l_TryOnItems_0 then
            for _, v101 in l_TryOnItems_0 do
                if v101.bundleInfo then
                    for v102, v103 in v101.bundleInfo do
                        if v103.assetType == v38.AssetTypeIdStrings.DynamicHead then
                            return (tostring(v102));
                        end;
                    end;
                elseif v101.itemSubType == v38.AssetTypeIdStrings.DynamicHead then
                    return (tostring(v101.itemId));
                end;
            end;
        end;
        return nil;
    end, {
        v66, 
        l_TryOnItems_0
    }) else nil;
    local v106 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v4.useCallback(function(v105) --[[ Line: 252 ]]
        -- upvalues: v104 (copy), l_FFlagAXLogFacialAnimationToggle_0 (ref), l_sendUnifiedEventLog_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), l_HttpService_0 (ref), v96 (copy), v64 (copy), l_SetStaticFacialAnimation_0 (ref)
        if v104 then
            if l_FFlagAXLogFacialAnimationToggle_0 then
                l_sendUnifiedEventLog_0({
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "FACIAL_ANIMATION_TOGGLE", 
                    surface = l_UnifiedLoggingSurface_0.CUSTOMIZE, 
                    itemId = v104, 
                    elementMetadata = l_HttpService_0:JSONEncode({
                        trigger = "MANUAL_TOGGLE", 
                        change_from_FACS_status = tostring(v96), 
                        change_to_FACS_status = tostring(v105)
                    })
                });
            end;
            v64(l_SetStaticFacialAnimation_0(not v105, v104));
        end;
    end, {
        v64, 
        v104, 
        v96
    }) else nil;
    local v118 = if l_FFlagDynamicHeadsMigration_0 then v4.useMemo(function() --[[ Line: 295 ]]
        -- upvalues: v88 (copy), v3 (ref), l_TryOnItems_0 (copy), v38 (ref), v69 (copy), v70 (copy), v36 (ref), v66 (copy)
        if v88 and not v3.isEmpty(l_TryOnItems_0) then
            for _, v108 in l_TryOnItems_0 do
                if v108.itemSubType == v38.AssetTypeIdStrings.DynamicHead then
                    local v109 = if v69 and v108.itemId then v69[tostring(v108.itemId)] else nil;
                    if v109 and v109.supportsHeadShapes then
                        return true;
                    end;
                end;
                if v108.itemType == v38.ItemType.Bundle and v108.itemSubType == v38.BundleTypeIdStrings.DynamicHead and v108.bundleInfo then
                    for v110, _ in v108.bundleInfo do
                        local v112 = if v69 then v69[tostring(v110)] else nil;
                        if v112 and v112.supportsHeadShapes then
                            return true;
                        end;
                    end;
                    if v70 and v70[v108.itemId] then
                        local v113 = v70[v108.itemId];
                        if v113 and v113.supportsHeadShapes then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
        if v88 and not v3.isEmpty(l_TryOnItems_0) and v36.isTryingOnDynamicHead(l_TryOnItems_0) then
            return false;
        else
            local v114 = if v66 then v66[v38.AssetTypeIdStrings.DynamicHead] else nil;
            if v114 then
                for v115, _ in v114 do
                    local v117 = if v69 then v69[v115] else nil;
                    if v117 and v117.supportsHeadShapes then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, {
        v88, 
        l_TryOnItems_0, 
        v66, 
        v69, 
        v70
    }) else nil;
    local v125 = v4.useMemo(function() --[[ Line: 365 ]]
        -- upvalues: l_FFlagDynamicHeadsMigration_0 (ref), v5 (ref), v92 (copy), v71 (copy), v94 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref), v88 (copy), v64 (copy), l_SetDynamicHeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), v22 (ref), v38 (ref), l_SetLastSelectedHeadShape_0 (ref)
        local v119 = if l_FFlagDynamicHeadsMigration_0 then v5.keys(v92) else v71;
        local v120 = {};
        for _, v122 in v119 do
            local v123 = v92[v122];
            if v123 then
                table.insert(v120, {
                    headShapeName = v122, 
                    headShapeData = v123, 
                    isSelected = v94 == v122, 
                    onActivated = function() --[[ Line: 381 ]] --[[ Name: onActivated ]]
                        -- upvalues: v123 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref), v122 (copy), v88 (ref), l_FFlagDynamicHeadsMigration_0 (ref), v64 (ref), l_SetDynamicHeadShape_0 (ref), l_TryOnClassicHeadShape_0 (ref), v22 (ref), v38 (ref), l_SetLastSelectedHeadShape_0 (ref)
                        local l_assetId_0 = v123.assetId;
                        l_sendAXCounterV2_0(l_Counters_0.HeadShapeSelect, {
                            headShapeName = v122 or "none", 
                            isTryingOnItems = v88 and "true" or "false"
                        });
                        if l_FFlagDynamicHeadsMigration_0 then
                            v64(l_SetDynamicHeadShape_0(v122, (tostring(l_assetId_0))));
                        elseif v88 then
                            v64(l_TryOnClassicHeadShape_0(v122));
                        else
                            v64(v22(v38.AssetTypeIdStrings.Head, (tostring(l_assetId_0))));
                        end;
                        if l_FFlagDynamicHeadsMigration_0 then
                            v64(l_SetLastSelectedHeadShape_0(v122));
                            return;
                        else
                            v64(l_SetLastSelectedHeadShape_0(v122));
                            return;
                        end;
                    end
                });
            end;
        end;
        return v120;
    end, {
        v71, 
        v94, 
        v64, 
        v88, 
        v92, 
        v118
    });
    local v131 = if l_FFlagRemoveClassicHeadsAndFaces_0 then v4.useMemo(function() --[[ Line: 420 ]]
        -- upvalues: v88 (copy), l_LookId_0 (copy), l_FFlagDynamicHeadsMigration_0 (ref), v37 (ref), v66 (copy), v118 (copy), v73 (copy), v36 (ref), l_TryOnItems_0 (copy), v38 (ref), v69 (copy)
        if v88 and l_LookId_0 ~= nil then
            return true;
        elseif l_FFlagDynamicHeadsMigration_0 and v37.isDynamicHeadEquipped(v66) then
            return not v118;
        elseif v88 then
            if v73 then
                return false;
            else
                local v126 = v36.isTryingOnDynamicHead(l_TryOnItems_0);
                local v127 = l_LookId_0 ~= nil;
                if v126 then
                    return not v118;
                elseif v127 then
                    for _, v129 in l_TryOnItems_0 do
                        if v129.itemSubType == v38.AssetTypeIdStrings.DynamicHead then
                            local v130 = if v69 and v129.itemId then v69[tostring(v129.itemId)] else nil;
                            if not v130 or not v130.supportsHeadShapes then
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
        v66, 
        l_TryOnItems_0, 
        v88, 
        l_LookId_0, 
        v73, 
        v118, 
        v69
    }) else v4.useMemo(function() --[[ Line: 469 ]]
        -- upvalues: v88 (copy), v36 (ref), l_TryOnItems_0 (copy), l_LookId_0 (copy), v73 (copy), v37 (ref), v66 (copy)
        if v88 then
            if v36.isTryingOnDynamicHead(l_TryOnItems_0) or l_LookId_0 ~= nil then
                return true;
            elseif v73 then
                return false;
            end;
        end;
        return v37.isDynamicHeadEquipped(v66);
    end, {
        v66, 
        l_TryOnItems_0, 
        v88, 
        l_LookId_0, 
        v73
    });
    v4.useEffect(function() --[[ Line: 485 ]]
        -- upvalues: v131 (copy), v89 (copy), l_sendAXCounterV2_0 (ref), l_Counters_0 (ref)
        if v131 and not v89.current then
            v89.current = true;
            l_sendAXCounterV2_0(l_Counters_0.Unsupported);
        end;
    end, {
        v131
    });
    return v125, v131, v85, v96, v106;
end;