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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageLoaded);
local v19 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_FullView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.FullView;
local v21 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterMover);
local v22 = require(l_Modules_0.AvatarExperience.Common.Managers.SaveManager);
local v23 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterManager);
local v24 = require(l_Modules_0.AvatarExperience.Common.Managers.BackgroundSceneManager);
local v25 = require(l_Modules_0.AvatarExperience.Common.Managers.BackgroundSceneManager_DEPRECATED);
local v26 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_AppPage_0 = v26.AppPage;
local l_SwitchTab_0 = v26.SwitchTab;
local v29 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v30 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v31 = require(l_Modules_0.LuaApp.AppPageProperties);
local v32 = require(l_Modules_0.AvatarExperience.Common.Context.wrapWithSceneInteractionEvents);
local v33 = require(l_Modules_0.AvatarExperience.Common.Managers.AvatarSceneSky);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v35 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v36 = require(l_Modules_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local v37 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v38 = require(l_CorePackages_0.Packages.Cryo);
local v39 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataEventsContext);
local v40 = require(l_Modules_0.AvatarExperience.Common.Context.AdjustmentData.useAdjustmentDataEventsContext);
local v41 = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionCallbackContext);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = v26.UiMode;
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded);
local v45 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v46 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v47 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP);
local v48 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v49 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.scene");
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v51 = game:DefineFastFlag("AXDebugCreateHumanoidModelError", false);
local v52 = v17.FFlagAXEnableManualSaving and game:DefineFastFlag("AXDisableSaveManager2", false);
local l_FFlagAXBackgroundSceneManagerRevamp_0 = v17.FFlagAXBackgroundSceneManagerRevamp;
local l_FFlagAXAvatarLoadWithRetry_0 = v17.FFlagAXAvatarLoadWithRetry;
local v55 = game:DefineFastInt("AXAvatarLoadRetryCount", 5);
local v56 = game:DefineFastInt("AXAvatarLoadRetryDelayMs", 500);
local l_FFlagAXCatalogCategoriesStore_0 = v17.FFlagAXCatalogCategoriesStore;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v59 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local function v65() --[[ Line: 85 ]] --[[ Name: setupCharacterModels ]]
    -- upvalues: v7 (copy), l_Players_0 (copy)
    return v7.new(function(v61, v62) --[[ Line: 86 ]]
        -- upvalues: l_Players_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 87 ]]
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
            v61(l_result_0);
            return;
        else
            v62(l_result_0);
            return;
        end;
    end);
