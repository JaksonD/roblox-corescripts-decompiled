local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.init");
local v5 = require(l_Modules_0.AvatarExperience.Common.Debug.LogHelpers);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Promise);
local v12 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_RemoteAvatarUpdateHandler_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInitialization).Components.RemoteAvatarUpdateHandler;
local v19 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetAvatarData);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetAvatarRules);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ProcessAvatarRules);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetCatalogMetadata);
local v26 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v27 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AvatarExperienceLoaded_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.AvatarExperienceLoaded;
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.PreventSaveAvatar);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetRangesAndSliderValuesFromBodyColor3s);
local l_selectCurrentLegacyPage_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors.selectCurrentLegacyPage;
local v33 = game:DefineFastInt("AXGetAvatarDataThrottleInterval", 90000);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableAvatarDataRefresh);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local v36 = v7.PureComponent:extend("AvatarExperienceInitialization");
v36.validateProps = v10.strictInterface({
    networking = v10.callback, 
    avatarExperienceActive = v10.boolean, 
    navigation = if v34() then v10.table else nil, 
    defaultBodyColorRanges = v10.optional(v10.table), 
    getCatalogMetadata = v10.callback, 
    getAvatarData = v10.callback, 
    receivedAvatarData = v10.callback, 
    getAvatarRules = v10.callback, 
    processAvatarRules = v10.callback, 
    avatarExperienceLoaded = v10.callback, 
    waitUntilIXPUserInit = v10.callback, 
    setRangesAndSliderValuesFromBodyColor3s = v10.callback, 
    setPreventSaveAvatar = if v34() then v10.callback else nil, 
    ixpService = v10.any
});
v36.init = function(v37) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy), v11 (copy), v4 (copy), v5 (copy), l_AvatarEditorService_0 (copy)
    v37.pendingBodyColor3s = nil;
    v37:setState({
        localPlayer = l_Players_0.LocalPlayer, 
        userId = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0, 
        getAvatarDataFailed = false, 
        getAvatarRulesFailed = false, 
        getAvatarRulesSuccess = false, 
        ixpLoaded = false
    });
    v37.loadedPromise = v11.new(function(v38, _) --[[ Line: 103 ]]
        -- upvalues: v37 (copy)
        v37.resolveLoadedPromise = v38;
    end);
    v37.retryAvatarRulesPromise = nil;
    v37.retryAvatarRulesCount = 0;
    v37.loadedPromise:andThen(function() --[[ Line: 111 ]]

    end);
    v37.onLocalPlayerChanged = function() --[[ Line: 113 ]]
        -- upvalues: v4 (ref), v5 (ref), l_Players_0 (ref), v37 (copy)
        v4:info("onLocalPlayerChanged: {}", v5.obfuscatePlayer(l_Players_0.LocalPlayer));
        if v37.state.localPlayer == nil then
            v37:setState({
                localPlayer = l_Players_0.LocalPlayer
            });
        end;
    end;
    v37.onUserIdChanged = function() --[[ Line: 122 ]]
        -- upvalues: v4 (ref), v5 (ref), l_Players_0 (ref), v37 (copy)
        v4:info("onUserIdChanged: {}", v5.obfuscatePlayer(l_Players_0.LocalPlayer));
        if v37.state.userId == 0 and l_Players_0.LocalPlayer ~= nil then
            v37:setState({
                userId = l_Players_0.LocalPlayer.UserId
            });
        end;
    end;
    v37.onRemoteAvatarUpdate = function() --[[ Line: 131 ]]
        -- upvalues: v37 (copy), l_AvatarEditorService_0 (ref)
        v37:getAvatarData():andThen(function() --[[ Line: 132 ]]
            -- upvalues: l_AvatarEditorService_0 (ref)
            if game:GetEngineFeature("AvatarEditorServiceRefreshAvatarThumbnailEnabled") then
                l_AvatarEditorService_0:refreshAvatarThumbnails({
                    "AvatarHeadShot", 
                    "AvatarBust", 
                    "Avatar"
                });
            end;
        end);
    end;
end;
v36.getLoadingStatus = function(v40) --[[ Line: 140 ]] --[[ Name: getLoadingStatus ]]
    -- upvalues: v12 (copy)
    local v41 = false;
    if v40.state.localPlayer ~= nil then
        v41 = v40.state.userId ~= 0;
    end;
    if not v41 then
        return v12.Fetching;
    elseif not v40.state.ixpLoaded then
        return v12.Fetching;
    elseif not v40.state.getAvatarRulesSuccess then
        return v12.Fetching;
    else
        return v12.Done;
    end;
