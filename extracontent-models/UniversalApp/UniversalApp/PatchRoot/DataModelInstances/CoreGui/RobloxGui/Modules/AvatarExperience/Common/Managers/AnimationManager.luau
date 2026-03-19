local l_CoreGui_0 = game:GetService("CoreGui");
local l_InsertService_0 = game:GetService("InsertService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v7 = require(l_Modules_0.AvatarExperience.Common.Managers.PPEAnimationUtils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManagerTypes);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.PlayingSwimAnimation);
local v15 = require(l_Modules_0.LuaApp.mutedError);
local v16 = require(l_CorePackages_0.Packages.Promise);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v20 = require(l_CorePackages_0.Packages.Dash);
local v21 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectShouldPlayMoodAnimationsUsingOutfitTryOn);
local v22 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectIsToolEquipped);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMoodAnimationAssetId);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnIdleAnimationAssetId);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId);
local v26 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_AnimationTrackWithConnectionsTypes_0 = v9.AnimationTrackWithConnectionsTypes;
local l_AssetTypeIdStrings_0 = v11.AssetTypeIdStrings;
local v30 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v31 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.init");
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v34 = {
    EnteredAX = "EnteredAX", 
    NewEquippedAssets = "NewEquippedAssets", 
    NewOutfitTryOn = "NewOutfitTryOn"
};
local v35 = {};
v35.__index = v35;
v35.new = function(v36, v37, v38) --[[ Line: 314 ]] --[[ Name: new ]]
    -- upvalues: v35 (copy), v8 (copy), l_InsertService_0 (copy)
    local v39 = {};
    setmetatable(v39, v35);
    v39.destroyed = false;
    v39.started = false;
    v39.store = v36;
    v39.avatarRoute = v38;
    v39.animationTrackWithConnectionsByType = {};
    v39.unresolvedStateTransitions = {};
    v39.shouldMoveToNextValidMainBodyAnimation = false;
    v39.stoppedButNotEndedATWCsByName = {};
    local v40 = v8.createR6AnimationFolder();
    local v41 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/animations/humanoidR15AnimateChildren.rbxm");
    v39.animationTrackNameIndex = 0;
    v8.createAnimation(v41, "Tool", v8.DefaultAnimations.R15.TOOL);
    v8.createAnimation(v8.createStringValue(v41, "wave"), "WaveAnim", v8.DefaultAnimations.R15.WAVE_EMOTE);
    v40.Name = "Animations";
    v41.Name = "Animations";
    v37:setupAnimations(v40, v41);
    v39.currentStateDigest = {};
    v39.currentAssetIdsToLoad = {};
    v39.currentLoadedAssets = {};
    v39.debugLoadAssetsFromFiles = false;
    v39.stateSummaryAtLastVersionUpdate = {
        equippedAssetsSummary = {}, 
        outfitTryOnSummary = {}
    };
    v39.equippedAssetsSummaryTriggeringLookAround = {};
    v39.outfitTryOnSummaryTriggeringLookAround = {};
    return v39;
end;
v35.setToolManager = function(v42, v43) --[[ Line: 363 ]] --[[ Name: setToolManager ]]
    v42.toolManager = v43;
end;
v35.start = function(v44) --[[ Line: 367 ]] --[[ Name: start ]]
    -- upvalues: v15 (copy), l_Logging_0 (copy)
    if v44.started then
        v15("calling AnimationManager:start when already started");
        return;
    else
        v44.started = true;
        v44.shouldMoveToNextValidMainBodyAnimation = false;
        v44:cleanupAllAnimationTracks();
        v44.storeChangedConnection = v44.store.changed:connect(function(v45, v46) --[[ Line: 377 ]]
            -- upvalues: v44 (copy)
            local l_avatarRoute_0 = v44.avatarRoute;
            v44:update(v45, v46, l_avatarRoute_0, l_avatarRoute_0);
        end);
        if not v44.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
            l_Logging_0.warn("Tried to start AnimationManager without a character!");
            return;
        else
            return;
        end;
    end;
end;
v35.stop = function(v48) --[[ Line: 389 ]] --[[ Name: stop ]]
    -- upvalues: v15 (copy)
    if not v48.started then
        v15("calling AnimationManager:stop when not started");
        return;
    else
        v48.started = false;
        if v48.loadAssetsPromise then
            v48.loadAssetsPromise:cancel();
        end;
        v48:cleanupAllAnimationTracks();
        if v48.storeChangedConnection then
            v48.storeChangedConnection:disconnect();
            v48.storeChangedConnection = nil;
        end;
        return;
    end;
end;
v35.onDestroy = function(v49) --[[ Line: 411 ]] --[[ Name: onDestroy ]]
    if v49.loadAssetsPromise then
        v49.loadAssetsPromise:cancel();
    end;
    v49.destroyed = true;
end;
v35.updateAvatarRoute = function(v50, v51, v52) --[[ Line: 420 ]] --[[ Name: updateAvatarRoute ]]
    v50.avatarRoute = v51;
    local v53 = v50.store:getState();
    v50:update(v53, v53, v51, v52);
end;
v35.updateCategorySelection = function(v54) --[[ Line: 426 ]] --[[ Name: updateCategorySelection ]]
    local v55 = v54.store:getState();
    v54:update(v55, v55, v54.avatarRoute, v54.avatarRoute);
