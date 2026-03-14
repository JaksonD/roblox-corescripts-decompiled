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
local l_selectCurrentRoactNavigationRoute_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors.selectCurrentRoactNavigationRoute;
local v11 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v12 = require(l_Modules_0.LuaApp.ExperienceEventReceiver);
local v13 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageLoad);
local v14 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageUnload);
local v15 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.AppPageProperties);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v20 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v21 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_NavigateIntoChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoChat;
local v23 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v24 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v25 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v26 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v27 = require(l_Modules_0.LuaApp.Actions.SetPreloading);
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local v29 = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames);
local l_FFlagShareTargetGameCleanup_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagShareTargetGameCleanup;
local function _(v31, v32) --[[ Line: 43 ]] --[[ Name: notifySwitchedToAppShellFeature ]]
    -- upvalues: v18 (copy)
    local v33 = v18[v32];
    v31:SwitchedToAppShellFeature(v33 and v33.appShellReporterFeature or Enum.AppShellFeature.None);
end;
local function _(v35) --[[ Line: 52 ]] --[[ Name: getRouteName ]]
    if v35 ~= nil then
        return v35.routeName;
    else
        return nil;
    end;
end;
local function _(v37) --[[ Line: 56 ]] --[[ Name: getRouteDetail ]]
    if v37 ~= nil and v37.params ~= nil then
        return v37.params.detail;
    else
        return nil;
    end;
end;
local function _() --[[ Line: 60 ]] --[[ Name: shouldEnableLuaAppUnloadEvent ]]
    -- upvalues: v29 (copy)
    return #v29() > 0;
end;
local function v59() --[[ Line: 65 ]] --[[ Name: usePageLoadEvents ]]
    -- upvalues: l_useRoactService_0 (copy), v11 (copy), l_AppNotificationService_0 (copy), l_useSelector_0 (copy), l_selectCurrentRoactNavigationRoute_0 (copy), v4 (copy), v29 (copy), v12 (copy), v14 (copy), v13 (copy), v18 (copy)
    local v40 = l_useRoactService_0(v11);
    local v41 = l_useRoactService_0(l_AppNotificationService_0);
    local v42 = l_useSelector_0(l_selectCurrentRoactNavigationRoute_0);
    local v43 = if v42 ~= nil then v42.routeName else nil;
    local v44 = if v42 ~= nil and v42.params ~= nil then v42.params.detail else nil;
    local v45, v46 = v4.useState(os.clock());
    local v47 = v4.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v29 (ref), v12 (ref)
        if #v29() > 0 then
            return v12.new();
        else
            return nil;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v47 (copy), v14 (ref), v40 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy), v13 (ref)
        if v47 ~= nil then
            local v50 = v47:onLaunched(function(v48) --[[ Line: 84 ]]
                -- upvalues: v14 (ref), v40 (ref), v43 (ref), v44 (ref), v45 (ref), v46 (ref)
                local v49 = os.clock();
                v14(v40, "AppRouter", v43, v44, {
                    nextPage = "Experience", 
                    nextDetail = v48.placeId, 
                    timeOnPage = v49 - v45
                });
                v46(v49);
            end);
            local v52 = v47:onLeft(function(v51) --[[ Line: 94 ]]
                -- upvalues: v13 (ref), v40 (ref), v43 (ref), v44 (ref), v46 (ref)
                v13(v40, "AppRouter", v43, v44, {
                    previousPage = "Experience", 
                    previousDetail = v51.placeId
                });
                v46(os.clock());
            end);
            return function() --[[ Line: 102 ]]
                -- upvalues: v50 (copy), v52 (copy)
                v50:disconnect();
                v52:disconnect();
            end;
        else
            return;
        end;
    end, {
        v47, 
        v40, 
        v43, 
        v44
    });
    local v53 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v53 (copy), v13 (ref), v40 (copy), v43 (copy), v44 (copy), v14 (ref), v45 (copy), v42 (copy), v41 (copy), v18 (ref), v46 (copy)
        local l_current_0 = v53.current;
        local v55 = if l_current_0 ~= nil then l_current_0.routeName else nil;
        local l_current_1 = v53.current;
        l_current_0 = if l_current_1 ~= nil and l_current_1.params ~= nil then l_current_1.params.detail else nil;
        v13(v40, "AppRouter", v43, v44, {
            previousPage = v55, 
            previousDetail = l_current_0
        });
        l_current_1 = os.clock();
        if v53.current ~= nil then
            v14(v40, "AppRouter", v55, l_current_0, {
                nextPage = v43, 
                nextDetail = v44, 
                timeOnPage = l_current_1 - v45
            });
        end;
        v53.current = v42;
        local l_v41_0 = v41;
        local v58 = v18[v43];
        l_v41_0:SwitchedToAppShellFeature(v58 and v58.appShellReporterFeature or Enum.AppShellFeature.None);
        v46(l_current_1);
    end, {
        v43, 
        v44
    });
