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
local l_FFlagAXRemoveMakeupAvatarLookTryOn_0 = v10.FFlagAXRemoveMakeupAvatarLookTryOn;
local l_FFlagEnableHeadShapeForCharacterManager_0 = v10.FFlagEnableHeadShapeForCharacterManager;
local l_FFlagFixHeadShapeColorSlider_0 = v10.FFlagFixHeadShapeColorSlider;
local v63 = settings():GetFVariable("LuaAppsDiagLoadTimeAvatarModel") .. "_" .. v45.getDeviceType();
local v64 = {};
v64.__index = v64;
local l_AssetTypeIdStringToHumanoidDescriptionProp_0 = v42.AssetTypeIdStringToHumanoidDescriptionProp;
local l_HumanoidDescriptionScaleToName_0 = v42.HumanoidDescriptionScaleToName;
local l_AssetTypeIdStrings_0 = v42.AssetTypeIdStrings;
local v68 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.loadtime");
local v69 = {
    toastMessage = "Feature.Avatar.Message.FaceNotVisible", 
    isLocalized = false, 
    toastType = v47.InformationMessage
};
local function _(v70) --[[ Line: 125 ]] --[[ Name: isHumanoidDescriptionPropertyEmpty ]]
    local v71 = true;
    if v70 ~= "" then
        v71 = v70 == 0;
    end;
    return v71;
end;
local function v78(v73) --[[ Line: 129 ]] --[[ Name: isHumanoidDescriptionEmpty ]]
    -- upvalues: l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy)
    for _, v75 in l_AssetTypeIdStringToHumanoidDescriptionProp_0 do
        local v76 = v73[v75];
        local v77 = true;
        if v76 ~= "" then
            v77 = v76 == 0;
        end;
        if not v77 then
            return false;
        end;
    end;
    if #v73:GetAccessories(true) > 0 then
        return false;
    else
        return true;
    end;
end;
v64.new = function(v79, v80, v81, v82, v83, v84, v85, v86, v87) --[[ Line: 146 ]] --[[ Name: new ]]
    -- upvalues: v64 (copy), v36 (copy), v28 (copy), v29 (copy), v34 (copy), v35 (copy), l_IsVRAppBuild_0 (copy)
    local v88 = {};
    setmetatable(v88, v64);
    v88.startAvatarModelLoadTime = tick();
    v88.connections = {};
    v88.store = v79;
    v88.networking = v80;
    v88.analytics = v81;
    v88.characterManagerEvents = v84;
    v88.characterManagerCallbacks = v85;
    v88.catalogAnalytics = v86;
    v88.characterModelPool = v36.new(v79, v81, v83, v87);
    v88._currentCharacter = v88.characterModelPool:getCurrentCharacter();
    v88.store:dispatch(v28(v88._currentCharacter));
    v88.store:dispatch(v29());
    v88.characterRoot = Instance.new("Folder");
    v88.characterRoot.Name = "CharacterRoot";
    v88.characterRoot.Parent = game.Workspace;
    v88.needsToEquipBundleTryOn = false;
    v88.initialHumanoidDescriptionApplied = false;
    v88.initialTryOnApplied = false;
    v88.destroyed = false;
    v88.checkBodyColors = true;
    v88.modelInitialized = false;
    v88.firstCallinPPE = true;
    v88.shouldUnequipAccessoriesBeforeTryOn = false;
    v88.animationManager = v34.new(v79, v88, v82);
    v88.toolManager = v35.new(v79, v88.animationManager, v88);
    v88.humanoidDescriptionCurrentlyEquipped = Instance.new("HumanoidDescription");
    v88.humanoidDescriptionTryOn = Instance.new("HumanoidDescription");
    v88.lastHumanoidDescriptionApplied = Instance.new("HumanoidDescription");
    if not l_IsVRAppBuild_0() then
        v88:maybeInitializeModel(v88.store:getState());
    end;
    v88.cachedRoduxState = v88.store:getState();
    return v88;
end;
v64.maybeInitializeModel = function(v89, v90) --[[ Line: 220 ]] --[[ Name: maybeInitializeModel ]]
    -- upvalues: v37 (copy)
    if not v89.modelInitialized and v37(v90) then
        v89.modelInitialized = true;
        v89:initializeModel(v90);
    end;
end;
v64.setupAnimations = function(v91, v92, v93) --[[ Line: 227 ]] --[[ Name: setupAnimations ]]
    v91.characterModelPool:setupAnimations(v92, v93);
end;
v64.initializeModel = function(v94, v95) --[[ Line: 232 ]] --[[ Name: initializeModel ]]
    -- upvalues: v41 (copy)
    local l_AvatarType_0 = v95.AvatarExperience.AvatarEditor.Character.AvatarType;
    if l_AvatarType_0 == v41.AvatarType.R6 then
        v94:switchAvatarType(l_AvatarType_0);
    end;
    v94._currentCharacter.Parent = v94.characterRoot;
    v94:updateHumanoidDescriptionCurrentlyEquipped(v95);
    v94:applyHumanoidDescription(true);
    v94.toolManager:update(v95);
end;
v64.updateCharacterFromConnection = function(v97, v98) --[[ Line: 245 ]] --[[ Name: updateCharacterFromConnection ]]
    v97.characterModelPool:maybeUpdateCharacter(v98):andThen(function(_, _) --[[ Line: 246 ]]
        -- upvalues: v97 (copy)
        v97.characterManagerCallbacks.setAppliedDescription(v97._currentCharacter.Humanoid.HumanoidDescription);
    end);
