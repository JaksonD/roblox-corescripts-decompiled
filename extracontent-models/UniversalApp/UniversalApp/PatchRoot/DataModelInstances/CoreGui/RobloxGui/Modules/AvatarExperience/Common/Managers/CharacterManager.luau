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
local v56 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUnequipAccessoriesBeforeLookTryOn);
local v57 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v58 = game:DefineFastFlag("AXRemoveDynamicHeadAssetsFromTryOn", false);
local l_FFlagAXMISEnableMultiShopping_0 = v10.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMakeupEquipping_0 = v10.FFlagAXMakeupEquipping;
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
local function _(v70) --[[ Line: 126 ]] --[[ Name: isHumanoidDescriptionPropertyEmpty ]]
    local v71 = true;
    if v70 ~= "" then
        v71 = v70 == 0;
    end;
    return v71;
end;
local function v78(v73) --[[ Line: 130 ]] --[[ Name: isHumanoidDescriptionEmpty ]]
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
v64.new = function(v79, v80, v81, v82, v83, v84, v85, v86, v87) --[[ Line: 147 ]] --[[ Name: new ]]
    -- upvalues: v64 (copy), v36 (copy), v28 (copy), v29 (copy), v56 (copy), v34 (copy), v35 (copy), l_IsVRAppBuild_0 (copy)
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
    if v56() then
        v88.shouldUnequipAccessoriesBeforeTryOn = false;
    end;
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
v64.maybeInitializeModel = function(v89, v90) --[[ Line: 223 ]] --[[ Name: maybeInitializeModel ]]
    -- upvalues: v37 (copy)
    if not v89.modelInitialized and v37(v90) then
        v89.modelInitialized = true;
        v89:initializeModel(v90);
    end;
end;
v64.setupAnimations = function(v91, v92, v93) --[[ Line: 230 ]] --[[ Name: setupAnimations ]]
    v91.characterModelPool:setupAnimations(v92, v93);
end;
v64.initializeModel = function(v94, v95) --[[ Line: 235 ]] --[[ Name: initializeModel ]]
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
v64.updateCharacterFromConnection = function(v97, v98) --[[ Line: 248 ]] --[[ Name: updateCharacterFromConnection ]]
    v97.characterModelPool:maybeUpdateCharacter(v98):andThen(function(_, _) --[[ Line: 249 ]]
        -- upvalues: v97 (copy)
        v97.characterManagerCallbacks.setAppliedDescription(v97._currentCharacter.Humanoid.HumanoidDescription);
    end);