end;
local v60 = v4.Component:extend("NavigationEventReceiver");
v60.handleBackButtonPressed = function(v61) --[[ Line: 134 ]] --[[ Name: handleBackButtonPressed ]]
    -- upvalues: v17 (copy), l_FFlagShareTargetGameCleanup_0 (copy), v18 (copy), l_GuiService_0 (copy), v15 (copy)
    local v62 = #v61.props.currentRoute;
    local l_name_0 = v61.props.currentRoute[1].name;
    local l_name_1 = v61.props.currentRoute[v62].name;
    if l_name_0 == v17.Chat and l_name_1 ~= v17.GameDetail and (l_FFlagShareTargetGameCleanup_0 and true or l_name_1 ~= v17.ShareGameToChat) then
        return;
    elseif v18[l_name_1] and v18[l_name_1].disableBackButton then
        return;
    elseif v61.props.centralOverlayType then
        if not v61.props.centralOverlayDisableBackButtonClose then
            v61.props.closeCentralOverlay();
        end;
        return;
    elseif v62 > 1 then
        v61.props.navigateBack();
        return;
    else
        l_GuiService_0:BroadcastNotification("", v15.BACK_BUTTON_NOT_CONSUMED);
        return;
    end;
end;
v60.init = function(v65) --[[ Line: 179 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), l_AvatarScreen_0 (copy), l_GuiService_0 (copy), v25 (copy)
    local l_RobloxEventReceiver_0 = v65.props.RobloxEventReceiver;
    v65.getShouldBlockDeeplink = function() --[[ Line: 182 ]]
        -- upvalues: v65 (copy)
        return not (v65.props.getCanSeeChatTab and v65.props.getCanSeeChatTab());
    end;
    v65.tokens = {
        l_RobloxEventReceiver_0:observeEvent("Navigations", function(v67, v68) --[[ Line: 187 ]]
            -- upvalues: v17 (ref), v65 (copy), l_AvatarScreen_0 (ref)
            if v68 == "Destination" or v68 == "Reload" then
                if v67.appName == v17.ShareGameToChat then
                    v65.props.navigateDown({
                        name = v17.ShareGameToChat, 
                        detail = v67.parameters.placeId
                    });
                    return;
                elseif v67.appName == v17.Chat then
                    if v65.getShouldBlockDeeplink() then
                        return;
                    else
                        v65.props.setPage({
                            name = v17.Chat, 
                            detail = v67.parameters and v67.parameters.conversationId
                        });
                        return;
                    end;
                elseif v67.appName == l_AvatarScreen_0.AvatarEditor then
                    v65.props.resetNavigationHistory({
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
                    v65.props.setPage({
                        name = v17[v67.appName] or v17.None
                    });
                end;
            end;
        end), 
        l_GuiService_0.ShowLeaveConfirmation:Connect(function() --[[ Line: 219 ]]
            -- upvalues: v65 (copy)
            v65:handleBackButtonPressed();
        end), 
        l_RobloxEventReceiver_0:observeEvent("AppShellNotifications", function(v69, v70) --[[ Line: 223 ]]
            -- upvalues: v65 (copy)
            if v70 == "StartConversationWithUserId" then
                if v65.getShouldBlockDeeplink() then
                    return;
                else
                    v65.props.navigateIntoChat({
                        userId = v69
                    });
                    return;
                end;
            elseif v70 == "StartConversationWithId" then
                if v65.getShouldBlockDeeplink() then
                    return;
                else
                    v65.props.navigateIntoChat({
                        conversationId = v69
                    });
                    return;
                end;
            else
                if v70 == "Preloading" then
                    local v71 = v69 == "true";
                    v65.props.setPreloading(v71);
                end;
                return;
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("QrCodeScanResult", function(_, v73) --[[ Line: 245 ]]
            -- upvalues: v65 (copy), v25 (ref)
            if v73 == "Cancelled" then
                v65.props.navigateBack();
                return;
            else
                v65.props.navigateBack();
                v65.props.setCurrentToast({
                    toastMessage = "Feature.Toast.ScanQrCodeError.UnrecognizableQrCode", 
                    toastType = v25.NetworkingError
                });
                return;
            end;
        end)
    };
end;
v60.render = function(_) --[[ Line: 260 ]] --[[ Name: render ]]

end;
v60.willUnmount = function(v75) --[[ Line: 262 ]] --[[ Name: willUnmount ]]
    for _, v77 in pairs(v75.tokens) do
        v77:disconnect();
    end;
end;
v60 = v5.connect(function(v78, _) --[[ Line: 268 ]]
    return {
        currentRoute = v78.Navigation.history[#v78.Navigation.history], 
        centralOverlayType = v78.CentralOverlay.OverlayType, 
        centralOverlayDisableBackButtonClose = v78.CentralOverlay.Configs.DisableBackButtonClose
    };
end, function(v80) --[[ Line: 274 ]]
    -- upvalues: v19 (copy), v20 (copy), v21 (copy), v24 (copy), v23 (copy), v26 (copy), l_NavigateIntoChat_0 (copy), v27 (copy)
    return {
        setPage = function(v81) --[[ Line: 276 ]] --[[ Name: setPage ]]
            -- upvalues: v80 (copy), v19 (ref)
            return v80(v19({
                v81
            }, true));
        end, 
        navigateDown = function(v82) --[[ Line: 280 ]] --[[ Name: navigateDown ]]
            -- upvalues: v80 (copy), v20 (ref)
            return v80(v20(v82, true));
        end, 
        navigateBack = function() --[[ Line: 283 ]] --[[ Name: navigateBack ]]
            -- upvalues: v80 (copy), v21 (ref)
            return v80(v21(true));
        end, 
        closeCentralOverlay = function() --[[ Line: 286 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v80 (copy), v24 (ref)
            v80(v24());
        end, 
        resetNavigationHistory = function(v83) --[[ Line: 289 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v80 (copy), v23 (ref)
            return v80(v23(nil, v83));
        end, 
        setCurrentToast = function(v84) --[[ Line: 292 ]] --[[ Name: setCurrentToast ]]
            -- upvalues: v80 (copy), v26 (ref)
            v80(v26(v84));
        end, 
        navigateIntoChat = function(v85) --[[ Line: 295 ]] --[[ Name: navigateIntoChat ]]
            -- upvalues: v80 (copy), l_NavigateIntoChat_0 (ref)
            return v80(l_NavigateIntoChat_0(v85, false));
        end, 
        setPreloading = function(v86) --[[ Line: 298 ]] --[[ Name: setPreloading ]]
            -- upvalues: v80 (copy), v27 (ref)
            v80(v27(v86));
        end
    };
end)(v60);
v60 = l_UniversalAppPolicy_0.connect(function(v87) --[[ Line: 303 ]]
    return {
        getCanSeeChatTab = v87.getCanSeeChatTab
    };
end)(v60);
return function(v88) --[[ Line: 309 ]] --[[ Name: NavigationEventReceiverWrapper ]]
    -- upvalues: v59 (copy), v4 (copy), v60 (ref)
    v59();
    return v4.createElement(v60, v88);
end;