end;
v35.update = function(v56, v57, v58, v59, v60) --[[ Line: 432 ]] --[[ Name: update ]]
    -- upvalues: v20 (copy), v16 (copy), l_Logging_0 (copy)
    if not v57.AvatarExperience.AvatarScene.Character.CurrentCharacter then
        if v56.onUpdateFinished then
            v56.onUpdateFinished(nil, nil, nil, nil);
        end;
        return;
    else
        local v61 = v56:createStateDigest(v57, v59);
        local v62 = v56:createStateTransitions(v57, v58, v59, v60);
        local v63 = v56:getAssetIdsToLoad(v61, v57);
        local v64 = v20.shallowEqual(v56.currentStateDigest, v61);
        local v65 = v20.shallowEqual(v56.currentAssetIdsToLoad, v63);
        v56.currentStateDigest = v61;
        v56.currentAssetIdsToLoad = v63;
        for v66, v67 in pairs(v62) do
            if v67 then
                v56.unresolvedStateTransitions[v66] = v67;
            end;
        end;
        local v68 = false;
        for _, v70 in pairs(v56.unresolvedStateTransitions) do
            if v70 then
                v68 = true;
                break;
            end;
        end;
        if v64 and v65 and not v68 then
            if v56.onUpdateFinished then
                v56.onUpdateFinished(v62, v61, v63, nil);
            end;
            return;
        else
            if v56.loadAssetsPromise then
                if not v64 or not v65 then
                    v56.loadAssetsPromise:cancel();
                    v56.loadAssetsPromise = nil;
                else
                    assert(v68, "hasUnresolvedTransition should be true");
                    if v56.onUpdateFinished then
                        v56.onUpdateFinished(v62, v61, v63, nil);
                    end;
                    return;
                end;
            end;
            assert(v56.loadAssetsPromise == nil, "self.loadAssetsPromise should be nil");
            v56.loadAssetsPromise = v56:makeLoadAssetsPromise(v61, v63);
            v56.loadAssetsPromise:andThen(function(v71) --[[ Line: 514 ]]
                -- upvalues: v56 (copy), v20 (ref), v61 (copy), v63 (copy), v62 (copy), v16 (ref)
                v56.loadAssetsPromise = nil;
                v56.currentLoadedAssets = v71;
                if v56.destroyed then
                    return;
                else
                    assert(v20.shallowEqual(v56.currentStateDigest, v61), "stateDigest should match");
                    assert(v20.shallowEqual(v56.currentAssetIdsToLoad, v63), "assetIdsToLoad should match");
                    v56:playLoadedAssets(v61, v63, v71);
                    if v56.onUpdateFinished then
                        v56.onUpdateFinished(v62, v61, v63, v71);
                    end;
                    return v16.resolve();
                end;
            end):catch(function(v72) --[[ Line: 537 ]]
                -- upvalues: v56 (copy), l_Logging_0 (ref), v62 (copy), v61 (copy), v63 (copy)
                v56.loadAssetsPromise = nil;
                l_Logging_0.warn("Error in loadAssetsPromise: " .. tostring(v72));
                if v56.onUpdateFinished then
                    v56.onUpdateFinished(v62, v61, v63, {});
                end;
            end);
            return;
        end;
    end;
end;
v35.createStateTransitions = function(v73, v74, v75, v76, v77) --[[ Line: 547 ]] --[[ Name: createStateTransitions ]]
    -- upvalues: v12 (copy), v8 (copy)
    local l_CurrentCharacter_0 = v74.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local l_CurrentCharacter_1 = v75.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_0, "currentCharacter should be non-nil. Silence type checker.");
    local v80 = v12.routeIsProfilePictureEditor(v76);
    local v81 = v12.routeIsProfilePictureEditor(v77);
    local l_isVisible_0 = v76.isVisible;
    local v83 = l_CurrentCharacter_0 ~= l_CurrentCharacter_1;
    local v84 = v8.getDidMoveOutOfPPE(v81, v80, l_isVisible_0);
    local v85 = v73:getDidSomethingThatShouldTriggerLookAround(l_CurrentCharacter_0, v74, v75, v76, v77);
    return {
        didUpdateCharacter = v83, 
        didMoveOutOfPPE = v84, 
        didSomethingThatShouldTriggerLookAround = v85
    };
