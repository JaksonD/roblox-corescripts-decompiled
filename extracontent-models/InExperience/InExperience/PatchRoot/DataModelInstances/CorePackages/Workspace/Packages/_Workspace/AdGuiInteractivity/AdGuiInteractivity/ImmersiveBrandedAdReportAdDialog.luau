local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("AdGuiInteractivity").Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.GenericAbuseReporting);
local v6 = require(l_Parent_0.LinkingProtocol);
local v7 = require(l_Parent_0.Foundation);
local v8 = require(l_Parent_0.Localization);
local v9 = require(l_Parent_0.UniversalAppPolicy);
local v10 = require(l_Parent_0.Http);
local v11 = require(l_Parent_0.RoactServices);
local v12 = require(l_Parent_0.RoactServiceTags);
local v13 = require(l_Parent_0.RobloxAppHooks);
local v14 = require(l_Parent_0.Screenshot);
local v15 = require(l_Parent_0.LoggingProtocol);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_useRoactService_0 = v13.useRoactService;
local l_useAppPolicy_0 = v9.useAppPolicy;
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local l_Constants_0 = v4.App.Style.Constants;
local l_DefaultTwoStepReportFlow_0 = v5.UXFlows.DefaultTwoStepReportFlow;
local l_Button_0 = v7.Button;
local l_View_0 = v7.View;
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_InputSize_0 = v7.Enums.InputSize;
local l_useLocalization_0 = v8.Hooks.useLocalization;
local l_default_0 = v6.LinkingProtocol.default;
local l_default_1 = v15.default;
local l_Url_0 = v10.Url;
local v30 = {
    {
        localizationKey = "CoreScripts.Ads.Label.InappropriateAd", 
        value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
    }
};
local v31 = l_UrlBuilder_0.new({
    base = l_Url_0.BASE_URL, 
    path = "illegal-content-reporting"
});
local v32 = l_UrlBuilder_0.new({
    base = l_Url_0.CREATOR_HUB_URL, 
    path = "store/asset/{assetId}"
});
local v33 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "abuse-reporting/v1/abuse-report"
});
local v34 = {
    eventName = "ReportImmersiveBrandedAdTotalCounter", 
    backends = {
        v15.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        11
    }, 
    description = "This event is fired when the user initiates submitting an immersive branded ad abuse report (before success or failure is known)."
};
local v35 = {
    eventName = "ReportImmersiveBrandedAdSuccessCounter", 
    backends = {
        v15.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        11
    }, 
    description = "This event is fired when an immersive branded ad abuse report is successfully submitted to the server."
};
local v36 = {
    eventName = "ReportImmersiveBrandedAdFailureCounter", 
    backends = {
        v15.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        11
    }, 
    description = "This event is fired when submitting an immersive branded ad abuse report fails."
};
local v37 = {
    eventName = "ReportImmersiveBrandedAdHttpFaulreEvent", 
    backends = {
        v15.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:DefineFastInt("ReportImmersiveBrandedAdHttpFaulreEventThrottleHundredthsPercent", 0), 
    lastUpdated = {
        26, 
        11, 
        3
    }, 
    description = "This event is fired when the HTTP request to submit an immersive branded ad abuse report fails."
};
local function _() --[[ Line: 91 ]] --[[ Name: logReportImmersiveBrandedAdTotalCounter ]]
    -- upvalues: l_default_1 (copy), v34 (copy)
    l_default_1:logRobloxTelemetryCounter(v34);
end;
local function _() --[[ Line: 95 ]] --[[ Name: logReportImmersiveBrandedAdSuccessCounter ]]
    -- upvalues: l_default_1 (copy), v35 (copy)
    l_default_1:logRobloxTelemetryCounter(v35);
end;
local function _(v40) --[[ Line: 99 ]] --[[ Name: logReportImmersiveBrandedAdFailureCounter ]]
    -- upvalues: l_default_1 (copy), v36 (copy)
    l_default_1:logRobloxTelemetryCounter(v36, 1, {
        reason = v40
    });
end;
local function v44(v42) --[[ Line: 105 ]] --[[ Name: logReportImmersiveBrandedAdHttpFailureEvent ]]
    -- upvalues: l_default_1 (copy), v37 (copy)
    local v43 = {};
    if type(v42) == "string" then
        v43.error = v42:sub(1, 500);
    elseif type(v42) == "table" then
        if v42.Body and type(v42.Body) == "string" then
            v43.body = v42.Body:sub(1, 500);
        end;
        if v42.StatusCode and type(v42.StatusCode) == "number" then
            v43.statusCode = tostring(v42.StatusCode);
        end;
    end;
    l_default_1:logRobloxTelemetryEvent(v37, nil, v43);
end;
local function v53(v45, v46) --[[ Line: 129 ]] --[[ Name: sendImmersiveBrandedAdAbuseReport ]]
    -- upvalues: l_HttpService_0 (copy), l_default_1 (copy), v36 (copy), v33 (copy), v35 (copy), v44 (copy)
    local v47 = {
        abuseVector = "ad_v2", 
        targetType = "ad_v2", 
        category = v46.reason, 
        comment = v46.comment, 
        custom = {
            SCREENSHOT_ID = v46.screenshotId
        }, 
        submitterId = v46.userId, 
        targetIdStr = ("immersiveBrandedAd/%*"):format(v46.immersiveBrandedAdId)
    };
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 142 ]]
        -- upvalues: l_HttpService_0 (ref), v47 (copy)
        return l_HttpService_0:JSONEncode(v47);
    end);
    if not l_status_0 then
        l_default_1:logRobloxTelemetryCounter(v36, 1, {
            reason = "jsonEncode"
        });
        return false;
    else
        task.spawn(function() --[[ Line: 150 ]]
            -- upvalues: v33 (ref), v45 (copy), l_result_0 (copy), l_default_1 (ref), v35 (ref), v36 (ref), v44 (ref)
            local v50 = v33();
            v45(v50, "POST", {
                postBody = l_result_0
            }):andThen(function(_) --[[ Line: 152 ]]
                -- upvalues: l_default_1 (ref), v35 (ref)
                l_default_1:logRobloxTelemetryCounter(v35);
            end, function(v52) --[[ Line: 154 ]]
                -- upvalues: l_default_1 (ref), v36 (ref), v44 (ref)
                l_default_1:logRobloxTelemetryCounter(v36, 1, {
                    reason = "http"
                });
                v44(v52);
            end);
        end);
        return true;
    end;