end;
v64.initAvatarScalesChangedConnection = function(v101) --[[ Line: 251 ]] --[[ Name: initAvatarScalesChangedConnection ]]
    -- upvalues: l_HumanoidDescriptionScaleToName_0 (copy)
    local v106 = v101.characterManagerEvents.avatarScalesChangedEvent:Connect(function(v102) --[[ Line: 252 ]]
        -- upvalues: v101 (copy), l_HumanoidDescriptionScaleToName_0 (ref)
        if not v102 then
            return;
        else
            local v103 = v101.lastHumanoidDescriptionApplied:Clone();
            for v104, v105 in v102 do
                v103[l_HumanoidDescriptionScaleToName_0[v104]] = v105;
            end;
            v101:updateCharacterFromConnection(v103);
            if v101.characterModelPool:isR15() then
                v101:adjustHeightToStandOnPlatform(v101._currentCharacter);
            end;
            return;
        end;
    end);
    table.insert(v101.connections, v106);
end;
v64.initBodyColorsChangedConnection = function(v107) --[[ Line: 269 ]] --[[ Name: initBodyColorsChangedConnection ]]
    -- upvalues: v39 (copy), v41 (copy), v16 (copy), v48 (copy), v54 (copy), l_AvatarEditorService_0 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v52 (copy)
    local v119 = v107.characterManagerEvents.bodyColorsChangedEvent:Connect(function(v108) --[[ Line: 270 ]]
        -- upvalues: v107 (copy), v39 (ref), v41 (ref), v16 (ref), v48 (ref), v54 (ref), l_AvatarEditorService_0 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v52 (ref)
        if not v108 then
            v107.overrideBodyColor3s = nil;
            return;
        else
            local v109 = v107.store:getState();
            if v39(v109) then
                v107.overrideBodyColor3s = nil;
                return;
            else
                local l_selectedBodyPartIndex_0 = v109.AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex;
                local l_bodyPartForSkinColoringIds_0 = v41.BodyPartButtonData[l_selectedBodyPartIndex_0].bodyPartForSkinColoringIds;
                local v112 = {};
                for _, v114 in l_bodyPartForSkinColoringIds_0 do
                    v112[v114] = v108;
                end;
                local v115 = nil;
                if v16(v109) then
                    v115 = v107:combineOutfitTryOnAndEquippedHumanoidDescriptions();
                    v107:updateHumanoidDescriptionTryOnWithColors(v109);
                else
                    v115 = v107.humanoidDescriptionCurrentlyEquipped:Clone();
                end;
                v48.setHumanoidDescriptionColorsFromBodyColor3s(v115, v112);
                local v116 = nil;
                if v54() then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 301 ]]
                        -- upvalues: l_AvatarEditorService_0 (ref), v115 (ref)
                        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                            return l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v115);
                        else
                            return l_AvatarEditorService_0:CheckApplyDefaultClothing(v115);
                        end;
                    end);
                    if l_status_0 then
                        v116 = l_result_0;
                    else
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v52.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing);
                        error(l_result_0);
                    end;
                else
                    v116 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v115) else l_AvatarEditorService_0:CheckApplyDefaultClothing(v115);
                end;
                v107.overrideBodyColor3s = v112;
                v107:updateCharacterFromConnection(v116 or v115);
                return;
            end;
        end;
    end);
    table.insert(v107.connections, v119);
end;
v64.initAdjustmentChangedConnection = function(v120) --[[ Line: 329 ]] --[[ Name: initAdjustmentChangedConnection ]]
    -- upvalues: v45 (copy)
    local v127 = v120.characterManagerEvents.adjustmentChangedEvent:Connect(function(v121, v122, v123) --[[ Line: 331 ]]
        -- upvalues: v120 (copy), v45 (ref)
        local l_SelectedAccessory_0 = v120.store:getState().AvatarExperience.AccessoryAdjustment.SelectedAccessory;
        local v125 = v120.lastHumanoidDescriptionApplied:Clone();
        local v126 = v45.getSelectedAccessoryDescription(v125, l_SelectedAccessory_0);
        if v126 then
            if v121 then
                v126.Position = v121;
            end;
            if v122 then
                v126.Rotation = v122;
            end;
            if v123 then
                v126.Scale = v123;
            end;
            v120:updateCharacterFromConnection(v125);
        end;
    end);
    table.insert(v120.connections, v127);
end;
v64.start = function(v128) --[[ Line: 354 ]] --[[ Name: start ]]
    -- upvalues: v56 (copy)
    v128:maybeInitializeModel(v128.store:getState());
    v128._currentCharacter.Parent = v128.characterRoot;
    local v131 = v128.store.changed:connect(function(v129, v130) --[[ Line: 358 ]]
        -- upvalues: v128 (copy)
        v128:update(v129, v130);
    end);
    table.insert(v128.connections, v131);
    if v56 then
        v128:initAvatarScalesChangedConnection();
    end;
    v128:initBodyColorsChangedConnection();
    v128:initAdjustmentChangedConnection();
    v128.characterModelPool:start();
    v128.animationManager:start();
    v128.toolManager:start();
    v128:updateHumanoidDescriptionCurrentlyEquipped(v128.store:getState());
    v128:applyHumanoidDescription(true);
    v128.toolManager:update(v128.store:getState());
    v128:update(v128.store:getState(), v128.cachedRoduxState);
