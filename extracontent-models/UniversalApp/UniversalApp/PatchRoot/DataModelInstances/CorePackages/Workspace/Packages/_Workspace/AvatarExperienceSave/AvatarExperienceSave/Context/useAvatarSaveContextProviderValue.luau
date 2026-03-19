local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AvatarExperienceCommon);
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.Signals);
local v7 = require(l_Parent_0.ToastRodux);
local v8 = require(l_Parent_0.tutils);
local v9 = require(l_Parent_0.Navigation);
local v10 = require(l_Parent_0.RoactNavigation);
local v11 = require(l_Parent_0.AvatarExperienceNavigation);
local v12 = require(l_Parent_0.AvatarExperienceFlags);
local v13 = require(l_Parent_0.NavigationRodux);
local v14 = require(l_Parent_0.RobloxAppEnums);
local v15 = require(l_Parent_0.Promise);
local l_useSelectorSignal_0 = v3.Hooks.useSelectorSignal;
local l_useSignal_0 = v3.Hooks.useSignal;
local l_useComputedSignal_0 = v3.Hooks.useComputedSignal;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = v9.useNavigation;
local _ = require(script.Parent.AvatarSaveContext);
local v22 = require(l_script_FirstAncestor_0.Enums.SaveStatusEnum);
local l_ToastType_0 = v7.Enums.ToastType;
local l_Actions_0 = v10.Actions;
local l_AvatarScreen_0 = v11.Enums.AvatarScreen;
local l_AppPage_0 = v14.AppPage;
local l_CustomGetStateForAction_0 = v11.Enums.CustomGetStateForAction;
local v28 = require(l_script_FirstAncestor_0.Requests.saveAvatar);
local l_SetCurrentToastMessage_0 = v7.Actions.SetCurrentToastMessage;
local l_CharacterHistoryStateChangeButtonActivated_0 = v3.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_RegisterCustomGetStateForAction_0 = v11.Actions.RegisterCustomGetStateForAction;
local v32 = require(l_script_FirstAncestor_0.Utils.shouldInsertNewHistoryEntry);
local v33 = require(l_script_FirstAncestor_0.Utils.shouldReplaceLastHistoryEntry);
local v34 = require(l_script_FirstAncestor_0.Utils.getSaveDict);
local v35 = require(l_script_FirstAncestor_0.Utils.checkHasChangesToSave);
local v36 = require(l_script_FirstAncestor_0.Utils.getInvalidAssetIdsToAssetTypeIdMap);
local v37 = require(l_script_FirstAncestor_0.Utils.removeInvalidAssetsFromCharacterData);
local v38 = require(l_script_FirstAncestor_0.Utils.checkCharacterDataHasTryOnItems);
local v39 = require(l_script_FirstAncestor_0.Selectors.selectCharacterData);
local v40 = require(l_script_FirstAncestor_0.Selectors.selectHasAvatarData);
local l_NavigateToRoute_0 = v13.Thunks.NavigateToRoute;
local l_buildHumanoidDescription_0 = v3.Utils.buildHumanoidDescription;
local l_getGearAssetIdFromEquippedAssets_0 = v3.Utils.getGearAssetIdFromEquippedAssets;
local l_getAssetIdToAssetTypeIdFromHumanoidDescription_0 = v3.Utils.getAssetIdToAssetTypeIdFromHumanoidDescription;
local v45 = game:DefineFastInt("FIntAXMinSaveIntervalSeconds", 2);
local v46 = game:DefineFastInt("AXMaxUndoRedoHistory", 20);
local v47 = game:DefineFastFlag("AXEnableMaxUndoRedoHistory", false);
local l_FFlagAXAvatarTimeoutFlow_0 = v12.FFlagAXAvatarTimeoutFlow;
local l_FFlagAXEnableManualSavingBlockingPrompt_0 = v12.FFlagAXEnableManualSavingBlockingPrompt;
local l_FFlagAXUpdateSaveStrings_0 = v12.FFlagAXUpdateSaveStrings;
local l_FFlagAXCustomizeMakeupSupport_0 = v12.FFlagAXCustomizeMakeupSupport;
local v52 = {
    toastMessage = "Feature.Avatar.Message.SaveThrottled", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v53 = {
    toastMessage = "Feature.Avatar.Message.SaveSuccessWithInvalidAssets", 
    isLocalized = false, 
    toastType = l_ToastType_0.SuccessConfirmation
};
local v54 = {
    toastMessage = "Feature.Avatar.Message.SaveSuccess", 
    isLocalized = false, 
    toastType = l_ToastType_0.SuccessConfirmation
};
local v55 = if l_FFlagAXUpdateSaveStrings_0 then {
    toastMessage = "Feature.Avatar.Message.SaveFailure", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
} else {
    toastMessage = "Your avatar could not be saved. Please try again later.", 
    isLocalized = true, 
    toastType = l_ToastType_0.InformationMessage
};
local v56 = {
    Home = l_AppPage_0.Home, 
    More = l_AppPage_0.More, 
    Chat = l_AppPage_0.Chat, 
    Games = l_AppPage_0.Games
};
local function _(v57) --[[ Line: 100 ]] --[[ Name: buildHumanoidDescriptionForCharacterData ]]
    -- upvalues: l_buildHumanoidDescription_0 (copy)
    return l_buildHumanoidDescription_0({
        currentAssets = v57.equipped.EquippedAssets, 
        avatarScales = v57.equipped.AvatarScales, 
        bodyColor3s = v57.equipped.BodyColor3s, 
        emotesSlotInfo = v57.equipped.EquippedEmotes.slotInfo
    });
end;
return function() --[[ Line: 111 ]] --[[ Name: useAvatarSaveContextProviderValue ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useSelectorSignal_0 (copy), v39 (copy), v8 (copy), v40 (copy), l_useSignal_0 (copy), v2 (copy), v6 (copy), v32 (copy), v4 (copy), v47 (copy), v46 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v33 (copy), v37 (copy), v3 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), l_useComputedSignal_0 (copy), v22 (copy), v35 (copy), v38 (copy), v36 (copy), l_getAssetIdToAssetTypeIdFromHumanoidDescription_0 (copy), l_SetCurrentToastMessage_0 (copy), v54 (copy), v53 (copy), l_CharacterHistoryStateChangeButtonActivated_0 (copy), v52 (copy), v55 (copy), v15 (copy), v45 (copy), l_buildHumanoidDescription_0 (copy), v34 (copy), l_getGearAssetIdFromEquippedAssets_0 (copy), v28 (copy), l_FFlagAXEnableManualSavingBlockingPrompt_0 (copy), l_NavigateToRoute_0 (copy), l_Actions_0 (copy), l_AvatarScreen_0 (copy), v56 (copy), v5 (copy), l_RegisterCustomGetStateForAction_0 (copy), l_CustomGetStateForAction_0 (copy)
    local v59 = l_useDispatch_0();
    local v60 = l_useNavigation_0();
    local v61 = l_useSelectorSignal_0(v39, v8.deepEqual);
    local v62 = l_useSelectorSignal_0(v40);
    local v63, v64 = l_useSignal_0({});
    local v65, v66 = l_useSignal_0(0);
    local v67, v68 = l_useSignal_0(nil);
    local v69, v70 = l_useSignal_0(nil);
    local v71, v72 = l_useSignal_0(0);
    local v73, v74 = l_useSignal_0(false);
    v2.useEffect(function() --[[ Line: 133 ]]
        -- upvalues: v6 (ref), v62 (copy), v61 (copy), v63 (copy), v8 (ref), v64 (copy), v66 (copy), v68 (copy), v70 (copy), v72 (copy)
        return v6.createEffect(function(v75) --[[ Line: 134 ]]
            -- upvalues: v62 (ref), v61 (ref), v63 (ref), v8 (ref), v64 (ref), v66 (ref), v68 (ref), v70 (ref), v72 (ref)
            local v76 = v62(v75);
            local v77 = v61(v75);
            local v78 = v63(false);
            local v79 = v77.equipped.BodyPartRangeIds and v8.fieldCount(v77.equipped.BodyPartRangeIds) > 0;
            if v76 and v79 and #v78 == 0 then
                v64({
                    v77
                });
                v66(1);
                v68(v77);
                v70(nil);
                v72(0);
            end;
        end);
    end, {});
    v2.useEffect(function() --[[ Line: 157 ]]
        -- upvalues: v6 (ref), v61 (copy), v63 (copy), v65 (copy), v32 (ref), v4 (ref), v47 (ref), v46 (ref), v64 (copy), v66 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v33 (ref)
        return v6.createEffect(function(v80) --[[ Line: 158 ]]
            -- upvalues: v61 (ref), v63 (ref), v65 (ref), v32 (ref), v4 (ref), v47 (ref), v46 (ref), v64 (ref), v66 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v33 (ref)
            local v81 = v61(v80);
            local v82 = v63(false);
            local v83 = v65(false);
            local v84 = v82[v83] or v81;
            if v32(v84, v81) and #v82 > 0 then
                local v85 = v4.slice(v82, 1, v83);
                table.insert(v85, v81);
                if v47 then
                    local v86 = v83 + 1;
                    if #v85 > v46 then
                        table.remove(v85, 1);
                        v86 = v86 - 1;
                    end;
                    v64(v85);
                    v66(v86);
                    return;
                else
                    v64(v85);
                    v66(v83 + 1);
                    return;
                end;
            else
                if l_FFlagAXCustomizeMakeupSupport_0 and v33(v84, v81) and #v82 > 0 then
                    local v87 = v4.slice(v82);
                    v87[v83] = v81;
                    v64(v87);
                    v66(v83);
                end;
                return;
            end;
        end);
    end, {});
    local v90 = v2.useCallback(function(v88) --[[ Line: 195 ]]
        -- upvalues: v63 (copy), v66 (copy)
        local v89 = v63(false);
        if v88 < 1 or #v89 < v88 then
            return nil;
        else
            v66(v88);
            return v89[v88];
        end;
    end, {
        v63, 
        v66
    });
    local v97 = v2.useCallback(function(v91) --[[ Line: 212 ]]
        -- upvalues: v63 (copy), v65 (copy), v37 (ref), v64 (copy)
        local v92 = v63(false);
        local v93 = v65(false);
        local v94 = v92[v93];
        if not v94 then
            return nil;
        else
            local v95, v96 = v37(v94, v91);
            if v96 then
                v92[v93] = v95;
                v64(v92);
                return v95;
            else
                return nil;
            end;
        end;
    end, {
        v63, 
        v64, 
        v66
    });
    local l_getTimeoutStatusStore_0 = v3.Stores.getTimeoutStatusStore;
    local v99 = if l_FFlagAXAvatarTimeoutFlow_0 then l_getTimeoutStatusStore_0() else nil;
    local v106 = l_useComputedSignal_0(function(v100) --[[ Line: 234 ]]
        -- upvalues: l_FFlagAXAvatarTimeoutFlow_0 (ref), v99 (copy), v22 (ref), v63 (copy), v65 (copy), v67 (copy), v69 (copy), v35 (ref), v38 (ref)
        if l_FFlagAXAvatarTimeoutFlow_0 and v99 and v99.getIsTimedOut(v100) then
            return v22.TimedOut;
        else
            local v101 = v63(v100);
            local v102 = v65(v100);
            local v103 = v67(v100);
            local v104 = v69(v100);
            local v105 = v101[v102];
            if not v105 or not v103 then
                return v22.NoData;
            elseif v104 then
                return v22.Saving;
            elseif v103 and not v35(v105, v103) then
                return v22.AlreadySaved;
            elseif v38(v105) then
                return v22.HasTryOns;
            else
                return v22.Eligible;
            end;
        end;
    end);
    local v116 = v2.useCallback(function(v107, v108, v109, _, v111) --[[ Line: 264 ]]
        -- upvalues: v22 (ref), v36 (ref), l_getAssetIdToAssetTypeIdFromHumanoidDescription_0 (ref), v97 (copy), v37 (ref), v68 (copy), v70 (copy), v59 (copy), l_SetCurrentToastMessage_0 (ref), v54 (ref), v53 (ref), l_CharacterHistoryStateChangeButtonActivated_0 (ref)
        local l_v109_0 = v109;
        local l_Success_0 = v22.Success;
        local v114 = nil;
        if v111.Assets then
            local v115 = v36(l_getAssetIdToAssetTypeIdFromHumanoidDescription_0(v107), l_getAssetIdToAssetTypeIdFromHumanoidDescription_0(v108));
            v114 = v97(v115);
            l_v109_0 = v37(l_v109_0, v115);
        end;
        v68(l_v109_0);
        v70(nil);
        if v114 ~= nil then
            l_Success_0 = v22.SuccessWithInvalidAssets;
        end;
        if l_Success_0 == v22.Success then
            v59(l_SetCurrentToastMessage_0(v54));
        elseif l_Success_0 == v22.SuccessWithInvalidAssets then
            v59(l_SetCurrentToastMessage_0(v53));
        end;
        if v114 then
            v59(l_CharacterHistoryStateChangeButtonActivated_0(v114));
        end;
        return l_Success_0;
    end, {
        v63, 
        v65, 
        v68, 
        v70, 
        v97
    });
    local v118 = v2.useCallback(function(v117) --[[ Line: 316 ]]
        -- upvalues: v70 (copy), v22 (ref), v59 (copy), l_SetCurrentToastMessage_0 (ref), v52 (ref), v55 (ref)
        v70(nil);
        if v117 == v22.Throttled then
            v59(l_SetCurrentToastMessage_0(v52));
            return;
        else
            v59(l_SetCurrentToastMessage_0(v55));
            return;
        end;
    end, {
        v70, 
        v59
    });
    local v132 = v2.useCallback(function() --[[ Line: 326 ]]
        -- upvalues: v15 (ref), l_FFlagAXAvatarTimeoutFlow_0 (ref), v99 (copy), v118 (copy), v22 (ref), v63 (copy), v65 (copy), v67 (copy), v71 (copy), v45 (ref), v70 (copy), v72 (copy), l_buildHumanoidDescription_0 (ref), v34 (ref), l_getGearAssetIdFromEquippedAssets_0 (ref), v28 (ref), v74 (copy), v116 (copy)
        return v15.new(function(v119, v120) --[[ Line: 327 ]]
            -- upvalues: l_FFlagAXAvatarTimeoutFlow_0 (ref), v99 (ref), v118 (ref), v22 (ref), v63 (ref), v65 (ref), v67 (ref), v71 (ref), v45 (ref), v70 (ref), v72 (ref), l_buildHumanoidDescription_0 (ref), v34 (ref), l_getGearAssetIdFromEquippedAssets_0 (ref), v28 (ref), v74 (ref), v116 (ref)
            if l_FFlagAXAvatarTimeoutFlow_0 and v99 and v99.getIsTimedOut(false) then
                v118(v22.TimedOut);
                v120();
                return;
            else
                local v121 = v63(false);
                local v122 = v65(false);
                local v123 = v67(false);
                local v124 = v121[v122];
                if v124 and v123 then
                    local v125 = v71(false);
                    if v125 > 0 and os.time() - v125 < v45 then
                        v118(v22.Throttled);
                        return;
                    else
                        v70(v124);
                        v72(os.time());
                        local v126 = l_buildHumanoidDescription_0({
                            currentAssets = v124.equipped.EquippedAssets, 
                            avatarScales = v124.equipped.AvatarScales, 
                            bodyColor3s = v124.equipped.BodyColor3s, 
                            emotesSlotInfo = v124.equipped.EquippedEmotes.slotInfo
                        });
                        local v127 = Enum.HumanoidRigType[v124.equipped.AvatarType];
                        local v128 = v34(v124, v123);
                        local v129 = l_getGearAssetIdFromEquippedAssets_0(v124.equipped.EquippedAssets);
                        v28(v126, v127, v128, v129):andThen(function(v130) --[[ Line: 358 ]]
                            -- upvalues: v74 (ref), v116 (ref), v126 (copy), v124 (copy), v123 (copy), v128 (copy), v119 (copy)
                            v74(false);
                            v116(v126, v130.humanoidDescriptionWithValidAssets, v124, v123, v128);
                            v119();
                        end):catch(function(v131) --[[ Line: 370 ]]
                            -- upvalues: v74 (ref), l_FFlagAXAvatarTimeoutFlow_0 (ref), v99 (ref), v118 (ref), v22 (ref), v120 (copy)
                            v74(false);
                            if l_FFlagAXAvatarTimeoutFlow_0 and v99 and v131 and v131.avatarPromptResult == Enum.AvatarPromptResult.PermissionDenied then
                                v99.fetchStatus();
                            end;
                            v118(v22.Failure);
                            v120();
                        end);
                    end;
                end;
                return;
            end;
        end);
    end, {
        if l_FFlagAXAvatarTimeoutFlow_0 then v99 else nil, 
        v63, 
        v65, 
        v68, 
        v70, 
        v72, 
        v97, 
        if l_FFlagAXAvatarTimeoutFlow_0 then v118 else nil, 
        v74
    });
    if l_FFlagAXEnableManualSavingBlockingPrompt_0 then
        local v134 = v2.useCallback(function(v133) --[[ Line: 402 ]]
            -- upvalues: v132 (copy), v59 (copy), l_NavigateToRoute_0 (ref)
            return function() --[[ Line: 403 ]]
                -- upvalues: v132 (ref), v59 (ref), l_NavigateToRoute_0 (ref), v133 (copy)
                v132():finally(function() --[[ Line: 404 ]]
                    -- upvalues: v59 (ref), l_NavigateToRoute_0 (ref), v133 (ref)
                    v59(l_NavigateToRoute_0({
                        {
                            name = v133, 
                            skipSaveBlockingPrompt = true
                        }
                    }));
                end);
            end;
        end, {
            v132, 
            v59
        });
        local v137 = v2.useCallback(function(v135) --[[ Line: 410 ]]
            -- upvalues: v67 (copy), v59 (copy), l_CharacterHistoryStateChangeButtonActivated_0 (ref), l_NavigateToRoute_0 (ref)
            return function() --[[ Line: 411 ]]
                -- upvalues: v67 (ref), v59 (ref), l_CharacterHistoryStateChangeButtonActivated_0 (ref), l_NavigateToRoute_0 (ref), v135 (copy)
                task.spawn(function() --[[ Line: 412 ]]
                    -- upvalues: v67 (ref), v59 (ref), l_CharacterHistoryStateChangeButtonActivated_0 (ref), l_NavigateToRoute_0 (ref), v135 (ref)
                    local v136 = v67(false);
                    v59(l_CharacterHistoryStateChangeButtonActivated_0(v136));
                    task.wait();
                    v59(l_NavigateToRoute_0({
                        {
                            name = v135, 
                            skipSaveBlockingPrompt = true
                        }
                    }));
                end);
            end;
        end, {
            v59, 
            v67
        });
        local l_v134_0 = v134 --[[ copy: 24 -> 27 ]];
        local v144 = v2.useCallback(function(v139, v140) --[[ Line: 429 ]]
            -- upvalues: l_Actions_0 (ref), l_AvatarScreen_0 (ref), v56 (ref), v8 (ref), v106 (copy), v22 (ref), v5 (ref), l_v134_0 (copy), v137 (copy)
            local l_routeName_0 = (v139 or {}).routeName;
            local l_params_0 = (v139 or {}).params;
            if v139.type == l_Actions_0.Back and not v139.immediate and v140.routes[#v140.routes] and v140.routes[#v140.routes].routeName == l_AvatarScreen_0.SaveAvatarOnLeaveAvatarExperiencePrompt then
                return true, nil;
            elseif v139.type == l_Actions_0.Navigate and v56[l_routeName_0] ~= nil and (l_params_0 == nil or v8.fieldCount(l_params_0) == 0) and v106(false) == v22.Eligible then
                if v140.routes[#v140.routes] and v140.routes[#v140.routes].routeName == l_AvatarScreen_0.SaveAvatarOnLeaveAvatarExperiencePrompt then
                    return true, nil;
                else
                    local v143 = v5.List.join(v140.routes, {
                        {
                            key = l_AvatarScreen_0.SaveAvatarOnLeaveAvatarExperiencePrompt, 
                            routeName = l_AvatarScreen_0.SaveAvatarOnLeaveAvatarExperiencePrompt, 
                            params = {
                                saveAndContinue = l_v134_0(l_routeName_0), 
                                continueWithoutSave = v137(l_routeName_0)
                            }
                        }
                    });
                    return true, v5.Dictionary.join(v140, {
                        routes = v143, 
                        index = #v143
                    });
                end;
            else
                return false, nil;
            end;
        end, {
            v106, 
            v134, 
            v137
        });
        v2.useEffect(function() --[[ Line: 492 ]]
            -- upvalues: v60 (copy), l_RegisterCustomGetStateForAction_0 (ref), l_CustomGetStateForAction_0 (ref), v144 (copy)
            v60.dispatch(l_RegisterCustomGetStateForAction_0(l_CustomGetStateForAction_0.HandlerId.BlockAXExitOnUnsavedChanges, v144));
        end, {
            v60, 
            v144
        });
    end;
    v2.useEffect(function() --[[ Line: 505 ]]
        -- upvalues: v6 (ref), v63 (copy), v73 (copy), v106 (copy), v22 (ref), v132 (copy)
        return v6.createEffect(function(v145) --[[ Line: 506 ]]
            -- upvalues: v63 (ref), v73 (ref), v106 (ref), v22 (ref), v132 (ref)
            local v146 = v63(v145);
            if v146[#v146] and v73(false) then
                local v147 = v106(false);
                if v147 == v22.Eligible or v147 == v22.HasTryOns then
                    v132();
                end;
            end;
        end);
    end, {});
    local v148 = v2.useCallback(function() --[[ Line: 523 ]]
        -- upvalues: v74 (copy)
        v74(true);
    end, {
        v74
    });
    return v2.useMemo(function() --[[ Line: 528 ]]
        -- upvalues: v63 (copy), v65 (copy), v90 (copy), v67 (copy), v106 (copy), v132 (copy), v148 (copy)
        return {
            getHistorySignal = v63, 
            getCurrentHistoryIndexSignal = v65, 
            updateHistoryIndexAndGetCharacterData = v90, 
            getLastSuccessfullySavedStateSignal = v67, 
            getSaveEligibilityStatusSignal = v106, 
            trySaveAvatar = v132, 
            autoSaveNextNewSaveData = v148
        };
    end, {
        v63, 
        v65, 
        v90, 
        v67, 
        v106, 
        v132, 
        v148
    });
end;