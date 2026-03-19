local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v7 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_ParticleUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).ParticleUtility;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments);
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = v10.FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = v11.AXEnableAccessoryAdjustmentDuringTryOnIXP;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v15 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v16 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v15.State.Selectors.selectHasBodyTryOn else require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasBodyTryOn);
local v17 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v15.State.Selectors.selectAvatarPreviewColors else require(l_Modules_0.AvatarExperience.Common.Selectors.selectAvatarPreviewColors);
local l_setMakeupDescriptions_0 = v15.Utils.setMakeupDescriptions;
local l_isMakeupAssetType_0 = v15.Utils.isMakeupAssetType;
local l_destroyMakeupDescriptions_0 = v15.Utils.destroyMakeupDescriptions;
local l_getMakeupDescriptionsFromHumanoidDescription_0 = v15.Utils.getMakeupDescriptionsFromHumanoidDescription;
local l_getTryOnItemReducerKey_0 = v15.Utils.getTryOnItemReducerKey;
local l_MAX_MAKEUP_LAYERS_0 = v15.Constants.MAX_MAKEUP_LAYERS;
local v24 = require(l_Modules_0.LuaApp.mutedError);
local v25 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v26 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCurrentCharacter);
local v27 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAdjustableTryOnIds);
local v28 = require(l_Modules_0.AvatarExperience.Common.Thunks.UpdateCharacter);
local v29 = require(l_Modules_0.AvatarExperience.Common.Actions.IncrementCharacterVersion);
local v30 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.IncrementCharacterModelVersion);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Actions.IncrementTryOnCharacterModelVersion);
local v33 = require(l_Modules_0.AvatarExperience.Common.Actions.FinishedWaitingOnLCUpdate);
local v34 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManager);
local v35 = require(l_Modules_0.AvatarExperience.Common.Managers.ToolManager);
local v36 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterModelPool);
local v37 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v38 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShape);
local v39 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled);
local v40 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColors);
local v41 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v42 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v43 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v44 = require(l_Modules_0.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils);
local v45 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v46 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v47 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v48 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v52 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v15.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local v54 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v55 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixCharacterManagerValueConversionWarning);
local v56 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v57 = game:DefineFastFlag("AXRemoveDynamicHeadAssetsFromTryOn", false);
local l_FFlagAXMISEnableMultiShopping_0 = v10.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMakeupEquipping_0 = v10.FFlagAXMakeupEquipping;
local l_FFlagEnableHeadShapeForCharacterManager_0 = v10.FFlagEnableHeadShapeForCharacterManager;
local l_FFlagFixHeadShapeColorSlider_0 = v10.FFlagFixHeadShapeColorSlider;
local v62 = settings():GetFVariable("LuaAppsDiagLoadTimeAvatarModel") .. "_" .. v45.getDeviceType();
local v63 = {};
v63.__index = v63;
local l_AssetTypeIdStringToHumanoidDescriptionProp_0 = v42.AssetTypeIdStringToHumanoidDescriptionProp;
local l_HumanoidDescriptionScaleToName_0 = v42.HumanoidDescriptionScaleToName;
local l_AssetTypeIdStrings_0 = v42.AssetTypeIdStrings;
local v67 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.loadtime");
local v68 = {
    toastMessage = "Feature.Avatar.Message.FaceNotVisible", 
    isLocalized = false, 
    toastType = v47.InformationMessage
};
local function _(v69) --[[ Line: 124 ]] --[[ Name: isHumanoidDescriptionPropertyEmpty ]]
    local v70 = true;
    if v69 ~= "" then
        v70 = v69 == 0;
    end;
    return v70;
end;
local function v77(v72) --[[ Line: 128 ]] --[[ Name: isHumanoidDescriptionEmpty ]]
    -- upvalues: l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy)
    for _, v74 in l_AssetTypeIdStringToHumanoidDescriptionProp_0 do
        local v75 = v72[v74];
        local v76 = true;
        if v75 ~= "" then
            v76 = v75 == 0;
        end;
        if not v76 then
            return false;
        end;
    end;
    if #v72:GetAccessories(true) > 0 then
        return false;
    else
        return true;
    end;
end;
v63.new = function(v78, v79, v80, v81, v82, v83, v84, v85, v86) --[[ Line: 145 ]] --[[ Name: new ]]
    -- upvalues: v63 (copy), v36 (copy), v28 (copy), v29 (copy), v34 (copy), v35 (copy), l_IsVRAppBuild_0 (copy)
    local v87 = {};
    setmetatable(v87, v63);
    v87.startAvatarModelLoadTime = tick();
    v87.connections = {};
    v87.store = v78;
    v87.networking = v79;
    v87.analytics = v80;
    v87.characterManagerEvents = v83;
    v87.characterManagerCallbacks = v84;
    v87.catalogAnalytics = v85;
    v87.characterModelPool = v36.new(v78, v80, v82, v86);
    v87._currentCharacter = v87.characterModelPool:getCurrentCharacter();
    v87.store:dispatch(v28(v87._currentCharacter));
    v87.store:dispatch(v29());
    v87.characterRoot = Instance.new("Folder");
    v87.characterRoot.Name = "CharacterRoot";
    v87.characterRoot.Parent = game.Workspace;
    v87.needsToEquipBundleTryOn = false;
    v87.initialHumanoidDescriptionApplied = false;
    v87.initialTryOnApplied = false;
    v87.destroyed = false;
    v87.checkBodyColors = true;
    v87.modelInitialized = false;
    v87.firstCallinPPE = true;
    v87.shouldUnequipAccessoriesBeforeTryOn = false;
    v87.animationManager = v34.new(v78, v87, v81);
    v87.toolManager = v35.new(v78, v87.animationManager, v87);
    v87.humanoidDescriptionCurrentlyEquipped = Instance.new("HumanoidDescription");
    v87.humanoidDescriptionTryOn = Instance.new("HumanoidDescription");
    v87.lastHumanoidDescriptionApplied = Instance.new("HumanoidDescription");
    if not l_IsVRAppBuild_0() then
        v87:maybeInitializeModel(v87.store:getState());
    end;
    v87.cachedRoduxState = v87.store:getState();
    return v87;