end;
v35.shouldResumeLookAroundAfterCharacterSwap = function(v86, v87, v88, v89, v90, v91) --[[ Line: 589 ]] --[[ Name: shouldResumeLookAroundAfterCharacterSwap ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy), v34 (copy), v8 (copy)
    if not (v88 ~= v89) then
        return false;
    elseif not v86:animationTrackWithConnectionsIsPlaying(l_AnimationTrackWithConnectionsTypes_0.LookAround) then
        return false;
    elseif v86.lookAroundReason == v34.EnteredAX and v87 then
        return true;
    elseif v86.lookAroundReason == v34.NewEquippedAssets and v8.getEquippedAssetSummariesMatch(v90, v86.equippedAssetsSummaryTriggeringLookAround) then
        return true;
    else
        if v86.lookAroundReason == v34.NewOutfitTryOn then
            assert(v86.outfitTryOnSummaryTriggeringLookAround, "self.outfitTryOnSummaryTriggeringLookAround should be non-nil");
            if v8.getOutfitTryOnSummariesMatch(v91, v86.outfitTryOnSummaryTriggeringLookAround) then
                return true;
            end;
        end;
        return false;
    end;
end;
v35.getDidSomethingThatShouldTriggerLookAround = function(v92, v93, v94, v95, v96, v97) --[[ Line: 654 ]] --[[ Name: getDidSomethingThatShouldTriggerLookAround ]]
    -- upvalues: v8 (copy), v12 (copy), v34 (copy)
    local v98 = v8.getHumanoidFromCharacter(v93);
    if not v98 then
        return false;
    else
        assert(v98, "humanoid should not be nil. Silence type checker");
        if Enum.HumanoidRigType.R15 ~= v98.RigType then
            return false;
        elseif v12.routeIsProfilePictureEditor(v96) then
            return false;
        else
            local l_isVisible_1 = v96.isVisible;
            local l_isVisible_2 = v97.isVisible;
            if l_isVisible_1 and not l_isVisible_2 then
                v92.lookAroundReason = v34.EnteredAX;
                return true;
            else
                local l_CurrentCharacter_2 = v95.AvatarExperience.AvatarScene.Character.CurrentCharacter;
                local l_CharacterVersion_0 = v94.AvatarExperience.AvatarScene.Character.CharacterVersion;
                local l_CharacterVersion_1 = v95.AvatarExperience.AvatarScene.Character.CharacterVersion;
                local l_EquippedAssets_0 = v94.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                local l_OutfitTryOn_0 = v94.AvatarExperience.AvatarScene.OutfitTryOn;
                local v106 = l_CharacterVersion_1 ~= l_CharacterVersion_0;
                local v107 = v8.getEquippedAssetsSummary(l_EquippedAssets_0);
                local v108 = v8.getOutfitTryOnSummary(l_OutfitTryOn_0);
                local l_equippedAssetsSummary_0 = v92.stateSummaryAtLastVersionUpdate.equippedAssetsSummary;
                local l_outfitTryOnSummary_0 = v92.stateSummaryAtLastVersionUpdate.outfitTryOnSummary;
                if v106 then
                    v92.stateSummaryAtLastVersionUpdate.equippedAssetsSummary = v107;
                    v92.stateSummaryAtLastVersionUpdate.outfitTryOnSummary = v108;
                    if v8.getEquippedAssetsSummaryHasNewItems(v107, l_equippedAssetsSummary_0) then
                        v92.lookAroundReason = v34.NewEquippedAssets;
                        v92.equippedAssetsSummaryTriggeringLookAround = v107;
                        return true;
                    elseif v8.getOutfitTryOnSummaryHasNewItems(v108, l_outfitTryOnSummary_0) then
                        v92.lookAroundReason = v34.NewOutfitTryOn;
                        v92.outfitTryOnSummaryTriggeringLookAround = v108;
                        return true;
                    end;
                end;
                if v92:shouldResumeLookAroundAfterCharacterSwap(l_isVisible_1, v93, l_CurrentCharacter_2, v107, v108) then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
v35.createStateDigest = function(v111, v112, v113) --[[ Line: 758 ]] --[[ Name: createStateDigest ]]
    -- upvalues: v12 (copy), v8 (copy), v11 (copy), l_AvatarScreen_0 (copy), v32 (copy), v10 (copy), v21 (copy), v26 (copy), v13 (copy), v30 (copy), v22 (copy)
    local l_name_0 = v113.opaque.name;
    local v115 = v12.getCategoryInfoFromState(v112, v113);
    local v116, v117 = v8.getAllowsTryingEmotesOrAnimations(v112, v113);
    local v118 = false;
    if v115.PageType == v11.PageType.Emotes then
        v118 = l_name_0 == l_AvatarScreen_0.AvatarEditor;
    end;
    if v32() then
        v118 = v118 or l_name_0 == l_AvatarScreen_0.EditEmotes;
    end;
    local v119 = false;
    if v115.PageType == v11.PageType.Animation then
        v119 = l_name_0 == l_AvatarScreen_0.AvatarEditor;
    end;
    local v120 = l_name_0 == l_AvatarScreen_0.AdjustAccessoryView;
    local v121 = nil;
    v121 = v112.AvatarExperience.AvatarEditor.Character.AvatarType ~= v10.AvatarType.R6 and v21(v112);
    local v122 = v12.routeIsProfilePictureEditor(v113);
    local v123 = false;
    if v122 and l_name_0 == l_AvatarScreen_0.ProfilePictureEditorFinal and v112.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == v26.FullBody then
        v123 = true;
    end;
    local v124 = false;
    local l_CurrentCharacter_3 = v111.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_3 and l_CurrentCharacter_3:FindFirstChildOfClass("Tool") then
        v124 = true;
    end;
    local v126 = v115.CanAnimateCameraBasedMood == true;
    local v127, v128 = v8.canPlayCameraBasedMoodAnimation(v112, v126, v116);
    local v129 = v13.readTestVariable(v30.EnabledForUser);
    return {
        isInPPE = v122, 
        isInAX = v113.isVisible, 
        toolEquipped = v22(v112), 
        curCategoryInfo = v115, 
        isAvatarBackground = v12.isAvatarBackground(v113.current.name), 
        pageAllowsForTryingOnEmotes = v116, 
        pageAllowsForTryingOnAnimations = v117, 
        pageHasBothAnimsAndEmotes = v116 and v117, 
        pageIsEditorEmotes = v118, 
        pageIsEditorAnimations = v119, 
        excludeIdleAnimation = v120, 
        shouldPlayMoodAnimations = v121, 
        canPlayCameraBasedMoodAnimation = if v129 then v127 else nil, 
        receivedOutfitInfo = if v129 then v128 else nil, 
        ppeFinalPageFullView = v123, 
        hasTool = v124, 
        cameraButtonEnabled = if v129 then v112.AvatarExperience.CameraButton.enabled else nil
    };
end;
v35.getAssetIdsToLoad = function(v130, v131, v132) --[[ Line: 843 ]] --[[ Name: getAssetIdsToLoad ]]
    -- upvalues: v7 (copy), v23 (copy), v18 (copy)
    if v131.isInPPE then
        return v7.getAssetIdsToLoad(v132, v131.shouldPlayMoodAnimations);
    else
        local v133 = {};
        if v131.shouldPlayMoodAnimations then
            local v134 = v23(v132);
            if v134 then
                v133.moodAssetId = v134;
            else
                v133.moodAssetId = v18.getEquippedMoodAssetId(v132);
            end;
        end;
        v133.mainBodyAssetId = v130:getMainBodyAssetId(v131, v132);
        return v133;
    end;
end;
v35.getMainBodyAssetId = function(v135, v136, v137) --[[ Line: 872 ]] --[[ Name: getMainBodyAssetId ]]
    -- upvalues: v10 (copy), v8 (copy)
    if v137.AvatarExperience.AvatarEditor.Character.AvatarType == v10.AvatarType.R6 then
        return nil;
    elseif v136.isAvatarBackground then
        return v135:getAvatarBackgroundAssetId(v137);
    else
        local v138 = v135:getTryOnMainBodyAssetId(v136, v137);
        if v138 then
            return v138;
        else
            if v136.pageIsEditorEmotes then
                local v139 = v137.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo[v137.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot];
                if v139 and v139.assetId then
                    return v139.assetId;
                end;
            end;
            if v136.pageIsEditorAnimations then
                local v140 = v8.getAssetTypeIdStringForCategory(v136.curCategoryInfo);
                if v140 then
                    local l_EquippedAssets_1 = v137.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                    local v142 = l_EquippedAssets_1 and l_EquippedAssets_1[v140];
                    local v143 = v142 and next(v142) or nil;
                    if v143 then
                        return v143;
                    else
                        return nil;
                    end;
                end;
            end;
            local v144 = v8.getEquippedIdleAnimation(v137);
            if v144 then
                return v144;
            else
                return nil;
            end;
        end;
    end;
end;
v35.getAvatarBackgroundAssetId = function(_, v146) --[[ Line: 934 ]] --[[ Name: getAvatarBackgroundAssetId ]]
    -- upvalues: v8 (copy)
    if not v146.AvatarExperience.Common.PlayEmoteInBackground.shouldPlayEmoteInBackground then
        return nil;
    else
        for _, v148 in v146.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo do
            if v148.assetId then
                return v148.assetId;
            end;
        end;
        local v149 = v8.getEquippedIdleAnimation(v146);
        if v149 then
            return v149;
        else
            return nil;
        end;
    end;
end;
v35.getTryOnMainBodyAssetId = function(_, v151, v152) --[[ Line: 962 ]] --[[ Name: getTryOnMainBodyAssetId ]]
    -- upvalues: v25 (copy), l_AssetTypeIdStrings_0 (copy), v24 (copy)
    local l_TryOn_0 = v152.AvatarExperience.AvatarScene.TryOn;
    local l_OutfitTryOn_1 = v152.AvatarExperience.AvatarScene.OutfitTryOn;
    if v151.pageAllowsForTryingOnEmotes then
        local v155 = v25(v152);
        if v155 then
            if v151.pageHasBothAnimsAndEmotes then
                local l_LastAnimOrEmoteToggledItem_0 = l_OutfitTryOn_1.LastAnimOrEmoteToggledItem;
                if l_LastAnimOrEmoteToggledItem_0 and l_LastAnimOrEmoteToggledItem_0.itemId == v155 then
                    return v155;
                end;
            else
                return v155;
            end;
        end;
    end;
    if v151.pageAllowsForTryingOnAnimations and l_TryOn_0.AnimationPreview and l_TryOn_0.AnimationPreviewAssetTypeIdString ~= l_AssetTypeIdStrings_0.EmoteAnimation then
        return l_TryOn_0.AnimationPreview;
    else
        local v157 = v24(v152);
        if v157 then
            return v157;
        else
            return nil;
        end;
    end;
end;
v35.getMultiTryOnTriedOnEmote = function(_, v159) --[[ Line: 1026 ]] --[[ Name: getMultiTryOnTriedOnEmote ]]
    -- upvalues: l_AssetTypeIdStrings_0 (copy)
    for _, v161 in v159.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v161.itemSubType == l_AssetTypeIdStrings_0.EmoteAnimation then
            return v161.itemId;
        end;
    end;
    return nil;
end;
v35.makeLoadAssetsPromise = function(v162, v163, v164) --[[ Line: 1037 ]] --[[ Name: makeLoadAssetsPromise ]]
    -- upvalues: v16 (copy), v7 (copy), v8 (copy), v20 (copy), l_ContentProvider_0 (copy)
    return v16.new(function(v165, _, v167) --[[ Line: 1041 ]]
        -- upvalues: v7 (ref), v162 (copy), v163 (copy), v164 (copy), v8 (ref), v20 (ref), l_ContentProvider_0 (ref)
        v167(function() --[[ Line: 1042 ]]
            -- upvalues: v7 (ref), v162 (ref)
            v7.maybeNoteLoadingFinished(v162.store);
        end);
        if v163.isInPPE then
            v165(v7.makeLoadedAssets(v162.store, v163, v164));
            return;
        else
            local v168 = {};
            if v164.moodAssetId then
                v168.moodAnimStringValues = v8.loadAnimStringValuesFromString(v164.moodAssetId, v162.debugLoadAssetsFromFiles, v162.mapAssetIdToFileName);
            end;
            if v164.mainBodyAssetId then
                v168.mainBodyAnimStringValues = v8.loadAnimStringValuesFromString(v164.mainBodyAssetId, v162.debugLoadAssetsFromFiles, v162.mapAssetIdToFileName);
            end;
            local v169 = {};
            if v168.moodAnimStringValues then
                v20.append(v169, v168.moodAnimStringValues);
            end;
            if v168.mainBodyAnimStringValues then
                v20.append(v169, v168.mainBodyAnimStringValues);
            end;
            if #v169 > 0 and not v162.debugLoadAssetsFromFiles then
                l_ContentProvider_0:PreloadAsync(v169);
            end;
            v165(v168);
            return;
        end;
    end);
end;
v35.playLoadedAssets = function(v170, v171, v172, v173) --[[ Line: 1094 ]] --[[ Name: playLoadedAssets ]]
    -- upvalues: v8 (copy), v7 (copy), v13 (copy), v30 (copy)
    if v170.unresolvedStateTransitions.didUpdateCharacter then
        v170:cleanupAllAnimationTracks();
        v170.unresolvedStateTransitions.didUpdateCharacter = false;
    end;
    if v171.isInPPE then
        v170:stopAnimationsAndMaybeProceedWithPPEPosing();
        return;
    else
        if v170.unresolvedStateTransitions.didMoveOutOfPPE then
            local l_CurrentCharacter_4 = v170.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
            local v175 = v8.getHumanoidFromCharacter(l_CurrentCharacter_4);
            v7.undoOldProfilePictureEditorPose(v170.store, l_CurrentCharacter_4, v175);
        end;
        v170.unresolvedStateTransitions.didMoveOutOfPPE = false;
        v170:updateToolAnimation(v171);
        v170:updateMoodAnimation(v171, v172, v173);
        if v13.readTestVariable(v30.EnabledForUser) then
            v170:updateCameraBasedMoodAnimation(v171);
        end;
        if v170.unresolvedStateTransitions.didSomethingThatShouldTriggerLookAround then
            v170:updateMainBodyAnimationAfterPlayingLookAround(v171, v172, v173);
        else
            v170:updateMainBodyAnimation(v171, v172, v173);
        end;
        v170.unresolvedStateTransitions.didSomethingThatShouldTriggerLookAround = false;
        return;
    end;
end;
v35.cleanupAllAnimationTracks = function(v176) --[[ Line: 1142 ]] --[[ Name: cleanupAllAnimationTracks ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy), v8 (copy)
    for _, v178 in pairs(l_AnimationTrackWithConnectionsTypes_0) do
        v8.cleanupAnimationTrackWithConnections(v176.animationTrackWithConnectionsByType[v178]);
        v176.animationTrackWithConnectionsByType[v178] = nil;
    end;
    for _, v180 in v176.stoppedButNotEndedATWCsByName do
        v8.cleanupAnimationTrackWithConnections(v180);
    end;
    v176.stoppedButNotEndedATWCsByName = {};
end;
v35.stopAnimationsAndMaybeProceedWithPPEPosing = function(v181) --[[ Line: 1163 ]] --[[ Name: stopAnimationsAndMaybeProceedWithPPEPosing ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy)
    assert(v181.currentStateDigest.isInPPE, "Must be in PPE");
    assert(v181.currentStateDigest.isInAX, "Must be in in AX");
    for _, v183 in pairs(l_AnimationTrackWithConnectionsTypes_0) do
        v181:stopAnimationTrackWithConnections(v183, 0.02);
    end;
    v181:maybeProceedWithPPEPosing();
end;
v35.maybeProceedWithPPEPosing = function(v184) --[[ Line: 1182 ]] --[[ Name: maybeProceedWithPPEPosing ]]
    -- upvalues: v8 (copy), v7 (copy)
    local function v187() --[[ Line: 1183 ]] --[[ Name: maybeProceedWithPPEPosingInner ]]
        -- upvalues: v184 (copy), v8 (ref), v7 (ref)
        if not v184.currentStateDigest.isInPPE then
            return;
        elseif not v184.currentStateDigest.isInAX then
            return;
        elseif v184.loadAssetsPromise then
            return;
        elseif v184:animationsAreMovingAvatar() then
            return;
        else
            local l_CurrentCharacter_5 = v184.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
            if l_CurrentCharacter_5 then
                local v186 = v8.getHumanoidFromCharacter(l_CurrentCharacter_5);
                if v186 then
                    v7.applyNewProfilePictureEditorPose(v184.store, l_CurrentCharacter_5, v186, v184.currentLoadedAssets.keyframesForPose);
                end;
            end;
            return;
        end;
    end;
    v8.waitForAnimationAndPosingToResolve(function() --[[ Line: 1222 ]]
        -- upvalues: v187 (copy)
        v187();
    end);
end;
v35.animationTrackWithConnectionsIsPlaying = function(v188, v189) --[[ Line: 1227 ]] --[[ Name: animationTrackWithConnectionsIsPlaying ]]
    -- upvalues: v8 (copy)
    local v190 = v188.animationTrackWithConnectionsByType[v189];
    if v190 then
        return v8.animationTrackWithConnectionsIsPlaying(v190);
    else
        return false;
    end;
end;
v35.animationsAreMovingAvatar = function(v191) --[[ Line: 1235 ]] --[[ Name: animationsAreMovingAvatar ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy)
    for _, v193 in pairs(l_AnimationTrackWithConnectionsTypes_0) do
        if v191:animationTrackWithConnectionsIsPlaying(v193) then
            return true;
        end;
    end;
    if next(v191.stoppedButNotEndedATWCsByName) then
        return true;
    else
        return false;
    end;
end;
v35.updateToolAnimation = function(v194, v195) --[[ Line: 1261 ]] --[[ Name: updateToolAnimation ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy), v8 (copy), v18 (copy)
    assert(not v195.isInPPE, "Should not be in PPE");
    if not v195.toolEquipped then
        v194:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.ToolHold);
        return;
    else
        local l_CurrentCharacter_6 = v194.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
        local l_Animations_0 = l_CurrentCharacter_6.Animations;
        local v198 = nil;
        local v199 = nil;
        local v200 = nil;
        if l_Animations_0 then
            v198 = l_Animations_0.Tool;
            if v198 then
                v199 = v8.animatorLoadAnimationTrack(l_CurrentCharacter_6, v198, v194.debugLoadAssetsFromFiles);
                v200 = v18.getAssetIdFromContent(v198.AnimationId);
            end;
        end;
        if not v200 or not v199 then
            v194:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.ToolHold);
            return;
        else
            assert(v200, "newToolAnimationAssetId is not nil. Silence type checker");
            local v201 = v194.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.ToolHold];
            if v8.animationTrackWithConnectionsIsPlayingThisAssetId(v201, v200) then
                return;
            else
                v194:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.ToolHold);
                assert(v199, "toolHoldAnimationTrack is not nil. Silence type checker");
                assert(v200, "newToolAnimationAssetId should be non-nil");
                local v202 = {
                    assetId = v200
                };
                v202.stoppedConnection = v199.Stopped:Connect(function() --[[ Line: 1316 ]]
                    -- upvalues: v194 (copy), v199 (ref), v202 (copy)
                    v194:handleStoppedConnection(v199, v202);
                end);
                v202.endedConnection = v199.Ended:Connect(function() --[[ Line: 1319 ]]
                    -- upvalues: v194 (copy), v199 (ref)
                    v194:handleEndedConnection(v199);
                end);
                v202.animationTrack = v199;
                v202.animationTrack.Name = v194:getNextAnimationTrackName("ToolHold");
                v194.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.ToolHold] = v202;
                v199:Play(0.1);
                v194:recordAnimationTrackProgress(v202.animationTrack.Name, "Playing");
                return;
            end;
        end;
    end;
