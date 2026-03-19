local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.Promise);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageLoaded);
local v18 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v19 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v20 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterMover);
local v21 = require(l_Modules_0.AvatarExperience.Common.Managers.SaveManager);
local v22 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterManager);
local v23 = require(l_Modules_0.AvatarExperience.Common.Managers.BackgroundSceneManager);
local v24 = require(l_Modules_0.AvatarExperience.Common.Managers.BackgroundSceneManager_DEPRECATED);
local v25 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_AppPage_0 = v25.AppPage;
local l_SwitchTab_0 = v25.SwitchTab;
local v28 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v30 = require(l_Modules_0.LuaApp.AppPageProperties);
local v31 = require(l_Modules_0.AvatarExperience.Common.Context.wrapWithSceneInteractionEvents);
local v32 = require(l_Modules_0.AvatarExperience.Common.Managers.AvatarSceneSky);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v34 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v35 = require(l_Modules_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local v36 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v37 = require(l_CorePackages_0.Packages.Cryo);
local v38 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataEventsContext);
local v39 = require(l_Modules_0.AvatarExperience.Common.Context.AdjustmentData.useAdjustmentDataEventsContext);
local v40 = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionCallbackContext);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = v25.UiMode;
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded);
local v44 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v45 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP);
local v47 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v48 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.scene");
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v50 = game:DefineFastFlag("AXDebugCreateHumanoidModelError", false);
local v51 = v16.FFlagAXEnableManualSaving and game:DefineFastFlag("AXDisableSaveManager2", false);
local l_FFlagAXBackgroundSceneManagerRevamp_0 = v16.FFlagAXBackgroundSceneManagerRevamp;
local l_FFlagAXAvatarLoadWithRetry_0 = v16.FFlagAXAvatarLoadWithRetry;
local v54 = game:DefineFastInt("AXAvatarLoadRetryCount", 5);
local v55 = game:DefineFastInt("AXAvatarLoadRetryDelayMs", 500);
local l_FFlagAXCatalogCategoriesStore_0 = v16.FFlagAXCatalogCategoriesStore;
local v57 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local function v63() --[[ Line: 82 ]] --[[ Name: setupCharacterModels ]]
    -- upvalues: v7 (copy), l_Players_0 (copy)
    return v7.new(function(v59, v60) --[[ Line: 83 ]]
        -- upvalues: l_Players_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 84 ]]
            -- upvalues: l_Players_0 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return {
                    r6 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6), 
                    r15 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
                };
            else
                return {
                    r6 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6), 
                    r15 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
                };
            end;
        end);
        if l_status_0 then
            v59(l_result_0);
            return;
        else
            v60(l_result_0);
            return;
        end;
    end);