end;
v64.updateHumanoidDescriptionTryOnWithColors = function(v132, v133) --[[ Line: 387 ]] --[[ Name: updateHumanoidDescriptionTryOnWithColors ]]
    -- upvalues: v39 (copy), v40 (copy), v17 (copy), v48 (copy)
    local v134 = if v39(v133) then v40(v133) else if v132.overrideBodyColor3s then v132.overrideBodyColor3s else v17(v133);
    v48.setHumanoidDescriptionColorsFromBodyColor3s(v132.humanoidDescriptionTryOn, v134);
end;
v64.update = function(v135, v136, v137) --[[ Line: 395 ]] --[[ Name: update ]]
    -- upvalues: v43 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v7 (copy), v41 (copy), v46 (copy), v27 (copy), l_FFlagAXMakeupEquipping_0 (copy), v42 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v44 (copy)
    local v138 = v135:shouldUpdateHumanoidDescriptionCurrentlyEquipped(v136, v137);
    if v138 then
        v135:updateHumanoidDescriptionCurrentlyEquipped(v136);
    end;
    local v139 = v135:shouldUpdateHumanoidDescriptionTryOnOutfit(v136, v137);
    if v139 then
        v43.updateHumanoidDescriptionUsingOutfitTryOn(v136, v135.humanoidDescriptionTryOn);
        if if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v7.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil then
            local v140 = v135.store:getState().AvatarExperience.AvatarEditor.AvatarSettings[v41.AvatarSettings.accessoryRefinementTypes];
            local v141 = v46.getAdjustableAccessories(v135.humanoidDescriptionTryOn, v140);
            v135.store:dispatch(v27(v141));
        end;
    end;
    local l_AvatarType_1 = v136.AvatarExperience.AvatarEditor.Character.AvatarType;
    local v143 = l_AvatarType_1 ~= v137.AvatarExperience.AvatarEditor.Character.AvatarType;
    if v143 then
        v135:switchAvatarType(l_AvatarType_1);
    end;
    if l_FFlagAXMakeupEquipping_0 then
        v135.isTryingOnLook = v136.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil;
        v135.isTryingOnMakeupLook = v135.isTryingOnLook and v136.AvatarExperience.AvatarScene.OutfitTryOn.LookType == v42.LookType.Makeup;
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        v135.isTryingOnMakeupLook = v136.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId ~= nil;
        v135.shouldUnequipAccessoriesBeforeTryOn = v136.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems and not v135.isTryingOnMakeupLook;
    else
        v135.shouldUnequipAccessoriesBeforeTryOn = v136.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil and not v135.isTryingOnMakeupLook;
    end;
    v135.shouldUnequipBodyBeforeTryOn = v44.shouldUnequipBodyBeforeTryOn(v136);
    local v144 = v137.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= v136.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
    if v138 or v139 or v143 then
        v135:applyHumanoidDescription(v138, v139);
    end;
    if v144 or v138 or v139 or v143 then
        v135.toolManager:update(v136);
    end;
end;
v64.updateNoFace = function(v145, v146) --[[ Line: 463 ]] --[[ Name: updateNoFace ]]
    -- upvalues: l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), l_AssetTypeIdStrings_0 (copy), v30 (copy), v5 (copy), v69 (copy), v42 (copy)
    local l_Head_0 = v145._currentCharacter:FindFirstChild("Head");
    if not l_Head_0 then
        warn("No head was found on the character!");
        return;
    else
        local v148 = not l_Head_0:FindFirstChildWhichIsA("Decal");
        local v149 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[l_AssetTypeIdStrings_0.Face];
        local v150 = v146[v149];
        local v151 = v145.lastHumanoidDescriptionApplied[v149];
        if v148 and v150 ~= v151 and v151 ~= 0 then
            v145.store:dispatch(v30(v5.Dictionary.join(v69)));
            local l_catalogAnalytics_0 = v145.catalogAnalytics;
            local l_latestAvatarRoute_0 = v145.latestAvatarRoute;
            if l_catalogAnalytics_0 and l_latestAvatarRoute_0 and l_latestAvatarRoute_0.opaque then
                l_catalogAnalytics_0.sendAXCounterV2(v42.Counter.Toasts.NoFaceHead, {
                    route = l_latestAvatarRoute_0.opaque.name
                });
            end;
        end;
        return;
    end;
end;
v64.shouldUpdateHumanoidDescriptionCurrentlyEquipped = function(_, v155, v156) --[[ Line: 495 ]] --[[ Name: shouldUpdateHumanoidDescriptionCurrentlyEquipped ]]
    local l_EquippedAssets_0 = v155.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_EquippedAssets_1 = v156.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_0 = v155.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_AvatarScales_1 = v156.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_BodyColors_0 = v155.AvatarExperience.AvatarEditor.Character.BodyColors;
    local l_BodyColors_1 = v156.AvatarExperience.AvatarEditor.Character.BodyColors;
    local l_BodyColor3s_0 = v155.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local l_BodyColor3s_1 = v156.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local v165 = l_EquippedAssets_0 ~= l_EquippedAssets_1;
    local v166 = l_AvatarScales_0 ~= l_AvatarScales_1;
    local v167 = l_BodyColors_0 ~= l_BodyColors_1;
    local v168 = l_BodyColor3s_0 ~= l_BodyColor3s_1;
    return v165 or v166 or v167 or v168;