end;
v36.render = function(v42) --[[ Line: 159 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_ExternalEventConnection_0 (copy), l_Players_0 (copy), v12 (copy), v8 (copy), l_RemoteAvatarUpdateHandler_0 (copy)
    local l_createFragment_0 = v7.createFragment;
    local v44 = {
        LocalPlayerConn = v7.createElement(l_ExternalEventConnection_0, {
            event = l_Players_0:GetPropertyChangedSignal("LocalPlayer"), 
            callback = v42.onLocalPlayerChanged
        })
    };
    local v45 = false;
    if l_Players_0.LocalPlayer ~= nil then
        v45 = v7.createElement(l_ExternalEventConnection_0, {
            event = l_Players_0.LocalPlayer:GetPropertyChangedSignal("UserId"), 
            callback = v42.onUserIdChanged
        });
    end;
    v44.UserIdConn = v45;
    v44.RemoteAvatarUpdateHandler = if v42:getLoadingStatus() == v12.Done then v8.createElement(l_RemoteAvatarUpdateHandler_0, {
        onUpdated = v42.onRemoteAvatarUpdate
    }) else nil;
    return l_createFragment_0(v44);
end;
v36.checkHasLoaded = function(v46) --[[ Line: 175 ]] --[[ Name: checkHasLoaded ]]
    -- upvalues: v11 (copy), v12 (copy), v4 (copy)
    if v46.loadedPromise:getStatus() ~= v11.Status.Resolved and v46:getLoadingStatus() == v12.Done then
        v4:info("avatarExperienceLoaded");
        v46.props.avatarExperienceLoaded();
        v46.resolveLoadedPromise();
    end;
end;
v36.maybeSetRangesAndSliderValuesFromBodyColor3s = function(v47) --[[ Line: 185 ]] --[[ Name: maybeSetRangesAndSliderValuesFromBodyColor3s ]]
    if v47.pendingBodyColor3s == nil then
        return;
    elseif #v47.props.defaultBodyColorRanges == 0 then
        return;
    else
        v47.props.setRangesAndSliderValuesFromBodyColor3s(v47.pendingBodyColor3s);
        return;
    end;
end;
v36.getAvatarData = function(v48, v49) --[[ Line: 201 ]] --[[ Name: getAvatarData ]]
    -- upvalues: v11 (copy), v4 (copy), v34 (copy), v26 (copy)
    return (v11.all({
        v48.props.getAvatarData(v48.props.networking), 
        v48.loadedPromise
    }):andThen(function(v50) --[[ Line: 208 ]]
        -- upvalues: v4 (ref), v34 (ref), v49 (copy), v48 (copy), v26 (ref)
        local v51 = v50[1];
        v4:debug("getAvatarData results valid: {}", v51 ~= nil);
        if v51 then
            if v34() and v49 then
                v48.props.setPreventSaveAvatar(true);
            end;
            local v52 = v51.bodyColor3s or {};
            local v53 = v26.convertBodyColor3HexesToColor3s(v52);
            v48:applyAvatarDataWithModifiedBodyColor3s(v51, v53);
        end;
    end):catch(function(v54) --[[ Line: 224 ]]
        -- upvalues: v4 (ref), v48 (copy)
        v4:info("getAvatarData failed: {}", v54);
        v48:setState({
            getAvatarDataFailed = true
        });
    end));
end;
v36.applyAvatarDataWithModifiedBodyColor3s = function(v55, v56, v57) --[[ Line: 233 ]] --[[ Name: applyAvatarDataWithModifiedBodyColor3s ]]
    -- upvalues: v6 (copy)
    local v58 = {
        bodyColor3s = v57
    };
    local v59 = v6.Dictionary.join(v56, v58);
    v55.props.receivedAvatarData(v59);
    v55.pendingBodyColor3s = v57;
    v55:maybeSetRangesAndSliderValuesFromBodyColor3s();
end;
v36.maybeStartRetryAvatarRules = function(v60) --[[ Line: 255 ]] --[[ Name: maybeStartRetryAvatarRules ]]
    -- upvalues: v11 (copy)
    if v60.retryAvatarRulesPromise and v60.retryAvatarRulesPromise:getStatus() ~= v11.Status.Resolved then
        return;
    else
        v60.retryAvatarRulesCount = v60.retryAvatarRulesCount + 1;
        v60.retryAvatarRulesPromise = v11.delay(math.pow(2, v60.retryAvatarRulesCount - 1) * 2):andThen(function() --[[ Line: 264 ]]
            -- upvalues: v60 (copy)
            v60:getAvatarRules();
        end);
        return;
    end;
end;
v36.getAvatarRules = function(v61) --[[ Line: 269 ]] --[[ Name: getAvatarRules ]]
    -- upvalues: v4 (copy), v11 (copy)
    local v64 = v61.props.getAvatarRules():andThen(function(v62) --[[ Line: 272 ]]
        -- upvalues: v61 (copy)
        v61:setState({
            getAvatarRulesSuccess = true
        });
        return v62;
    end, function(v63) --[[ Line: 278 ]]
        -- upvalues: v4 (ref), v61 (copy)
        v4:info("getAvatarRules failed: {}", v63);
        v61:setState({
            getAvatarRulesFailed = true
        });
        v61:maybeStartRetryAvatarRules();
    end);
    v11.all({
        v64, 
        v61.loadedPromise
    }):andThen(function(v65) --[[ Line: 289 ]]
        -- upvalues: v4 (ref), v61 (copy)
        local v66 = v65[1];
        v4:debug("getAvatarRules results valid: {}", v66 ~= nil);
        if v66 then
            v61.props.processAvatarRules(v66);
        end;
    end);
end;
v36.checkIXPInitialized = function(v67) --[[ Line: 298 ]] --[[ Name: checkIXPInitialized ]]
    if v67.state.userId ~= 0 then
        local l_ixpService_0 = v67.props.ixpService;
        v67.props.waitUntilIXPUserInit(l_ixpService_0, v67.state.userId):andThen(function() --[[ Line: 302 ]]
            -- upvalues: v67 (copy)
            v67:setState({
                ixpLoaded = true
            });
        end);
    end;
end;
v36.checkForLocalPlayer = function(v69) --[[ Line: 310 ]] --[[ Name: checkForLocalPlayer ]]
    -- upvalues: l_Players_0 (copy)
    local v70 = l_Players_0.LocalPlayer ~= v69.state.localPlayer;
    local v71 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId ~= v69.state.userId;
    if v70 or v71 then
        v69:setState({
            localPlayer = l_Players_0.LocalPlayer, 
            userId = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0
        });
    end;
end;
v36.didMount = function(v72) --[[ Line: 323 ]] --[[ Name: didMount ]]
    -- upvalues: v4 (copy)
    v72:checkForLocalPlayer();
    v4:info("AvatarExperienceInitialization:didMount");
    v72.props.getCatalogMetadata(v72.props.networking);
    v72:getAvatarData();
    v72:getAvatarRules();
    v72:checkIXPInitialized();
    v72:checkHasLoaded();
end;
if v34() then
    v36.refreshAvatarDataOnRouteChange = function(v73, v74) --[[ Line: 338 ]] --[[ Name: refreshAvatarDataOnRouteChange ]]
        -- upvalues: v33 (copy)
        if v73.props.navigation.currentRoute.routeName ~= v74.navigation.currentRoute.routeName and not v73.props.avatarExperienceActive then
            local v75 = os.clock() * 1000;
            if not v73.lastCallTime then
                v73.lastCallTime = 0;
            end;
            if v75 and v75 - v73.lastCallTime >= v33 then
                v73:getAvatarData(true);
                v73.lastCallTime = v75;
            end;
        end;
    end;
end;
v36.didUpdate = function(v76, v77, v78) --[[ Line: 359 ]] --[[ Name: didUpdate ]]
    -- upvalues: v34 (copy)
    v76:checkForLocalPlayer();
    v76:checkHasLoaded();
    if v76.props.avatarExperienceActive and not v77.avatarExperienceActive then
        if v76.state.getAvatarDataFailed then
            v76:setState({
                getAvatarDataFailed = false
            });
            v76:getAvatarData();
        end;
        if v76.state.getAvatarRulesFailed then
            v76:setState({
                getAvatarRulesFailed = false
            });
            v76:getAvatarRules();
        end;
    end;
    if v34() then
        v76:refreshAvatarDataOnRouteChange(v77);
    end;
    if v76.state.userId ~= v78.userId then
        v76:checkIXPInitialized();
    end;
    if #v77.defaultBodyColorRanges == 0 and #v76.props.defaultBodyColorRanges ~= 0 then
        v76:maybeSetRangesAndSliderValuesFromBodyColor3s();
    end;
end;
v36.willUnmount = function(v79) --[[ Line: 400 ]] --[[ Name: willUnmount ]]
    -- upvalues: v4 (copy), v11 (copy)
    v4:info("AvatarExperienceInitialization:willUnmount");
    if v79.loadedPromise:getStatus() ~= v11.Status.Resolved then
        v79.loadedPromise:cancel();
    end;
    if v79.retryAvatarRulesPromise and v79.retryAvatarRulesPromise:getStatus() ~= v11.Status.Resolved then
        v79.retryAvatarRulesPromise:cancel();
        v79.retryAvatarRulesPromise = nil;
    end;
end;
v36 = v9.connect(function(v80, _) --[[ Line: 412 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_selectCurrentLegacyPage_0 (copy), l_SwitchTab_0 (copy), l_AvatarScreen_0 (copy), v34 (copy)
    local v82 = l_selectCurrentLegacyPage_0(v80);
    local v83 = true;
    if v82.name ~= l_SwitchTab_0.AvatarExperienceTab then
        v83 = v82.name == l_AvatarScreen_0.AvatarExperienceRoot;
    end;
    return {
        defaultBodyColorRanges = v80.AvatarExperience.AvatarEditor.DefaultBodyColorRanges, 
        avatarExperienceActive = v83, 
        navigation = if v34() then v80.Navigation else nil
    };
end, function(v84) --[[ Line: 425 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v22 (copy), v23 (copy), v24 (copy), l_AvatarExperienceLoaded_0 (copy), v19 (copy), v25 (copy), v31 (copy), v34 (copy), v29 (copy)
    return {
        getAvatarData = function(v85) --[[ Line: 427 ]] --[[ Name: getAvatarData ]]
            -- upvalues: v84 (copy), v21 (ref), l_FFlagAXModeratedItemsFlow_0 (ref)
            return v84(v21(v85, l_FFlagAXModeratedItemsFlow_0 and true or nil));
        end, 
        receivedAvatarData = function(v86) --[[ Line: 430 ]] --[[ Name: receivedAvatarData ]]
            -- upvalues: v84 (copy), v22 (ref)
            return v84(v22(v86));
        end, 
        getAvatarRules = function() --[[ Line: 434 ]] --[[ Name: getAvatarRules ]]
            -- upvalues: v84 (copy), v23 (ref)
            return v84(v23);
        end, 
        processAvatarRules = function(v87) --[[ Line: 437 ]] --[[ Name: processAvatarRules ]]
            -- upvalues: v84 (copy), v24 (ref)
            return v84(v24(v87));
        end, 
        avatarExperienceLoaded = function() --[[ Line: 441 ]] --[[ Name: avatarExperienceLoaded ]]
            -- upvalues: v84 (copy), l_AvatarExperienceLoaded_0 (ref)
            return v84(l_AvatarExperienceLoaded_0());
        end, 
        waitUntilIXPUserInit = function(v88, v89) --[[ Line: 445 ]] --[[ Name: waitUntilIXPUserInit ]]
            -- upvalues: v84 (copy), v19 (ref)
            return v84(v19(v88, v89));
        end, 
        getCatalogMetadata = function(v90) --[[ Line: 449 ]] --[[ Name: getCatalogMetadata ]]
            -- upvalues: v84 (copy), v25 (ref)
            return v84(v25(v90));
        end, 
        setRangesAndSliderValuesFromBodyColor3s = function(v91) --[[ Line: 453 ]] --[[ Name: setRangesAndSliderValuesFromBodyColor3s ]]
            -- upvalues: v84 (copy), v31 (ref)
            v84(v31(v91));
        end, 
        setPreventSaveAvatar = v34() and function(v92) --[[ Line: 458 ]]
            -- upvalues: v84 (copy), v29 (ref)
            v84(v29(v92));
        end or nil
    };
end)(v36);
v36 = l_RoactServices_0.connect({
    networking = v16
})(v36);
return function(v93) --[[ Line: 471 ]]
    -- upvalues: v7 (copy), v27 (copy), v6 (copy), v36 (ref)
    return v7.createElement(v27.Consumer, {
        render = function(v94) --[[ Line: 473 ]] --[[ Name: render ]]
            -- upvalues: v6 (ref), v93 (copy), v7 (ref), v36 (ref)
            local v95 = v6.Dictionary.join(v93, {
                ixpService = v94
            });
            return v7.createElement(v36, v95);
        end
    });
end;