end;
local v64 = v4.PureComponent:extend("AvatarSceneManager");
v64.defaultProps = {
    renderSky = true, 
    shouldManageBackground = true, 
    alternateAvatarLandingScreenFullscreenEnabled = if v46() then nil else false, 
    allowCameraMovements = true
};
v64.init = function(v65) --[[ Line: 126 ]] --[[ Name: init ]]
    -- upvalues: v47 (copy), l_FFlagAXAvatarLoadWithRetry_0 (copy), v7 (copy), v63 (copy), v54 (copy), v55 (copy), v20 (copy), v22 (copy), l_FFlagAXBackgroundSceneManagerRevamp_0 (copy), v23 (copy), v24 (copy), v51 (copy), v21 (copy), l_mutedError_0 (copy), v50 (copy)
    local l_analytics_0 = v65.props.analytics;
    local l_appAnalytics_0 = v65.props.appAnalytics;
    local l_avatarExperienceAnalytics_0 = v65.props.avatarExperienceAnalytics;
    local l_setBodyColors_0 = v65.props.setBodyColors;
    local v70 = if v47 then v65.props.setAvatarScales else nil;
    local l_networking_0 = v65.props.networking;
    local l_interactionEvents_0 = v65.props.interactionEvents;
    local l_store_0 = v65.props.store;
    local l_avatarRoute_0 = v65.props.avatarRoute;
    local l_shouldManageBackground_0 = v65.props.shouldManageBackground;
    local l_catalogAnalytics_0 = v65.props.catalogAnalytics;
    v65.running = false;
    v65.characterManagerRunning = false;
    v65.finishedInitializing = false;
    v65.modelLoadPromise = nil;
    if l_FFlagAXAvatarLoadWithRetry_0 then
        v65.modelLoadPromise = v7.retryWithDelay(v63, v54, v55 * 0.001):andThen(function(v77) --[[ Line: 149 ]]
            -- upvalues: v65 (copy), v20 (ref), l_store_0 (copy), l_avatarExperienceAnalytics_0 (copy), l_avatarRoute_0 (copy), l_interactionEvents_0 (copy), v22 (ref), l_networking_0 (copy), l_appAnalytics_0 (copy), l_setBodyColors_0 (copy), v47 (ref), v70 (copy), l_catalogAnalytics_0 (copy), l_shouldManageBackground_0 (copy), l_FFlagAXBackgroundSceneManagerRevamp_0 (ref), v23 (ref), v24 (ref), v51 (ref), v21 (ref), l_analytics_0 (copy)
            v65.characterMover = v20.new(l_store_0, l_avatarExperienceAnalytics_0, l_avatarRoute_0, l_interactionEvents_0, v65.props.allowCameraMovements);
            v65.characterManager = v22.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v65.characterMover, {
                bodyColorsChangedEvent = l_setBodyColors_0, 
                adjustmentChangedEvent = v65.props.setAdjustments, 
                avatarScalesChangedEvent = if v47 then v70 else nil
            }, {
                setAppliedDescription = v65.props.setAppliedDescription
            }, l_catalogAnalytics_0, v77);
            if l_shouldManageBackground_0 then
                if l_FFlagAXBackgroundSceneManagerRevamp_0 then
                    v65.backgroundSceneManager = v23.new(l_store_0, l_networking_0, l_avatarRoute_0);
                else
                    v65.backgroundSceneManager = v24.new(l_store_0, l_networking_0, l_avatarRoute_0);
                end;
            end;
            if not v51 then
                v65.saveManager = v21.new(l_store_0, l_networking_0, l_analytics_0);
            end;
            v65.finishedInitializing = true;
            if v65.destroyed then
                v65:onDestroy();
                return;
            else
                v65:updateManagers();
                return;
            end;
        end):catch(function(v78) --[[ Line: 197 ]]
            -- upvalues: v65 (copy), l_mutedError_0 (ref)
            local function v81() --[[ Line: 198 ]]
                -- upvalues: v65 (ref)
                if not v65.props.routeHistory or typeof(v65.props.routeHistory) ~= "table" then
                    return (("no route history got %*"):format((typeof(v65.props.routeHistory))));
                else
                    local v79 = v65.props.routeHistory[#v65.props.routeHistory];
                    if not v79 or typeof(v79) ~= "table" then
                        return (("no route, got %*"):format((typeof(v79))));
                    else
                        local v80 = v79[#v79];
                        if not v80 or typeof(v80) ~= "table" then
                            return "no page";
                        else
                            return v80.name;
                        end;
                    end;
                end;
            end;
            l_mutedError_0((("%* on page: %*, with receivedAvatarData: %*"):format(tostring(v78), v81(), v65.props.receivedAvatarData)));
        end);
        return;
    else
        task.spawn(function() --[[ Line: 219 ]]
            -- upvalues: v50 (ref), v65 (copy), v20 (ref), l_store_0 (copy), l_avatarExperienceAnalytics_0 (copy), l_avatarRoute_0 (copy), l_interactionEvents_0 (copy), v22 (ref), l_networking_0 (copy), l_appAnalytics_0 (copy), l_setBodyColors_0 (copy), v47 (ref), v70 (copy), l_catalogAnalytics_0 (copy), l_shouldManageBackground_0 (copy), l_FFlagAXBackgroundSceneManagerRevamp_0 (ref), v23 (ref), v24 (ref), v51 (ref), v21 (ref), l_analytics_0 (copy), l_mutedError_0 (ref)
            if v50 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 221 ]]
                    -- upvalues: v65 (ref), v20 (ref), l_store_0 (ref), l_avatarExperienceAnalytics_0 (ref), l_avatarRoute_0 (ref), l_interactionEvents_0 (ref), v22 (ref), l_networking_0 (ref), l_appAnalytics_0 (ref), l_setBodyColors_0 (ref), v47 (ref), v70 (ref), l_catalogAnalytics_0 (ref), l_shouldManageBackground_0 (ref), l_FFlagAXBackgroundSceneManagerRevamp_0 (ref), v23 (ref), v24 (ref), v51 (ref), v21 (ref), l_analytics_0 (ref)
                    v65.characterMover = v20.new(l_store_0, l_avatarExperienceAnalytics_0, l_avatarRoute_0, l_interactionEvents_0, v65.props.allowCameraMovements);
                    v65.characterManager = v22.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v65.characterMover, {
                        bodyColorsChangedEvent = l_setBodyColors_0, 
                        adjustmentChangedEvent = v65.props.setAdjustments, 
                        avatarScalesChangedEvent = if v47 then v70 else nil
                    }, {
                        setAppliedDescription = v65.props.setAppliedDescription
                    }, l_catalogAnalytics_0);
                    if l_shouldManageBackground_0 then
                        if l_FFlagAXBackgroundSceneManagerRevamp_0 then
                            v65.backgroundSceneManager = v23.new(l_store_0, l_networking_0, l_avatarRoute_0);
                        else
                            v65.backgroundSceneManager = v24.new(l_store_0, l_networking_0, l_avatarRoute_0);
                        end;
                    end;
                    if not v51 then
                        v65.saveManager = v21.new(l_store_0, l_networking_0, l_analytics_0);
                    end;
                    v65.finishedInitializing = true;
                    if v65.destroyed then
                        v65:onDestroy();
                        return;
                    else
                        v65:updateManagers();
                        return;
                    end;
                end);
                if not l_status_1 then
                    l_mutedError_0((("%* on page: %*, with receivedAvatarData: %*"):format(l_result_1, (function() --[[ Line: 270 ]]
                        -- upvalues: v65 (ref)
                        if not v65.props.routeHistory or typeof(v65.props.routeHistory) ~= "table" then
                            return (("no route history got %*"):format((typeof(v65.props.routeHistory))));
                        else
                            local v84 = v65.props.routeHistory[#v65.props.routeHistory];
                            if not v84 or typeof(v84) ~= "table" then
                                return (("no route, got %*"):format((typeof(v84))));
                            else
                                local v85 = v84[#v84];
                                if not v85 or typeof(v84) ~= "table" then
                                    return (("no page, got %*"):format((typeof(v84))));
                                else
                                    return v85.name;
                                end;
                            end;
                        end;
                    end)(), v65.props.receivedAvatarData)));
                    return;
                end;
            else
                v65.characterMover = v20.new(l_store_0, l_avatarExperienceAnalytics_0, l_avatarRoute_0, l_interactionEvents_0, v65.props.allowCameraMovements);
                v65.characterManager = v22.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v65.characterMover, {
                    bodyColorsChangedEvent = l_setBodyColors_0, 
                    adjustmentChangedEvent = v65.props.setAdjustments, 
                    avatarScalesChangedEvent = if v47 then v70 else nil
                }, {
                    setAppliedDescription = v65.props.setAppliedDescription
                }, l_catalogAnalytics_0);
                if l_FFlagAXBackgroundSceneManagerRevamp_0 then
                    v65.backgroundSceneManager = v23.new(l_store_0, l_networking_0, l_avatarRoute_0);
                else
                    v65.backgroundSceneManager = v24.new(l_store_0, l_networking_0, l_avatarRoute_0);
                end;
                if not v51 then
                    v65.saveManager = v21.new(l_store_0, l_networking_0, l_analytics_0);
                end;
                v65.finishedInitializing = true;
                if v65.destroyed then
                    v65:onDestroy();
                    return;
                else
                    v65:updateManagers();
                end;
            end;
        end);
        return;
    end;
