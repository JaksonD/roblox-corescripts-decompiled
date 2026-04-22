local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_selectCurrentRoactNavigationRoute_0 = l_Selectors_0.selectCurrentRoactNavigationRoute;
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_Modules_0.LuaApp.ExperienceEventReceiver);
local v14 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageLoad);
local v15 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageUnload);
local v16 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v18 = require(l_Modules_0.LuaApp.AppPage);
local v19 = require(l_Modules_0.LuaApp.AppPageProperties);
local v20 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v21 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_NavigateIntoChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoChat;
local v24 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v25 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v26 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v27 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v28 = require(l_Modules_0.LuaApp.Actions.SetPreloading);
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local v30 = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames);
local v31 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagShareTargetGameCleanup_0 = v31.FFlagShareTargetGameCleanup;
local l_FFlagUseNavigationSelectors_0 = v31.FFlagUseNavigationSelectors;
local function _(v34, v35) --[[ Line: 45 ]] --[[ Name: notifySwitchedToAppShellFeature ]]
    -- upvalues: v19 (copy)
    local v36 = v19[v35];
    v34:SwitchedToAppShellFeature(v36 and v36.appShellReporterFeature or Enum.AppShellFeature.None);
end;
local function _(v38) --[[ Line: 54 ]] --[[ Name: getRouteName ]]
    if v38 ~= nil then
        return v38.routeName;
    else
        return nil;
    end;
end;
local function _(v40) --[[ Line: 58 ]] --[[ Name: getRouteDetail ]]
    if v40 ~= nil and v40.params ~= nil then
        return v40.params.detail;
    else
        return nil;
    end;
end;
local function _() --[[ Line: 62 ]] --[[ Name: shouldEnableLuaAppUnloadEvent ]]
    -- upvalues: v30 (copy)
    return #v30() > 0;
end;
local function v62() --[[ Line: 67 ]] --[[ Name: usePageLoadEvents ]]
    -- upvalues: l_useRoactService_0 (copy), v12 (copy), l_AppNotificationService_0 (copy), l_useSelector_0 (copy), l_selectCurrentRoactNavigationRoute_0 (copy), v4 (copy), v30 (copy), v13 (copy), v15 (copy), v14 (copy), v19 (copy)
    local v43 = l_useRoactService_0(v12);
    local v44 = l_useRoactService_0(l_AppNotificationService_0);
    local v45 = l_useSelector_0(l_selectCurrentRoactNavigationRoute_0);
    local v46 = if v45 ~= nil then v45.routeName else nil;
    local v47 = if v45 ~= nil and v45.params ~= nil then v45.params.detail else nil;
    local v48, v49 = v4.useState(os.clock());
    local v50 = v4.useMemo(function() --[[ Line: 77 ]]
        -- upvalues: v30 (ref), v13 (ref)
        if #v30() > 0 then
            return v13.new();
        else
            return nil;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v50 (copy), v15 (ref), v43 (copy), v46 (copy), v47 (copy), v48 (copy), v49 (copy), v14 (ref)
        if v50 ~= nil then
            local v53 = v50:onLaunched(function(v51) --[[ Line: 86 ]]
                -- upvalues: v15 (ref), v43 (ref), v46 (ref), v47 (ref), v48 (ref), v49 (ref)
                local v52 = os.clock();
                v15(v43, "AppRouter", v46, v47, {
                    nextPage = "Experience", 
                    nextDetail = v51.placeId, 
                    timeOnPage = v52 - v48
                });
                v49(v52);
            end);
            local v55 = v50:onLeft(function(v54) --[[ Line: 96 ]]
                -- upvalues: v14 (ref), v43 (ref), v46 (ref), v47 (ref), v49 (ref)
                v14(v43, "AppRouter", v46, v47, {
                    previousPage = "Experience", 
                    previousDetail = v54.placeId
                });
                v49(os.clock());
            end);
            return function() --[[ Line: 104 ]]
                -- upvalues: v53 (copy), v55 (copy)
                v53:disconnect();
                v55:disconnect();
            end;
        else
            return;
        end;
    end, {
        v50, 
        v43, 
        v46, 
        v47
    });
    local v56 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v56 (copy), v14 (ref), v43 (copy), v46 (copy), v47 (copy), v15 (ref), v48 (copy), v45 (copy), v44 (copy), v19 (ref), v49 (copy)
        local l_current_0 = v56.current;
        local v58 = if l_current_0 ~= nil then l_current_0.routeName else nil;
        local l_current_1 = v56.current;
        l_current_0 = if l_current_1 ~= nil and l_current_1.params ~= nil then l_current_1.params.detail else nil;
        v14(v43, "AppRouter", v46, v47, {
            previousPage = v58, 
            previousDetail = l_current_0
        });
        l_current_1 = os.clock();
        if v56.current ~= nil then
            v15(v43, "AppRouter", v58, l_current_0, {
                nextPage = v46, 
                nextDetail = v47, 
                timeOnPage = l_current_1 - v48
            });
        end;
        v56.current = v45;
        local l_v44_0 = v44;
        local v61 = v19[v46];
        l_v44_0:SwitchedToAppShellFeature(v61 and v61.appShellReporterFeature or Enum.AppShellFeature.None);
        v49(l_current_1);
    end, {
        v46, 
        v47
    });