end;
v35.updateMoodAnimation = function(v203, v204, v205, v206) --[[ Line: 1346 ]] --[[ Name: updateMoodAnimation ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy), v8 (copy)
    assert(not v204.isInPPE, "Should not be in PPE");
    if v205.moodAssetId == nil or v206.moodAnimStringValues == nil then
        v203:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.Mood);
        return;
    else
        assert(v205.moodAssetId, "assetIdsToLoad.moodAssetId is non-nil. Silence type checker");
        assert(v206.moodAnimStringValues, "loadedAssets.moodAnimStringValues is non-nil. Silence type checker");
        local v207 = v203.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.Mood];
        if v8.animationTrackWithConnectionsIsPlayingThisAssetId(v207, v205.moodAssetId) then
            return;
        else
            v203:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.Mood);
            assert(v206.moodAnimStringValues, "loadedAssets.moodAnimStringValues is not nil.  Silences type checker");
            local v208 = nil;
            local v209 = nil;
            if v206.moodAnimStringValues[1] then
                v209 = v206.moodAnimStringValues[1]:GetChildren();
            end;
            if v209 then
                local v210 = v209[1];
                if v210 then
                    assert(v210.ClassName == "Animation", "moodAnim should be an animation.");
                    local l_CurrentCharacter_7 = v203.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
                    v208 = v8.animatorLoadAnimationTrack(l_CurrentCharacter_7, v210, v203.debugLoadAssetsFromFiles);
                end;
            end;
            if not v208 then
                return;
            else
                assert(v208, "moodAnimationTrack is not nil. Silences type checker");
                local v212 = {
                    assetId = v205.moodAssetId
                };
                v212.stoppedConnection = v208.Stopped:Connect(function() --[[ Line: 1406 ]]
                    -- upvalues: v203 (copy), v208 (ref), v212 (copy)
                    v203:handleStoppedConnection(v208, v212);
                end);
                v212.endedConnection = v208.Ended:Connect(function() --[[ Line: 1409 ]]
                    -- upvalues: v203 (copy), v208 (ref)
                    v203:handleEndedConnection(v208);
                end);
                v212.animationTrack = v208;
                v212.animationTrack.Name = v203:getNextAnimationTrackName("Mood");
                assert(v203.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.Mood] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.Mood] should be empty");
                v203.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.Mood] = v212;
                v208:Play();
                v203:recordAnimationTrackProgress(v212.animationTrack.Name, "Playing");
                return;
            end;
        end;
    end;