end;
local v66 = v4.PureComponent:extend("AvatarSceneManager");
v66.defaultProps = {
    renderSky = true, 
    shouldManageBackground = true, 
    alternateAvatarLandingScreenFullscreenEnabled = if v47() then nil else false, 
    allowCameraMovements = true
};
v66.init = function(v67) --[[ Line: 129 ]] --[[ Name: init ]]
    -- upvalues: v48 (copy), l_FFlagAXAvatarLoadWithRetry_0 (copy), v7 (copy), v65 (copy), v55 (copy), v56 (copy), v21 (copy), v23 (copy), l_FFlagAXBackgroundSceneManagerRevamp_0 (copy), v24 (copy), v25 (copy), v52 (copy), v22 (copy), l_mutedError_0 (copy), v51 (copy)
    local l_analytics_0 = v67.props.analytics;
    local l_appAnalytics_0 = v67.props.appAnalytics;
    local l_avatarExperienceAnalytics_0 = v67.props.avatarExperienceAnalytics;
    local l_setBodyColors_0 = v67.props.setBodyColors;
    local v72 = if v48 then v67.props.setAvatarScales else nil;
    local l_networking_0 = v67.props.networking;
    local l_interactionEvents_0 = v67.props.interactionEvents;
    local l_store_0 = v67.props.store;
    local l_avatarRoute_0 = v67.props.avatarRoute;
    local l_shouldManageBackground_0 = v67.props.shouldManageBackground;
    local l_catalogAnalytics_0 = v67.props.catalogAnalytics;
    v67.running = false;
    v67.characterManagerRunning = false;
    v67.finishedInitializing = false;
    v67.modelLoadPromise = nil;
    if l_FFlagAXAvatarLoadWithRetry_0 then
        v67.modelLoadPromise = v7.retryWithDelay(v65, v55, v56 * 0.001):andThen(function(v79) --[[ Line: 152 ]]
            -- upvalues: v67 (copy), v21 (ref), l_store_0 (copy), l_avatarExperienceAnalytics_0 (copy), l_avatarRoute_0 (copy), l_interactionEvents_0 (copy), v23 (ref), l_networking_0 (copy), l_appAnalytics_0 (copy), l_setBodyColors_0 (copy), v48 (ref), v72 (copy), l_catalogAnalytics_0 (copy), l_shouldManageBackground_0 (copy), l_FFlagAXBackgroundSceneManagerRevamp_0 (ref), v24 (ref), v25 (ref), v52 (ref), v22 (ref), l_analytics_0 (copy)
            v67.characterMover = v21.new(l_store_0, l_avatarExperienceAnalytics_0, l_avatarRoute_0, l_interactionEvents_0, v67.props.allowCameraMovements);
            v67.characterManager = v23.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v67.characterMover, {
                bodyColorsChangedEvent = l_setBodyColors_0, 
                adjustmentChangedEvent = v67.props.setAdjustments, 
                avatarScalesChangedEvent = if v48 then v72 else nil
            }, {
                setAppliedDescription = v67.props.setAppliedDescription
            }, l_catalogAnalytics_0, v79);
            if l_shouldManageBackground_0 then
                if l_FFlagAXBackgroundSceneManagerRevamp_0 then
                    v67.backgroundSceneManager = v24.new(l_store_0, l_networking_0, l_avatarRoute_0);
                else
                    v67.backgroundSceneManager = v25.new(l_store_0, l_networking_0, l_avatarRoute_0);
                end;
            end;
            if not v52 then
                v67.saveManager = v22.new(l_store_0, l_networking_0, l_analytics_0);
            end;
            v67.finishedInitializing = true;
            if v67.destroyed then
                v67:onDestroy();
                return;
            else
                v67:updateManagers();
                return;
            end;
        end):catch(function(v80) --[[ Line: 200 ]]
            -- upvalues: v67 (copy), l_mutedError_0 (ref)
            local function v83() --[[ Line: 201 ]]
                -- upvalues: v67 (ref)
                if not v67.props.routeHistory or typeof(v67.props.routeHistory) ~= "table" then
                    return (("no route history got %*"):format((typeof(v67.props.routeHistory))));
                else
                    local v81 = v67.props.routeHistory[#v67.props.routeHistory];
                    if not v81 or typeof(v81) ~= "table" then
                        return (("no route, got %*"):format((typeof(v81))));
                    else
                        local v82 = v81[#v81];
                        if not v82 or typeof(v82) ~= "table" then
                            return "no page";
                        else
                            return v82.name;
                        end;
                    end;
                end;
            end;
            l_mutedError_0((("%* on page: %*, with receivedAvatarData: %*"):format(tostring(v80), v83(), v67.props.receivedAvatarData)));
        end);
        return;
    else
        task.spawn(function() --[[ Line: 222 ]]
            -- upvalues: v51 (ref), v67 (copy), v21 (ref), l_store_0 (copy), l_avatarExperienceAnalytics_0 (copy), l_avatarRoute_0 (copy), l_interactionEvents_0 (copy), v23 (ref), l_networking_0 (copy), l_appAnalytics_0 (copy), l_setBodyColors_0 (copy), v48 (ref), v72 (copy), l_catalogAnalytics_0 (copy), l_shouldManageBackground_0 (copy), l_FFlagAXBackgroundSceneManagerRevamp_0 (ref), v24 (ref), v25 (ref), v52 (ref), v22 (ref), l_analytics_0 (copy), l_mutedError_0 (ref)
            if v51 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 224 ]]
                    -- upvalues: v67 (ref), v21 (ref), l_store_0 (ref), l_avatarExperienceAnalytics_0 (ref), l_avatarRoute_0 (ref), l_interactionEvents_0 (ref), v23 (ref), l_networking_0 (ref), l_appAnalytics_0 (ref), l_setBodyColors_0 (ref), v48 (ref), v72 (ref), l_catalogAnalytics_0 (ref), l_shouldManageBackground_0 (ref), l_FFlagAXBackgroundSceneManagerRevamp_0 (ref), v24 (ref), v25 (ref), v52 (ref), v22 (ref), l_analytics_0 (ref)
                    v67.characterMover = v21.new(l_store_0, l_avatarExperienceAnalytics_0, l_avatarRoute_0, l_interactionEvents_0, v67.props.allowCameraMovements);
                    v67.characterManager = v23.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v67.characterMover, {
                        bodyColorsChangedEvent = l_setBodyColors_0, 
                        adjustmentChangedEvent = v67.props.setAdjustments, 
                        avatarScalesChangedEvent = if v48 then v72 else nil
                    }, {
                        setAppliedDescription = v67.props.setAppliedDescription
                    }, l_catalogAnalytics_0);
                    if l_shouldManageBackground_0 then
                        if l_FFlagAXBackgroundSceneManagerRevamp_0 then
                            v67.backgroundSceneManager = v24.new(l_store_0, l_networking_0, l_avatarRoute_0);
                        else
                            v67.backgroundSceneManager = v25.new(l_store_0, l_networking_0, l_avatarRoute_0);
                        end;
                    end;
                    if not v52 then
                        v67.saveManager = v22.new(l_store_0, l_networking_0, l_analytics_0);
                    end;
                    v67.finishedInitializing = true;
                    if v67.destroyed then
                        v67:onDestroy();
                        return;
                    else
                        v67:updateManagers();
                        return;
                    end;
                end);
                if not l_status_1 then
                    l_mutedError_0((("%* on page: %*, with receivedAvatarData: %*"):format(l_result_1, (function() --[[ Line: 273 ]]
                        -- upvalues: v67 (ref)
                        if not v67.props.routeHistory or typeof(v67.props.routeHistory) ~= "table" then
                            return (("no route history got %*"):format((typeof(v67.props.routeHistory))));
                        else
                            local v86 = v67.props.routeHistory[#v67.props.routeHistory];
                            if not v86 or typeof(v86) ~= "table" then
                                return (("no route, got %*"):format((typeof(v86))));
                            else
                                local v87 = v86[#v86];
                                if not v87 or typeof(v86) ~= "table" then
                                    return (("no page, got %*"):format((typeof(v86))));
                                else
                                    return v87.name;
                                end;
                            end;
                        end;
                    end)(), v67.props.receivedAvatarData)));
                    return;
                end;
            else
                v67.characterMover = v21.new(l_store_0, l_avatarExperienceAnalytics_0, l_avatarRoute_0, l_interactionEvents_0, v67.props.allowCameraMovements);
                v67.characterManager = v23.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v67.characterMover, {
                    bodyColorsChangedEvent = l_setBodyColors_0, 
                    adjustmentChangedEvent = v67.props.setAdjustments, 
                    avatarScalesChangedEvent = if v48 then v72 else nil
                }, {
                    setAppliedDescription = v67.props.setAppliedDescription
                }, l_catalogAnalytics_0);
                if l_FFlagAXBackgroundSceneManagerRevamp_0 then
                    v67.backgroundSceneManager = v24.new(l_store_0, l_networking_0, l_avatarRoute_0);
                else
                    v67.backgroundSceneManager = v25.new(l_store_0, l_networking_0, l_avatarRoute_0);
                end;
                if not v52 then
                    v67.saveManager = v22.new(l_store_0, l_networking_0, l_analytics_0);
                end;
                v67.finishedInitializing = true;
                if v67.destroyed then
                    v67:onDestroy();
                    return;
                else
                    v67:updateManagers();
                end;
            end;
        end);
        return;
    end;