end;
v63.maybeInitializeModel = function(v88, v89) --[[ Line: 219 ]] --[[ Name: maybeInitializeModel ]]
    -- upvalues: v37 (copy)
    if not v88.modelInitialized and v37(v89) then
        v88.modelInitialized = true;
        v88:initializeModel(v89);
    end;
end;
v63.setupAnimations = function(v90, v91, v92) --[[ Line: 226 ]] --[[ Name: setupAnimations ]]
    v90.characterModelPool:setupAnimations(v91, v92);
end;
v63.initializeModel = function(v93, v94) --[[ Line: 231 ]] --[[ Name: initializeModel ]]
    -- upvalues: v41 (copy)
    local l_AvatarType_0 = v94.AvatarExperience.AvatarEditor.Character.AvatarType;
    if l_AvatarType_0 == v41.AvatarType.R6 then
        v93:switchAvatarType(l_AvatarType_0);
    end;
    v93._currentCharacter.Parent = v93.characterRoot;
    v93:updateHumanoidDescriptionCurrentlyEquipped(v94);
    v93:applyHumanoidDescription(true);
    v93.toolManager:update(v94);
end;
v63.updateCharacterFromConnection = function(v96, v97) --[[ Line: 244 ]] --[[ Name: updateCharacterFromConnection ]]
    v96.characterModelPool:maybeUpdateCharacter(v97):andThen(function(_, _) --[[ Line: 245 ]]
        -- upvalues: v96 (copy)
        v96.characterManagerCallbacks.setAppliedDescription(v96._currentCharacter.Humanoid.HumanoidDescription);
    end);
end;
v63.initAvatarScalesChangedConnection = function(v100) --[[ Line: 250 ]] --[[ Name: initAvatarScalesChangedConnection ]]
    -- upvalues: l_HumanoidDescriptionScaleToName_0 (copy)
    local v105 = v100.characterManagerEvents.avatarScalesChangedEvent:Connect(function(v101) --[[ Line: 251 ]]
        -- upvalues: v100 (copy), l_HumanoidDescriptionScaleToName_0 (ref)
        if not v101 then
            return;
        else
            local v102 = v100.lastHumanoidDescriptionApplied:Clone();
            for v103, v104 in v101 do
                v102[l_HumanoidDescriptionScaleToName_0[v103]] = v104;
            end;
            v100:updateCharacterFromConnection(v102);
            if v100.characterModelPool:isR15() then
                v100:adjustHeightToStandOnPlatform(v100._currentCharacter);
            end;
            return;
        end;
    end);
    table.insert(v100.connections, v105);
end;
v63.initBodyColorsChangedConnection = function(v106) --[[ Line: 268 ]] --[[ Name: initBodyColorsChangedConnection ]]
    -- upvalues: v39 (copy), v41 (copy), v16 (copy), v48 (copy), v54 (copy), l_AvatarEditorService_0 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v52 (copy)
    local v118 = v106.characterManagerEvents.bodyColorsChangedEvent:Connect(function(v107) --[[ Line: 269 ]]
        -- upvalues: v106 (copy), v39 (ref), v41 (ref), v16 (ref), v48 (ref), v54 (ref), l_AvatarEditorService_0 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v52 (ref)
        if not v107 then
            v106.overrideBodyColor3s = nil;
            return;
        else
            local v108 = v106.store:getState();
            if v39(v108) then
                v106.overrideBodyColor3s = nil;
                return;
            else
                local l_selectedBodyPartIndex_0 = v108.AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex;
                local l_bodyPartForSkinColoringIds_0 = v41.BodyPartButtonData[l_selectedBodyPartIndex_0].bodyPartForSkinColoringIds;
                local v111 = {};
                for _, v113 in l_bodyPartForSkinColoringIds_0 do
                    v111[v113] = v107;
                end;
                local v114 = nil;
                if v16(v108) then
                    v114 = v106:combineOutfitTryOnAndEquippedHumanoidDescriptions();
                    v106:updateHumanoidDescriptionTryOnWithColors(v108);
                else
                    v114 = v106.humanoidDescriptionCurrentlyEquipped:Clone();
                end;
                v48.setHumanoidDescriptionColorsFromBodyColor3s(v114, v111);
                local v115 = nil;
                if v54() then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 300 ]]
                        -- upvalues: l_AvatarEditorService_0 (ref), v114 (ref)
                        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                            return l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v114);
                        else
                            return l_AvatarEditorService_0:CheckApplyDefaultClothing(v114);
                        end;
                    end);
                    if l_status_0 then
                        v115 = l_result_0;
                    else
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v52.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing);
                        error(l_result_0);
                    end;
                else
                    v115 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v114) else l_AvatarEditorService_0:CheckApplyDefaultClothing(v114);
                end;
                v106.overrideBodyColor3s = v111;
                v106:updateCharacterFromConnection(v115 or v114);
                return;
            end;
        end;
    end);
    table.insert(v106.connections, v118);