end;
v35.updateCameraBasedMoodAnimation = function(v213, v214) --[[ Line: 1441 ]] --[[ Name: updateCameraBasedMoodAnimation ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy), l_FaceAnimatorService_0 (copy), v8 (copy)
    assert(not v214.isInPPE, "Should not be in PPE");
    local v215 = v213.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.CameraStream];
    if not v214.cameraButtonEnabled then
        v213:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.CameraStream);
        l_FaceAnimatorService_0:Stop();
        return;
    else
        if v215 then
            if v214.receivedOutfitInfo and not v214.canPlayCameraBasedMoodAnimation then
                v8.adjustATWCWeight(v215, 1.0E-4);
                return;
            elseif v8.animationTrackWithConnectionsIsPlaying(v215) then
                v8.adjustATWCWeight(v215, 1);
                return;
            end;
        end;
        v213:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.CameraStream);
        local v216 = {};
        local l_CurrentCharacter_8 = v213.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
        local v218 = v8.animatorLoadTrackerStreamAnimationTrack(l_CurrentCharacter_8, Instance.new("TrackerStreamAnimation"), v213.debugLoadAssetsFromFiles);
        assert(v218, "cameraBasedMoodAnimationTrack is not nil. If it is ever nil, it should be investigated if a dependent flag is missing");
        v216.animationTrack = v218;
        v216.animationTrack.Name = v213:getNextAnimationTrackName("CameraBasedMoodAnimation");
        v216.stoppedConnection = v218.Stopped:Connect(function() --[[ Line: 1484 ]]
            -- upvalues: v213 (copy), v218 (copy), v216 (copy)
            v213:handleStoppedConnection(v218, v216);
            v213:handleEndedConnection(v218);
        end);
        v218.Priority = Enum.AnimationPriority.Action4;
        assert(v213.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.CameraStream] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.CameraStream] should be empty");
        v213.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.CameraStream] = v216;
        v218:Play();
        v213:recordAnimationTrackProgress(v216.animationTrack.Name, "Playing");
        if v214.receivedOutfitInfo and not v214.canPlayCameraBasedMoodAnimation then
            v8.adjustATWCWeight(v216, 1.0E-4);
        end;
        return;
    end;
