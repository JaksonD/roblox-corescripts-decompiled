local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.tutils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.LuaApp.mutedError);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v12 = require(l_Modules_0.AvatarExperience.Common.MockAnimationTrack);
local v13 = require(l_Modules_0.AvatarExperience.Common.MockAnimationStreamTrack);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManagerTypes);
local v16 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectIsTryingOnClassicOrDynamicHead);
local v17 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v21.Enums.CatalogCategories;
local l_isMakeupOrEyebrowEyelashAssetType_0 = v21.Utils.isMakeupOrEyebrowEyelashAssetType;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_AssetTypeIdStrings_0 = v18.AssetTypeIdStrings;
local v26 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXPhotoboothFunctionality_0 = v26.FFlagAXPhotoboothFunctionality;
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v26.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXDefaultCatalogCategoryId_0 = v26.FFlagAXDefaultCatalogCategoryId;
local v31 = game:DefineFastFlag("AXTestMoodAnimationNotStringMutedError", false);
local l_FFlagAXMakeupEquipping_0 = v26.FFlagAXMakeupEquipping;
local v52 = {
    DefaultAnimations = {
        R15 = {
            TOOL = 507768375, 
            WAVE_EMOTE = 507770239
        }, 
        R6 = {
            CLIMB = 180436334, 
            FALL = 180436148, 
            IDLE = 180435571, 
            IDLE_LOOK_AROUND = 180435792, 
            JUMP = 125750702, 
            RUN = 180426354, 
            SIT = 178130996, 
            TOOL_NONE = 182393478, 
            WALK = 180426354, 
            TOOL = 182393478
        }
    }, 
    loadAnimationModel = function(v33, v34, v35) --[[ Line: 79 ]]
        -- upvalues: l_InsertService_0 (copy)
        if not v33 then
            return nil;
        else
            local v36 = nil;
            local _, l_result_1 = pcall(function() --[[ Line: 89 ]]
                -- upvalues: v34 (copy), v35 (copy), v33 (copy), v36 (ref), l_InsertService_0 (ref)
                if v34 and v35 then
                    local v37 = "rbxasset://" .. v35(v33);
                    v36 = l_InsertService_0:LoadLocalAsset(v37);
                    return;
                else
                    local v38 = nil;
                    local l_BindableEvent_0 = Instance.new("BindableEvent");
                    task.spawn(function() --[[ Line: 102 ]]
                        -- upvalues: v36 (ref), l_InsertService_0 (ref), v33 (ref), v38 (ref), l_BindableEvent_0 (copy)
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 104 ]]
                            -- upvalues: v36 (ref), l_InsertService_0 (ref), v33 (ref)
                            v36 = l_InsertService_0:LoadAsset(v33);
                        end);
                        if not l_status_0 then
                            v38 = l_result_0;
                        end;
                        l_BindableEvent_0:Fire();
                    end);
                    l_BindableEvent_0.Event:Wait();
                    if v38 then
                        error(v38);
                    end;
                    return;
                end;
            end);
            if l_result_1 or not v36 then
                warn(l_result_1);
                return nil;
            else
                return v36;
            end;
        end;
    end, 
    isSwimAnimation = function(v44) --[[ Line: 127 ]]
        if v44.Parent and v44.Parent.Name == "swim" then
            return true;
        else
            return false;
        end;
    end, 
    createStringValue = function(v45, v46) --[[ Line: 135 ]]
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Parent = v45;
        l_StringValue_0.Name = v46;
        return l_StringValue_0;
    end, 
    createAnimation = function(v48, v49, v50) --[[ Line: 142 ]]
        local l_Animation_0 = Instance.new("Animation");
        l_Animation_0.Parent = v48;
        l_Animation_0.AnimationId = "http://www.roblox.com/asset/?id=" .. v50;
        l_Animation_0.Name = v49;
        return l_Animation_0;
    end
};
v52.createR6AnimationFolder = function() --[[ Line: 150 ]]
    -- upvalues: v52 (copy)
    local l_Folder_0 = Instance.new("Folder");
    v52.createAnimation(v52.createStringValue(l_Folder_0, "climb"), "ClimbAnim", v52.DefaultAnimations.R6.CLIMB);
    v52.createAnimation(v52.createStringValue(l_Folder_0, "fall"), "FallAnim", v52.DefaultAnimations.R6.FALL);
    local v54 = v52.createStringValue(l_Folder_0, "idle");
    v52.createAnimation(v54, "Animation1", v52.DefaultAnimations.R6.IDLE);
    v52.createAnimation(v54, "Animation2", v52.DefaultAnimations.R6.IDLE_LOOK_AROUND);
    v52.createAnimation(v52.createStringValue(l_Folder_0, "jump"), "JumpAnim", v52.DefaultAnimations.R6.JUMP);
    v52.createAnimation(v52.createStringValue(l_Folder_0, "run"), "RunAnim", v52.DefaultAnimations.R6.RUN);
    v52.createAnimation(v52.createStringValue(l_Folder_0, "sit"), "SitAnim", v52.DefaultAnimations.R6.SIT);
    v52.createAnimation(v52.createStringValue(l_Folder_0, "toolnone"), "ToolNoneAnim", v52.DefaultAnimations.R6.TOOL_NONE);
    v52.createAnimation(v52.createStringValue(l_Folder_0, "walk"), "WalkAnim", v52.DefaultAnimations.R6.WALK);
    v52.createAnimation(l_Folder_0, "Tool", v52.DefaultAnimations.R6.TOOL);
    return l_Folder_0;