end;
v63.initAdjustmentChangedConnection = function(v119) --[[ Line: 328 ]] --[[ Name: initAdjustmentChangedConnection ]]
    -- upvalues: v45 (copy)
    local v126 = v119.characterManagerEvents.adjustmentChangedEvent:Connect(function(v120, v121, v122) --[[ Line: 330 ]]
        -- upvalues: v119 (copy), v45 (ref)
        local l_SelectedAccessory_0 = v119.store:getState().AvatarExperience.AccessoryAdjustment.SelectedAccessory;
        local v124 = v119.lastHumanoidDescriptionApplied:Clone();
        local v125 = v45.getSelectedAccessoryDescription(v124, l_SelectedAccessory_0);
        if v125 then
            if v120 then
                v125.Position = v120;
            end;
            if v121 then
                v125.Rotation = v121;
            end;
            if v122 then
                v125.Scale = v122;
            end;
            v119:updateCharacterFromConnection(v124);
        end;
    end);
    table.insert(v119.connections, v126);
end;
v63.start = function(v127) --[[ Line: 353 ]] --[[ Name: start ]]
    -- upvalues: v56 (copy)
    v127:maybeInitializeModel(v127.store:getState());
    v127._currentCharacter.Parent = v127.characterRoot;
    local v130 = v127.store.changed:connect(function(v128, v129) --[[ Line: 357 ]]
        -- upvalues: v127 (copy)
        v127:update(v128, v129);
    end);
    table.insert(v127.connections, v130);
    if v56 then
        v127:initAvatarScalesChangedConnection();
    end;
    v127:initBodyColorsChangedConnection();
    v127:initAdjustmentChangedConnection();
    v127.characterModelPool:start();
    v127.animationManager:start();
    v127.toolManager:start();
    v127:updateHumanoidDescriptionCurrentlyEquipped(v127.store:getState());
    v127:applyHumanoidDescription(true);
    v127.toolManager:update(v127.store:getState());
    v127:update(v127.store:getState(), v127.cachedRoduxState);
end;
v63.updateHumanoidDescriptionTryOnWithColors = function(v131, v132) --[[ Line: 386 ]] --[[ Name: updateHumanoidDescriptionTryOnWithColors ]]
    -- upvalues: v39 (copy), v40 (copy), v17 (copy), v48 (copy)
    local v133 = if v39(v132) then v40(v132) else if v131.overrideBodyColor3s then v131.overrideBodyColor3s else v17(v132);
    v48.setHumanoidDescriptionColorsFromBodyColor3s(v131.humanoidDescriptionTryOn, v133);
end;
v63.update = function(v134, v135, v136) --[[ Line: 394 ]] --[[ Name: update ]]
    -- upvalues: v43 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v7 (copy), v41 (copy), v46 (copy), v27 (copy), l_FFlagAXMakeupEquipping_0 (copy), v42 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v44 (copy)
    local v137 = v134:shouldUpdateHumanoidDescriptionCurrentlyEquipped(v135, v136);
    if v137 then
        v134:updateHumanoidDescriptionCurrentlyEquipped(v135);
    end;
    local v138 = v134:shouldUpdateHumanoidDescriptionTryOnOutfit(v135, v136);
    if v138 then
        v43.updateHumanoidDescriptionUsingOutfitTryOn(v135, v134.humanoidDescriptionTryOn);
        if if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v7.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil then
            local v139 = v134.store:getState().AvatarExperience.AvatarEditor.AvatarSettings[v41.AvatarSettings.accessoryRefinementTypes];
            local v140 = v46.getAdjustableAccessories(v134.humanoidDescriptionTryOn, v139);
            v134.store:dispatch(v27(v140));
        end;
    end;
    local l_AvatarType_1 = v135.AvatarExperience.AvatarEditor.Character.AvatarType;
    local v142 = l_AvatarType_1 ~= v136.AvatarExperience.AvatarEditor.Character.AvatarType;
    if v142 then
        v134:switchAvatarType(l_AvatarType_1);
    end;
    if l_FFlagAXMakeupEquipping_0 then
        v134.isTryingOnLook = v135.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil;
        v134.isTryingOnMakeupLook = v134.isTryingOnLook and v135.AvatarExperience.AvatarScene.OutfitTryOn.LookType == v42.LookType.Makeup;
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        v134.shouldUnequipAccessoriesBeforeTryOn = v135.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems and not v134.isTryingOnMakeupLook;
    else
        v134.shouldUnequipAccessoriesBeforeTryOn = v135.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil and not v134.isTryingOnMakeupLook;
    end;
    v134.shouldUnequipBodyBeforeTryOn = v44.shouldUnequipBodyBeforeTryOn(v135);
    local v143 = v136.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= v135.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
    if v137 or v138 or v142 then
        v134:applyHumanoidDescription(v137, v138);
    end;
    if v143 or v137 or v138 or v142 then
        v134.toolManager:update(v135);
    end;