end;
local v88 = {
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
local function _(v89) --[[ Line: 361 ]] --[[ Name: shouldRunManagers ]]
    -- upvalues: v88 (copy)
    return v88[v89.name] or false;
end;
local function v94(v91) --[[ Line: 365 ]] --[[ Name: checkShouldRunManagers ]]
    -- upvalues: v88 (copy), v31 (copy)
    if not v91 then
        return false;
    else
        for v92 = #v91, 1, -1 do
            local v93 = v91[v92];
            if v88[v93.name] or false then
                return true;
            elseif not (v31[v93.name] and v31[v93.name].renderUnderlyingPage) then
                return false;
            end;
        end;
        return false;
    end;
end;
v66.updateManagers = function(v95) --[[ Line: 386 ]] --[[ Name: updateManagers ]]
    -- upvalues: v94 (copy)
    if not v95.finishedInitializing then
        return;
    else
        local l_routeHistory_0 = v95.props.routeHistory;
        local v97 = l_routeHistory_0[#l_routeHistory_0];
        local v98 = nil;
        v98 = if v95.props.shouldStart ~= nil then v95.props.shouldStart else v95.props.avatarRoute.isVisible or v94(v97);
        if v98 and not v95.running then
            v95:start();
            return;
        else
            if not v98 and v95.running then
                v95:stop();
            end;
            return;
        end;
    end;
end;
v66.didMount = function(v99) --[[ Line: 409 ]] --[[ Name: didMount ]]
    v99:updateManagers();
end;
v66.willUnmount = function(v100) --[[ Line: 413 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagAXAvatarLoadWithRetry_0 (copy)
    if l_FFlagAXAvatarLoadWithRetry_0 and v100.modelLoadPromise then
        v100.modelLoadPromise:cancel();
    end;
    if v100.running then
        v100:stop();
    end;
    if v100.finishedInitializing then
        v100:onDestroy();
    end;
    v100.destroyed = true;
end;
v66.callUpdateAvatarRoute = function(_, v102, v103, v104) --[[ Line: 427 ]] --[[ Name: callUpdateAvatarRoute ]]
    if v102 then
        v102:updateAvatarRoute(v103, v104);
    end;
end;
v66.callUpdateCategorySelection = function(_, v106) --[[ Line: 433 ]] --[[ Name: callUpdateCategorySelection ]]
    if v106 then
        v106:updateCategorySelection();
    end;
end;
v66.shouldResetFullViewForPage = function(v107, v108) --[[ Line: 439 ]] --[[ Name: shouldResetFullViewForPage ]]
    -- upvalues: l_FullView_0 (copy)
    if v107.props.fullView[v108] == nil then
        return false;
    else
        return v107.props.fullView[v108] ~= l_FullView_0.None;
    end;
end;
v66.resetFullView = function(v109, v110) --[[ Line: 451 ]] --[[ Name: resetFullView ]]
    -- upvalues: v30 (copy), l_AvatarScreen_0 (copy), v47 (copy), l_FullView_0 (copy)
    local v111 = v30.FullViewPageDefaults[v110];
    if v111 == nil then
        return;
    else
        local v112 = true;
        if v110 ~= l_AvatarScreen_0.Catalog then
            v112 = v110 == l_AvatarScreen_0.CatalogSearch;
        end;
        if v112 and v109.props.isPortrait then
            local l_alternateAvatarLandingScreenFullscreenEnabled_0 = v109.props.alternateAvatarLandingScreenFullscreenEnabled;
            if v47() then
                l_alternateAvatarLandingScreenFullscreenEnabled_0 = not v109.props.is10ftUI;
            end;
            v111 = if l_alternateAvatarLandingScreenFullscreenEnabled_0 then l_FullView_0.UIFullView else l_FullView_0.None;
        end;
        if v109.props.fullView[v110] ~= v111 then
            v109.props.setFullView(v109.props.avatarExperienceAnalytics, v110, v111);
        end;
        return;
    end;
end;
v66.onAvatarDataReady = function(v114) --[[ Line: 473 ]] --[[ Name: onAvatarDataReady ]]
    if v114.running then
        v114:maybeStartCharacterAndSaveManager();
        return;
    else
        if v114.finishedInitializing then
            v114.characterManager:maybeInitializeModel(v114.props.store:getState());
        end;
        return;
    end;
end;
v66.didUpdate = function(v115, v116) --[[ Line: 486 ]] --[[ Name: didUpdate ]]
    -- upvalues: v52 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy)
    if v115.props.receivedAvatarData and not v116.receivedAvatarData then
        v115:onAvatarDataReady();
    end;
    v115:updateManagers();
    local l_avatarRoute_1 = v115.props.avatarRoute;
    local l_avatarRoute_2 = v116.avatarRoute;
    if l_avatarRoute_1 ~= l_avatarRoute_2 then
        v115:callUpdateAvatarRoute(v115.characterMover, l_avatarRoute_1, l_avatarRoute_2);
        if v115.backgroundSceneManager then
            v115:callUpdateAvatarRoute(v115.backgroundSceneManager, l_avatarRoute_1, l_avatarRoute_2);
        end;
        v115:callUpdateAvatarRoute(v115.characterManager, l_avatarRoute_1, l_avatarRoute_2);
        if not v52 then
            v115:callUpdateAvatarRoute(v115.saveManager, l_avatarRoute_1, l_avatarRoute_2);
        end;
    end;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local l_catalogCategoryId_0 = v116.catalogCategoryId;
        local l_catalogCategoryId_1 = v115.props.catalogCategoryId;
        local l_catalogSubcategoryId_0 = v116.catalogSubcategoryId;
        local l_catalogSubcategoryId_1 = v115.props.catalogSubcategoryId;
        local l_catalogSearchCategoryId_0 = v116.catalogSearchCategoryId;
        local l_catalogSearchCategoryId_1 = v115.props.catalogSearchCategoryId;
        local l_catalogSearchSubcategoryId_0 = v116.catalogSearchSubcategoryId;
        local l_catalogSearchSubcategoryId_1 = v115.props.catalogSearchSubcategoryId;
        if l_catalogCategoryId_1 ~= l_catalogCategoryId_0 or l_catalogSubcategoryId_1 ~= l_catalogSubcategoryId_0 or l_catalogSearchCategoryId_1 ~= l_catalogSearchCategoryId_0 or l_catalogSearchSubcategoryId_1 ~= l_catalogSearchSubcategoryId_0 then
            v115:callUpdateCategorySelection(v115.characterMover);
            v115:callUpdateAvatarRoute(v115.characterManager, l_avatarRoute_1, l_avatarRoute_2);
        end;
    end;
end;
v66.render = function(v127) --[[ Line: 533 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v33 (copy)
    if v127.props.renderSky then
        return v4.createElement(v33);
    else
        return;
    end;
end;
v66.maybeStartCharacterAndSaveManager = function(v128) --[[ Line: 539 ]] --[[ Name: maybeStartCharacterAndSaveManager ]]
    -- upvalues: v52 (copy)
    if v128.characterManagerRunning or not v128.props.receivedAvatarData then
        return;
    else
        v128.characterManager:start();
        if not v52 then
            v128.saveManager:start();
        end;
        v128.characterManagerRunning = true;
        return;
    end;
end;
v66.stopCharacterAndSaveManager = function(v129) --[[ Line: 551 ]] --[[ Name: stopCharacterAndSaveManager ]]
    -- upvalues: v52 (copy)
    if not v129.characterManagerRunning then
        return;
    else
        v129.characterManager:stop();
        if not v52 then
            v129.saveManager:stop();
        end;
        v129.characterManagerRunning = false;
        return;
    end;
end;
v66.start = function(v130) --[[ Line: 563 ]] --[[ Name: start ]]
    -- upvalues: v49 (copy)
    v49:info("AvatarSceneManager:start()");
    if v130.running then
        return;
    else
        if v130.backgroundSceneManager then
            v130.props.setThrottleFramerateEnabled(false);
            v130.backgroundSceneManager:start();
        end;
        v130.running = true;
        v130:maybeStartCharacterAndSaveManager();
        v130.characterMover:start();
        v130.props.setPageLoaded();
        v130.props.notificationService:ActionEnabled(Enum.AppShellActionType.AvatarEditorPageLoaded);
        return;
    end;
end;
v66.stop = function(v131) --[[ Line: 586 ]] --[[ Name: stop ]]
    -- upvalues: v49 (copy)
    v49:info("AvatarSceneManager:stop()");
    if not v131.running then
        return;
    else
        v131.props.setThrottleFramerateEnabled(true);
        v131.running = false;
        v131:stopCharacterAndSaveManager();
        if v131.backgroundSceneManager then
            v131.backgroundSceneManager:stop();
        end;
        v131.characterMover:stop();
        return;
    end;
end;
v66.onDestroy = function(v132) --[[ Line: 604 ]] --[[ Name: onDestroy ]]
    -- upvalues: v52 (copy)
    v132.characterManager:onDestroy();
    if v132.backgroundSceneManager then
        v132.backgroundSceneManager:onDestroy();
    end;
    v132.characterMover:onDestroy();
    if not v52 then
        v132.saveManager:onDestroy();
    end;
end;
v66 = l_RoactServices_0.connect({
    catalogAnalytics = v10, 
    analytics = v8, 
    appAnalytics = v9, 
    avatarExperienceAnalytics = v29, 
    networking = v13, 
    notificationService = l_AppNotificationService_0
})(v66);
v66 = v34((v32((v6.connect(function(v133, _) --[[ Line: 624 ]]
    -- upvalues: v37 (copy), v35 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        isPortrait = v37(v133), 
        fullView = v133.AvatarExperience.Common.FullView, 
        avatarPageLoaded = v133.AvatarExperience.AvatarEditor.PageLoaded, 
        receivedAvatarData = v35(v133), 
        routeHistory = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v133) else v133.Navigation.history
    };
end, function(v135) --[[ Line: 634 ]]
    -- upvalues: v18 (copy), v19 (copy)
    return {
        setPageLoaded = function() --[[ Line: 636 ]] --[[ Name: setPageLoaded ]]
            -- upvalues: v135 (copy), v18 (ref)
            v135(v18(true));
        end, 
        setFullView = function(v136, v137, v138) --[[ Line: 639 ]] --[[ Name: setFullView ]]
            -- upvalues: v135 (copy), v19 (ref)
            v135(v19(v136, v137, v138));
        end
    };
end)(v66)))));
if not v47() and v46 then
    v66 = v45.connectTestVariables({
        alternateAvatarLandingScreenFullscreenEnabled = v46.GetFullScreenEnabled
    })(v66);
end;
v66 = v44(v66, false);
v66 = v36((l_RoactAppPolicy_0.connect(function(v139) --[[ Line: 659 ]]
    return {
        allowCameraMovements = v139.getAllowCameraMovements()
    };
end)(v66)));
return function(v140) --[[ Line: 667 ]] --[[ Name: AvatarSceneManagerWrapper ]]
    -- upvalues: v39 (copy), v38 (copy), v40 (copy), v41 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v59 (copy), l_useSignalState_0 (copy), v47 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v5 (copy), v66 (ref)
    local v141 = v39();
    local v142 = v38.Dictionary.join(v141, v140);
    local v143 = v40();
    local v144 = v41();
    v142 = v38.Dictionary.join(v143, v142, v144);
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v145 = v59.getCatalogSelectionStore();
        local v146 = l_useSignalState_0(v145.selectedCategoryId);
        local v147 = l_useSignalState_0(v145.selectedSubcategoryId);
        v142.catalogCategoryId = v146;
        v142.catalogSubcategoryId = v147;
        local v148 = v59.getCatalogSearchSelectionStore();
        local v149 = l_useSignalState_0(v148.selectedCategoryId);
        local v150 = l_useSignalState_0(v148.selectedSubcategoryId);
        v142.catalogSearchCategoryId = v149;
        v142.catalogSearchSubcategoryId = v150;
    end;
    if v47() then
        v142.is10ftUI = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    end;
    return v5.createElement(v66, v142);
end;