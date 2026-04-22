local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdGuiInteractivity");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.GenericAbuseReporting);
local v8 = require(l_Parent_0.LinkingProtocol);
local v9 = require(l_Parent_0.Foundation);
local v10 = require(l_Parent_0.Localization);
local v11 = require(l_Parent_0.UniversalAppPolicy);
local v12 = require(l_Parent_0.Http);
local v13 = require(l_Parent_0.RoactServices);
local v14 = require(l_Parent_0.RoactServiceTags);
local v15 = require(l_Parent_0.RobloxAppHooks);
local v16 = require(l_Parent_0.Screenshot);
local v17 = require(l_Parent_0.LoggingProtocol);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v19 = require(l_script_FirstAncestor_0.Flags);
local v20 = require(l_script_FirstAncestor_0.AdsInteractivityTelemetry);
local l_useRoactService_0 = v15.useRoactService;
local l_useAppPolicy_0 = v11.useAppPolicy;
local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
local l_Constants_0 = v6.App.Style.Constants;
local l_DefaultTwoStepReportFlow_0 = v7.UXFlows.DefaultTwoStepReportFlow;
local l_Button_0 = v9.Button;
local l_View_0 = v9.View;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_InputSize_0 = v9.Enums.InputSize;
local l_useLocalization_0 = v10.Hooks.useLocalization;
local l_default_0 = v8.LinkingProtocol.default;
local l_default_1 = v17.default;
local l_Url_0 = v12.Url;
local v34 = game:DefineFastFlag("AddImmersiveBrandedAdReportPlaceId", false);
local v35 = {
    {
        localizationKey = "CoreScripts.Ads.Label.InappropriateAd", 
        value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
    }
};
local v36 = l_UrlBuilder_0.new({
    base = l_Url_0.BASE_URL, 
    path = "illegal-content-reporting"
});
local v37 = l_UrlBuilder_0.new({
    base = l_Url_0.CREATOR_HUB_URL, 
    path = "store/asset/{assetId}"
});
local v38 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "abuse-reporting/v1/abuse-report"
});
local v39 = {
    eventName = "ReportImmersiveBrandedAdTotalCounter", 
    backends = {
        v17.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        11
    }, 
    description = "This event is fired when the user initiates submitting an immersive branded ad abuse report (before success or failure is known)."
};
local v40 = {
    eventName = "ReportImmersiveBrandedAdSuccessCounter", 
    backends = {
        v17.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        11
    }, 
    description = "This event is fired when an immersive branded ad abuse report is successfully submitted to the server."
};
local v41 = {
    eventName = "ReportImmersiveBrandedAdFailureCounter", 
    backends = {
        v17.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        11
    }, 
    description = "This event is fired when submitting an immersive branded ad abuse report fails."
};
local v42 = {
    eventName = "ReportImmersiveBrandedAdHttpFaulreEvent", 
    backends = {
        v17.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:DefineFastInt("ReportImmersiveBrandedAdHttpFaulreEventThrottleHundredthsPercent", 0), 
    lastUpdated = {
        26, 
        11, 
        3
    }, 
    description = "This event is fired when the HTTP request to submit an immersive branded ad abuse report fails."
};
local function _() --[[ Line: 97 ]] --[[ Name: logReportImmersiveBrandedAdTotalCounter ]]
    -- upvalues: l_default_1 (copy), v39 (copy)
    l_default_1:logRobloxTelemetryCounter(v39);
end;
local function _() --[[ Line: 101 ]] --[[ Name: logReportImmersiveBrandedAdSuccessCounter ]]
    -- upvalues: l_default_1 (copy), v40 (copy)
    l_default_1:logRobloxTelemetryCounter(v40);
end;
local function _(v45) --[[ Line: 105 ]] --[[ Name: logReportImmersiveBrandedAdFailureCounter ]]
    -- upvalues: l_default_1 (copy), v41 (copy)
    l_default_1:logRobloxTelemetryCounter(v41, 1, {
        reason = v45
    });
end;
local function v49(v47) --[[ Line: 111 ]] --[[ Name: logReportImmersiveBrandedAdHttpFailureEvent ]]
    -- upvalues: l_default_1 (copy), v42 (copy)
    local v48 = {};
    if type(v47) == "string" then
        v48.error = v47:sub(1, 500);
    elseif type(v47) == "table" then
        if v47.Body and type(v47.Body) == "string" then
            v48.body = v47.Body:sub(1, 500);
        end;
        if v47.StatusCode and type(v47.StatusCode) == "number" then
            v48.statusCode = tostring(v47.StatusCode);
        end;
    end;
    l_default_1:logRobloxTelemetryEvent(v42, nil, v48);
end;
local function v58(v50, v51) --[[ Line: 136 ]] --[[ Name: sendImmersiveBrandedAdAbuseReport ]]
    -- upvalues: v34 (copy), l_HttpService_0 (copy), l_default_1 (copy), v41 (copy), v38 (copy), v40 (copy), v49 (copy)
    local v52 = {
        abuseVector = "ad_v2", 
        targetType = "ad_v2", 
        category = v51.reason, 
        comment = v51.comment, 
        custom = {
            SCREENSHOT_ID = v51.screenshotId, 
            PLACE_ID = if v34 then v51.placeId else nil
        }, 
        submitterId = v51.userId, 
        targetIdStr = ("immersiveBrandedAd/%*"):format(v51.immersiveBrandedAdId)
    };
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 150 ]]
        -- upvalues: l_HttpService_0 (ref), v52 (copy)
        return l_HttpService_0:JSONEncode(v52);
    end);
    if not l_status_0 then
        l_default_1:logRobloxTelemetryCounter(v41, 1, {
            reason = "jsonEncode"
        });
        return false;
    else
        task.spawn(function() --[[ Line: 158 ]]
            -- upvalues: v38 (ref), v50 (copy), l_result_0 (copy), l_default_1 (ref), v40 (ref), v41 (ref), v49 (ref)
            local v55 = v38();
            v50(v55, "POST", {
                postBody = l_result_0
            }):andThen(function(_) --[[ Line: 160 ]]
                -- upvalues: l_default_1 (ref), v40 (ref)
                l_default_1:logRobloxTelemetryCounter(v40);
            end, function(v57) --[[ Line: 162 ]]
                -- upvalues: l_default_1 (ref), v41 (ref), v49 (ref)
                l_default_1:logRobloxTelemetryCounter(v41, 1, {
                    reason = "http"
                });
                v49(v57);
            end);
        end);
        return true;
    end;
