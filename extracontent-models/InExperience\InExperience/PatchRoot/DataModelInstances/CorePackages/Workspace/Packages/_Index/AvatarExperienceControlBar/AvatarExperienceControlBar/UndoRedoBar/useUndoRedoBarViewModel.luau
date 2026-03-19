local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AvatarExperienceSave);
local v4 = require(l_Parent_0.AvatarExperienceCommon);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.Navigation);
local v7 = require(l_Parent_0.AvatarExperienceNavigation);
local v8 = require(l_Parent_0.AvatarExperienceAnalytics);
local v9 = require(l_Parent_0.AvatarExperienceFlags);
local v10 = require(l_Parent_0.Foundation);
local v11 = require(l_Parent_0.ToastRodux);
local v12 = require(l_Parent_0.tutils);
local l_IconName_0 = v10.Enums.IconName;
local l_FFlagAXExtendUndoRedoTracking_0 = v9.FFlagAXExtendUndoRedoTracking;
local l_FFlagAXMigrateBuilderIcons_0 = v9.FFlagAXMigrateBuilderIcons;
local l_FFlagAXResetAvatarButton_0 = v9.FFlagAXResetAvatarButton;
local l_FFlagDynamicHeadsMigration_0 = v9.FFlagDynamicHeadsMigration;
local l_SlotBasedEditorAnalytics_0 = v8.Surfaces.SlotBasedEditorAnalytics;
local l_SetCurrentToastMessage_0 = v11.Actions.SetCurrentToastMessage;
local l_ToastType_0 = v11.Enums.ToastType;
local l_useSelectorSignal_0 = v4.Hooks.useSelectorSignal;
local l_useTokens_0 = v10.Hooks.useTokens;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useAvatarSaveContext_0 = v3.Context.useAvatarSaveContext;
local l_useNavigation_0 = v6.useNavigation;
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local l_CharacterHistoryStateChangeButtonActivated_0 = v4.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_ClearScreens_0 = v7.Actions.ClearScreens;
local l_FFlagAXMISEnableMultiShopping_0 = v9.FFlagAXMISEnableMultiShopping;
local v31 = require(l_script_FirstAncestor_0.Enums.MenuItemEnum);
local v32 = if l_FFlagAXResetAvatarButton_0 then v3.Selectors.selectCharacterData else nil;
local l_ClearTryOns_0 = require(l_Parent_0.AvatarExperienceCommon).State.Actions.ClearTryOns;
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local v35 = require(l_script_FirstAncestor_0.Constants);
local v36 = if l_FFlagAXResetAvatarButton_0 then {
    toastMessage = "Feature.Avatar.Message.OutfitCleared", 
    isLocalized = false, 
    toastType = l_ToastType_0.SuccessConfirmation
} else nil;
return function() --[[ Line: 61 ]] --[[ Name: useUndoRedoBarViewModel ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_useTokens_0 (copy), l_useAvatarSaveContext_0 (copy), l_FFlagAXResetAvatarButton_0 (copy), l_useSelectorSignal_0 (copy), v32 (copy), v12 (copy), l_FFlagAXExtendUndoRedoTracking_0 (copy), l_useAvatarRoute_0 (copy), v5 (copy), v2 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v35 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_CharacterHistoryStateChangeButtonActivated_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_AvatarScreen_0 (copy), l_ClearScreens_0 (copy), l_ClearTryOns_0 (copy), l_SetCurrentToastMessage_0 (copy), v36 (copy), v31 (copy), l_IconName_0 (copy)
    local v37 = l_useNavigation_0();
    local v38 = l_useDispatch_0();
    local v39 = if l_FFlagAXMigrateBuilderIcons_0 then l_useTokens_0() else nil;
    local v40 = l_useAvatarSaveContext_0();
    local l_getHistorySignal_0 = v40.getHistorySignal;
    local l_getCurrentHistoryIndexSignal_0 = v40.getCurrentHistoryIndexSignal;
    local v43 = if l_FFlagAXResetAvatarButton_0 then l_useSelectorSignal_0(v32, v12.deepEqual) else nil;
    local v44 = if l_FFlagAXExtendUndoRedoTracking_0 then l_useAvatarRoute_0() else nil;
    local v45 = v5.useSignalState(l_getHistorySignal_0);
    local v46 = v5.useSignalState(l_getCurrentHistoryIndexSignal_0);
    local v47 = if l_FFlagAXResetAvatarButton_0 then v5.useSignalState(v43) else nil;
    local v49 = v2.useMemo(function() --[[ Line: 86 ]]
        -- upvalues: v46 (copy), v45 (copy)
        local l_v46_0 = v46;
        if l_v46_0 and v45 then
            return l_v46_0 == 1;
        else
            return true;
        end;
    end, {
        v46, 
        v45
    });
    local v51 = v2.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v46 (copy), v45 (copy)
        local l_v46_1 = v46;
        if l_v46_1 and v45 then
            return l_v46_1 == #v45;
        else
            return true;
        end;
    end, {
        v46, 
        v45
    });
    local v54 = if l_FFlagAXResetAvatarButton_0 then v2.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: l_FFlagDynamicHeadsMigration_0 (ref), v47 (copy), v35 (ref)
        if l_FFlagDynamicHeadsMigration_0 then
            if v47 and v47.tryOn and v47.tryOn.OutfitTryOn and next(v47.tryOn.OutfitTryOn.TryOnItems) ~= nil then
                return false;
            elseif not v47 or not v47.equipped or not v47.equipped.EquippedAssets then
                return true;
            else
                for v52 in v47.equipped.EquippedAssets do
                    if table.find(v35.AssetTypeStringsToKeep, v52) == nil then
                        return false;
                    end;
                end;
                return true;
            end;
        elseif next(v47.tryOn.OutfitTryOn.TryOnItems) ~= nil then
            return false;
        else
            for v53 in v47.equipped.EquippedAssets do
                if table.find(v35.AssetTypeStringsToKeep, v53) == nil then
                    return false;
                end;
            end;
            return true;
        end;
    end, {
        v47, 
        v45
    }) else nil;
    local v57 = v2.useCallback(function(v55) --[[ Line: 142 ]]
        -- upvalues: v40 (copy), v46 (copy), l_SlotBasedEditorAnalytics_0 (ref), l_FFlagAXExtendUndoRedoTracking_0 (ref), v44 (copy), v38 (copy), l_CharacterHistoryStateChangeButtonActivated_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v37 (copy), l_AvatarScreen_0 (ref), l_ClearScreens_0 (ref)
        if v40 then
            local v56 = v40.updateHistoryIndexAndGetCharacterData(v46 + (v55 and -1 or 1));
            if v56 then
                l_SlotBasedEditorAnalytics_0.trackUndoRedoClick(v55, if l_FFlagAXExtendUndoRedoTracking_0 and v44 and v44.opaque then v44.opaque.name else nil);
                v38(l_CharacterHistoryStateChangeButtonActivated_0({
                    isUndo = v55, 
                    equipped = v56.equipped, 
                    tryOn = v56.tryOn
                }));
                if v56.tryOn.OutfitTryOn and v56.tryOn.OutfitTryOn.LookId ~= nil and v56.tryOn.OutfitTryOn.LookId ~= "" and not l_FFlagAXMISEnableMultiShopping_0 then
                    v37.navigate(l_AvatarScreen_0.LookDetails);
                    return;
                else
                    v37.dispatch(l_ClearScreens_0({
                        l_AvatarScreen_0.LookDetails
                    }));
                end;
            end;
        end;
    end, {
        v38, 
        v40, 
        v46, 
        v37, 
        v44, 
        v45
    });
    local v62 = if l_FFlagAXResetAvatarButton_0 then v2.useCallback(function() --[[ Line: 179 ]]
        -- upvalues: v43 (copy), l_SlotBasedEditorAnalytics_0 (ref), v44 (copy), v35 (ref), v38 (copy), l_CharacterHistoryStateChangeButtonActivated_0 (ref), l_ClearTryOns_0 (ref), l_SetCurrentToastMessage_0 (ref), v36 (ref)
        local v58 = v43(false);
        if v58 then
            if l_SlotBasedEditorAnalytics_0.trackAvatarRemoveAllClick and v44 and v44.opaque then
                l_SlotBasedEditorAnalytics_0.trackAvatarRemoveAllClick(v44.opaque.name);
            end;
            local v59 = {};
            for _, v61 in v35.AssetTypeStringsToKeep do
                v59[v61] = v58.equipped.EquippedAssets[v61];
            end;
            v58.equipped.EquippedAssets = v59;
            v38(l_CharacterHistoryStateChangeButtonActivated_0(v58));
            v38(l_ClearTryOns_0());
            v38(l_SetCurrentToastMessage_0(v36));
        end;
    end, {
        v38
    }) else nil;
    if l_FFlagAXExtendUndoRedoTracking_0 then
        v2.useEffect(function() --[[ Line: 209 ]]
            -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v44 (copy), v45 (copy)
            if l_SlotBasedEditorAnalytics_0.trackUndoHistoryCount and v44 and v44.opaque and v45 and #v45 then
                l_SlotBasedEditorAnalytics_0.trackUndoHistoryCount(v44.opaque.name, #v45);
            end;
        end, {
            v45, 
            v44
        });
    end;
    return {
        items = v2.useMemo(function() --[[ Line: 224 ]]
            -- upvalues: l_FFlagAXResetAvatarButton_0 (ref), v31 (ref), l_IconName_0 (ref), v39 (copy), v62 (copy), v54 (copy), l_FFlagAXMigrateBuilderIcons_0 (ref), v57 (copy), v49 (copy), v51 (copy)
            if l_FFlagAXResetAvatarButton_0 then
                return {
                    {
                        type = "icon", 
                        id = v31.Reset.Reset, 
                        icon = l_IconName_0.ArrowSpinClockwise, 
                        iconSize = v39.Size.Size_500, 
                        isActive = false, 
                        onActivated = function() --[[ Line: 233 ]] --[[ Name: onActivated ]]
                            -- upvalues: v62 (ref)
                            v62();
                        end, 
                        disabled = v54
                    }, 
                    {
                        type = "icon", 
                        id = v31.Undo, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ArrowCurlToLeft else "icons/actions/edit/undo", 
                        onActivated = function() --[[ Line: 244 ]] --[[ Name: onActivated ]]
                            -- upvalues: v57 (ref)
                            v57(true);
                        end, 
                        disabled = v49, 
                        isActive = false
                    }, 
                    {
                        type = "icon", 
                        id = v31.Redo, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ArrowCurlToRight else "icons/actions/edit/redo", 
                        onActivated = function() --[[ Line: 256 ]] --[[ Name: onActivated ]]
                            -- upvalues: v57 (ref)
                            v57(false);
                        end, 
                        disabled = v51, 
                        isActive = false
                    }
                };
            else
                return {
                    {
                        type = "icon", 
                        id = v31.Undo, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ArrowCurlToLeft else "icons/actions/edit/undo", 
                        onActivated = function() --[[ Line: 271 ]] --[[ Name: onActivated ]]
                            -- upvalues: v57 (ref)
                            v57(true);
                        end, 
                        disabled = v49, 
                        isActive = false
                    }, 
                    {
                        type = "icon", 
                        id = v31.Redo, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.ArrowCurlToRight else "icons/actions/edit/redo", 
                        onActivated = function() --[[ Line: 283 ]] --[[ Name: onActivated ]]
                            -- upvalues: v57 (ref)
                            v57(false);
                        end, 
                        disabled = v51, 
                        isActive = false
                    }
                };
            end;
        end, if l_FFlagAXResetAvatarButton_0 then {
            v49, 
            v51, 
            v54, 
            v57, 
            v62
        } else {
            v49, 
            v51, 
            v57
        })
    };
end;