end;
local v86 = {
    [l_AvatarScreen_0.AvatarEditor] = true, 
    [l_AvatarScreen_0.MySharedAvatars] = true, 
    [l_AvatarScreen_0.Catalog] = true, 
    [l_AvatarScreen_0.AvatarExperienceLandingPage] = true, 
    [l_AvatarScreen_0.AvatarBackground] = true, 
    [l_AvatarScreen_0.AvatarExperienceRoot] = true, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = true, 
    [l_AvatarScreen_0.TryOnItem] = true, 
    [l_AppPage_0.AvatarExperienceWrapper] = true, 
    [l_AppPage_0.AvatarExperienceWrapperTransparent] = true, 
    [l_SwitchTab_0.AvatarExperienceTab] = true
};
local function _(v87) --[[ Line: 358 ]] --[[ Name: shouldRunManagers ]]
    -- upvalues: v86 (copy)
    return v86[v87.name] or false;
end;
local function v92(v89) --[[ Line: 362 ]] --[[ Name: checkShouldRunManagers ]]
    -- upvalues: v86 (copy), v30 (copy)
    if not v89 then
        return false;
    else
        for v90 = #v89, 1, -1 do
            local v91 = v89[v90];
            if v86[v91.name] or false then
                return true;
            elseif not (v30[v91.name] and v30[v91.name].renderUnderlyingPage) then
                return false;
            end;
        end;
        return false;
    end;
