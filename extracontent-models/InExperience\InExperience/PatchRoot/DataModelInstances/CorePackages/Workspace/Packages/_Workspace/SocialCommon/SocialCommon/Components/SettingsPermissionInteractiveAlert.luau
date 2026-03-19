local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v9 = require(l_Parent_0.LinkingProtocol);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v11 = require(l_Parent_0.SocialLuaAnalytics);
local v12 = require(l_Parent_0.Dash);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local l_default_0 = v9.LinkingProtocol.default;
local l_SettingsRoute_0 = v9.Enums.SettingsRoute;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_Images_0 = v4.App.ImageSet.Images;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_AnalyticsFactory_0 = v11.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v11.Analytics.DefaultAnalyticsService;
local l_EventTypes_0 = v11.Analytics.Enums.EventTypes;
local l_FFlagEnableRetryForLinkingProtocolFetch_0 = require(l_Parent_0.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch;
local l_FIntLinkingProtocolFetchRetries_0 = require(l_Parent_0.SharedFlags).FIntLinkingProtocolFetchRetries;
local l_FIntLinkingProtocolFetchTimeoutMS_0 = require(l_Parent_0.SharedFlags).FIntLinkingProtocolFetchTimeoutMS;
local l_FFlagQRInSearchScanner_0 = require(l_Parent_0.SharedFlags).FFlagQRInSearchScanner;
local v29 = require(l_Parent_0.SharedFlags).FFlagRegisterQRCodeKeyInEngine and "ProfileQrCodeCameraSettingsModalSeen" or "ScreenshotEventTracking";
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("Realtime", "appResume");
local v31 = {
    SettingsPermissionInteractiveAlertButtonClick = {
        context = "settingsPermissionInteractiveAlert", 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            settingsRoute = v12.identity, 
            btn = v12.identity
        }
    }, 
    SettingsPermissionInteractiveAlertImpression = {
        context = "settingsPermissionInteractiveAlert", 
        eventType = l_EventTypes_0.SettingsPermissionInteractiveAlertImpression, 
        formatRulesForAdditionalInfo = {
            settingsRoute = v12.identity, 
            settingsAppAvailable = v12.identity
        }
    }
};
local v32 = {
    [l_SettingsRoute_0.Camera] = l_PermissionsProtocol_0.Permissions.CAMERA_ACCESS, 
    [l_SettingsRoute_0.Contacts] = l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
};
return function(v33) --[[ Line: 86 ]] --[[ Name: SettingsPermissionInteractiveAlert ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_AnalyticsFactory_0 (copy), v31 (copy), l_DefaultAnalyticsService_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagEnableRetryForLinkingProtocolFetch_0 (copy), l_FIntLinkingProtocolFetchRetries_0 (copy), l_default_0 (copy), l_FIntLinkingProtocolFetchTimeoutMS_0 (copy), l_AppStorageService_0 (copy), v29 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), l_PermissionsProtocol_0 (copy), v32 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), l_SettingsRoute_0 (copy), l_Images_0 (copy), l_ButtonType_0 (copy), l_StyledTextLabel_0 (copy), l_Text_0 (copy), l_InteractiveAlert_0 (copy)
    local v34 = l_useScreenSize_0();
    local v35 = l_useDispatch_0();
    local v36 = l_useStyle_0();
    local v37 = v33.settingsRoute or v33.navigation and v33.navigation.getParam("settingsRoute");
    local v38 = v33.source or v33.navigation and v33.navigation.getParam("source");
    local v39 = v3.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v33 (copy), v35 (copy)
        if v33.closeCentralOverlayThunk then
            return (v35(v33.closeCentralOverlayThunk()));
        else
            return v33.navigation and v33.navigation.pop();
        end;
    end, l_dependencyArray_0(v35, v33.closeCentralOverlayThunk, v33.navigation));
    local v40 = v3.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: l_AnalyticsFactory_0 (ref), v31 (ref), l_DefaultAnalyticsService_0 (ref), l_FFlagQRInSearchScanner_0 (ref), v38 (copy)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v31
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream
            }, 
            staticInfoForAllEvents = if l_FFlagQRInSearchScanner_0 then {
                source = v38
            } else nil
        })();
    end);
    local v41 = false;
    local v42 = nil;
    local v43 = nil;
    if v43 == nil then
        if l_FFlagEnableRetryForLinkingProtocolFetch_0 then
            for _ = 0, l_FIntLinkingProtocolFetchRetries_0 do
                local v47 = task.spawn(function() --[[ Line: 132 ]]
                    -- upvalues: v41 (ref), v42 (ref), l_default_0 (ref), v37 (copy)
                    local v45, v46 = l_default_0:supportsSwitchToSettingsApp(v37):await();
                    v41 = v45;
                    v42 = v46;
                end);
                task.wait(l_FIntLinkingProtocolFetchTimeoutMS_0 / 1000);
                task.cancel(v47);
                if v42 ~= nil then
                    break;
                end;
            end;
        else
            local v48, v49 = l_default_0:supportsSwitchToSettingsApp(v37):await();
            v41 = v48;
            v42 = v49;
        end;
        v43 = v41 and v42;
    end;
    v3.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v40 (copy), v37 (copy), v43 (ref), l_AppStorageService_0 (ref), v29 (ref), l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_PermissionsProtocol_0 (ref), v32 (ref), v39 (copy)
        v40.fireAnalyticsEvent("SettingsPermissionInteractiveAlertImpression", {
            settingsRoute = v37, 
            settingsAppAvailable = v43
        });
        l_AppStorageService_0:SetItem(v29, "true");
        l_AppStorageService_0:Flush();
        local v51 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function() --[[ Line: 158 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), v32 (ref), v37 (ref), v39 (ref)
            l_PermissionsProtocol_0.default:hasPermissions({
                v32[v37]
            }):andThen(function(v50) --[[ Line: 163 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v39 (ref)
                if v50 and v50.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v39();
                end;
            end);
        end, false, true);
        return function() --[[ Line: 170 ]]
            -- upvalues: v51 (copy)
            v51:Disconnect();
        end;
    end, {});
    local v53 = l_useAppPolicy_0(function(v52) --[[ Line: 175 ]]
        return v52.getShouldShowSettingsPermissionsAdditionalInstructions();
    end);
    local v54 = l_useLocalization_0({
        notNow = "Feature.SettingsHub.Action.NotNow", 
        ok = "Feature.SettingsHub.Action.Ok", 
        openSettings = "Feature.SettingsHub.Action.OpenSettings", 
        titleCamera = "Feature.SettingsHub.Prompt.NeedCameraAccess", 
        titleContacts = "Feature.SettingsHub.Prompt.NeedContactsAccess", 
        bodyTextCamera = "Feature.SettingsHub.Description.QRCodeCameraPermissionIOS", 
        bodyTextContacts = "Feature.SettingsHub.Description.ContactsPermissionIOS", 
        additionalInstructionsContactsDeeplinkSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroid", 
        additionalInstructionsContactsDeeplinkNotSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroidDeeplinkNotSupported", 
        additionalInstructionsCameraDeeplinkSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroid", 
        additionalInstructionsCameraDeeplinkNotSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroidDeeplinkNotSupported"
    });
    local v55 = {
        [l_SettingsRoute_0.Camera] = l_Images_0["icons/controls/cameraOff"], 
        [l_SettingsRoute_0.Contacts] = l_Images_0["icons/menu/contacts_large"]
    };
    local v56 = {
        [l_SettingsRoute_0.Camera] = v54.titleCamera, 
        [l_SettingsRoute_0.Contacts] = v54.titleContacts
    };
    local v57 = {
        [l_SettingsRoute_0.Camera] = v54.bodyTextCamera, 
        [l_SettingsRoute_0.Contacts] = v54.bodyTextContacts
    };
    local v58 = "<b>" .. ({
        [l_SettingsRoute_0.Contacts] = {
            deepLinkSupported = v54.additionalInstructionsContactsDeeplinkSupported, 
            deepLinkNotSupported = v54.additionalInstructionsContactsDeeplinkNotSupported
        }, 
        [l_SettingsRoute_0.Camera] = {
            deepLinkSupported = v54.additionalInstructionsCameraDeeplinkSupported, 
            deepLinkNotSupported = v54.additionalInstructionsCameraDeeplinkNotSupported
        }
    })[v37][v43 and "deepLinkSupported" or "deepLinkNotSupported"] .. "</b>";
    local v59 = v3.useCallback(function() --[[ Line: 225 ]]
        -- upvalues: v40 (copy), v37 (copy), v39 (copy)
        v40.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", {
            settingsRoute = v37, 
            btn = "notNow"
        });
        return v39();
    end, {
        v33.navigation
    });
    local v60 = {
        buttonType = l_ButtonType_0.Secondary, 
        props = {
            onActivated = v59, 
            text = v54.notNow
        }
    };
    local v61 = v3.useCallback(function() --[[ Line: 240 ]]
        -- upvalues: v40 (copy), v37 (copy), v39 (copy)
        v40.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", {
            settingsRoute = v37, 
            btn = "ok"
        });
        return v39();
    end, {
        v33.navigation
    });
    local v62 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = v61, 
            text = v54.ok
        }
    };
    local v63 = v3.useCallback(function() --[[ Line: 255 ]]
        -- upvalues: v40 (copy), v37 (copy), l_default_0 (ref)
        v40.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", {
            settingsRoute = v37, 
            btn = "openSettings"
        });
        return l_default_0:switchToSettingsApp(v37);
    end, {
        v33.navigation
    });
    local v64 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = v63, 
            text = v54.openSettings
        }
    };
    local v65 = {
        buttons = if v43 then {
            v60, 
            v64
        } else {
            v62
        }
    };
    local v66 = v3.useCallback(function() --[[ Line: 275 ]]
        -- upvalues: v3 (ref), l_StyledTextLabel_0 (ref), v36 (copy), v57 (copy), v37 (copy), v53 (copy), l_Text_0 (ref), v58 (copy)
        return v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            DeepLinkInstructions = v3.createElement(l_StyledTextLabel_0, {
                automaticSize = Enum.AutomaticSize.Y, 
                fontStyle = v36.Font.Body, 
                colorStyle = v36.Theme.TextDefault, 
                size = UDim2.fromScale(1, 0), 
                text = v57[v37], 
                lineHeight = 1, 
                fluidSizing = false, 
                layoutOrder = 1
            }), 
            additionalInstructionsFrame = if v53 then v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_Text_0.GetTextHeight("", v36.Font.Body.Font, v36.Font.BaseSize * v36.Font.Body.RelativeSize)), 
                    PaddingLeft = UDim.new(0, 5)
                }), 
                AdditionalInstructions = v3.createElement(l_StyledTextLabel_0, {
                    automaticSize = Enum.AutomaticSize.Y, 
                    fontStyle = v36.Font.Body, 
                    colorStyle = v36.Theme.TextDefault, 
                    size = UDim2.fromScale(1, 0), 
                    text = v58, 
                    fluidSizing = false, 
                    lineHeight = 1
                })
            }) else nil
        });
    end, {
        v33.navigation
    });
    return v3.createElement(l_InteractiveAlert_0, {
        richText = true, 
        screenSize = v34, 
        title = v56[v37], 
        titleIcon = v55[v37], 
        middleContent = v66, 
        buttonStackInfo = v65
    });
end;