end;
v63.updateNoFace = function(v144, v145) --[[ Line: 460 ]] --[[ Name: updateNoFace ]]
    -- upvalues: l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), l_AssetTypeIdStrings_0 (copy), v30 (copy), v5 (copy), v68 (copy), v42 (copy)
    local l_Head_0 = v144._currentCharacter:FindFirstChild("Head");
    if not l_Head_0 then
        warn("No head was found on the character!");
        return;
    else
        local v147 = not l_Head_0:FindFirstChildWhichIsA("Decal");
        local v148 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[l_AssetTypeIdStrings_0.Face];
        local v149 = v145[v148];
        local v150 = v144.lastHumanoidDescriptionApplied[v148];
        if v147 and v149 ~= v150 and v150 ~= 0 then
            v144.store:dispatch(v30(v5.Dictionary.join(v68)));
            local l_catalogAnalytics_0 = v144.catalogAnalytics;
            local l_latestAvatarRoute_0 = v144.latestAvatarRoute;
            if l_catalogAnalytics_0 and l_latestAvatarRoute_0 and l_latestAvatarRoute_0.opaque then
                l_catalogAnalytics_0.sendAXCounterV2(v42.Counter.Toasts.NoFaceHead, {
                    route = l_latestAvatarRoute_0.opaque.name
                });
            end;
        end;
        return;
    end;
end;
v63.shouldUpdateHumanoidDescriptionCurrentlyEquipped = function(_, v154, v155) --[[ Line: 492 ]] --[[ Name: shouldUpdateHumanoidDescriptionCurrentlyEquipped ]]
    local l_EquippedAssets_0 = v154.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_EquippedAssets_1 = v155.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_0 = v154.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_AvatarScales_1 = v155.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_BodyColors_0 = v154.AvatarExperience.AvatarEditor.Character.BodyColors;
    local l_BodyColors_1 = v155.AvatarExperience.AvatarEditor.Character.BodyColors;
    local l_BodyColor3s_0 = v154.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local l_BodyColor3s_1 = v155.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local v164 = l_EquippedAssets_0 ~= l_EquippedAssets_1;
    local v165 = l_AvatarScales_0 ~= l_AvatarScales_1;
    local v166 = l_BodyColors_0 ~= l_BodyColors_1;
    local v167 = l_BodyColor3s_0 ~= l_BodyColor3s_1;
    return v164 or v165 or v166 or v167;
end;
v63.updateHumanoidDescriptionCurrentlyEquipped = function(v168, v169) --[[ Line: 509 ]] --[[ Name: updateHumanoidDescriptionCurrentlyEquipped ]]
    -- upvalues: l_Logging_0 (copy), v55 (copy), v43 (copy), l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), l_AssetTypeIdStrings_0 (copy), v5 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), v42 (copy), v45 (copy), l_FFlagFixHeadShapeColorSlider_0 (copy), l_setMakeupDescriptions_0 (copy), l_HumanoidDescriptionScaleToName_0 (copy), v48 (copy)
    local l_EquippedAssets_2 = v169.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_2 = v169.AvatarExperience.AvatarEditor.Character.AvatarScales;
    if not l_EquippedAssets_2 then
        l_Logging_0.warn("CharacterManager: Equipped assets has not been initialized!");
        return;
    else
        if v55() then
            v43.resetHumanoidDescriptionProperties(v168.humanoidDescriptionCurrentlyEquipped);
        else
            for _, v173 in l_AssetTypeIdStringToHumanoidDescriptionProp_0 do
                v168.humanoidDescriptionCurrentlyEquipped[v173] = "";
            end;
        end;
        v168.humanoidDescriptionCurrentlyEquipped:SetAccessories({}, true);
        local v174 = {};
        local v175 = false;
        local v176 = false;
        if l_EquippedAssets_2 and (not l_EquippedAssets_2[l_AssetTypeIdStrings_0.Head] or v5.isEmpty(l_EquippedAssets_2[l_AssetTypeIdStrings_0.Head])) then
            v175 = true;
        elseif l_EquippedAssets_2 and (not l_EquippedAssets_2[l_AssetTypeIdStrings_0.DynamicHead] or v5.isEmpty(l_EquippedAssets_2[l_AssetTypeIdStrings_0.DynamicHead])) then
            v176 = true;
        end;
        for v177, v178 in l_EquippedAssets_2 do
            local v179 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[v177];
            if v177 ~= l_AssetTypeIdStrings_0.Gear and (not l_FFlagAXMakeupEquipping_0 or not l_isMakeupAssetType_0(v177)) then
                if v42.AssetTypeIdToAccessoryTypeEnum[v177] then
                    for v180, v181 in v178 do
                        table.insert(v174, v45.createHumanoidDescriptionAccessoryInfo(v177, v180, v181));
                    end;
                elseif v179 and (v177 ~= l_AssetTypeIdStrings_0.Head or not v175) and (v177 ~= l_AssetTypeIdStrings_0.DynamicHead or not v176) then
                    local v182 = v5.Dictionary.keys(v178);
                    if #v182 == 0 then
                        v168.humanoidDescriptionCurrentlyEquipped[v179] = 0;
                    elseif l_FFlagFixHeadShapeColorSlider_0 and v177 == v42.AssetTypeIdStrings.DynamicHead then
                        v43.applyHeadShapeFromAssetMetadata(v168.humanoidDescriptionCurrentlyEquipped, v178);
                    else
                        v168.humanoidDescriptionCurrentlyEquipped[v179] = table.concat(v182, ",");
                    end;
                end;
            end;
        end;
        v168.humanoidDescriptionCurrentlyEquipped:SetAccessories(v174, true);
        if l_FFlagAXMakeupEquipping_0 then
            l_setMakeupDescriptions_0(v168.humanoidDescriptionCurrentlyEquipped, l_EquippedAssets_2);
        end;
        for v183, v184 in l_AvatarScales_2 do
            v168.humanoidDescriptionCurrentlyEquipped[l_HumanoidDescriptionScaleToName_0[v183]] = v184;
        end;
        v168.checkBodyColors = true;
        if v168.overrideBodyColor3s then
            v48.setHumanoidDescriptionColorsFromBodyColor3s(v168.humanoidDescriptionCurrentlyEquipped, v168.overrideBodyColor3s);
            return;
        else
            v48.setHumanoidDescriptionColorsFromCharacter(v168.humanoidDescriptionCurrentlyEquipped, v169.AvatarExperience);
            return;
        end;
    end;
