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
local v34 = {
    {
        localizationKey = "CoreScripts.Ads.Label.InappropriateAd", 
        value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
    }
};
local v35 = l_UrlBuilder_0.new({
    base = l_Url_0.BASE_URL, 
    path = "illegal-content-reporting"
});
local v36 = l_UrlBuilder_0.new({
    base = l_Url_0.CREATOR_HUB_URL, 
    path = "store/asset/{assetId}"
});
local v37 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "abuse-reporting/v1/abuse-report"
});
local v38 = {
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
local v39 = {
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
local v40 = {
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
local v41 = {
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
local function _() --[[ Line: 95 ]] --[[ Name: logReportImmersiveBrandedAdTotalCounter ]]
    -- upvalues: l_default_1 (copy), v38 (copy)
    l_default_1:logRobloxTelemetryCounter(v38);
end;
local function _() --[[ Line: 99 ]] --[[ Name: logReportImmersiveBrandedAdSuccessCounter ]]
    -- upvalues: l_default_1 (copy), v39 (copy)
    l_default_1:logRobloxTelemetryCounter(v39);
end;
local function _(v44) --[[ Line: 103 ]] --[[ Name: logReportImmersiveBrandedAdFailureCounter ]]
    -- upvalues: l_default_1 (copy), v40 (copy)
    l_default_1:logRobloxTelemetryCounter(v40, 1, {
        reason = v44
    });
end;
local function v48(v46) --[[ Line: 109 ]] --[[ Name: logReportImmersiveBrandedAdHttpFailureEvent ]]
    -- upvalues: l_default_1 (copy), v41 (copy)
    local v47 = {};
    if type(v46) == "string" then
        v47.error = v46:sub(1, 500);
    elseif type(v46) == "table" then
        if v46.Body and type(v46.Body) == "string" then
            v47.body = v46.Body:sub(1, 500);
        end;
        if v46.StatusCode and type(v46.StatusCode) == "number" then
            v47.statusCode = tostring(v46.StatusCode);
        end;
    end;
    l_default_1:logRobloxTelemetryEvent(v41, nil, v47);
end;
local function v57(v49, v50) --[[ Line: 133 ]] --[[ Name: sendImmersiveBrandedAdAbuseReport ]]
    -- upvalues: l_HttpService_0 (copy), l_default_1 (copy), v40 (copy), v37 (copy), v39 (copy), v48 (copy)
    local v51 = {
        abuseVector = "ad_v2", 
        targetType = "ad_v2", 
        category = v50.reason, 
        comment = v50.comment, 
        custom = {
            SCREENSHOT_ID = v50.screenshotId
        }, 
        submitterId = v50.userId, 
        targetIdStr = ("immersiveBrandedAd/%*"):format(v50.immersiveBrandedAdId)
    };
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 146 ]]
        -- upvalues: l_HttpService_0 (ref), v51 (copy)
        return l_HttpService_0:JSONEncode(v51);
    end);
    if not l_status_0 then
        l_default_1:logRobloxTelemetryCounter(v40, 1, {
            reason = "jsonEncode"
        });
        return false;
    else
        task.spawn(function() --[[ Line: 154 ]]
            -- upvalues: v37 (ref), v49 (copy), l_result_0 (copy), l_default_1 (ref), v39 (ref), v40 (ref), v48 (ref)
            local v54 = v37();
            v49(v54, "POST", {
                postBody = l_result_0
            }):andThen(function(_) --[[ Line: 156 ]]
                -- upvalues: l_default_1 (ref), v39 (ref)
                l_default_1:logRobloxTelemetryCounter(v39);
            end, function(v56) --[[ Line: 158 ]]
                -- upvalues: l_default_1 (ref), v40 (ref), v48 (ref)
                l_default_1:logRobloxTelemetryCounter(v40, 1, {
                    reason = "http"
                });
                v48(v56);
            end);
        end);
        return true;
    end;
end;
local function v77(v58) --[[ Line: 172 ]] --[[ Name: ImmersiveBrandedAdReportAdDialog ]]
    -- upvalues: l_useRoactService_0 (copy), v14 (copy), v5 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), v36 (copy), l_UrlBuilder_0 (copy), v35 (copy), v19 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy), l_default_0 (copy), v20 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_RunService_0 (copy), l_default_1 (copy), v38 (copy), v40 (copy), v57 (copy), v16 (copy), l_DefaultTwoStepReportFlow_0 (copy), v34 (copy)
    local l_immersiveBrandedAdId_0 = v58.immersiveBrandedAdId;
    local v60 = l_useRoactService_0(v14.RoactNetworking);
    local v61 = v5.useRef(nil);
    local v62, v63 = v5.useState(false);
    local v64 = l_useLocalization_0({
        LinkText = "CoreScripts.Ads.Label.IllegalContentReportingLink"
    });
    local v66 = l_useAppPolicy_0(function(v65) --[[ Line: 182 ]]
        return v65.getShowIllegalContentReportingUI();
    end);
    local v70 = v5.useCallback(function() --[[ Line: 187 ]]
        -- upvalues: v36 (ref), l_immersiveBrandedAdId_0 (copy), l_UrlBuilder_0 (ref), v35 (ref), v19 (ref), l_BrowserService_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), v20 (ref), v58 (copy)
        local v67 = v36({
            assetId = l_immersiveBrandedAdId_0
        });
        local v68 = l_UrlBuilder_0.addQueryString(v35(), {
            contentURL = v67
        });
        if v19.FFlagUseWebviewsForImmersiveBrandedAdLinks then
            l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode({
                command = "open", 
                url = v68, 
                visible = true, 
                isGenericWebview = true
            }));
            return;
        elseif v19.FFlagSendImmersiveBrandedAdLinkingFailureTelemetry then
            l_default_0:openURL(v68):catch(function(_) --[[ Line: 201 ]]
                -- upvalues: v20 (ref), v58 (ref)
                v20.logImmersiveBrandedAdLinkingFailedCounter("reportAd.eudsaIllegalContent");
                v58.onDismiss();
            end);
            return;
        else
            l_default_0:openURL(v68);
            return;
        end;
    end, if v19.FFlagSendImmersiveBrandedAdLinkingFailureTelemetry then {
        l_immersiveBrandedAdId_0, 
        v58.onDismiss
    } else {
        l_immersiveBrandedAdId_0
    });
    local v71 = v5.useCallback(function() --[[ Line: 214 ]]
        -- upvalues: v5 (ref), l_View_0 (ref), l_Button_0 (ref), v64 (copy), l_ButtonVariant_0 (ref), v70 (copy), l_InputSize_0 (ref)
        return v5.createElement(l_View_0, {
            tag = "col margin-x-medium padding-top-medium size-full-0 auto-y"
        }, {
            linkButton = v5.createElement(l_Button_0, {
                text = v64.LinkText, 
                variant = l_ButtonVariant_0.Link, 
                onActivated = v70, 
                icon = "icons/navigation/externallink", 
                size = l_InputSize_0.Small
            })
        });
    end, {
        v70, 
        v64.LinkText
    });
    local v75 = v5.useCallback(function(v72, v73) --[[ Line: 228 ]]
        -- upvalues: l_RunService_0 (ref), l_default_1 (ref), v38 (ref), v40 (ref), v61 (copy), v57 (ref), v60 (copy), l_immersiveBrandedAdId_0 (copy)
        if l_RunService_0:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
            return true;
        else
            l_default_1:logRobloxTelemetryCounter(v38);
            local l_LocalPlayer_0 = game.Players.LocalPlayer;
            if not l_LocalPlayer_0 then
                l_default_1:logRobloxTelemetryCounter(v40, 1, {
                    reason = "noPlayer"
                });
                return false;
            elseif not v61.current then
                l_default_1:logRobloxTelemetryCounter(v40, 1, {
                    reason = "noScreenshot"
                });
                return false;
            else
                return (v57(v60, {
                    reason = v72, 
                    comment = v73, 
                    immersiveBrandedAdId = l_immersiveBrandedAdId_0, 
                    screenshotId = v61.current, 
                    userId = l_LocalPlayer_0.UserId
                }));
            end;
        end;
    end, {
        l_immersiveBrandedAdId_0, 
        v60
    });
    v5.useEffect(function() --[[ Line: 256 ]]
        -- upvalues: l_RunService_0 (ref), v16 (ref), v61 (copy), v63 (copy)
        if not l_RunService_0:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
            v16.ScreenshotManager:TakeScreenshotWithCallback(function(v76) --[[ Line: 259 ]]
                -- upvalues: v61 (ref)
                v61.current = v76;
            end, nil);
        end;
        task.defer(function() --[[ Line: 265 ]]
            -- upvalues: v63 (ref)
            v63(true);
        end);
    end, {});
    if not v62 then
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
                    onAbandon = v58.onDismiss
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v75
                }, 
                onComplete = v58.onDismiss, 
                reportCategories = v34, 
                reportCategoryDefaultKey = v34[1].value, 
                isReportCategoryReadonly = true, 
                localizationKeys = {
                    formTitle = "CoreScripts.Ads.Label.ReportAd", 
                    completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou", 
                    completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
                }, 
                footerContent = if v66 then v71 else nil
            })
        });
    end;
end;
return function(v78) --[[ Line: 306 ]]
    -- upvalues: v5 (copy), v13 (copy), v14 (copy), v12 (copy), l_HttpService_0 (copy), v11 (copy), l_AppStyleProvider_0 (copy), l_Constants_0 (copy), v77 (copy)
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
                    reportAdDialog = v5.createElement(v77, v78)
                })
            })
        })
    });
end;