end;
v52.convertToStringValues = function(v55, v56) --[[ Line: 174 ]]
    -- upvalues: v31 (copy), v10 (copy)
    for _, v58 in v55 do
        if v58.ClassName ~= "StringValue" then
            if v31 then
                v10((("instance should be StringValue: %*"):format(v56)));
            else
                v10("instance should be StringValue.");
            end;
            return {};
        end;
    end;
    return v55;
end;
v52.convertToAnimations = function(v59) --[[ Line: 190 ]]
    -- upvalues: v10 (copy)
    for _, v61 in v59 do
        if v61.ClassName ~= "Animation" then
            v10("instance should be Animation.");
            return {};
        end;
    end;
    return v59;
end;
v52.getLowestWeightAnimation = function(v62) --[[ Line: 201 ]]
    local v63 = nil;
    local v64 = 1e999;
    for _, v66 in next, v62 do
        local l_Weight_0 = v66:FindFirstChild("Weight");
        local v68 = if l_Weight_0 then l_Weight_0.Value else 1;
        if v68 < v64 then
            v63 = v66;
            v64 = v68;
        end;
    end;
    return v63;
end;
v52.getWeightedAnimations = function(v69, v70) --[[ Line: 216 ]]
    -- upvalues: v52 (copy)
    local v71 = {};
    local v72 = 0;
    local v73 = nil;
    if v70 then
        v73 = v52.getLowestWeightAnimation(v69);
    end;
    for _, v75 in next, v69 do
        local l_Weight_1 = v75:FindFirstChild("Weight");
        local v77 = if l_Weight_1 then l_Weight_1.Value else 1;
        if v70 and v75 == v73 then
            v77 = 0;
        end;
        if v77 > 0 then
            v71[v75] = v77;
            v72 = v72 + v77;
        end;
    end;
    return v71, v72;
end;
v52.getHumanoidFromCharacter = function(v78) --[[ Line: 244 ]]
    if v78 then
        return v78:FindFirstChildOfClass("Humanoid");
    else
        return nil;
    end;
end;
v52.getAnimatorFromCharacter = function(v79) --[[ Line: 251 ]]
    -- upvalues: v52 (copy)
    local v80 = v52.getHumanoidFromCharacter(v79);
    if v80 then
        return v80:FindFirstChildOfClass("Animator");
    else
        return nil;
    end;
