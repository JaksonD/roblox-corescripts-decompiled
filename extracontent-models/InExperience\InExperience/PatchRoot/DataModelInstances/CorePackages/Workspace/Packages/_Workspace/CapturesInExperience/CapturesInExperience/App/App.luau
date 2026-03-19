local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CaptureService_0 = game:GetService("CaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local v10 = require(l_Parent_1.AppCommonLib);
local v11 = require(l_Parent_1.CapturesCommon);
local v12 = require(l_Parent_1.Dash);
local v13 = require(l_Parent_1.React);
local v14 = require(l_Parent_1.Rodux);
local l_Signal_0 = v10.Signal;
local v16 = require(l_Parent_0.Analytics.AnalyticsService);
local v17 = require(l_Parent_0.Components.CaptureManager.CaptureManagerScreen);
local v18 = require(l_Parent_0.Components.CoreUI.CaptureOverlay);
local v19 = require(l_Parent_0.Actions.CapturesActivated);
local v20 = require(l_Parent_0.Actions.CapturesCoreGuiDisabled);
local v21 = require(l_Parent_0.Actions.CapturesCoreGuiEnabled);
local v22 = require(l_Parent_0.Components.CoreUI.CapturesCoreUI);
local v23 = require(l_Parent_0.Actions.CapturesDeactivated);
local v24 = require(l_Parent_0.Components.CaptureService.CaptureServicePrompts);
local v25 = require(l_Parent_0.Components.CoreUI.CapturesPage);
local v26 = require(l_Parent_0.App.CapturesPolicy);
local v27 = require(l_Parent_0.Components.CapturesCarousel.CarouselScreen);
local v28 = require(l_Parent_0.Constants);
local v29 = require(l_Parent_0.Analytics.EventNames);
local v30 = require(l_Parent_0.Utils.getLocalUserId);
local v31 = require(l_Parent_0.Utils.getUserIdsFromString);
local v32 = require(l_Parent_0.installReducer);
local v33 = require(l_Parent_0.Utils.makeCaptureSavedHandler);
local v34 = require(l_Parent_0.Utils.makeVideoCaptureInProgressHandler);
local v35 = require(l_Parent_0.Utils.makeWrapWithProviders);
local v36 = require(l_Parent_0.Actions.MenuClosed);
local v37 = require(l_Parent_0.Actions.MenuOpened);
local v38 = require(l_Parent_0.App.Networking);
local v39 = require(l_Parent_0.Utils.onToggleActivation);
local l_onViewportSizeChanged_0 = v11.Utils.onViewportSizeChanged;
local v41 = require(l_Parent_0.Thunks.RetrieveCaptures);
local v42 = require(l_Parent_0.installReducer.ScreenSize);
local v43 = require(l_Parent_0.Actions.ScreenSizeChanged);
local v44 = require(l_Parent_0.installReducer.ServerType);
local v45 = require(l_Parent_0.Actions.ServerTypeDetected);
local v46 = require(l_Parent_0.Analytics.setupFireEvent);
local v47 = require(l_Parent_0.Thunks.TakeCapture);
local _ = require(l_Parent_0.Types);
local v49 = require(l_Parent_0.Flags.FFlagCapturesVideoCaptureTriggerHandlerEnabled);
local v50 = require(l_Parent_0.Flags.FIntCapturesCoreGuiEventsPerMyriad);
return {
    createApp = function(v51) --[[ Line: 76 ]] --[[ Name: createApp ]]
        -- upvalues: v12 (copy), v16 (copy), l_AppStorageService_0 (copy), l_CaptureService_0 (copy), l_LocalizationService_0 (copy), l_NotificationService_0 (copy), l_Players_0 (copy), l_RbxAnalyticsService_0 (copy), l_RobloxReplicatedStorage_0 (copy), l_StarterGui_0 (copy), v46 (copy), v28 (copy), v30 (copy), v14 (copy), v32 (copy), v38 (copy), v42 (copy), v44 (copy), v41 (copy), v33 (copy), v49 (copy), v34 (copy), v31 (copy), v19 (copy), v23 (copy), v45 (copy), v36 (copy), v37 (copy), v47 (copy), v50 (copy), v29 (copy), v21 (copy), v20 (copy), l_Signal_0 (copy), l_onViewportSizeChanged_0 (copy), v43 (copy), v39 (copy), v35 (copy), v26 (copy), v13 (copy), v17 (copy), v18 (copy), v27 (copy), v24 (copy), v22 (copy), v25 (copy)
        local v52 = {};
        local v53 = v12.join({
            AnalyticsService = v16, 
            AppStorageService = l_AppStorageService_0, 
            CaptureService = l_CaptureService_0, 
            LocalizationService = l_LocalizationService_0, 
            NotificationService = l_NotificationService_0, 
            Players = l_Players_0, 
            RbxAnalyticsService = l_RbxAnalyticsService_0, 
            RobloxReplicatedStorage = l_RobloxReplicatedStorage_0, 
            StarterGui = l_StarterGui_0
        }, v51);
        local v54 = v46({
            analytics = v53.AnalyticsService, 
            infoForAllEvents = {
                isUnder13 = if v53.Players.LocalPlayer then v53.Players.LocalPlayer:GetUnder13() else nil, 
                pid = tostring(game.PlaceId), 
                source = v28.AnalyticsSource, 
                uid = v30(v53.Players), 
                universeId = tostring(game.GameId)
            }
        });
        local v55 = v14.combineReducers({
            [v28.RoduxKey] = v32(), 
            NetworkStatus = v38.RoduxNetworking.installReducer(), 
            ScreenSize = v42, 
            ServerType = v44, 
            ShareLinks = v38.ShareLinksRodux.installReducer()
        });
        v52._store = v14.Store.new(v55, {}, {
            v14.thunkMiddleware
        });
        v52._store:dispatch(v41());
        local v56 = v33(v52._store, v53, v54);
        v53.CaptureService.CaptureSavedInternal:Connect(v56);
        if v49 then
            local v57 = v34(v52._store, v53, v54);
            v53.CaptureService.VideoCaptureInProgress:Connect(v57);
        end;
        v53.AppStorageService:WhenLoaded(function() --[[ Line: 124 ]]
            -- upvalues: v53 (copy), v28 (ref), v31 (ref), v30 (ref), v52 (copy), v19 (ref), v23 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 125 ]]
                -- upvalues: v53 (ref), v28 (ref)
                return v53.AppStorageService:GetItem(v28.CapturesActiveLocalStorageKey);
            end);
            if l_status_0 and l_result_0 ~= "" then
                if v31(l_result_0)[v30(v53.Players) or ""] then
                    v52._store:dispatch(v19());
                    return;
                else
                    v52._store:dispatch(v23());
                end;
            end;
        end);
        task.spawn(function() --[[ Line: 140 ]]
            -- upvalues: v53 (copy), v52 (copy), v45 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 141 ]]
                -- upvalues: v53 (ref)
                return v53.RobloxReplicatedStorage:WaitForChild("GetServerType", 1e999):InvokeServer();
            end);
            if l_status_1 then
                v52._store:dispatch(v45(l_result_1));
            end;
        end);
        v52.closeMenu = function() --[[ Line: 150 ]]
            -- upvalues: v52 (copy), v36 (ref)
            v52._store:dispatch(v36());
        end;
        v52.openMenu = function() --[[ Line: 154 ]]
            -- upvalues: v52 (copy), v37 (ref)
            v52._store:dispatch(v37());
        end;
        v52.takeCapture = function() --[[ Line: 158 ]]
            -- upvalues: v52 (copy), v47 (ref)
            v52._store:dispatch(v47());
        end;
        local function v64(v62, v63) --[[ Line: 162 ]] --[[ Name: maybeSendCoreGuiEvent ]]
            -- upvalues: v50 (ref), v54 (copy), v29 (ref)
            if v50 == 0 then
                return;
            elseif Random.new():NextInteger(1, 10000) >= v50 then
                return;
            elseif v63 then
                v54(v29.CapturesCoreGuiEnabled, {
                    allTypeChanged = v62
                });
                return;
            else
                v54(v29.CapturesCoreGuiDisabled, {
                    allTypeChanged = v62
                });
                return;
            end;
        end;
        v53.StarterGui.CoreGuiChangedSignal:Connect(function(v65, v66) --[[ Line: 179 ]]
            -- upvalues: v64 (copy), v52 (copy), v21 (ref), v20 (ref)
            local v67 = true;
            if v65 ~= Enum.CoreGuiType.All then
                v67 = v65 == Enum.CoreGuiType.Captures;
            end;
            if not v67 then
                return;
            else
                local v68 = v65 == Enum.CoreGuiType.All;
                v64(v68, v66);
                if v66 then
                    v52._store:dispatch(v21());
                    return;
                else
                    v52._store:dispatch(v20());
                    return;
                end;
            end;
        end);
        if v53.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
            v52._store:dispatch(v21());
        else
            v52._store:dispatch(v20());
        end;
        v52.onIsActiveChanged = l_Signal_0.new();
        v52.getIsActive = function() --[[ Line: 203 ]]
            -- upvalues: v52 (copy), v28 (ref)
            return v52._store:getState()[v28.RoduxKey].IsActive or false;
        end;
        v52._store.changed:connect(function(v69, v70) --[[ Line: 207 ]]
            -- upvalues: v28 (ref), v53 (copy), v31 (ref), v30 (ref), v12 (ref), v52 (copy)
            local l_IsActive_0 = v70[v28.RoduxKey].IsActive;
            local l_IsActive_1 = v69[v28.RoduxKey].IsActive;
            if l_IsActive_1 ~= l_IsActive_0 then
                pcall(function() --[[ Line: 212 ]]
                    -- upvalues: v53 (ref), v28 (ref), v31 (ref), v30 (ref), l_IsActive_1 (copy), v12 (ref)
                    local l_Item_0 = v53.AppStorageService:GetItem(v28.CapturesActiveLocalStorageKey);
                    local v74 = v31(l_Item_0);
                    local v75 = v30(v53.Players) or "";
                    if l_IsActive_1 then
                        v74[v75] = true;
                    else
                        v74[v75] = nil;
                    end;
                    local v76 = table.concat(v12.keys(v74), ",");
                    v53.AppStorageService:SetItem(v28.CapturesActiveLocalStorageKey, v76);
                    v53.AppStorageService:Flush();
                end);
                v52.onIsActiveChanged:fire(l_IsActive_1);
            end;
        end);
        l_onViewportSizeChanged_0(function(v77) --[[ Line: 231 ]]
            -- upvalues: v52 (copy), v43 (ref)
            v52._store:dispatch(v43(v77));
        end);
        v52.onToggleActivationFromChrome = function(...) --[[ Line: 235 ]]
            -- upvalues: v52 (copy), v39 (ref), v54 (copy), v29 (ref)
            local function v78(...) --[[ Line: 236 ]]
                -- upvalues: v52 (ref)
                v52._store:dispatch(...);
            end;
            v39(v52.getIsActive(), nil, v54, v78, v29.CapturesActivatedChrome, v29.CapturesDeactivatedChrome);
        end;
        local v79 = v35(v52._store, v53);
        local v80 = v26.PolicyImplementation.read();
        local v81 = if v80 then v26.Mapper(v80).eligibleForCapturesFeature() else false;
        local v82 = if v80 then v26.Mapper(v80).enableCapturesBulkManagement() else false;
        local v83 = {
            fireAnalyticsEvent = v54
        };
        v52.mountCaptureManager = function(v84) --[[ Line: 264 ]]
            -- upvalues: v82 (copy), v81 (copy), v52 (copy), v79 (copy), v83 (copy), v13 (ref), v17 (ref)
            if not v82 then
                return;
            elseif not v81 then
                return;
            else
                v52._captureManagerHandle = v79(v84, v83, {
                    CaptureManager = v13.createElement(v17)
                });
                return;
            end;
        end;
        v52.mountCaptureOverlay = function(v85) --[[ Line: 276 ]]
            -- upvalues: v81 (copy), v13 (ref), v18 (ref), v52 (copy), v79 (copy), v83 (copy)
            if not v81 then
                return;
            else
                local v86 = {
                    CaptureOverlay = v13.createElement(v18)
                };
                v52._captureOverlayHandle = v79(v85, v83, v86);
                return;
            end;
        end;
        v52.mountCarousel = function(v87) --[[ Line: 288 ]]
            -- upvalues: v81 (copy), v13 (ref), v27 (ref), v52 (copy), v79 (copy), v83 (copy)
            if not v81 then
                return;
            else
                local v88 = {
                    CarouselScreen = v13.createElement(v27)
                };
                v52._carouselHandle = v79(v87, v83, v88);
                return;
            end;
        end;
        v52.mountCoreUI = function(v89, v90) --[[ Line: 300 ]]
            -- upvalues: v81 (copy), v54 (copy), v52 (copy), v79 (copy), v13 (ref), v24 (ref), v22 (ref)
            if not v81 then
                return;
            else
                local v91 = {
                    chromeEnabled = v90, 
                    fireAnalyticsEvent = v54
                };
                v52._coreUiHandle = v79(v89, v91, {
                    CaptureServicePrompts = v13.createElement(v24), 
                    CapturesCoreUI = v13.createElement(v22)
                }, "CapturesCoreUI");
                return;
            end;
        end;
        v52.mountMenuPage = function(v92, v93, v94) --[[ Line: 316 ]]
            -- upvalues: v81 (copy), v54 (copy), v52 (copy), v79 (copy), v13 (ref), v25 (ref)
            if not v81 then
                return;
            else
                local v95 = {
                    chromeEnabled = v94, 
                    fireAnalyticsEvent = v54
                };
                v52._menuPageHandle = v79(v92, v95, {
                    CapturesPage = v13.createElement(v25, {
                        closeSettingsMenu = v93
                    })
                });
                return;
            end;
        end;
        return v52;
    end
};