end;
v63.shouldUpdateHumanoidDescriptionTryOnOutfit = function(v185, v186, v187) --[[ Line: 618 ]] --[[ Name: shouldUpdateHumanoidDescriptionTryOnOutfit ]]
    -- upvalues: v45 (copy), v38 (copy), v39 (copy)
    if v185.latestAvatarRoute then
        if v45.routeIsProfilePictureEditor(v185.latestAvatarRoute) then
            if not v185.firstCallinPPE then
                return false;
            else
                v185.firstCallinPPE = false;
            end;
        else
            v185.firstCallinPPE = true;
        end;
    end;
    local v188 = v186.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems ~= v187.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v189 = v186.AvatarExperience.LayeredClothingSort.CurrentSort ~= v187.AvatarExperience.LayeredClothingSort.CurrentSort;
    local v190 = v38(v186) ~= v38(v187);
    if not v185.initialTryOnApplied then
        v188 = true;
        v185.initialTryOnApplied = true;
    end;
    if v188 or v189 or v190 then
        return true;
    elseif v186.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s ~= v187.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s then
        return true;
    elseif v39(v186) ~= v39(v187) then
        return true;
    else
        return false;
    end;
end;
v63.setAccessoriesForTryOn = function(v191, v192) --[[ Line: 679 ]] --[[ Name: setAccessoriesForTryOn ]]
    -- upvalues: v42 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_AssetTypeIdStrings_0 (copy), v43 (copy), v57 (copy), v5 (copy)
    local l_v192_Accessories_0 = v192:GetAccessories(true);
    local l_Accessories_0 = v191.humanoidDescriptionTryOn:GetAccessories(true);
    local l_RemovedList_0 = v191.store:getState().AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
    local v196 = {};
    local v197 = {};
    for _, v199 in l_Accessories_0 do
        local v200 = v42.AccessoryTypeEnumToAssetTypeId[v199.AccessoryType];
        local v201 = v42.AssetTypeToAssetCategory[v200];
        v196[v199.AccessoryType] = true;
        if v201 then
            v197[v201] = true;
        end;
    end;
    for _, v203 in l_RemovedList_0 do
        if not l_FFlagAXMakeupEquipping_0 or not l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v203] then
            local v204 = v42.AssetTypeIdToAccessoryTypeEnum[v203];
            local v205 = v42.AssetTypeToAssetCategory[v203];
            v196[v204] = true;
            if v205 then
                v197[v205] = true;
            end;
        end;
    end;
    if l_FFlagAXMakeupEquipping_0 and v191.isTryingOnMakeupLook then
        v196[v42.AssetTypeIdToAccessoryTypeEnum[l_AssetTypeIdStrings_0.EyebrowAccessory]] = true;
        v196[v42.AssetTypeIdToAccessoryTypeEnum[l_AssetTypeIdStrings_0.EyelashAccessory]] = true;
    end;
    for _, v207 in l_v192_Accessories_0 do
        local v208 = v42.AccessoryTypeEnumToAssetTypeId[v207.AccessoryType];
        local v209 = not v196[v207.AccessoryType];
        local v210 = v42.AssetTypeToAssetCategory[v208];
        if v210 then
            v209 = not v197[v210];
        end;
        if v43.isDHBundleTryOn(v191.store:getState()) and v42.DynamicHeadAssetTypes[v208] then
            v209 = false;
        end;
        if v209 then
            table.insert(l_Accessories_0, v207);
        end;
    end;
    if v57 and v43.isClassicHeadOrClassicFaceTryOn(v191.store:getState()) then
        l_Accessories_0 = v5.List.filter(l_Accessories_0, function(v211) --[[ Line: 753 ]]
            -- upvalues: v42 (ref)
            local v212 = v42.AccessoryTypeEnumToAssetTypeId[v211.AccessoryType];
            return not v42.DynamicHeadAssetTypes[v212];
        end);
    end;
    v192:SetAccessories(l_Accessories_0, true);