end;
v35.updateMainBodyAnimationAfterPlayingLookAround = function(v219, v220, v221, v222) --[[ Line: 1516 ]] --[[ Name: updateMainBodyAnimationAfterPlayingLookAround ]]
    -- upvalues: v8 (copy), l_AnimationTrackWithConnectionsTypes_0 (copy)
    assert(not v220.isInPPE, "Should not be in PPE");
    local l_mainBodyAnimStringValues_0 = v222.mainBodyAnimStringValues;
    local l_mainBodyAssetId_0 = v221.mainBodyAssetId;
    if not l_mainBodyAnimStringValues_0 then
        local v225, v226 = v219:getFallbackMainBodyAnimStringValuesAndMockAssetId(v220);
        l_mainBodyAnimStringValues_0 = v225;
        l_mainBodyAssetId_0 = v226;
    end;
    local v227 = nil;
    if l_mainBodyAnimStringValues_0 then
        local v228, _ = v8.getWeightedAnimations(v8.convertToAnimations(l_mainBodyAnimStringValues_0[1]:GetChildren()));
        local v230 = nil;
        local v231 = nil;
        for v232, v233 in next, v228 do
            if v230 == nil or v233 < v231 then
                v230 = v232;
                v231 = v233;
            end;
        end;
        if v230 then
            local l_CurrentCharacter_9 = v219.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
            v227 = v8.animatorLoadAnimationTrack(l_CurrentCharacter_9, v230, v219.debugLoadAssetsFromFiles);
        end;
    end;
    if not v227 or not l_mainBodyAssetId_0 then
        v219:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
        v219:updateMainBodyAnimation(v220, v221, v222);
        return;
    else
        assert(v227, "lookAroundTrack is not nil. Silences type checker");
        assert(l_mainBodyAssetId_0, "assetId is not nil. Silences type checker");
        local v235 = v219.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround];
        if v8.animationTrackWithConnectionsIsPlayingThisAssetId(v235, l_mainBodyAssetId_0) then
            return;
        else
            v219:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
            v219:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
            v227.Looped = true;
            local v236 = {
                assetId = l_mainBodyAssetId_0
            };
            v236.stoppedConnection = v227.Stopped:Connect(function() --[[ Line: 1586 ]]
                -- upvalues: v219 (copy), v227 (ref), v236 (copy)
                v219:handleStoppedConnection(v227, v236);
            end);
            v236.endedConnection = v227.Ended:Connect(function() --[[ Line: 1589 ]]
                -- upvalues: v219 (copy), v227 (ref)
                v219:handleEndedConnection(v227);
            end);
            v236.didLoopConnection = v227.DidLoop:Connect(function() --[[ Line: 1592 ]]
                -- upvalues: v219 (copy), v227 (ref), l_AnimationTrackWithConnectionsTypes_0 (ref), v220 (copy), v221 (copy), v222 (copy)
                if v219.destroyed then
                    return;
                else
                    v219:recordAnimationTrackProgress(v227.Name, "Looped");
                    v219:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
                    v219:updateMainBodyAnimation(v220, v221, v222);
                    return;
                end;
            end);
            v236.animationTrack = v227;
            v236.animationTrack.Name = v219:getNextAnimationTrackName("LookAround");
            assert(v219.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.LookAround] should be empty");
            v219.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround] = v236;
            v227:Play(0.1);
            v219:recordAnimationTrackProgress(v236.animationTrack.Name, "Playing");
            return;
        end;
    end;
end;
v35.updateMainBodyAnimation = function(v237, v238, v239, v240) --[[ Line: 1618 ]] --[[ Name: updateMainBodyAnimation ]]
    -- upvalues: l_AnimationTrackWithConnectionsTypes_0 (copy), v8 (copy)
    assert(not v238.isInPPE, "Should not be in PPE");
    local l_mainBodyAnimStringValues_1 = v240.mainBodyAnimStringValues;
    local l_mainBodyAssetId_1 = v239.mainBodyAssetId;
    if not l_mainBodyAnimStringValues_1 then
        local v243, v244 = v237:getFallbackMainBodyAnimStringValuesAndMockAssetId(v238);
        l_mainBodyAnimStringValues_1 = v243;
        l_mainBodyAssetId_1 = v244;
    end;
    if not l_mainBodyAnimStringValues_1 or not l_mainBodyAssetId_1 or #l_mainBodyAnimStringValues_1 == 0 then
        v237:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
        v237:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
        return;
    else
        assert(l_mainBodyAnimStringValues_1, "animStringValues is not nil. Silences type checker");
        assert(l_mainBodyAssetId_1, "assetId is not nil.  Silences type checker");
        local v245 = v237.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody];
        local v246 = v237.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround];
        local v247 = v8.animationTrackWithConnectionsIsPlayingThisAssetId(v245, l_mainBodyAssetId_1);
        local v248 = not v238.excludeIdleAnimation;
        if v247 and v248 then
            return;
        elseif v8.animationTrackWithConnectionsIsPlayingThisAssetId(v246, l_mainBodyAssetId_1) and v248 then
            return;
        else
            local v249 = 1;
            if v237.shouldMoveToNextValidMainBodyAnimation then
                v249 = v249 % #l_mainBodyAnimStringValues_1 + 1;
            end;
            local v250, v251 = v237:selectBestMainBodyAnimation(l_mainBodyAnimStringValues_1, v249, v238.excludeIdleAnimation);
            if v250 then
                v237:playMainBodyAnimation(v250, l_mainBodyAnimStringValues_1, l_mainBodyAssetId_1, v251, nil, v238.excludeIdleAnimation);
                return;
            else
                v237:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
                v237:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
                return;
            end;
        end;
    end;