end;
v64.updateHumanoidDescriptionCurrentlyEquipped = function(v169, v170) --[[ Line: 512 ]] --[[ Name: updateHumanoidDescriptionCurrentlyEquipped ]]
    -- upvalues: l_Logging_0 (copy), v55 (copy), v43 (copy), l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), l_AssetTypeIdStrings_0 (copy), v5 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), v42 (copy), v45 (copy), l_FFlagFixHeadShapeColorSlider_0 (copy), l_setMakeupDescriptions_0 (copy), l_HumanoidDescriptionScaleToName_0 (copy), v48 (copy)
    local l_EquippedAssets_2 = v170.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_2 = v170.AvatarExperience.AvatarEditor.Character.AvatarScales;
    if not l_EquippedAssets_2 then
        l_Logging_0.warn("CharacterManager: Equipped assets has not been initialized!");
        return;
    else
        if v55() then
            v43.resetHumanoidDescriptionProperties(v169.humanoidDescriptionCurrentlyEquipped);
        else
            for _, v174 in l_AssetTypeIdStringToHumanoidDescriptionProp_0 do
                v169.humanoidDescriptionCurrentlyEquipped[v174] = "";
            end;
        end;
        v169.humanoidDescriptionCurrentlyEquipped:SetAccessories({}, true);
        local v175 = {};
        local v176 = false;
        local v177 = false;
        if l_EquippedAssets_2 and (not l_EquippedAssets_2[l_AssetTypeIdStrings_0.Head] or v5.isEmpty(l_EquippedAssets_2[l_AssetTypeIdStrings_0.Head])) then
            v176 = true;
        elseif l_EquippedAssets_2 and (not l_EquippedAssets_2[l_AssetTypeIdStrings_0.DynamicHead] or v5.isEmpty(l_EquippedAssets_2[l_AssetTypeIdStrings_0.DynamicHead])) then
            v177 = true;
        end;
        for v178, v179 in l_EquippedAssets_2 do
            local v180 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[v178];
            if v178 ~= l_AssetTypeIdStrings_0.Gear and (not l_FFlagAXMakeupEquipping_0 or not l_isMakeupAssetType_0(v178)) then
                if v42.AssetTypeIdToAccessoryTypeEnum[v178] then
                    for v181, v182 in v179 do
                        table.insert(v175, v45.createHumanoidDescriptionAccessoryInfo(v178, v181, v182));
                    end;
                elseif v180 and (v178 ~= l_AssetTypeIdStrings_0.Head or not v176) and (v178 ~= l_AssetTypeIdStrings_0.DynamicHead or not v177) then
                    local v183 = v5.Dictionary.keys(v179);
                    if #v183 == 0 then
                        v169.humanoidDescriptionCurrentlyEquipped[v180] = 0;
                    elseif l_FFlagFixHeadShapeColorSlider_0 and v178 == v42.AssetTypeIdStrings.DynamicHead then
                        v43.applyHeadShapeFromAssetMetadata(v169.humanoidDescriptionCurrentlyEquipped, v179);
                    else
                        v169.humanoidDescriptionCurrentlyEquipped[v180] = table.concat(v183, ",");
                    end;
                end;
            end;
        end;
        v169.humanoidDescriptionCurrentlyEquipped:SetAccessories(v175, true);
        if l_FFlagAXMakeupEquipping_0 then
            l_setMakeupDescriptions_0(v169.humanoidDescriptionCurrentlyEquipped, l_EquippedAssets_2);
        end;
        for v184, v185 in l_AvatarScales_2 do
            v169.humanoidDescriptionCurrentlyEquipped[l_HumanoidDescriptionScaleToName_0[v184]] = v185;
        end;
        v169.checkBodyColors = true;
        if v169.overrideBodyColor3s then
            v48.setHumanoidDescriptionColorsFromBodyColor3s(v169.humanoidDescriptionCurrentlyEquipped, v169.overrideBodyColor3s);
            return;
        else
            v48.setHumanoidDescriptionColorsFromCharacter(v169.humanoidDescriptionCurrentlyEquipped, v170.AvatarExperience);
            return;
        end;
    end;
end;
v64.shouldUpdateHumanoidDescriptionTryOnOutfit = function(v186, v187, v188) --[[ Line: 621 ]] --[[ Name: shouldUpdateHumanoidDescriptionTryOnOutfit ]]
    -- upvalues: v45 (copy), v38 (copy), v39 (copy)
    if v186.latestAvatarRoute then
        if v45.routeIsProfilePictureEditor(v186.latestAvatarRoute) then
            if not v186.firstCallinPPE then
                return false;
            else
                v186.firstCallinPPE = false;
            end;
        else
            v186.firstCallinPPE = true;
        end;
    end;
    local v189 = v187.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems ~= v188.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v190 = v187.AvatarExperience.LayeredClothingSort.CurrentSort ~= v188.AvatarExperience.LayeredClothingSort.CurrentSort;
    local v191 = v38(v187) ~= v38(v188);
    if not v186.initialTryOnApplied then
        v189 = true;
        v186.initialTryOnApplied = true;
    end;
    if v189 or v190 or v191 then
        return true;
    elseif v187.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s ~= v188.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s then
        return true;
    elseif v39(v187) ~= v39(v188) then
        return true;
    else
        return false;
    end;
