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
local l_FFlagRegisterQRCodeKeyInEngine_0 = require(l_Parent_0.SharedFlags).FFlagRegisterQRCodeKeyInEngine;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v31 = l_FFlagRegisterQRCodeKeyInEngine_0 and "ProfileQrCodeCameraSettingsModalSeen" or "ScreenshotEventTracking";
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("Realtime", "appResume");
local v33 = {
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
local v34 = {
    [l_SettingsRoute_0.Camera] = l_PermissionsProtocol_0.Permissions.CAMERA_ACCESS, 
    [l_SettingsRoute_0.Contacts] = l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
};
return function(v35) --[[ Line: 88 ]] --[[ Name: SettingsPermissionInteractiveAlert ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_AnalyticsFactory_0 (copy), v33 (copy), l_DefaultAnalyticsService_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagEnableRetryForLinkingProtocolFetch_0 (copy), l_FIntLinkingProtocolFetchRetries_0 (copy), l_default_0 (copy), l_FIntLinkingProtocolFetchTimeoutMS_0 (copy), l_AppStorageService_0 (copy), v31 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), l_PermissionsProtocol_0 (copy), v34 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), l_SettingsRoute_0 (copy), l_Images_0 (copy), l_ButtonType_0 (copy), l_StyledTextLabel_0 (copy), l_Text_0 (copy), l_InteractiveAlert_0 (copy)
    local v36 = l_useScreenSize_0();
    local v37 = l_useDispatch_0();
    local v38 = l_useStyle_0();
    local v39 = v35.settingsRoute or v35.navigation and v35.navigation.getParam("settingsRoute");
    local v40 = v35.source or v35.navigation and v35.navigation.getParam("source");
    local v41 = v3.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v35 (copy), v37 (copy)
        if v35.closeCentralOverlayThunk then
            return (v37(v35.closeCentralOverlayThunk()));
        else
            return v35.navigation and v35.navigation.pop();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37, 
        v35.closeCentralOverlayThunk, 
        v35.navigation
    } else l_dependencyArray_0(v37, v35.closeCentralOverlayThunk, v35.navigation));
    local v42 = v3.useMemo(function() --[[ Line: 109 ]]
        -- upvalues: l_AnalyticsFactory_0 (ref), v33 (ref), l_DefaultAnalyticsService_0 (ref), l_FFlagQRInSearchScanner_0 (ref), v40 (copy)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v33
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream
            }, 
            staticInfoForAllEvents = if l_FFlagQRInSearchScanner_0 then {
                source = v40
            } else nil
        })();
    end);
    local v43 = false;
    local v44 = nil;
    local v45 = nil;
    if v45 == nil then
        if l_FFlagEnableRetryForLinkingProtocolFetch_0 then
            for _ = 0, l_FIntLinkingProtocolFetchRetries_0 do
                local v49 = task.spawn(function() --[[ Line: 139 ]]
                    -- upvalues: v43 (ref), v44 (ref), l_default_0 (ref), v39 (copy)
                    local v47, v48 = l_default_0:supportsSwitchToSettingsApp(v39):await();
                    v43 = v47;
                    v44 = v48;
                end);
                task.wait(l_FIntLinkingProtocolFetchTimeoutMS_0 / 1000);
                task.cancel(v49);
                if v44 ~= nil then
                    break;
                end;
            end;
        else
            local v50, v51 = l_default_0:supportsSwitchToSettingsApp(v39):await();
            v43 = v50;
            v44 = v51;
        end;
        v45 = v43 and v44;
    end;
    v3.useEffect(function() --[[ Line: 156 ]]
        -- upvalues: v42 (copy), v39 (copy), v45 (ref), l_AppStorageService_0 (ref), v31 (ref), l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_PermissionsProtocol_0 (ref), v34 (ref), v41 (copy)
        v42.fireAnalyticsEvent("SettingsPermissionInteractiveAlertImpression", {
            settingsRoute = v39, 
            settingsAppAvailable = v45
        });
        l_AppStorageService_0:SetItem(v31, "true");
        l_AppStorageService_0:Flush();
        local v53 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function() --[[ Line: 165 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), v34 (ref), v39 (ref), v41 (ref)
            l_PermissionsProtocol_0.default:hasPermissions({
                v34[v39]
            }):andThen(function(v52) --[[ Line: 170 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v41 (ref)
                if v52 and v52.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v41();
                end;
            end);
        end, false, true);
        return function() --[[ Line: 177 ]]
            -- upvalues: v53 (copy)
            v53:Disconnect();
        end;
    end, {});
    local v55 = l_useAppPolicy_0(function(v54) --[[ Line: 182 ]]
        return v54.getShouldShowSettingsPermissionsAdditionalInstructions();
    end);
    local v56 = l_useLocalization_0({
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
    local v57 = {
        [l_SettingsRoute_0.Camera] = l_Images_0["icons/controls/cameraOff"], 
        [l_SettingsRoute_0.Contacts] = l_Images_0["icons/menu/contacts_large"]
    };
    local v58 = {
        [l_SettingsRoute_0.Camera] = v56.titleCamera, 
        [l_SettingsRoute_0.Contacts] = v56.titleContacts
    };
    local v59 = {
        [l_SettingsRoute_0.Camera] = v56.bodyTextCamera, 
        [l_SettingsRoute_0.Contacts] = v56.bodyTextContacts
    };
    local v60 = "<b>" .. ({
        [l_SettingsRoute_0.Contacts] = {
            deepLinkSupported = v56.additionalInstructionsContactsDeeplinkSupported, 
            deepLinkNotSupported = v56.additionalInstructionsContactsDeeplinkNotSupported
        }, 
        [l_SettingsRoute_0.Camera] = {
            deepLinkSupported = v56.additionalInstructionsCameraDeeplinkSupported, 
            deepLinkNotSupported = v56.additionalInstructionsCameraDeeplinkNotSupported
        }
    })[v39][v45 and "deepLinkSupported" or "deepLinkNotSupported"] .. "</b>";
    local v61 = v3.useCallback(function() --[[ Line: 232 ]]
        -- upvalues: v42 (copy), v39 (copy), v41 (copy)
        v42.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", {
            settingsRoute = v39, 
            btn = "notNow"
        });
        return v41();
    end, {
        v35.navigation
    });
    local v62 = {
        buttonType = l_ButtonType_0.Secondary, 
        props = {
            onActivated = v61, 
            text = v56.notNow
        }
    };
    local v63 = v3.useCallback(function() --[[ Line: 247 ]]
        -- upvalues: v42 (copy), v39 (copy), v41 (copy)
        v42.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", {
            settingsRoute = v39, 
            btn = "ok"
        });
        return v41();
    end, {
        v35.navigation
    });
    local v64 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = v63, 
            text = v56.ok
        }
    };
    local v65 = v3.useCallback(function() --[[ Line: 262 ]]
        -- upvalues: v42 (copy), v39 (copy), l_default_0 (ref)
        v42.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", {
            settingsRoute = v39, 
            btn = "openSettings"
        });
        return l_default_0:switchToSettingsApp(v39);
    end, {
        v35.navigation
    });
    local v66 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = v65, 
            text = v56.openSettings
        }
    };
    local v67 = {
        buttons = if v45 then {
            v62, 
            v66
        } else {
            v64
        }
    };
    local v68 = v3.useCallback(function() --[[ Line: 282 ]]
        -- upvalues: v3 (ref), l_StyledTextLabel_0 (ref), v38 (copy), v59 (copy), v39 (copy), v55 (copy), l_Text_0 (ref), v60 (copy)
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
                fontStyle = v38.Font.Body, 
                colorStyle = v38.Theme.TextDefault, 
                size = UDim2.fromScale(1, 0), 
                text = v59[v39], 
                lineHeight = 1, 
                fluidSizing = false, 
                layoutOrder = 1
            }), 
            additionalInstructionsFrame = if v55 then v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_Text_0.GetTextHeight("", v38.Font.Body.Font, v38.Font.BaseSize * v38.Font.Body.RelativeSize)), 
                    PaddingLeft = UDim.new(0, 5)
                }), 
                AdditionalInstructions = v3.createElement(l_StyledTextLabel_0, {
                    automaticSize = Enum.AutomaticSize.Y, 
                    fontStyle = v38.Font.Body, 
                    colorStyle = v38.Theme.TextDefault, 
                    size = UDim2.fromScale(1, 0), 
                    text = v60, 
                    fluidSizing = false, 
                    lineHeight = 1
                })
            }) else nil
        });
    end, {
        v35.navigation
    });
    return v3.createElement(l_InteractiveAlert_0, {
        richText = true, 
        screenSize = v36, 
        title = v58[v39], 
        titleIcon = v57[v39], 
        middleContent = v68, 
        buttonStackInfo = v67
    });
end;