end;
v52.animationTrackWithConnectionsIsPlaying = function(v81) --[[ Line: 259 ]]
    if not v81 then
        return false;
    else
        assert(v81, "animationTrackWithId should be non-nil. Silence type checker.");
        if not v81.animationTrack then
            return false;
        else
            assert(v81.animationTrack, "animationTrackWithId.animationTrack should be non-nil. Silence type checker.");
            return v81.animationTrack.IsPlaying;
        end;
    end;
end;
v52.animationTrackWithConnectionsIsPlayingThisAssetId = function(v82, v83) --[[ Line: 277 ]]
    -- upvalues: v52 (copy)
    if v82 and v82.assetId == v83 and v52.animationTrackWithConnectionsIsPlaying(v82) then
        return true;
    else
        return false;
    end;
end;
v52.getRandomAnimation = function(v84, v85) --[[ Line: 291 ]]
    local v86 = math.random() * v85;
    for v87, v88 in next, v84 do
        if v86 <= v88 then
            return v87;
        else
            v86 = v86 - v88;
        end;
    end;
    return nil;
end;
v52.animatorLoadAnimationTrack = function(v89, v90, v91) --[[ Line: 308 ]]
    -- upvalues: v52 (copy), v12 (copy)
    local v92 = v52.getAnimatorFromCharacter(v89);
    if v92 then
        if v91 then
            return (v12.new());
        else
            return v92:LoadAnimation(v90);
        end;
    else
        return nil;
    end;
end;
v52.animatorLoadTrackerStreamAnimationTrack = function(v93, v94, v95) --[[ Line: 328 ]]
    -- upvalues: v52 (copy), v13 (copy), l_Players_0 (copy)
    local v96 = v52.getAnimatorFromCharacter(v93);
    if v96 then
        if v95 then
            return (v13.new());
        else
            assert(l_Players_0, "assert Players cannot be nil. Silences type checker");
            assert(l_Players_0.LocalPlayer, "assert LocalPlayer is not nil. Silences type checker");
            if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                return v96:LoadStreamAnimationV2(v94, l_Players_0.LocalPlayer, false, false);
            else
                return v96:LoadStreamAnimationForSelfieView_deprecated(v94, l_Players_0.LocalPlayer);
            end;
        end;
    else
        return nil;
    end;