end;
v64.setAccessoriesForTryOn = function(v192, v193) --[[ Line: 682 ]] --[[ Name: setAccessoriesForTryOn ]]
    -- upvalues: v42 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_AssetTypeIdStrings_0 (copy), v43 (copy), v57 (copy), v5 (copy)
    local l_v193_Accessories_0 = v193:GetAccessories(true);
    local l_Accessories_0 = v192.humanoidDescriptionTryOn:GetAccessories(true);
    local l_RemovedList_0 = v192.store:getState().AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
    local v197 = {};
    local v198 = {};
    for _, v200 in l_Accessories_0 do
        local v201 = v42.AccessoryTypeEnumToAssetTypeId[v200.AccessoryType];
        local v202 = v42.AssetTypeToAssetCategory[v201];
        v197[v200.AccessoryType] = true;
        if v202 then
            v198[v202] = true;
        end;
    end;
    for _, v204 in l_RemovedList_0 do
        if not l_FFlagAXMakeupEquipping_0 or not l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v204] then
            local v205 = v42.AssetTypeIdToAccessoryTypeEnum[v204];
            local v206 = v42.AssetTypeToAssetCategory[v204];
            v197[v205] = true;
            if v206 then
                v198[v206] = true;
            end;
        end;
    end;
    if l_FFlagAXMakeupEquipping_0 and v192.isTryingOnMakeupLook then
        v197[v42.AssetTypeIdToAccessoryTypeEnum[l_AssetTypeIdStrings_0.EyebrowAccessory]] = true;
        v197[v42.AssetTypeIdToAccessoryTypeEnum[l_AssetTypeIdStrings_0.EyelashAccessory]] = true;
    end;
    for _, v208 in l_v193_Accessories_0 do
        local v209 = v42.AccessoryTypeEnumToAssetTypeId[v208.AccessoryType];
        local v210 = not v197[v208.AccessoryType];
        local v211 = v42.AssetTypeToAssetCategory[v209];
        if v211 then
            v210 = not v198[v211];
        end;
        if v43.isDHBundleTryOn(v192.store:getState()) and v42.DynamicHeadAssetTypes[v209] then
            v210 = false;
        end;
        if v210 then
            table.insert(l_Accessories_0, v208);
        end;
    end;
    if v57 and v43.isClassicHeadOrClassicFaceTryOn(v192.store:getState()) then
        l_Accessories_0 = v5.List.filter(l_Accessories_0, function(v212) --[[ Line: 756 ]]
            -- upvalues: v42 (ref)
            local v213 = v42.AccessoryTypeEnumToAssetTypeId[v212.AccessoryType];
            return not v42.DynamicHeadAssetTypes[v213];
        end);
    end;
    v193:SetAccessories(l_Accessories_0, true);
end;
v64.getTryOnsBundleOutfitInfo = function(v214) --[[ Line: 768 ]] --[[ Name: getTryOnsBundleOutfitInfo ]]
    -- upvalues: v42 (copy), v45 (copy)
    local v215 = v214.store:getState();
    for _, v217 in v215.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v217.itemType == v42.ItemType.Bundle and v217.itemSubType == v42.BundleTypeIdStrings.BodyParts then
            local v218 = v45.getOutfitInfoFromBundleId(v215, v217.itemId);
            if v218 then
                return v218;
            end;
        end;
    end;
    return nil;
end;
v64.makeupAssetsTryOn = function(v219, v220, v221) --[[ Line: 786 ]] --[[ Name: makeupAssetsTryOn ]]
    -- upvalues: l_getMakeupDescriptionsFromHumanoidDescription_0 (copy), v5 (copy), l_getTryOnItemReducerKey_0 (copy), v42 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), l_destroyMakeupDescriptions_0 (copy)
    local v222 = l_getMakeupDescriptionsFromHumanoidDescription_0(v221);
    if #v222 == 0 then
        return;
    else
        local v223 = v219.store:getState();
        local l_TryOnItems_0 = v223.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v225 = l_getMakeupDescriptionsFromHumanoidDescription_0(v220);
        if v223.AvatarExperience.LayeredClothingSort and v223.AvatarExperience.LayeredClothingSort.CurrentSort and #v223.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList > 0 then
            local l_OrderedList_0 = v223.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
            local l_l_OrderedList_0_0 = l_OrderedList_0 --[[ copy: 7 -> 16 ]];
            v225 = v5.List.filter(v225, function(v228) --[[ Line: 805 ]]
                -- upvalues: l_l_OrderedList_0_0 (copy)
                for _, v230 in l_l_OrderedList_0_0 do
                    if tostring(v230.id) == tostring(v228.AssetId) then
                        return true;
                    end;
                end;
                return false;
            end);
        end;
        table.sort(v225, function(v231, v232) --[[ Line: 816 ]]
            return v231.Order < v232.Order;
        end);
        local v233 = {};
        for _, v235 in v225 do
            v233[v235.AssetId] = true;
        end;
        local v236 = {};
        for _, v238 in v222 do
            if not v233[v238.AssetId] then
                local v239 = l_TryOnItems_0[l_getTryOnItemReducerKey_0(tostring(v238.AssetId), v42.ItemType.Asset)];
                v238.Order = if v239 then v239.order else l_MAX_MAKEUP_LAYERS_0;
                table.insert(v236, v238);
            end;
        end;
        local v240 = {};
        v240 = if #v225 + #v236 <= l_MAX_MAKEUP_LAYERS_0 then v225 else {
            table.unpack(v225, #v225 + #v236 - l_MAX_MAKEUP_LAYERS_0 + 1)
        };
        for _, v242 in v236 do
            table.insert(v240, v242);
        end;
        table.sort(v240, function(v243, v244) --[[ Line: 858 ]]
            -- upvalues: l_getTryOnItemReducerKey_0 (ref), v42 (ref), l_TryOnItems_0 (copy)
            if v243.Order == v244.Order then
                local v245 = l_getTryOnItemReducerKey_0(tostring(v243.AssetId), v42.ItemType.Asset);
                local v246 = l_getTryOnItemReducerKey_0(tostring(v244.AssetId), v42.ItemType.Asset);
                if not l_TryOnItems_0[v245] then
                    return true;
                elseif not l_TryOnItems_0[v246] then
                    return false;
                else
                    return l_TryOnItems_0[v245].itemRecency < l_TryOnItems_0[v246].itemRecency;
                end;
            else
                return v243.Order < v244.Order;
            end;
        end);
        local v247 = {};
        for _, v249 in v240 do
            table.insert(v247, v249:Clone());
        end;
        l_destroyMakeupDescriptions_0(v220);
        for v250, v251 in v247 do
            v251.Order = v250 - 1;
            v251.Parent = v220;
        end;
        return;
    end;