end;
v63.getTryOnsBundleOutfitInfo = function(v213) --[[ Line: 765 ]] --[[ Name: getTryOnsBundleOutfitInfo ]]
    -- upvalues: v42 (copy), v45 (copy)
    local v214 = v213.store:getState();
    for _, v216 in v214.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v216.itemType == v42.ItemType.Bundle and v216.itemSubType == v42.BundleTypeIdStrings.BodyParts then
            local v217 = v45.getOutfitInfoFromBundleId(v214, v216.itemId);
            if v217 then
                return v217;
            end;
        end;
    end;
    return nil;
end;
v63.singleMakeupAssetTryOn = function(v218, v219, v220) --[[ Line: 783 ]] --[[ Name: singleMakeupAssetTryOn ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_getMakeupDescriptionsFromHumanoidDescription_0 (copy), l_getTryOnItemReducerKey_0 (copy), v42 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), l_destroyMakeupDescriptions_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    else
        local v221 = l_getMakeupDescriptionsFromHumanoidDescription_0(v220)[1];
        if not v221 then
            return;
        else
            local v222 = v218.store:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[l_getTryOnItemReducerKey_0(tostring(v221.AssetId), v42.ItemType.Asset)];
            local v223 = l_getMakeupDescriptionsFromHumanoidDescription_0(v219);
            table.sort(v223, function(v224, v225) --[[ Line: 803 ]]
                return v224.Order < v225.Order;
            end);
            local v226 = {};
            for _, v228 in v223 do
                if v228.AssetId == v221.AssetId then
                    return;
                end;
            end;
            if #v223 < l_MAX_MAKEUP_LAYERS_0 then
                v226 = v223;
            else
                table.remove(v223, 1);
                v226 = v223;
            end;
            local v229 = if v222 then v222.order else nil;
            local v230 = #v226;
            v229 = if v229 == nil then v230 else math.max(0, (math.min(v229, v230)));
            local v231 = {};
            for _, v233 in v226 do
                table.insert(v231, v233:Clone());
            end;
            table.insert(v231, v229 + 1, v221);
            l_destroyMakeupDescriptions_0(v219);
            for v234, v235 in v231 do
                v235.Order = v234 - 1;
                v235.Parent = v219;
            end;
            return;
        end;
    end;
end;
v63.lookMakeupTryOn = function(_, v237, v238) --[[ Line: 854 ]] --[[ Name: lookMakeupTryOn ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_destroyMakeupDescriptions_0 (copy), l_getMakeupDescriptionsFromHumanoidDescription_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    else
        l_destroyMakeupDescriptions_0(v237);
        for _, v240 in l_getMakeupDescriptionsFromHumanoidDescription_0(v238) do
            v240:Clone().Parent = v237;
        end;
        return;
    end;
end;
v63.combineTryOnMakeupDescriptionsWithEquipped = function(v241, v242, v243) --[[ Line: 868 ]] --[[ Name: combineTryOnMakeupDescriptionsWithEquipped ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    elseif v241.isTryingOnLook then
        v241:lookMakeupTryOn(v242, v243);
        return;
    else
        v241:singleMakeupAssetTryOn(v242, v243);
        return;
    end;
end;
v63.combineOutfitTryOnAndEquippedHumanoidDescriptions = function(v244) --[[ Line: 883 ]] --[[ Name: combineOutfitTryOnAndEquippedHumanoidDescriptions ]]
    -- upvalues: l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), v42 (copy), l_FFlagAXMakeupEquipping_0 (copy), v54 (copy), l_AvatarEditorService_0 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v52 (copy), l_HumanoidDescriptionScaleToName_0 (copy), v43 (copy), l_FFlagEnableHeadShapeForCharacterManager_0 (copy)
    local v245 = nil;
    local v246 = v244:getTryOnsBundleOutfitInfo();
    v245 = v244.humanoidDescriptionCurrentlyEquipped:Clone();
    if v244.shouldUnequipAccessoriesBeforeTryOn then
        v245:SetAccessories({}, true);
        v245.GraphicTShirt = 0;
        v245.Shirt = 0;
        v245.Pants = 0;
    end;
    for v247, v248 in l_AssetTypeIdStringToHumanoidDescriptionProp_0 do
        if v42.AssetTypeIdToCategory[v247] == v42.AssetCategories.Body and v244.shouldUnequipBodyBeforeTryOn then
            v245[v248] = 0;
        end;
        if not v42.AssetTypeIdToAccessoryTypeEnum[v247] then
            local v249 = v244.humanoidDescriptionTryOn[v248];
            local v250 = true;
            if v249 ~= "" then
                v250 = v249 == 0;
            end;
            if not v250 then
                v245[v248] = v244.humanoidDescriptionTryOn[v248];
            end;
        end;
    end;
    v244:setAccessoriesForTryOn(v245);
    if l_FFlagAXMakeupEquipping_0 then
        v244:combineTryOnMakeupDescriptionsWithEquipped(v245, v244.humanoidDescriptionTryOn);
    end;
    local v251 = nil;
    if v54() then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 924 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v245 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v245);
            else
                return l_AvatarEditorService_0:CheckApplyDefaultClothing(v245);
            end;
        end);
        if l_status_1 then
            v251 = l_result_1;
        else
            l_reportAvatarEventCounterNoAnalyticsArgument_0(v52.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing);
            error(l_result_1);
        end;
    else
        v251 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v245) else l_AvatarEditorService_0:CheckApplyDefaultClothing(v245);
    end;
    v245 = v251 or v245;
    if v246 then
        for v254, v255 in v246.scales do
            v245[l_HumanoidDescriptionScaleToName_0[v254]] = v255;
        end;
    end;
    v43.setAvatarTryOnProperties(v245, v244.store:getState());
    if l_FFlagEnableHeadShapeForCharacterManager_0 then
        v43.applyHeadShapeToHumanoidDescription(v245, v244.store:getState());
    end;
    return v245;
end;
v63.finishApplyDescription = function(v256, v257, v258, v259, v260) --[[ Line: 969 ]] --[[ Name: finishApplyDescription ]]
    -- upvalues: v67 (copy), v62 (copy), v31 (copy), v32 (copy), v45 (copy), v24 (copy)
    if v256.initialHumanoidDescriptionApplied and not v259 then
        v256:updateNoFace(v260);
    end;
    if not v256.initialHumanoidDescriptionApplied then
        local v261 = (tick() - v256.startAvatarModelLoadTime) * 1000;
        v67:info("Avatar model load time: {} ms", v261);
        v256.analytics.Diag:reportStats(v62, v261);
    end;
    if v256.characterModelPool:isR15() then
        v256:adjustHeightToStandOnPlatform(v256._currentCharacter);
    end;
    if v257 then
        v256.store:dispatch(v31());
    elseif v258 then
        v256.store:dispatch(v32());
    end;
    v256.initialHumanoidDescriptionApplied = true;
    if v256._currentCharacter then
        local l_BoundingBox_0, v263 = v256._currentCharacter:GetBoundingBox();
        if not v45.isBoundingBoxVectorSane(v263) or not v45.isBoundingBoxCFrameSane(l_BoundingBox_0) then
            local v264 = v45.calculateNewAssetIdsWithGeometry(v260, v256.lastHumanoidDescriptionApplied);
            if #v264 > 0 then
                v24("(Avatar Experience) bad bounding box on adding assetIds: " .. table.concat(v264, ","));
            end;
        end;
    end;
end;
v63.getCurrentCharacter = function(v265) --[[ Line: 1022 ]] --[[ Name: getCurrentCharacter ]]
    return v265._currentCharacter;
end;
v63.applyHumanoidDescription = function(v266, v267, v268) --[[ Line: 1026 ]] --[[ Name: applyHumanoidDescription ]]
    -- upvalues: v25 (copy), v77 (copy), v29 (copy), v28 (copy), v33 (copy)
    v25.assert(v266.modelInitialized, "applyHumanoidDescription called before initializeModel");
    task.spawn(function() --[[ Line: 1032 ]]
        -- upvalues: v266 (copy), v268 (copy), v77 (ref), v29 (ref), v28 (ref), v33 (ref), v267 (copy)
        if v266.destroyed or not v266._currentCharacter:IsDescendantOf(game) then
            return;
        else
            local l_lastHumanoidDescriptionApplied_0 = v266.lastHumanoidDescriptionApplied;
            local v270 = v266:combineOutfitTryOnAndEquippedHumanoidDescriptions();
            v266.checkBodyColors = false;
            local v271 = v268 and v77(v266.humanoidDescriptionTryOn);
            v266.characterModelPool:maybeUpdateCharacter(v270):andThen(function(v272, v273) --[[ Line: 1047 ]]
                -- upvalues: v266 (ref), v29 (ref), v28 (ref), v33 (ref), v270 (copy), v267 (ref), v268 (ref), v271 (copy), l_lastHumanoidDescriptionApplied_0 (copy)
                v266.store:dispatch(v29());
                if v272 ~= v266._currentCharacter then
                    v266.toolManager:unequipTool();
                    v266._currentCharacter = v272;
                    v266.store:dispatch(v28(v266._currentCharacter));
                    v266._currentCharacter.Parent = v266.characterRoot;
                    v266.toolManager:checkAndEquipTool();
                end;
                if not v273 and v266.store:getState().AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates then
                    v266.store:dispatch(v33());
                end;
                v266.lastHumanoidDescriptionApplied = v270;
                v266:finishApplyDescription(v267, v268, v271, l_lastHumanoidDescriptionApplied_0);
                v266.characterManagerCallbacks.setAppliedDescription(v266._currentCharacter.Humanoid.HumanoidDescription);
            end);
            return;
        end;
    end);
end;
v63.switchAvatarType = function(v274, v275) --[[ Line: 1087 ]] --[[ Name: switchAvatarType ]]
    -- upvalues: v28 (copy), v29 (copy)
    v274._currentCharacter = v274.characterModelPool:switchAvatarType(v275);
    v274.store:dispatch(v28(v274._currentCharacter));
    v274.store:dispatch(v29());
    v274._currentCharacter.Parent = v274.characterRoot;
    v274.toolManager:notifySwitchedAvatarType();
end;
v63.adjustHeightToStandOnPlatform = function(_, v277) --[[ Line: 1098 ]] --[[ Name: adjustHeightToStandOnPlatform ]]
    local l_HumanoidRootPart_0 = v277.HumanoidRootPart;
    local l_Humanoid_0 = v277.Humanoid;
    local v280 = l_HumanoidRootPart_0.Size.y * 0.5 + l_Humanoid_0.HipHeight;
    local v281, _, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292 = l_HumanoidRootPart_0.CFrame:components();
    l_HumanoidRootPart_0.CFrame = CFrame.new(v281, v280, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292);
end;
v63.stop = function(v293) --[[ Line: 1108 ]] --[[ Name: stop ]]
    -- upvalues: v43 (copy)
    v43.updateHumanoidDescriptionUsingOutfitTryOn(v293.store:getState(), v293.humanoidDescriptionTryOn);
    v293:applyHumanoidDescription(true);
    for _, v295 in v293.connections do
        v295:disconnect();
    end;
    v293.connections = {};
    v293.characterModelPool:stop();
    v293.animationManager:stop();
    v293.toolManager:stop();
    v293.initialTryOnApplied = false;
    v293.cachedRoduxState = v293.store:getState();
end;
v63.onDestroy = function(v296) --[[ Line: 1134 ]] --[[ Name: onDestroy ]]
    -- upvalues: v26 (copy), v29 (copy)
    v296.humanoidDescriptionCurrentlyEquipped:Destroy();
    v296.humanoidDescriptionTryOn:Destroy();
    v296.lastHumanoidDescriptionApplied:Destroy();
    v296.characterRoot:Destroy();
    v296.destroyed = true;
    v296.animationManager:onDestroy();
    v296.toolManager:onDestroy();
    v296.characterModelPool:onDestroy();
    v296.store:dispatch(v26(nil));
    v296.store:dispatch(v29());
end;
v63.updateAvatarRoute = function(v297, v298, v299) --[[ Line: 1150 ]] --[[ Name: updateAvatarRoute ]]
    -- upvalues: v45 (copy)
    v297.animationManager:updateAvatarRoute(v298, v299);
    v297.toolManager:updateAvatarRoute(v298, v299);
    v297.latestAvatarRoute = v298;
    local v300 = v45.routeIsPPEStaticImagePage(v298);
    local v301 = v45.routeIsPPEStaticImagePage(v299);
    if v300 and not v301 then
        v297:freezeParticles();
        v297:watchCharacterToFreezeNewParticles();
        return;
    else
        if v301 and not v300 then
            v297:stopWatchingCharacter();
            v297:unfreezeParticles();
        end;
        return;
    end;
end;
v63.watchCharacterToFreezeNewParticles = function(v302) --[[ Line: 1174 ]] --[[ Name: watchCharacterToFreezeNewParticles ]]
    -- upvalues: l_RunService_0 (copy), l_ParticleUtility_0 (copy)
    local l_CurrentCharacter_0 = v302.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        v302.freezeParticlesCharacterConnection = l_CurrentCharacter_0.DescendantAdded:Connect(function(v304) --[[ Line: 1177 ]]
            -- upvalues: l_RunService_0 (ref), v302 (copy), l_ParticleUtility_0 (ref)
            if v304:IsA("Tool") then
                l_RunService_0.Heartbeat:Wait();
                v302:recursiveFreezeParticles(v304);
                l_ParticleUtility_0.FastForwardParticles(v304);
            end;
        end);
    end;
end;
v63.stopWatchingCharacter = function(v305) --[[ Line: 1188 ]] --[[ Name: stopWatchingCharacter ]]
    if v305.freezeParticlesCharacterConnection then
        v305.freezeParticlesCharacterConnection:Disconnect();
        v305.freezeParticlesCharacterConnection = nil;
    end;
end;
v63.instanceIsAParticleEffect = function(_, v307) --[[ Line: 1195 ]] --[[ Name: instanceIsAParticleEffect ]]
    return v307:IsA("ParticleEmitter") or v307:IsA("Fire") or v307:IsA("Smoke") or v307:IsA("Sparkles");
end;
v63.recursiveFreezeParticles = function(v308, v309) --[[ Line: 1199 ]] --[[ Name: recursiveFreezeParticles ]]
    -- upvalues: l_ParticleUtility_0 (copy)
    if l_ParticleUtility_0.InstanceIsAParticleEffect(v309) then
        v308.frozenParticlesToTimeScale[v309] = v309.TimeScale;
        v309.TimeScale = 0;
    end;
    for _, v311 in (v309:GetChildren()) do
        v308:recursiveFreezeParticles(v311);
    end;
end;
v63.freezeParticles = function(v312) --[[ Line: 1210 ]] --[[ Name: freezeParticles ]]
    v312.frozenParticlesToTimeScale = {};
    local l_CurrentCharacter_1 = v312.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_1 then
        v312:recursiveFreezeParticles(l_CurrentCharacter_1);
    end;
end;
v63.unfreezeParticles = function(v314) --[[ Line: 1224 ]] --[[ Name: unfreezeParticles ]]
    if v314.frozenParticlesToTimeScale then
        for v315, v316 in v314.frozenParticlesToTimeScale do
            v315.TimeScale = v316;
        end;
        v314.frozenParticlesToTimeScale = {};
    end;
end;
return v63;