end;
v52.loadAnimStringValuesFromString = function(v97, v98, v99) --[[ Line: 358 ]]
    -- upvalues: v52 (copy), v31 (copy)
    local v100 = tonumber(v97);
    if not v100 then
        return nil;
    else
        assert(v100, "assetIdAsNumber is not nil. Silences type checker");
        local v101 = v52.loadAnimationModel(v100, v98, v99);
        if not v101 then
            return nil;
        else
            assert(v101, "animationModel is not nil. Silence type checker.");
            local l_R15Anim_0 = v101:FindFirstChild("R15Anim");
            if l_R15Anim_0 then
                return v52.convertToStringValues(l_R15Anim_0:GetChildren(), if v31 then v97 else nil);
            else
                local v103 = {};
                for _, v105 in v101:GetChildren() do
                    if v105:IsA("Animation") then
                        local l_StringValue_1 = Instance.new("StringValue");
                        l_StringValue_1.Name = v105.Name;
                        v105.Parent = l_StringValue_1;
                        v103[#v103 + 1] = l_StringValue_1;
                    end;
                end;
                if #v103 > 0 then
                    return v103;
                else
                    return nil;
                end;
            end;
        end;
    end;
end;
v52.getAssetTypeIdStringForCategory = l_memoize_0(function(v107) --[[ Line: 405 ]]
    if v107 and v107.AssetTypeIdStrings and #v107.AssetTypeIdStrings == 1 then
        return v107.AssetTypeIdStrings[1];
    else
        return nil;
    end;
end);
v52.hasMissingIds = l_memoize_0(function(v108, v109) --[[ Line: 417 ]]
    if v108 == nil or not next(v108) then
        return false;
    else
        for v110, _ in v108 do
            if not v109[v110] then
                return true;
            end;
        end;
        return false;
    end;
end);
v52.getEquippedAssetsSummary = l_memoize_0(function(v112) --[[ Line: 438 ]]
    -- upvalues: v9 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupOrEyebrowEyelashAssetType_0 (copy)
    local v113 = {};
    if v112 then
        for v114, v115 in v112 do
            if not v9.assetTypeIdIsAnimationOrEmote(v114) and (not l_FFlagAXMakeupEquipping_0 or not l_isMakeupOrEyebrowEyelashAssetType_0(v114)) then
                local v116 = {};
                for v117, _ in v115 do
                    v116[v117] = true;
                end;
                v113[v114] = v116;
            end;
        end;
    end;
    return v113;
end);
v52.getEquippedAssetSummariesMatch = l_memoize_0(function(v119, v120) --[[ Line: 464 ]]
    -- upvalues: v6 (copy)
    return v6.deepEqual(v119, v120);
end);
v52.getOutfitTryOnSummary = l_memoize_0(function(v121) --[[ Line: 476 ]]
    -- upvalues: v18 (copy), v9 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupOrEyebrowEyelashAssetType_0 (copy)
    local v122 = {};
    if v121 and v121.TryOnItems then
        for v123, v124 in v121.TryOnItems do
            if (v124.itemType ~= v18.ItemType.Bundle or v124.itemSubType ~= v18.BundleTypeIdStrings.Animations) and (v124.itemType ~= v18.ItemType.Asset or not v9.assetTypeIdIsAnimationOrEmote(v124.itemSubType)) and (not l_FFlagAXMakeupEquipping_0 or v124.itemType ~= v18.ItemType.Asset or not l_isMakeupOrEyebrowEyelashAssetType_0(v124.itemSubType)) then
                v122[v123] = {
                    itemType = v124.itemType, 
                    itemSubType = v124.itemSubType
                };
            end;
        end;
    end;
    return v122;
end);
v52.getOutfitTryOnSummariesMatch = l_memoize_0(function(v125, v126) --[[ Line: 518 ]]
    -- upvalues: v6 (copy)
    return v6.deepEqual(v125, v126);
end);
v52.getEquippedAssetsSummaryHasNewItems = l_memoize_0(function(v127, v128) --[[ Line: 528 ]]
    -- upvalues: v52 (copy)
    for v129, v130 in v127 do
        local v131 = {};
        if v128[v129] then
            v131 = v128[v129];
        end;
        if v52.hasMissingIds(v130, v131) then
            return true;
        end;
    end;
    return false;
end);
v52.getOutfitTryOnSummaryHasNewItems = function(v132, v133) --[[ Line: 551 ]]
    for v134, _ in v132 do
        if not v133[v134] then
            return true;
        end;
    end;
    return false;
end;
v52.cleanupAnimationTrackWithConnections = function(v136) --[[ Line: 563 ]]
    if not v136 then
        return;
    else
        assert(v136, "Assert animationTrackWithConnections is not nil, silence type checker");
        if v136.stoppedConnection then
            v136.stoppedConnection:Disconnect();
            v136.stoppedConnection = nil;
        end;
        if v136.endedConnection then
            v136.endedConnection:Disconnect();
            v136.endedConnection = nil;
        end;
        if v136.didLoopConnection then
            v136.didLoopConnection:Disconnect();
            v136.didLoopConnection = nil;
        end;
        if v136.animationTrack then
            v136.animationTrack:Stop();
            v136.animationTrack:Destroy();
            v136.animationTrack = nil;
        end;
        return;
    end;
end;
v52.getDidMoveOutOfPPE = function(v137, v138, v139) --[[ Line: 591 ]]
    if v137 then
        if not v138 then
            return true;
        elseif not v139 then
            return true;
        end;
    end;
    return false;
end;
v52.getEquippedIdleAnimation = function(v140) --[[ Line: 607 ]]
    -- upvalues: l_AssetTypeIdStrings_0 (copy)
    local l_EquippedAssets_0 = v140.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local v142 = l_EquippedAssets_0 and l_EquippedAssets_0[l_AssetTypeIdStrings_0.IdleAnimation];
    return v142 and next(v142) or nil;
end;
v52.ableToAnimateHead = function(v143) --[[ Line: 620 ]]
    -- upvalues: v16 (copy), v18 (copy), v5 (copy)
    local v144, v145, v146 = v16(v143);
    if v144 then
        return false, v146;
    elseif v143.AvatarExperience.AvatarEditor.Character.AvatarType == v18.AvatarType.R6 then
        return false, v146;
    elseif v145 then
        return true, v146;
    else
        local l_EquippedAssets_1 = v143.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local v148 = l_EquippedAssets_1 and l_EquippedAssets_1[v18.AssetTypeIdStrings.DynamicHead];
        local v149 = false;
        if v148 ~= nil then
            v149 = not v5.isEmpty(v148);
        end;
        return v149, v146;
    end;
end;
v52.adjustATWCWeight = function(v150, v151) --[[ Line: 643 ]]
    if v150.animationTrack then
        assert(v150.animationTrack, "assert animationTrackWithConnections.animationTrack is not nil. Silences Type checker");
        v150.animationTrack:AdjustWeight(v151);
    end;
end;
v52.getAllowsTryingEmotesOrAnimations = function(v152, v153) --[[ Line: 660 ]]
    -- upvalues: v19 (copy), v18 (copy), l_AvatarScreen_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), l_CatalogCategories_0 (copy), v28 (copy), l_FFlagAXPhotoboothFunctionality_0 (copy)
    local l_name_0 = v153.opaque.name;
    local v155 = v19.getCategoryInfoFromState(v152, v153);
    if v155.PageType == v18.PageType.AllAnimation or l_name_0 == l_AvatarScreen_0.CatalogSearch or l_name_0 == l_AvatarScreen_0.TryOnItem or (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v155.Id == if l_FFlagAXDefaultCatalogCategoryId_0 then v18.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue() else v155.NavigationKey == l_CatalogCategories_0.Recommended) or v28() and l_name_0 == l_AvatarScreen_0.EditEmotes or l_FFlagAXPhotoboothFunctionality_0 and l_name_0 == l_AvatarScreen_0.Photobooth then
        return true, true;
    else
        return v155.PageType == v18.PageType.Emotes, v155.PageType == v18.PageType.Animation;
    end;
end;
v52.canPlayCameraBasedMoodAnimation = function(v156, v157, v158) --[[ Line: 705 ]]
    -- upvalues: v17 (copy), v52 (copy)
    if not v157 then
        return false, true;
    else
        local v159 = v17(v156);
        local l_LastAnimOrEmoteToggledItem_0 = v156.AvatarExperience.AvatarScene.OutfitTryOn.LastAnimOrEmoteToggledItem;
        local v161 = if l_LastAnimOrEmoteToggledItem_0 then l_LastAnimOrEmoteToggledItem_0.itemId == v159 else false;
        local v162, v163 = v52.ableToAnimateHead(v156);
        return v162 and not (v161 and v158), v163;
    end;
end;
v52.waitForAnimationAndPosingToResolve = function(v164) --[[ Line: 727 ]]
    -- upvalues: l_RunService_0 (copy)
    task.spawn(function() --[[ Line: 728 ]]
        -- upvalues: l_RunService_0 (ref), v164 (copy)
        l_RunService_0.PreAnimation:Wait();
        l_RunService_0.PostSimulation:Wait();
        v164();
    end);
end;
return v52;