end;
v64.singleMakeupAssetTryOn = function(v252, v253, v254) --[[ Line: 891 ]] --[[ Name: singleMakeupAssetTryOn ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_getMakeupDescriptionsFromHumanoidDescription_0 (copy), l_getTryOnItemReducerKey_0 (copy), v42 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), l_destroyMakeupDescriptions_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    else
        local v255 = l_getMakeupDescriptionsFromHumanoidDescription_0(v254)[1];
        if not v255 then
            return;
        else
            local v256 = v252.store:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[l_getTryOnItemReducerKey_0(tostring(v255.AssetId), v42.ItemType.Asset)];
            local v257 = l_getMakeupDescriptionsFromHumanoidDescription_0(v253);
            table.sort(v257, function(v258, v259) --[[ Line: 911 ]]
                return v258.Order < v259.Order;
            end);
            local v260 = {};
            for _, v262 in v257 do
                if v262.AssetId == v255.AssetId then
                    return;
                end;
            end;
            if #v257 < l_MAX_MAKEUP_LAYERS_0 then
                v260 = v257;
            else
                table.remove(v257, 1);
                v260 = v257;
            end;
            local v263 = if v256 then v256.order else nil;
            local v264 = #v260;
            v263 = if v263 == nil then v264 else math.max(0, (math.min(v263, v264)));
            local v265 = {};
            for _, v267 in v260 do
                table.insert(v265, v267:Clone());
            end;
            table.insert(v265, v263 + 1, v255);
            l_destroyMakeupDescriptions_0(v253);
            for v268, v269 in v265 do
                v269.Order = v268 - 1;
                v269.Parent = v253;
            end;
            return;
        end;
    end;
end;
v64.lookMakeupTryOn = function(_, v271, v272) --[[ Line: 962 ]] --[[ Name: lookMakeupTryOn ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_destroyMakeupDescriptions_0 (copy), l_getMakeupDescriptionsFromHumanoidDescription_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    else
        l_destroyMakeupDescriptions_0(v271);
        for _, v274 in l_getMakeupDescriptionsFromHumanoidDescription_0(v272) do
            v274:Clone().Parent = v271;
        end;
        return;
    end;
end;
v64.combineTryOnMakeupDescriptionsWithEquipped = function(v275, v276, v277) --[[ Line: 976 ]] --[[ Name: combineTryOnMakeupDescriptionsWithEquipped ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    elseif v275.isTryingOnMakeupLook then
        v275:lookMakeupTryOn(v276, v277);
        return;
    elseif l_FFlagAXMISEnableMultiShopping_0 then
        v275:makeupAssetsTryOn(v276, v277);
        return;
    else
        v275:singleMakeupAssetTryOn(v276, v277);
        return;
    end;
end;
v64.combineOutfitTryOnAndEquippedHumanoidDescriptions = function(v278) --[[ Line: 995 ]] --[[ Name: combineOutfitTryOnAndEquippedHumanoidDescriptions ]]
    -- upvalues: l_FFlagAXRemoveMakeupAvatarLookTryOn_0 (copy), l_destroyMakeupDescriptions_0 (copy), l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), v42 (copy), l_FFlagAXMakeupEquipping_0 (copy), v54 (copy), l_AvatarEditorService_0 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v52 (copy), l_HumanoidDescriptionScaleToName_0 (copy), v43 (copy), l_FFlagEnableHeadShapeForCharacterManager_0 (copy)
    local v279 = nil;
    local v280 = v278:getTryOnsBundleOutfitInfo();
    v279 = v278.humanoidDescriptionCurrentlyEquipped:Clone();
    if v278.shouldUnequipAccessoriesBeforeTryOn then
        v279:SetAccessories({}, true);
        v279.GraphicTShirt = 0;
        v279.Shirt = 0;
        v279.Pants = 0;
        if l_FFlagAXRemoveMakeupAvatarLookTryOn_0 then
            l_destroyMakeupDescriptions_0(v279);
        end;
    end;
    for v281, v282 in l_AssetTypeIdStringToHumanoidDescriptionProp_0 do
        if v42.AssetTypeIdToCategory[v281] == v42.AssetCategories.Body and v278.shouldUnequipBodyBeforeTryOn then
            v279[v282] = 0;
        end;
        if not v42.AssetTypeIdToAccessoryTypeEnum[v281] then
            local v283 = v278.humanoidDescriptionTryOn[v282];
            local v284 = true;
            if v283 ~= "" then
                v284 = v283 == 0;
            end;
            if not v284 then
                v279[v282] = v278.humanoidDescriptionTryOn[v282];
            end;
        end;
    end;
    v278:setAccessoriesForTryOn(v279);
    if l_FFlagAXMakeupEquipping_0 then
        v278:combineTryOnMakeupDescriptionsWithEquipped(v279, v278.humanoidDescriptionTryOn);
    end;
    local v285 = nil;
    if v54() then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 1040 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v279 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v279);
            else
                return l_AvatarEditorService_0:CheckApplyDefaultClothing(v279);
            end;
        end);
        if l_status_1 then
            v285 = l_result_1;
        else
            l_reportAvatarEventCounterNoAnalyticsArgument_0(v52.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing);
            error(l_result_1);
        end;
    else
        v285 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v279) else l_AvatarEditorService_0:CheckApplyDefaultClothing(v279);
    end;
    v279 = v285 or v279;
    if v280 then
        for v288, v289 in v280.scales do
            v279[l_HumanoidDescriptionScaleToName_0[v288]] = v289;
        end;
    end;
    v43.setAvatarTryOnProperties(v279, v278.store:getState());
    if l_FFlagEnableHeadShapeForCharacterManager_0 then
        v43.applyHeadShapeToHumanoidDescription(v279, v278.store:getState());
    end;
    return v279;
end;
v64.finishApplyDescription = function(v290, v291, v292, v293, v294) --[[ Line: 1085 ]] --[[ Name: finishApplyDescription ]]
    -- upvalues: v68 (copy), v63 (copy), v31 (copy), v32 (copy), v45 (copy), v24 (copy)
    if v290.initialHumanoidDescriptionApplied and not v293 then
        v290:updateNoFace(v294);
    end;
    if not v290.initialHumanoidDescriptionApplied then
        local v295 = (tick() - v290.startAvatarModelLoadTime) * 1000;
        v68:info("Avatar model load time: {} ms", v295);
        v290.analytics.Diag:reportStats(v63, v295);
    end;
    if v290.characterModelPool:isR15() then
        v290:adjustHeightToStandOnPlatform(v290._currentCharacter);
    end;
    if v291 then
        v290.store:dispatch(v31());
    elseif v292 then
        v290.store:dispatch(v32());
    end;
    v290.initialHumanoidDescriptionApplied = true;
    if v290._currentCharacter then
        local l_BoundingBox_0, v297 = v290._currentCharacter:GetBoundingBox();
        if not v45.isBoundingBoxVectorSane(v297) or not v45.isBoundingBoxCFrameSane(l_BoundingBox_0) then
            local v298 = v45.calculateNewAssetIdsWithGeometry(v294, v290.lastHumanoidDescriptionApplied);
            if #v298 > 0 then
                v24("(Avatar Experience) bad bounding box on adding assetIds: " .. table.concat(v298, ","));
            end;
        end;
    end;
end;
v64.getCurrentCharacter = function(v299) --[[ Line: 1138 ]] --[[ Name: getCurrentCharacter ]]
    return v299._currentCharacter;
end;
v64.applyHumanoidDescription = function(v300, v301, v302) --[[ Line: 1142 ]] --[[ Name: applyHumanoidDescription ]]
    -- upvalues: v25 (copy), v78 (copy), v29 (copy), v28 (copy), v33 (copy)
    v25.assert(v300.modelInitialized, "applyHumanoidDescription called before initializeModel");
    task.spawn(function() --[[ Line: 1148 ]]
        -- upvalues: v300 (copy), v302 (copy), v78 (ref), v29 (ref), v28 (ref), v33 (ref), v301 (copy)
        if v300.destroyed or not v300._currentCharacter:IsDescendantOf(game) then
            return;
        else
            local l_lastHumanoidDescriptionApplied_0 = v300.lastHumanoidDescriptionApplied;
            local v304 = v300:combineOutfitTryOnAndEquippedHumanoidDescriptions();
            v300.checkBodyColors = false;
            local v305 = v302 and v78(v300.humanoidDescriptionTryOn);
            v300.characterModelPool:maybeUpdateCharacter(v304):andThen(function(v306, v307) --[[ Line: 1163 ]]
                -- upvalues: v300 (ref), v29 (ref), v28 (ref), v33 (ref), v304 (copy), v301 (ref), v302 (ref), v305 (copy), l_lastHumanoidDescriptionApplied_0 (copy)
                v300.store:dispatch(v29());
                if v306 ~= v300._currentCharacter then
                    v300.toolManager:unequipTool();
                    v300._currentCharacter = v306;
                    v300.store:dispatch(v28(v300._currentCharacter));
                    v300._currentCharacter.Parent = v300.characterRoot;
                    v300.toolManager:checkAndEquipTool();
                end;
                if not v307 and v300.store:getState().AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates then
                    v300.store:dispatch(v33());
                end;
                v300.lastHumanoidDescriptionApplied = v304;
                v300:finishApplyDescription(v301, v302, v305, l_lastHumanoidDescriptionApplied_0);
                v300.characterManagerCallbacks.setAppliedDescription(v300._currentCharacter.Humanoid.HumanoidDescription);
            end);
            return;
        end;
    end);
end;
v64.switchAvatarType = function(v308, v309) --[[ Line: 1203 ]] --[[ Name: switchAvatarType ]]
    -- upvalues: v28 (copy), v29 (copy)
    v308._currentCharacter = v308.characterModelPool:switchAvatarType(v309);
    v308.store:dispatch(v28(v308._currentCharacter));
    v308.store:dispatch(v29());
    v308._currentCharacter.Parent = v308.characterRoot;
    v308.toolManager:notifySwitchedAvatarType();
end;
v64.adjustHeightToStandOnPlatform = function(_, v311) --[[ Line: 1214 ]] --[[ Name: adjustHeightToStandOnPlatform ]]
    local l_HumanoidRootPart_0 = v311.HumanoidRootPart;
    local l_Humanoid_0 = v311.Humanoid;
    local v314 = l_HumanoidRootPart_0.Size.y * 0.5 + l_Humanoid_0.HipHeight;
    local v315, _, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326 = l_HumanoidRootPart_0.CFrame:components();
    l_HumanoidRootPart_0.CFrame = CFrame.new(v315, v314, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326);
end;
v64.stop = function(v327) --[[ Line: 1224 ]] --[[ Name: stop ]]
    -- upvalues: v43 (copy)
    v43.updateHumanoidDescriptionUsingOutfitTryOn(v327.store:getState(), v327.humanoidDescriptionTryOn);
    v327:applyHumanoidDescription(true);
    for _, v329 in v327.connections do
        v329:disconnect();
    end;
    v327.connections = {};
    v327.characterModelPool:stop();
    v327.animationManager:stop();
    v327.toolManager:stop();
    v327.initialTryOnApplied = false;
    v327.cachedRoduxState = v327.store:getState();
end;
v64.onDestroy = function(v330) --[[ Line: 1250 ]] --[[ Name: onDestroy ]]
    -- upvalues: v26 (copy), v29 (copy)
    v330.humanoidDescriptionCurrentlyEquipped:Destroy();
    v330.humanoidDescriptionTryOn:Destroy();
    v330.lastHumanoidDescriptionApplied:Destroy();
    v330.characterRoot:Destroy();
    v330.destroyed = true;
    v330.animationManager:onDestroy();
    v330.toolManager:onDestroy();
    v330.characterModelPool:onDestroy();
    v330.store:dispatch(v26(nil));
    v330.store:dispatch(v29());
end;
v64.updateAvatarRoute = function(v331, v332, v333) --[[ Line: 1266 ]] --[[ Name: updateAvatarRoute ]]
    -- upvalues: v45 (copy)
    v331.animationManager:updateAvatarRoute(v332, v333);
    v331.toolManager:updateAvatarRoute(v332, v333);
    v331.latestAvatarRoute = v332;
    local v334 = v45.routeIsPPEStaticImagePage(v332);
    local v335 = v45.routeIsPPEStaticImagePage(v333);
    if v334 and not v335 then
        v331:freezeParticles();
        v331:watchCharacterToFreezeNewParticles();
        return;
    else
        if v335 and not v334 then
            v331:stopWatchingCharacter();
            v331:unfreezeParticles();
        end;
        return;
    end;
end;
v64.watchCharacterToFreezeNewParticles = function(v336) --[[ Line: 1290 ]] --[[ Name: watchCharacterToFreezeNewParticles ]]
    -- upvalues: l_RunService_0 (copy), l_ParticleUtility_0 (copy)
    local l_CurrentCharacter_0 = v336.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        v336.freezeParticlesCharacterConnection = l_CurrentCharacter_0.DescendantAdded:Connect(function(v338) --[[ Line: 1293 ]]
            -- upvalues: l_RunService_0 (ref), v336 (copy), l_ParticleUtility_0 (ref)
            if v338:IsA("Tool") then
                l_RunService_0.Heartbeat:Wait();
                v336:recursiveFreezeParticles(v338);
                l_ParticleUtility_0.FastForwardParticles(v338);
            end;
        end);
    end;
end;
v64.stopWatchingCharacter = function(v339) --[[ Line: 1304 ]] --[[ Name: stopWatchingCharacter ]]
    if v339.freezeParticlesCharacterConnection then
        v339.freezeParticlesCharacterConnection:Disconnect();
        v339.freezeParticlesCharacterConnection = nil;
    end;
end;
v64.instanceIsAParticleEffect = function(_, v341) --[[ Line: 1311 ]] --[[ Name: instanceIsAParticleEffect ]]
    return v341:IsA("ParticleEmitter") or v341:IsA("Fire") or v341:IsA("Smoke") or v341:IsA("Sparkles");
end;
v64.recursiveFreezeParticles = function(v342, v343) --[[ Line: 1315 ]] --[[ Name: recursiveFreezeParticles ]]
    -- upvalues: l_ParticleUtility_0 (copy)
    if l_ParticleUtility_0.InstanceIsAParticleEffect(v343) then
        v342.frozenParticlesToTimeScale[v343] = v343.TimeScale;
        v343.TimeScale = 0;
    end;
    for _, v345 in (v343:GetChildren()) do
        v342:recursiveFreezeParticles(v345);
    end;
end;
v64.freezeParticles = function(v346) --[[ Line: 1326 ]] --[[ Name: freezeParticles ]]
    v346.frozenParticlesToTimeScale = {};
    local l_CurrentCharacter_1 = v346.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_1 then
        v346:recursiveFreezeParticles(l_CurrentCharacter_1);
    end;
end;
v64.unfreezeParticles = function(v348) --[[ Line: 1340 ]] --[[ Name: unfreezeParticles ]]
    if v348.frozenParticlesToTimeScale then
        for v349, v350 in v348.frozenParticlesToTimeScale do
            v349.TimeScale = v350;
        end;
        v348.frozenParticlesToTimeScale = {};
    end;
end;
return v64;