end;
local v63 = v4.Component:extend("NavigationEventReceiver");
v63.handleBackButtonPressed = function(v64) --[[ Line: 136 ]] --[[ Name: handleBackButtonPressed ]]
    -- upvalues: v18 (copy), l_FFlagShareTargetGameCleanup_0 (copy), v19 (copy), l_GuiService_0 (copy), v16 (copy)
    local v65 = #v64.props.currentRoute;
    local l_name_0 = v64.props.currentRoute[1].name;
    local l_name_1 = v64.props.currentRoute[v65].name;
    if l_name_0 == v18.Chat and l_name_1 ~= v18.GameDetail and (l_FFlagShareTargetGameCleanup_0 and true or l_name_1 ~= v18.ShareGameToChat) then
        return;
    elseif v19[l_name_1] and v19[l_name_1].disableBackButton then
        return;
    elseif v64.props.centralOverlayType then
        if not v64.props.centralOverlayDisableBackButtonClose then
            v64.props.closeCentralOverlay();
        end;
        return;
    elseif v65 > 1 then
        v64.props.navigateBack();
        return;
    else
        l_GuiService_0:BroadcastNotification("", v16.BACK_BUTTON_NOT_CONSUMED);
        return;
    end;
end;
v63.init = function(v68) --[[ Line: 181 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), l_AvatarScreen_0 (copy), l_GuiService_0 (copy), v26 (copy)
    local l_RobloxEventReceiver_0 = v68.props.RobloxEventReceiver;
    v68.getShouldBlockDeeplink = function() --[[ Line: 184 ]]
        -- upvalues: v68 (copy)
        return not (v68.props.getCanSeeChatTab and v68.props.getCanSeeChatTab());
    end;
    v68.tokens = {
        l_RobloxEventReceiver_0:observeEvent("Navigations", function(v70, v71) --[[ Line: 189 ]]
            -- upvalues: v18 (ref), v68 (copy), l_AvatarScreen_0 (ref)
            if v71 == "Destination" or v71 == "Reload" then
                if v70.appName == v18.ShareGameToChat then
                    v68.props.navigateDown({
                        name = v18.ShareGameToChat, 
                        detail = v70.parameters.placeId
                    });
                    return;
                elseif v70.appName == v18.Chat then
                    if v68.getShouldBlockDeeplink() then
                        return;
                    else
                        v68.props.setPage({
                            name = v18.Chat, 
                            detail = v70.parameters and v70.parameters.conversationId
                        });
                        return;
                    end;
                elseif v70.appName == l_AvatarScreen_0.AvatarEditor then
                    v68.props.resetNavigationHistory({
                        {
                            {
                                name = l_AvatarScreen_0.AvatarExperienceLandingPage
                            }
                        }, 
                        {
                            {
                                name = l_AvatarScreen_0.AvatarExperienceLandingPage
                            }, 
                            {
                                name = l_AvatarScreen_0.AvatarEditor
                            }
                        }
                    });
                    return;
                else
                    v68.props.setPage({
                        name = v18[v70.appName] or v18.None
                    });
                end;
            end;
        end), 
        l_GuiService_0.ShowLeaveConfirmation:Connect(function() --[[ Line: 221 ]]
            -- upvalues: v68 (copy)
            v68:handleBackButtonPressed();
        end), 
        l_RobloxEventReceiver_0:observeEvent("AppShellNotifications", function(v72, v73) --[[ Line: 225 ]]
            -- upvalues: v68 (copy)
            if v73 == "StartConversationWithUserId" then
                if v68.getShouldBlockDeeplink() then
                    return;
                else
                    v68.props.navigateIntoChat({
                        userId = v72
                    });
                    return;
                end;
            elseif v73 == "StartConversationWithId" then
                if v68.getShouldBlockDeeplink() then
                    return;
                else
                    v68.props.navigateIntoChat({
                        conversationId = v72
                    });
                    return;
                end;
            else
                if v73 == "Preloading" then
                    local v74 = v72 == "true";
                    v68.props.setPreloading(v74);
                end;
                return;
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("QrCodeScanResult", function(_, v76) --[[ Line: 247 ]]
            -- upvalues: v68 (copy), v26 (ref)
            if v76 == "Cancelled" then
                v68.props.navigateBack();
                return;
            else
                v68.props.navigateBack();
                v68.props.setCurrentToast({
                    toastMessage = "Feature.Toast.ScanQrCodeError.UnrecognizableQrCode", 
                    toastType = v26.NetworkingError
                });
                return;
            end;
        end)
    };
end;
v63.render = function(_) --[[ Line: 262 ]] --[[ Name: render ]]

end;
v63.willUnmount = function(v78) --[[ Line: 264 ]] --[[ Name: willUnmount ]]
    for _, v80 in pairs(v78.tokens) do
        v80:disconnect();
    end;
end;
v63 = v5.connect(function(v81, _) --[[ Line: 270 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v81) else v81.Navigation.history[#v81.Navigation.history], 
        centralOverlayType = v81.CentralOverlay.OverlayType, 
        centralOverlayDisableBackButtonClose = v81.CentralOverlay.Configs.DisableBackButtonClose
    };
end, function(v83) --[[ Line: 278 ]]
    -- upvalues: v20 (copy), v21 (copy), v22 (copy), v25 (copy), v24 (copy), v27 (copy), l_NavigateIntoChat_0 (copy), v28 (copy)
    return {
        setPage = function(v84) --[[ Line: 280 ]] --[[ Name: setPage ]]
            -- upvalues: v83 (copy), v20 (ref)
            return v83(v20({
                v84
            }, true));
        end, 
        navigateDown = function(v85) --[[ Line: 284 ]] --[[ Name: navigateDown ]]
            -- upvalues: v83 (copy), v21 (ref)
            return v83(v21(v85, true));
        end, 
        navigateBack = function() --[[ Line: 287 ]] --[[ Name: navigateBack ]]
            -- upvalues: v83 (copy), v22 (ref)
            return v83(v22(true));
        end, 
        closeCentralOverlay = function() --[[ Line: 290 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v83 (copy), v25 (ref)
            v83(v25());
        end, 
        resetNavigationHistory = function(v86) --[[ Line: 293 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v83 (copy), v24 (ref)
            return v83(v24(nil, v86));
        end, 
        setCurrentToast = function(v87) --[[ Line: 296 ]] --[[ Name: setCurrentToast ]]
            -- upvalues: v83 (copy), v27 (ref)
            v83(v27(v87));
        end, 
        navigateIntoChat = function(v88) --[[ Line: 299 ]] --[[ Name: navigateIntoChat ]]
            -- upvalues: v83 (copy), l_NavigateIntoChat_0 (ref)
            return v83(l_NavigateIntoChat_0(v88, false));
        end, 
        setPreloading = function(v89) --[[ Line: 302 ]] --[[ Name: setPreloading ]]
            -- upvalues: v83 (copy), v28 (ref)
            v83(v28(v89));
        end
    };
end)(v63);
v63 = l_UniversalAppPolicy_0.connect(function(v90) --[[ Line: 307 ]]
    return {
        getCanSeeChatTab = v90.getCanSeeChatTab
    };
end)(v63);
return function(v91) --[[ Line: 313 ]] --[[ Name: NavigationEventReceiverWrapper ]]
    -- upvalues: v62 (copy), v4 (copy), v63 (ref)
    v62();
    return v4.createElement(v63, v91);
end;