end;
v35.playMainBodyAnimation = function(v252, v253, v254, v255, v256, v257, v258) --[[ Line: 1698 ]] --[[ Name: playMainBodyAnimation ]]
    -- upvalues: v8 (copy), v14 (copy), l_AnimationTrackWithConnectionsTypes_0 (copy)
    local v259 = v257 or 0;
    local l_CurrentCharacter_10 = v252.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local v261 = v8.animatorLoadAnimationTrack(l_CurrentCharacter_10, v253, v252.debugLoadAssetsFromFiles);
    if not v261 then
        return;
    else
        assert(v261, "animationTrack is not nil.  Silences type checker");
        local l_PlayingSwimAnimation_0 = v252.store:getState().AvatarExperience.AvatarScene.Character.PlayingSwimAnimation;
        local v263 = v8.isSwimAnimation(v253);
        if l_PlayingSwimAnimation_0 ~= v263 then
            v252.store:dispatch(v14(v263));
        end;
        v261.Looped = true;
        local v264 = {
            assetId = v255
        };
        v264.stoppedConnection = v261.Stopped:Connect(function() --[[ Line: 1728 ]]
            -- upvalues: v252 (copy), v261 (copy), v264 (copy)
            v252:handleStoppedConnection(v261, v264);
        end);
        v264.endedConnection = v261.Ended:Connect(function() --[[ Line: 1731 ]]
            -- upvalues: v252 (copy), v261 (copy)
            v252:handleEndedConnection(v261);
        end);
        v264.didLoopConnection = v261.DidLoop:Connect(function() --[[ Line: 1734 ]]
            -- upvalues: v252 (copy), v261 (copy), l_AnimationTrackWithConnectionsTypes_0 (ref), v259 (ref), v254 (copy), v256 (copy), v8 (ref), v258 (copy), v253 (copy), v255 (copy)
            if v252.destroyed then
                return;
            else
                v252:recordAnimationTrackProgress(v261.Name, "Looped");
                local v265 = v252.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody];
                if v265 == nil then
                    return;
                else
                    assert(v265, "mainBodyAnimationTrackWithConnections is non nil. Silence type checker");
                    if v265.animationTrack ~= v261 then
                        return;
                    elseif not v252.started then
                        v261:Stop();
                        return;
                    else
                        v259 = v259 + 1;
                        local l_Children_0 = v254[v256]:GetChildren();
                        local v267, v268 = v8.getWeightedAnimations(v8.convertToAnimations(l_Children_0), v258);
                        local v269 = v8.getRandomAnimation(v267, v268) or v253;
                        assert(v269, "newAnimation not nil.  Silences type checker");
                        local v270 = false;
                        if v259 % 4 == 0 then
                            if v252.shouldMoveToNextValidMainBodyAnimation then
                                v252.shouldMoveToNextValidMainBodyAnimation = false;
                            else
                                v252.shouldMoveToNextValidMainBodyAnimation = true;
                            end;
                            v270 = true;
                        end;
                        if v270 or v269 ~= v253 then
                            v252:playMainBodyAnimation(v269, v254, v255, v256, nil, v258);
                        end;
                        return;
                    end;
                end;
            end;
        end);
        v252:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
        v252:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
        v264.animationTrack = v261;
        v264.animationTrack.Name = v252:getNextAnimationTrackName("MainBody");
        assert(v252.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.MainBody] should be empty");
        v252.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody] = v264;
        v261:Play(0.1);
        v252:recordAnimationTrackProgress(v264.animationTrack.Name, "Playing");
        return;
    end;
end;
v35.selectBestMainBodyAnimation = function(v271, v272, v273, v274) --[[ Line: 1822 ]] --[[ Name: selectBestMainBodyAnimation ]]
    local v275, v276 = v271:findNextPlayableWeightedAnimations(v272, v273, v274);
    local v277, v278 = next(v275);
    if not v277 then
        return nil, v276;
    else
        local l_v277_0 = v277;
        local l_v278_0 = v278;
        for v281, v282 in v275 do
            if l_v278_0 < v282 then
                l_v277_0 = v281;
                l_v278_0 = v282;
            end;
        end;
        return l_v277_0, v276;
    end;
end;
v35.findNextPlayableWeightedAnimations = function(_, v284, v285, v286) --[[ Line: 1844 ]] --[[ Name: findNextPlayableWeightedAnimations ]]
    -- upvalues: v8 (copy)
    for _ = 1, #v284 do
        local v288 = if v284[v285] then v284[v285]:GetChildren() else nil;
        if v288 then
            local v289 = v8.convertToAnimations(v288);
            local v290, v291 = v8.getWeightedAnimations(v289, v286);
            if v291 > 0 then
                return v290, v285;
            end;
        end;
        v285 = v285 % #v284 + 1;
    end;
    return {}, v285;
end;
v35.getFallbackMainBodyAnimStringValuesAndMockAssetId = function(v292, v293) --[[ Line: 1885 ]] --[[ Name: getFallbackMainBodyAnimStringValuesAndMockAssetId ]]
    -- upvalues: l_AssetTypeIdStrings_0 (copy), v8 (copy)
    local l_CurrentCharacter_11 = v292.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_11, "currentCharacter is not nil");
    if v293.isAvatarBackground then
        local l_wave_0 = l_CurrentCharacter_11.Animations:FindFirstChild("wave");
        if l_wave_0 then
            return {
                l_wave_0
            }, "character_defaultWave";
        else
            return nil, nil;
        end;
    else
        local l_IdleAnimation_0 = l_AssetTypeIdStrings_0.IdleAnimation;
        if v293.pageIsEditorAnimations and v293.curCategoryInfo then
            l_IdleAnimation_0 = v8.getAssetTypeIdStringForCategory(v293.curCategoryInfo);
        end;
        local v297 = v292:getAnimStringValuesAssignedToCharacter(l_IdleAnimation_0, l_CurrentCharacter_11);
        local v298 = nil;
        if v297 and l_IdleAnimation_0 then
            v298 = "character_" .. l_IdleAnimation_0;
        end;
        return v297, v298;
    end;