end;
local function v78(v59) --[[ Line: 176 ]] --[[ Name: ImmersiveBrandedAdReportAdDialog ]]
    -- upvalues: l_useRoactService_0 (copy), v14 (copy), v5 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), v37 (copy), l_UrlBuilder_0 (copy), v36 (copy), v19 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy), l_default_0 (copy), v20 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_RunService_0 (copy), l_default_1 (copy), v39 (copy), v41 (copy), v58 (copy), v34 (copy), v16 (copy), l_DefaultTwoStepReportFlow_0 (copy), v35 (copy)
    local l_immersiveBrandedAdId_0 = v59.immersiveBrandedAdId;
    local v61 = l_useRoactService_0(v14.RoactNetworking);
    local v62 = v5.useRef(nil);
    local v63, v64 = v5.useState(false);
    local v65 = l_useLocalization_0({
        LinkText = "CoreScripts.Ads.Label.IllegalContentReportingLink"
    });
    local v67 = l_useAppPolicy_0(function(v66) --[[ Line: 186 ]]
        return v66.getShowIllegalContentReportingUI();
    end);
    local v71 = v5.useCallback(function() --[[ Line: 191 ]]
        -- upvalues: v37 (ref), l_immersiveBrandedAdId_0 (copy), l_UrlBuilder_0 (ref), v36 (ref), v19 (ref), l_BrowserService_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), v20 (ref), v59 (copy)
        local v68 = v37({
            assetId = l_immersiveBrandedAdId_0
        });
        local v69 = l_UrlBuilder_0.addQueryString(v36(), {
            contentURL = v68
        });
        if v19.FFlagUseWebviewsForImmersiveBrandedAdLinks then
            l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode({
                command = "open", 
                url = v69, 
                visible = true, 
                isGenericWebview = true
            }));
            return;
        elseif v19.FFlagSendImmersiveBrandedAdLinkingFailureTelemetry then
            l_default_0:openURL(v69):catch(function(_) --[[ Line: 205 ]]
                -- upvalues: v20 (ref), v59 (ref)
                v20.logImmersiveBrandedAdLinkingFailedCounter("reportAd.eudsaIllegalContent");
                v59.onDismiss();
            end);
            return;
        else
            l_default_0:openURL(v69);
            return;
        end;
    end, if v19.FFlagSendImmersiveBrandedAdLinkingFailureTelemetry then {
        l_immersiveBrandedAdId_0, 
        v59.onDismiss
    } else {
        l_immersiveBrandedAdId_0
    });
    local v72 = v5.useCallback(function() --[[ Line: 218 ]]
        -- upvalues: v5 (ref), l_View_0 (ref), l_Button_0 (ref), v65 (copy), l_ButtonVariant_0 (ref), v71 (copy), l_InputSize_0 (ref)
        return v5.createElement(l_View_0, {
            tag = "col margin-x-medium padding-top-medium size-full-0 auto-y"
        }, {
            linkButton = v5.createElement(l_Button_0, {
                text = v65.LinkText, 
                variant = l_ButtonVariant_0.Link, 
                onActivated = v71, 
                icon = "icons/navigation/externallink", 
                size = l_InputSize_0.Small
            })
        });
    end, {
        v71, 
        v65.LinkText
    });
    local v76 = v5.useCallback(function(v73, v74) --[[ Line: 232 ]]
        -- upvalues: l_RunService_0 (ref), l_default_1 (ref), v39 (ref), v41 (ref), v62 (copy), v58 (ref), v61 (copy), l_immersiveBrandedAdId_0 (copy), v34 (ref)
        if l_RunService_0:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
            return true;
        else
            l_default_1:logRobloxTelemetryCounter(v39);
            local l_LocalPlayer_0 = game.Players.LocalPlayer;
            if not l_LocalPlayer_0 then
                l_default_1:logRobloxTelemetryCounter(v41, 1, {
                    reason = "noPlayer"
                });
                return false;
            elseif not v62.current then
                l_default_1:logRobloxTelemetryCounter(v41, 1, {
                    reason = "noScreenshot"
                });
                return false;
            else
                return (v58(v61, {
                    reason = v73, 
                    comment = v74, 
                    immersiveBrandedAdId = l_immersiveBrandedAdId_0, 
                    screenshotId = v62.current, 
                    userId = l_LocalPlayer_0.UserId, 
                    placeId = if v34 then game.PlaceId else nil
                }));
            end;
        end;
    end, {
        l_immersiveBrandedAdId_0, 
        v61
    });
    v5.useEffect(function() --[[ Line: 261 ]]
        -- upvalues: l_RunService_0 (ref), v16 (ref), v62 (copy), v64 (copy)
        if not l_RunService_0:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
            v16.ScreenshotManager:TakeScreenshotWithCallback(function(v77) --[[ Line: 264 ]]
                -- upvalues: v62 (ref)
                v62.current = v77;
            end, nil);
        end;
        task.defer(function() --[[ Line: 270 ]]
            -- upvalues: v64 (ref)
            v64(true);
        end);
    end, {});
    if not v63 then
        return nil;
    else
        return v5.createElement(v5.Fragment, {}, {
            modal = v5.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 0), 
                Modal = true
            }), 
            abuseReportFlow = v5.createElement(l_DefaultTwoStepReportFlow_0, {
                analyticsContext = "Ad", 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = v59.onDismiss
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v76
                }, 
                onComplete = v59.onDismiss, 
                reportCategories = v35, 
                reportCategoryDefaultKey = v35[1].value, 
                isReportCategoryReadonly = true, 
                localizationKeys = {
                    formTitle = "CoreScripts.Ads.Label.ReportAd", 
                    completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou", 
                    completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
                }, 
                footerContent = if v67 then v72 else nil
            })
        });
    end;
end;
return function(v79) --[[ Line: 311 ]]
    -- upvalues: v5 (copy), v13 (copy), v14 (copy), v12 (copy), l_HttpService_0 (copy), v11 (copy), l_AppStyleProvider_0 (copy), l_Constants_0 (copy), v78 (copy)
    return v5.createElement(v13.RoactServices.ServiceProvider, {
        services = {
            [v14.RoactNetworking] = v12.NetworkLayers.requestInternalWrapper(l_HttpService_0)
        }
    }, {
        policyProvider = v5.createElement(v11.RoactAppPolicy.Provider, {
            policy = {
                v11.AppFeaturePolicies
            }
        }, {
            appStyleProvider = v5.createElement(l_AppStyleProvider_0, {
                style = {
                    themeName = l_Constants_0.ThemeName.Dark, 
                    fontName = l_Constants_0.FontName.Gotham
                }
            }, {
                resizeFrame = v5.createElement("Frame", {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromScale(1, 0.6), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    reportAdDialog = v5.createElement(v78, v79)
                })
            })
        })
    });
end;