end;
local function v72(v54) --[[ Line: 168 ]] --[[ Name: ImmersiveBrandedAdReportAdDialog ]]
    -- upvalues: l_useRoactService_0 (copy), v12 (copy), v3 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), v32 (copy), l_UrlBuilder_0 (copy), v31 (copy), l_default_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_RunService_0 (copy), l_default_1 (copy), v34 (copy), v36 (copy), v53 (copy), v14 (copy), l_DefaultTwoStepReportFlow_0 (copy), v30 (copy)
    local l_immersiveBrandedAdId_0 = v54.immersiveBrandedAdId;
    local v56 = l_useRoactService_0(v12.RoactNetworking);
    local v57 = v3.useRef(nil);
    local v58, v59 = v3.useState(false);
    local v60 = l_useLocalization_0({
        LinkText = "CoreScripts.Ads.Label.IllegalContentReportingLink"
    });
    local v62 = l_useAppPolicy_0(function(v61) --[[ Line: 178 ]]
        return v61.getShowIllegalContentReportingUI();
    end);
    local v65 = v3.useCallback(function() --[[ Line: 182 ]]
        -- upvalues: v32 (ref), l_immersiveBrandedAdId_0 (copy), l_UrlBuilder_0 (ref), v31 (ref), l_default_0 (ref)
        local v63 = v32({
            assetId = l_immersiveBrandedAdId_0
        });
        local v64 = l_UrlBuilder_0.addQueryString(v31(), {
            contentURL = v63
        });
        l_default_0:openURL(v64);
    end, {
        l_immersiveBrandedAdId_0
    });
    local v66 = v3.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v3 (ref), l_View_0 (ref), l_Button_0 (ref), v60 (copy), l_ButtonVariant_0 (ref), v65 (copy), l_InputSize_0 (ref)
        return v3.createElement(l_View_0, {
            tag = "col margin-x-medium padding-top-medium size-full-0 auto-y"
        }, {
            linkButton = v3.createElement(l_Button_0, {
                text = v60.LinkText, 
                variant = l_ButtonVariant_0.Link, 
                onActivated = v65, 
                icon = "icons/navigation/externallink", 
                size = l_InputSize_0.Small
            })
        });
    end, {
        v65, 
        v60.LinkText
    });
    local v70 = v3.useCallback(function(v67, v68) --[[ Line: 204 ]]
        -- upvalues: l_RunService_0 (ref), l_default_1 (ref), v34 (ref), v36 (ref), v57 (copy), v53 (ref), v56 (copy), l_immersiveBrandedAdId_0 (copy)
        if l_RunService_0:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
            return true;
        else
            l_default_1:logRobloxTelemetryCounter(v34);
            local l_LocalPlayer_0 = game.Players.LocalPlayer;
            if not l_LocalPlayer_0 then
                l_default_1:logRobloxTelemetryCounter(v36, 1, {
                    reason = "noPlayer"
                });
                return false;
            elseif not v57.current then
                l_default_1:logRobloxTelemetryCounter(v36, 1, {
                    reason = "noScreenshot"
                });
                return false;
            else
                return (v53(v56, {
                    reason = v67, 
                    comment = v68, 
                    immersiveBrandedAdId = l_immersiveBrandedAdId_0, 
                    screenshotId = v57.current, 
                    userId = l_LocalPlayer_0.UserId
                }));
            end;
        end;
    end, {
        l_immersiveBrandedAdId_0, 
        v56
    });
    v3.useEffect(function() --[[ Line: 232 ]]
        -- upvalues: l_RunService_0 (ref), v14 (ref), v57 (copy), v59 (copy)
        if not l_RunService_0:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
            v14.ScreenshotManager:TakeScreenshotWithCallback(function(v71) --[[ Line: 235 ]]
                -- upvalues: v57 (ref)
                v57.current = v71;
            end, nil);
        end;
        task.defer(function() --[[ Line: 241 ]]
            -- upvalues: v59 (ref)
            v59(true);
        end);
    end, {});
    if not v58 then
        return nil;
    else
        return v3.createElement(v3.Fragment, {}, {
            modal = v3.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 0), 
                Modal = true
            }), 
            abuseReportFlow = v3.createElement(l_DefaultTwoStepReportFlow_0, {
                analyticsContext = "Ad", 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = v54.onDismiss
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v70
                }, 
                onComplete = v54.onDismiss, 
                reportCategories = v30, 
                reportCategoryDefaultKey = v30[1].value, 
                isReportCategoryReadonly = true, 
                localizationKeys = {
                    formTitle = "CoreScripts.Ads.Label.ReportAd", 
                    completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou", 
                    completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
                }, 
                footerContent = if v62 then v66 else nil
            })
        });
    end;
end;
return function(v73) --[[ Line: 282 ]]
    -- upvalues: v3 (copy), v11 (copy), v12 (copy), v10 (copy), l_HttpService_0 (copy), v9 (copy), l_AppStyleProvider_0 (copy), l_Constants_0 (copy), v72 (copy)
    return v3.createElement(v11.RoactServices.ServiceProvider, {
        services = {
            [v12.RoactNetworking] = v10.NetworkLayers.requestInternalWrapper(l_HttpService_0)
        }
    }, {
        policyProvider = v3.createElement(v9.RoactAppPolicy.Provider, {
            policy = {
                v9.AppFeaturePolicies
            }
        }, {
            appStyleProvider = v3.createElement(l_AppStyleProvider_0, {
                style = {
                    themeName = l_Constants_0.ThemeName.Dark, 
                    fontName = l_Constants_0.FontName.Gotham
                }
            }, {
                resizeFrame = v3.createElement("Frame", {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromScale(1, 0.6), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    reportAdDialog = v3.createElement(v72, v73)
                })
            })
        })
    });
end;