end;
v64.updateManagers = function(v93) --[[ Line: 383 ]] --[[ Name: updateManagers ]]
    -- upvalues: v92 (copy)
    if not v93.finishedInitializing then
        return;
    else
        local l_routeHistory_0 = v93.props.routeHistory;
        local v95 = l_routeHistory_0[#l_routeHistory_0];
        local v96 = nil;
        v96 = if v93.props.shouldStart ~= nil then v93.props.shouldStart else v93.props.avatarRoute.isVisible or v92(v95);
        if v96 and not v93.running then
            v93:start();
            return;
        else
            if not v96 and v93.running then
                v93:stop();
            end;
            return;
        end;
    end;
end;
v64.didMount = function(v97) --[[ Line: 406 ]] --[[ Name: didMount ]]
    v97:updateManagers();
end;
v64.willUnmount = function(v98) --[[ Line: 410 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagAXAvatarLoadWithRetry_0 (copy)
    if l_FFlagAXAvatarLoadWithRetry_0 and v98.modelLoadPromise then
        v98.modelLoadPromise:cancel();
    end;
    if v98.running then
        v98:stop();
    end;
    if v98.finishedInitializing then
        v98:onDestroy();
    end;
    v98.destroyed = true;
end;
v64.callUpdateAvatarRoute = function(_, v100, v101, v102) --[[ Line: 424 ]] --[[ Name: callUpdateAvatarRoute ]]
    if v100 then
        v100:updateAvatarRoute(v101, v102);
    end;
end;
v64.callUpdateCategorySelection = function(_, v104) --[[ Line: 430 ]] --[[ Name: callUpdateCategorySelection ]]
    if v104 then
        v104:updateCategorySelection();
    end;
end;
v64.shouldResetFullViewForPage = function(v105, v106) --[[ Line: 436 ]] --[[ Name: shouldResetFullViewForPage ]]
    -- upvalues: v19 (copy)
    if v105.props.fullView[v106] == nil then
        return false;
    else
        return v105.props.fullView[v106] ~= v19.None;
    end;
end;
v64.resetFullView = function(v107, v108) --[[ Line: 448 ]] --[[ Name: resetFullView ]]
    -- upvalues: v29 (copy), l_AvatarScreen_0 (copy), v46 (copy), v19 (copy)
    local v109 = v29.FullViewPageDefaults[v108];
    if v109 == nil then
        return;
    else
        local v110 = true;
        if v108 ~= l_AvatarScreen_0.Catalog then
            v110 = v108 == l_AvatarScreen_0.CatalogSearch;
        end;
        if v110 and v107.props.isPortrait then
            local l_alternateAvatarLandingScreenFullscreenEnabled_0 = v107.props.alternateAvatarLandingScreenFullscreenEnabled;
            if v46() then
                l_alternateAvatarLandingScreenFullscreenEnabled_0 = not v107.props.is10ftUI;
            end;
            v109 = if l_alternateAvatarLandingScreenFullscreenEnabled_0 then v19.UIFullView else v19.None;
        end;
        if v107.props.fullView[v108] ~= v109 then
            v107.props.setFullView(v107.props.avatarExperienceAnalytics, v108, v109);
        end;
        return;
    end;
end;
v64.onAvatarDataReady = function(v112) --[[ Line: 470 ]] --[[ Name: onAvatarDataReady ]]
    if v112.running then
        v112:maybeStartCharacterAndSaveManager();
        return;
    else
        if v112.finishedInitializing then
            v112.characterManager:maybeInitializeModel(v112.props.store:getState());
        end;
        return;
    end;
end;
v64.didUpdate = function(v113, v114) --[[ Line: 483 ]] --[[ Name: didUpdate ]]
    -- upvalues: v51 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy)
    if v113.props.receivedAvatarData and not v114.receivedAvatarData then
        v113:onAvatarDataReady();
    end;
    v113:updateManagers();
    local l_avatarRoute_1 = v113.props.avatarRoute;
    local l_avatarRoute_2 = v114.avatarRoute;
    if l_avatarRoute_1 ~= l_avatarRoute_2 then
        v113:callUpdateAvatarRoute(v113.characterMover, l_avatarRoute_1, l_avatarRoute_2);
        if v113.backgroundSceneManager then
            v113:callUpdateAvatarRoute(v113.backgroundSceneManager, l_avatarRoute_1, l_avatarRoute_2);
        end;
        v113:callUpdateAvatarRoute(v113.characterManager, l_avatarRoute_1, l_avatarRoute_2);
        if not v51 then
            v113:callUpdateAvatarRoute(v113.saveManager, l_avatarRoute_1, l_avatarRoute_2);
        end;
    end;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local l_catalogCategoryId_0 = v114.catalogCategoryId;
        local l_catalogCategoryId_1 = v113.props.catalogCategoryId;
        local l_catalogSubcategoryId_0 = v114.catalogSubcategoryId;
        local l_catalogSubcategoryId_1 = v113.props.catalogSubcategoryId;
        local l_catalogSearchCategoryId_0 = v114.catalogSearchCategoryId;
        local l_catalogSearchCategoryId_1 = v113.props.catalogSearchCategoryId;
        local l_catalogSearchSubcategoryId_0 = v114.catalogSearchSubcategoryId;
        local l_catalogSearchSubcategoryId_1 = v113.props.catalogSearchSubcategoryId;
        if l_catalogCategoryId_1 ~= l_catalogCategoryId_0 or l_catalogSubcategoryId_1 ~= l_catalogSubcategoryId_0 or l_catalogSearchCategoryId_1 ~= l_catalogSearchCategoryId_0 or l_catalogSearchSubcategoryId_1 ~= l_catalogSearchSubcategoryId_0 then
            v113:callUpdateCategorySelection(v113.characterMover);
            v113:callUpdateAvatarRoute(v113.characterManager, l_avatarRoute_1, l_avatarRoute_2);
        end;
    end;
end;
v64.render = function(v125) --[[ Line: 530 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v32 (copy)
    if v125.props.renderSky then
        return v4.createElement(v32);
    else
        return;
    end;
end;
v64.maybeStartCharacterAndSaveManager = function(v126) --[[ Line: 536 ]] --[[ Name: maybeStartCharacterAndSaveManager ]]
    -- upvalues: v51 (copy)
    if v126.characterManagerRunning or not v126.props.receivedAvatarData then
        return;
    else
        v126.characterManager:start();
        if not v51 then
            v126.saveManager:start();
        end;
        v126.characterManagerRunning = true;
        return;
    end;
end;
v64.stopCharacterAndSaveManager = function(v127) --[[ Line: 548 ]] --[[ Name: stopCharacterAndSaveManager ]]
    -- upvalues: v51 (copy)
    if not v127.characterManagerRunning then
        return;
    else
        v127.characterManager:stop();
        if not v51 then
            v127.saveManager:stop();
        end;
        v127.characterManagerRunning = false;
        return;
    end;
end;
v64.start = function(v128) --[[ Line: 560 ]] --[[ Name: start ]]
    -- upvalues: v48 (copy)
    v48:info("AvatarSceneManager:start()");
    if v128.running then
        return;
    else
        if v128.backgroundSceneManager then
            v128.props.setThrottleFramerateEnabled(false);
            v128.backgroundSceneManager:start();
        end;
        v128.running = true;
        v128:maybeStartCharacterAndSaveManager();
        v128.characterMover:start();
        v128.props.setPageLoaded();
        v128.props.notificationService:ActionEnabled(Enum.AppShellActionType.AvatarEditorPageLoaded);
        return;
    end;
end;
v64.stop = function(v129) --[[ Line: 583 ]] --[[ Name: stop ]]
    -- upvalues: v48 (copy)
    v48:info("AvatarSceneManager:stop()");
    if not v129.running then
        return;
    else
        v129.props.setThrottleFramerateEnabled(true);
        v129.running = false;
        v129:stopCharacterAndSaveManager();
        if v129.backgroundSceneManager then
            v129.backgroundSceneManager:stop();
        end;
        v129.characterMover:stop();
        return;
    end;
end;
v64.onDestroy = function(v130) --[[ Line: 601 ]] --[[ Name: onDestroy ]]
    -- upvalues: v51 (copy)
    v130.characterManager:onDestroy();
    if v130.backgroundSceneManager then
        v130.backgroundSceneManager:onDestroy();
    end;
    v130.characterMover:onDestroy();
    if not v51 then
        v130.saveManager:onDestroy();
    end;
end;
v64 = l_RoactServices_0.connect({
    catalogAnalytics = v10, 
    analytics = v8, 
    appAnalytics = v9, 
    avatarExperienceAnalytics = v28, 
    networking = v13, 
    notificationService = l_AppNotificationService_0
})(v64);
v64 = v33((v31((v6.connect(function(v131, _) --[[ Line: 621 ]]
    -- upvalues: v36 (copy), v34 (copy)
    return {
        isPortrait = v36(v131), 
        fullView = v131.AvatarExperience.Common.FullView, 
        avatarPageLoaded = v131.AvatarExperience.AvatarEditor.PageLoaded, 
        receivedAvatarData = v34(v131), 
        routeHistory = v131.Navigation.history
    };
end, function(v133) --[[ Line: 629 ]]
    -- upvalues: v17 (copy), v18 (copy)
    return {
        setPageLoaded = function() --[[ Line: 631 ]] --[[ Name: setPageLoaded ]]
            -- upvalues: v133 (copy), v17 (ref)
            v133(v17(true));
        end, 
        setFullView = function(v134, v135, v136) --[[ Line: 634 ]] --[[ Name: setFullView ]]
            -- upvalues: v133 (copy), v18 (ref)
            v133(v18(v134, v135, v136));
        end
    };
end)(v64)))));
if not v46() and v45 then
    v64 = v44.connectTestVariables({
        alternateAvatarLandingScreenFullscreenEnabled = v45.GetFullScreenEnabled
    })(v64);
end;
v64 = v43(v64, false);
v64 = v35((l_RoactAppPolicy_0.connect(function(v137) --[[ Line: 654 ]]
    return {
        allowCameraMovements = v137.getAllowCameraMovements()
    };
end)(v64)));
return function(v138) --[[ Line: 662 ]] --[[ Name: AvatarSceneManagerWrapper ]]
    -- upvalues: v38 (copy), v37 (copy), v39 (copy), v40 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v57 (copy), l_useSignalState_0 (copy), v46 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v5 (copy), v64 (ref)
    local v139 = v38();
    local v140 = v37.Dictionary.join(v139, v138);
    local v141 = v39();
    local v142 = v40();
    v140 = v37.Dictionary.join(v141, v140, v142);
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v143 = v57.getCatalogSelectionStore();
        local v144 = l_useSignalState_0(v143.selectedCategoryId);
        local v145 = l_useSignalState_0(v143.selectedSubcategoryId);
        v140.catalogCategoryId = v144;
        v140.catalogSubcategoryId = v145;
        local v146 = v57.getCatalogSearchSelectionStore();
        local v147 = l_useSignalState_0(v146.selectedCategoryId);
        local v148 = l_useSignalState_0(v146.selectedSubcategoryId);
        v140.catalogSearchCategoryId = v147;
        v140.catalogSearchSubcategoryId = v148;
    end;
    if v46() then
        v140.is10ftUI = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    end;
    return v5.createElement(v64, v140);
end;