end;
v64.initAvatarScalesChangedConnection = function(v101) --[[ Line: 254 ]] --[[ Name: initAvatarScalesChangedConnection ]]
    -- upvalues: l_HumanoidDescriptionScaleToName_0 (copy)
    local v106 = v101.characterManagerEvents.avatarScalesChangedEvent:Connect(function(v102) --[[ Line: 255 ]]
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
v64.initBodyColorsChangedConnection = function(v107) --[[ Line: 272 ]] --[[ Name: initBodyColorsChangedConnection ]]
    -- upvalues: v39 (copy), v41 (copy), v16 (copy), v48 (copy), v54 (copy), l_AvatarEditorService_0 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v52 (copy)
    local v119 = v107.characterManagerEvents.bodyColorsChangedEvent:Connect(function(v108) --[[ Line: 273 ]]
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
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 304 ]]
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
v64.initAdjustmentChangedConnection = function(v120) --[[ Line: 332 ]] --[[ Name: initAdjustmentChangedConnection ]]
    -- upvalues: v45 (copy)
    local v127 = v120.characterManagerEvents.adjustmentChangedEvent:Connect(function(v121, v122, v123) --[[ Line: 334 ]]
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
v64.start = function(v128) --[[ Line: 357 ]] --[[ Name: start ]]
    -- upvalues: v57 (copy)
    v128:maybeInitializeModel(v128.store:getState());
    v128._currentCharacter.Parent = v128.characterRoot;
    local v131 = v128.store.changed:connect(function(v129, v130) --[[ Line: 361 ]]
        -- upvalues: v128 (copy)
        v128:update(v129, v130);
    end);
    table.insert(v128.connections, v131);
    if v57 then
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
v64.updateHumanoidDescriptionTryOnWithColors = function(v132, v133) --[[ Line: 390 ]] --[[ Name: updateHumanoidDescriptionTryOnWithColors ]]
    -- upvalues: v39 (copy), v40 (copy), v17 (copy), v48 (copy)
    local v134 = if v39(v133) then v40(v133) else if v132.overrideBodyColor3s then v132.overrideBodyColor3s else v17(v133);
    v48.setHumanoidDescriptionColorsFromBodyColor3s(v132.humanoidDescriptionTryOn, v134);
end;
v64.update = function(v135, v136, v137) --[[ Line: 398 ]] --[[ Name: update ]]
    -- upvalues: v43 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v7 (copy), v41 (copy), v46 (copy), v27 (copy), l_FFlagAXMakeupEquipping_0 (copy), v42 (copy), v56 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v44 (copy)
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
    if v56() then
        if l_FFlagAXMISEnableMultiShopping_0 then
            v135.shouldUnequipAccessoriesBeforeTryOn = v136.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems and not v135.isTryingOnMakeupLook;
        else
            v135.shouldUnequipAccessoriesBeforeTryOn = v136.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil and not v135.isTryingOnMakeupLook;
        end;
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
v64.updateNoFace = function(v145, v146) --[[ Line: 466 ]] --[[ Name: updateNoFace ]]
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
v64.shouldUpdateHumanoidDescriptionCurrentlyEquipped = function(_, v155, v156) --[[ Line: 498 ]] --[[ Name: shouldUpdateHumanoidDescriptionCurrentlyEquipped ]]
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
v64.updateHumanoidDescriptionCurrentlyEquipped = function(v169, v170) --[[ Line: 515 ]] --[[ Name: updateHumanoidDescriptionCurrentlyEquipped ]]
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
v64.shouldUpdateHumanoidDescriptionTryOnOutfit = function(v186, v187, v188) --[[ Line: 624 ]] --[[ Name: shouldUpdateHumanoidDescriptionTryOnOutfit ]]
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
v64.setAccessoriesForTryOn = function(v192, v193) --[[ Line: 685 ]] --[[ Name: setAccessoriesForTryOn ]]
    -- upvalues: v42 (copy), l_FFlagAXMakeupEquipping_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_AssetTypeIdStrings_0 (copy), v43 (copy), v58 (copy), v5 (copy)
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
    if v58 and v43.isClassicHeadOrClassicFaceTryOn(v192.store:getState()) then
        l_Accessories_0 = v5.List.filter(l_Accessories_0, function(v212) --[[ Line: 759 ]]
            -- upvalues: v42 (ref)
            local v213 = v42.AccessoryTypeEnumToAssetTypeId[v212.AccessoryType];
            return not v42.DynamicHeadAssetTypes[v213];
        end);
    end;
    v193:SetAccessories(l_Accessories_0, true);
end;
v64.getTryOnsBundleOutfitInfo = function(v214) --[[ Line: 771 ]] --[[ Name: getTryOnsBundleOutfitInfo ]]
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
v64.singleMakeupAssetTryOn = function(v219, v220, v221) --[[ Line: 789 ]] --[[ Name: singleMakeupAssetTryOn ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_getMakeupDescriptionsFromHumanoidDescription_0 (copy), l_getTryOnItemReducerKey_0 (copy), v42 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), l_destroyMakeupDescriptions_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    else
        local v222 = l_getMakeupDescriptionsFromHumanoidDescription_0(v221)[1];
        if not v222 then
            return;
        else
            local v223 = v219.store:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[l_getTryOnItemReducerKey_0(tostring(v222.AssetId), v42.ItemType.Asset)];
            local v224 = l_getMakeupDescriptionsFromHumanoidDescription_0(v220);
            table.sort(v224, function(v225, v226) --[[ Line: 809 ]]
                return v225.Order < v226.Order;
            end);
            local v227 = {};
            for _, v229 in v224 do
                if v229.AssetId == v222.AssetId then
                    return;
                end;
            end;
            if #v224 < l_MAX_MAKEUP_LAYERS_0 then
                v227 = v224;
            else
                table.remove(v224, 1);
                v227 = v224;
            end;
            local v230 = if v223 then v223.order else nil;
            local v231 = #v227;
            v230 = if v230 == nil then v231 else math.max(0, (math.min(v230, v231)));
            local v232 = {};
            for _, v234 in v227 do
                table.insert(v232, v234:Clone());
            end;
            table.insert(v232, v230 + 1, v222);
            l_destroyMakeupDescriptions_0(v220);
            for v235, v236 in v232 do
                v236.Order = v235 - 1;
                v236.Parent = v220;
            end;
            return;
        end;
    end;
end;
v64.lookMakeupTryOn = function(_, v238, v239) --[[ Line: 860 ]] --[[ Name: lookMakeupTryOn ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_destroyMakeupDescriptions_0 (copy), l_getMakeupDescriptionsFromHumanoidDescription_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    else
        l_destroyMakeupDescriptions_0(v238);
        for _, v241 in l_getMakeupDescriptionsFromHumanoidDescription_0(v239) do
            v241:Clone().Parent = v238;
        end;
        return;
    end;
end;
v64.combineTryOnMakeupDescriptionsWithEquipped = function(v242, v243, v244) --[[ Line: 874 ]] --[[ Name: combineTryOnMakeupDescriptionsWithEquipped ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return;
    elseif v242.isTryingOnLook then
        v242:lookMakeupTryOn(v243, v244);
        return;
    else
        v242:singleMakeupAssetTryOn(v243, v244);
        return;
    end;
end;
v64.combineOutfitTryOnAndEquippedHumanoidDescriptions = function(v245) --[[ Line: 889 ]] --[[ Name: combineOutfitTryOnAndEquippedHumanoidDescriptions ]]
    -- upvalues: v56 (copy), l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), v42 (copy), l_FFlagAXMakeupEquipping_0 (copy), v54 (copy), l_AvatarEditorService_0 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v52 (copy), l_HumanoidDescriptionScaleToName_0 (copy), v43 (copy), l_FFlagEnableHeadShapeForCharacterManager_0 (copy)
    local v246 = nil;
    local v247 = v245:getTryOnsBundleOutfitInfo();
    v246 = v245.humanoidDescriptionCurrentlyEquipped:Clone();
    if v56() and v245.shouldUnequipAccessoriesBeforeTryOn then
        v246:SetAccessories({}, true);
        v246.GraphicTShirt = 0;
        v246.Shirt = 0;
        v246.Pants = 0;
    end;
    for v248, v249 in l_AssetTypeIdStringToHumanoidDescriptionProp_0 do
        if v42.AssetTypeIdToCategory[v248] == v42.AssetCategories.Body and v245.shouldUnequipBodyBeforeTryOn then
            v246[v249] = 0;
        end;
        if not v42.AssetTypeIdToAccessoryTypeEnum[v248] then
            local v250 = v245.humanoidDescriptionTryOn[v249];
            local v251 = true;
            if v250 ~= "" then
                v251 = v250 == 0;
            end;
            if not v251 then
                v246[v249] = v245.humanoidDescriptionTryOn[v249];
            end;
        end;
    end;
    v245:setAccessoriesForTryOn(v246);
    if l_FFlagAXMakeupEquipping_0 then
        v245:combineTryOnMakeupDescriptionsWithEquipped(v246, v245.humanoidDescriptionTryOn);
    end;
    local v252 = nil;
    if v54() then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 930 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v246 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v246);
            else
                return l_AvatarEditorService_0:CheckApplyDefaultClothing(v246);
            end;
        end);
        if l_status_1 then
            v252 = l_result_1;
        else
            l_reportAvatarEventCounterNoAnalyticsArgument_0(v52.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing);
            error(l_result_1);
        end;
    else
        v252 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_AvatarEditorService_0:CheckApplyDefaultClothingAsync(v246) else l_AvatarEditorService_0:CheckApplyDefaultClothing(v246);
    end;
    v246 = v252 or v246;
    if v247 then
        for v255, v256 in v247.scales do
            v246[l_HumanoidDescriptionScaleToName_0[v255]] = v256;
        end;
    end;
    v43.setAvatarTryOnProperties(v246, v245.store:getState());
    if l_FFlagEnableHeadShapeForCharacterManager_0 then
        v43.applyHeadShapeToHumanoidDescription(v246, v245.store:getState());
    end;
    return v246;
end;
v64.finishApplyDescription = function(v257, v258, v259, v260, v261) --[[ Line: 975 ]] --[[ Name: finishApplyDescription ]]
    -- upvalues: v68 (copy), v63 (copy), v31 (copy), v32 (copy), v45 (copy), v24 (copy)
    if v257.initialHumanoidDescriptionApplied and not v260 then
        v257:updateNoFace(v261);
    end;
    if not v257.initialHumanoidDescriptionApplied then
        local v262 = (tick() - v257.startAvatarModelLoadTime) * 1000;
        v68:info("Avatar model load time: {} ms", v262);
        v257.analytics.Diag:reportStats(v63, v262);
    end;
    if v257.characterModelPool:isR15() then
        v257:adjustHeightToStandOnPlatform(v257._currentCharacter);
    end;
    if v258 then
        v257.store:dispatch(v31());
    elseif v259 then
        v257.store:dispatch(v32());
    end;
    v257.initialHumanoidDescriptionApplied = true;
    if v257._currentCharacter then
        local l_BoundingBox_0, v264 = v257._currentCharacter:GetBoundingBox();
        if not v45.isBoundingBoxVectorSane(v264) or not v45.isBoundingBoxCFrameSane(l_BoundingBox_0) then
            local v265 = v45.calculateNewAssetIdsWithGeometry(v261, v257.lastHumanoidDescriptionApplied);
            if #v265 > 0 then
                v24("(Avatar Experience) bad bounding box on adding assetIds: " .. table.concat(v265, ","));
            end;
        end;
    end;
end;
v64.getCurrentCharacter = function(v266) --[[ Line: 1028 ]] --[[ Name: getCurrentCharacter ]]
    return v266._currentCharacter;
end;
v64.applyHumanoidDescription = function(v267, v268, v269) --[[ Line: 1032 ]] --[[ Name: applyHumanoidDescription ]]
    -- upvalues: v25 (copy), v78 (copy), v29 (copy), v28 (copy), v33 (copy)
    v25.assert(v267.modelInitialized, "applyHumanoidDescription called before initializeModel");
    task.spawn(function() --[[ Line: 1038 ]]
        -- upvalues: v267 (copy), v269 (copy), v78 (ref), v29 (ref), v28 (ref), v33 (ref), v268 (copy)
        if v267.destroyed or not v267._currentCharacter:IsDescendantOf(game) then
            return;
        else
            local l_lastHumanoidDescriptionApplied_0 = v267.lastHumanoidDescriptionApplied;
            local v271 = v267:combineOutfitTryOnAndEquippedHumanoidDescriptions();
            v267.checkBodyColors = false;
            local v272 = v269 and v78(v267.humanoidDescriptionTryOn);
            v267.characterModelPool:maybeUpdateCharacter(v271):andThen(function(v273, v274) --[[ Line: 1053 ]]
                -- upvalues: v267 (ref), v29 (ref), v28 (ref), v33 (ref), v271 (copy), v268 (ref), v269 (ref), v272 (copy), l_lastHumanoidDescriptionApplied_0 (copy)
                v267.store:dispatch(v29());
                if v273 ~= v267._currentCharacter then
                    v267.toolManager:unequipTool();
                    v267._currentCharacter = v273;
                    v267.store:dispatch(v28(v267._currentCharacter));
                    v267._currentCharacter.Parent = v267.characterRoot;
                    v267.toolManager:checkAndEquipTool();
                end;
                if not v274 and v267.store:getState().AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates then
                    v267.store:dispatch(v33());
                end;
                v267.lastHumanoidDescriptionApplied = v271;
                v267:finishApplyDescription(v268, v269, v272, l_lastHumanoidDescriptionApplied_0);
                v267.characterManagerCallbacks.setAppliedDescription(v267._currentCharacter.Humanoid.HumanoidDescription);
            end);
            return;
        end;
    end);
end;
v64.switchAvatarType = function(v275, v276) --[[ Line: 1093 ]] --[[ Name: switchAvatarType ]]
    -- upvalues: v28 (copy), v29 (copy)
    v275._currentCharacter = v275.characterModelPool:switchAvatarType(v276);
    v275.store:dispatch(v28(v275._currentCharacter));
    v275.store:dispatch(v29());
    v275._currentCharacter.Parent = v275.characterRoot;
    v275.toolManager:notifySwitchedAvatarType();
end;
v64.adjustHeightToStandOnPlatform = function(_, v278) --[[ Line: 1104 ]] --[[ Name: adjustHeightToStandOnPlatform ]]
    local l_HumanoidRootPart_0 = v278.HumanoidRootPart;
    local l_Humanoid_0 = v278.Humanoid;
    local v281 = l_HumanoidRootPart_0.Size.y * 0.5 + l_Humanoid_0.HipHeight;
    local v282, _, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293 = l_HumanoidRootPart_0.CFrame:components();
    l_HumanoidRootPart_0.CFrame = CFrame.new(v282, v281, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293);
end;
v64.stop = function(v294) --[[ Line: 1114 ]] --[[ Name: stop ]]
    -- upvalues: v43 (copy)
    v43.updateHumanoidDescriptionUsingOutfitTryOn(v294.store:getState(), v294.humanoidDescriptionTryOn);
    v294:applyHumanoidDescription(true);
    for _, v296 in v294.connections do
        v296:disconnect();
    end;
    v294.connections = {};
    v294.characterModelPool:stop();
    v294.animationManager:stop();
    v294.toolManager:stop();
    v294.initialTryOnApplied = false;
    v294.cachedRoduxState = v294.store:getState();
end;
v64.onDestroy = function(v297) --[[ Line: 1140 ]] --[[ Name: onDestroy ]]
    -- upvalues: v26 (copy), v29 (copy)
    v297.humanoidDescriptionCurrentlyEquipped:Destroy();
    v297.humanoidDescriptionTryOn:Destroy();
    v297.lastHumanoidDescriptionApplied:Destroy();
    v297.characterRoot:Destroy();
    v297.destroyed = true;
    v297.animationManager:onDestroy();
    v297.toolManager:onDestroy();
    v297.characterModelPool:onDestroy();
    v297.store:dispatch(v26(nil));
    v297.store:dispatch(v29());
end;
v64.updateAvatarRoute = function(v298, v299, v300) --[[ Line: 1156 ]] --[[ Name: updateAvatarRoute ]]
    -- upvalues: v45 (copy)
    v298.animationManager:updateAvatarRoute(v299, v300);
    v298.toolManager:updateAvatarRoute(v299, v300);
    v298.latestAvatarRoute = v299;
    local v301 = v45.routeIsPPEStaticImagePage(v299);
    local v302 = v45.routeIsPPEStaticImagePage(v300);
    if v301 and not v302 then
        v298:freezeParticles();
        v298:watchCharacterToFreezeNewParticles();
        return;
    else
        if v302 and not v301 then
            v298:stopWatchingCharacter();
            v298:unfreezeParticles();
        end;
        return;
    end;
end;
v64.watchCharacterToFreezeNewParticles = function(v303) --[[ Line: 1180 ]] --[[ Name: watchCharacterToFreezeNewParticles ]]
    -- upvalues: l_RunService_0 (copy), l_ParticleUtility_0 (copy)
    local l_CurrentCharacter_0 = v303.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        v303.freezeParticlesCharacterConnection = l_CurrentCharacter_0.DescendantAdded:Connect(function(v305) --[[ Line: 1183 ]]
            -- upvalues: l_RunService_0 (ref), v303 (copy), l_ParticleUtility_0 (ref)
            if v305:IsA("Tool") then
                l_RunService_0.Heartbeat:Wait();
                v303:recursiveFreezeParticles(v305);
                l_ParticleUtility_0.FastForwardParticles(v305);
            end;
        end);
    end;
end;
v64.stopWatchingCharacter = function(v306) --[[ Line: 1194 ]] --[[ Name: stopWatchingCharacter ]]
    if v306.freezeParticlesCharacterConnection then
        v306.freezeParticlesCharacterConnection:Disconnect();
        v306.freezeParticlesCharacterConnection = nil;
    end;
end;
v64.instanceIsAParticleEffect = function(_, v308) --[[ Line: 1201 ]] --[[ Name: instanceIsAParticleEffect ]]
    return v308:IsA("ParticleEmitter") or v308:IsA("Fire") or v308:IsA("Smoke") or v308:IsA("Sparkles");
end;
v64.recursiveFreezeParticles = function(v309, v310) --[[ Line: 1205 ]] --[[ Name: recursiveFreezeParticles ]]
    -- upvalues: l_ParticleUtility_0 (copy)
    if l_ParticleUtility_0.InstanceIsAParticleEffect(v310) then
        v309.frozenParticlesToTimeScale[v310] = v310.TimeScale;
        v310.TimeScale = 0;
    end;
    for _, v312 in (v310:GetChildren()) do
        v309:recursiveFreezeParticles(v312);
    end;
end;
v64.freezeParticles = function(v313) --[[ Line: 1216 ]] --[[ Name: freezeParticles ]]
    v313.frozenParticlesToTimeScale = {};
    local l_CurrentCharacter_1 = v313.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_1 then
        v313:recursiveFreezeParticles(l_CurrentCharacter_1);
    end;
end;
v64.unfreezeParticles = function(v315) --[[ Line: 1230 ]] --[[ Name: unfreezeParticles ]]
    if v315.frozenParticlesToTimeScale then
        for v316, v317 in v315.frozenParticlesToTimeScale do
            v316.TimeScale = v317;
        end;
        v315.frozenParticlesToTimeScale = {};
    end;
end;
return v64;