end;
v35.getAnimStringValuesAssignedToCharacter = function(v299, v300, v301) --[[ Line: 1918 ]] --[[ Name: getAnimStringValuesAssignedToCharacter ]]
    -- upvalues: l_AssetTypeIdStrings_0 (copy), v10 (copy), v8 (copy)
    local l_AvatarType_0 = v299.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType;
    local v303 = {};
    if not v301 then
        return nil;
    else
        assert(v301, "currentCharacter is not nil.  Silences type checker");
        local l_Animations_1 = v301:FindFirstChild("Animations");
        if l_Animations_1 == nil then
            return nil;
        else
            assert(l_Animations_1, "animations is not nil.  Silences type checker");
            if v300 == l_AssetTypeIdStrings_0.ClimbAnimation then
                table.insert(v303, l_Animations_1:FindFirstChild("climb"));
            elseif v300 == l_AssetTypeIdStrings_0.FallAnimation then
                table.insert(v303, l_Animations_1:FindFirstChild("fall"));
            elseif v300 == l_AssetTypeIdStrings_0.IdleAnimation then
                table.insert(v303, l_Animations_1:FindFirstChild("idle"));
            elseif v300 == l_AssetTypeIdStrings_0.JumpAnimation then
                table.insert(v303, l_Animations_1:FindFirstChild("jump"));
            elseif v300 == l_AssetTypeIdStrings_0.RunAnimation then
                table.insert(v303, l_Animations_1:FindFirstChild("run"));
            elseif v300 == l_AssetTypeIdStrings_0.WalkAnimation then
                table.insert(v303, l_Animations_1:FindFirstChild("walk"));
            elseif v300 == l_AssetTypeIdStrings_0.EmoteAnimation then
                table.insert(v303, l_Animations_1:FindFirstChild("idle"));
            elseif v300 == l_AssetTypeIdStrings_0.SwimAnimation then
                if l_AvatarType_0 == v10.AvatarType.R15 then
                    table.insert(v303, l_Animations_1:FindFirstChild("swim"));
                    table.insert(v303, l_Animations_1:FindFirstChild("swimidle"));
                else
                    local l_run_0 = l_Animations_1:FindFirstChild("run");
                    if l_run_0 then
                        local v306 = l_run_0:Clone();
                        v306.Name = "swim";
                        table.insert(v303, v306);
                    end;
                end;
            end;
            return v8.convertToStringValues(v303);
        end;
    end;
end;
v35.stopAnimationTrackWithConnections = function(v307, v308, v309) --[[ Line: 1966 ]] --[[ Name: stopAnimationTrackWithConnections ]]
    -- upvalues: v8 (copy)
    local v310 = v307.animationTrackWithConnectionsByType[v308];
    if v310 then
        if v310.didLoopConnection then
            v310.didLoopConnection:Disconnect();
        end;
        v307.animationTrackWithConnectionsByType[v308] = nil;
        if v8.animationTrackWithConnectionsIsPlaying(v310) then
            assert(v310, "animationTrackWithConnections is not nil. Silences type checker");
            assert(v310.animationTrack, "animationTrackWithConnections.animationTrack is not nil. Silences type checker");
            v310.animationTrack:Stop(v309);
            return;
        elseif v310 and v310.animationTrack then
            v310.animationTrack:Destroy();
        end;
    end;
end;
v35.handleStoppedConnection = function(v311, v312, v313) --[[ Line: 1996 ]] --[[ Name: handleStoppedConnection ]]
    if v311.destroyed then
        return;
    else
        v311:recordAnimationTrackProgress(v312.Name, "Stopped");
        assert(v312, "animationTrack should be non-nil");
        assert(v312.Name, "animationTrack name should be set");
        assert(v311.stoppedButNotEndedATWCsByName[v312.Name] == nil, "animationTrack should not be in stoppedButNotEndedATWCsByName yet");
        v311.stoppedButNotEndedATWCsByName[v312.Name] = v313;
        return;
    end;
end;
v35.handleEndedConnection = function(v314, v315) --[[ Line: 2015 ]] --[[ Name: handleEndedConnection ]]
    -- upvalues: v31 (copy), v15 (copy)
    assert(v315, "originalTrack should exist");
    if v314.destroyed then
        return;
    else
        v314:recordAnimationTrackProgress(v315.Name, "Ended");
        if not v314.stoppedButNotEndedATWCsByName[v315.Name] then
            local v316 = string.format("\"%s\" missing from self.stoppedButNotEndedATWCsByName: ", v315.Name) .. v314:getAnimationTrackRecordString(v315.Name);
            v31:info(v316);
            v15("originalTrack missing from self.stoppedButNotEndedATWCsByName");
        end;
        v315:Destroy();
        v314.stoppedButNotEndedATWCsByName[v315.Name] = nil;
        if v314.started then
            v314:maybeProceedWithPPEPosing();
        end;
        return;
    end;
end;
v35.setOnUpdateFinished = function(v317, v318) --[[ Line: 2052 ]] --[[ Name: setOnUpdateFinished ]]
    v317.onUpdateFinished = v318;
end;
v35.setDebugLoadAssetsFromFiles = function(v319, v320, v321) --[[ Line: 2056 ]] --[[ Name: setDebugLoadAssetsFromFiles ]]
    v319.debugLoadAssetsFromFiles = v320;
    v319.mapAssetIdToFileName = v321;
end;
v35.getNextAnimationTrackName = function(v322, v323) --[[ Line: 2064 ]] --[[ Name: getNextAnimationTrackName ]]
    v322.animationTrackNameIndex = v322.animationTrackNameIndex + 1;
    return "AnimationTrack_" .. v323 .. "_" .. tostring(v322.animationTrackNameIndex);
end;
v35.recordAnimationTrackProgress = function(v324, v325, v326) --[[ Line: 2069 ]] --[[ Name: recordAnimationTrackProgress ]]
    if v324.animationTrackNameToHistory == nil then
        v324.animationTrackNameToHistory = {};
    end;
    local v327 = v324.animationTrackNameToHistory[v325];
    if v327 == nil then
        v327 = {};
        v324.animationTrackNameToHistory[v325] = v327;
    end;
    table.insert(v327, v326);
end;
v35.getAnimationTrackRecordString = function(v328, v329) --[[ Line: 2081 ]] --[[ Name: getAnimationTrackRecordString ]]
    local v330 = "Name = " .. v329;
    local v331 = v328.animationTrackNameToHistory[v329];
    if v331 == nil then
        v331 = {};
    end;
    for _, v333 in v331 do
        v330 = v330 .. ", " .. v333;
    end;
    return v330;
end;
return v35;