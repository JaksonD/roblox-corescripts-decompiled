local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.UIBlox);
local v5 = require(l_Parent_0.AdsDisplayOrder);
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local l_DefaultTwoStepReportFlow_0 = require(l_Parent_1.GenericAbuseReporting).UXFlows.DefaultTwoStepReportFlow;
local l_Players_0 = game:GetService("Players");
local l_ScreenshotManager_0 = require(l_Parent_1.Screenshot).ScreenshotManager;
local l_HttpService_0 = game:GetService("HttpService");
local l_getAppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).getAppFeaturePolicies;
local v15 = require(l_Parent_1.LoggingProtocol);
local l_default_0 = v15.default;
local v17 = require(l_Parent_0.ReportAdFooter);
local v18 = require(script.Parent.Flags);
local v19 = v18.GetEnableHideReportAdModalDuringScreenshot();
local l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 = require(l_Parent_1.SharedFlags).FFlagAddGenericIllegalReportingToTwoStepFlow;
local v21 = require(l_Parent_0.AdsInteractivityTelemetry);
local v22 = {
    {
        localizationKey = "CoreScripts.Ads.Label.InappropriateAd", 
        value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
    }
};
buildReport = function(v23, v24, v25, v26, v27) --[[ Line: 57 ]] --[[ Name: buildReport ]]
    -- upvalues: l_HttpService_0 (copy)
    local v28 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "in-experience"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v23)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v25
                    }
                }
            }, 
            PLACE_ID = {
                valueList = {
                    {
                        data = tostring(game.PlaceId)
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v26
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "ad"
                    }
                }
            }, 
            SCREENSHOT_ID = {
                valueList = {
                    {
                        data = v24
                    }
                }
            }, 
            IDENTIFIED_ADS = {
                valueList = {
                    {
                        data = v27
                    }
                }
            }
        }
    };
    return l_HttpService_0:JSONEncode(v28);
end;
ReportAdPopup = function(v29) --[[ Line: 112 ]] --[[ Name: ReportAdPopup ]]
    -- upvalues: l_HttpService_0 (copy), l_getAppFeaturePolicies_0 (copy), l_default_0 (copy), v15 (copy), v18 (copy), v2 (copy), v19 (copy), l_ScreenshotManager_0 (copy), l_Players_0 (copy), v21 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_AppStyleProvider_0 (copy), l_DefaultTwoStepReportFlow_0 (copy), v22 (copy), l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 (copy), v17 (copy), v5 (copy)
    local v30 = "";
    local v31 = {
        table.clone(v29.adInfo)
    };
    local v32 = l_HttpService_0:JSONEncode(v31);
    local v33 = true;
    local v34 = l_getAppFeaturePolicies_0();
    if v34 ~= nil then
        local v35 = v34.getShowIllegalContentReportingUI();
        local v36 = false;
        if v35 ~= nil then
            v36 = v35;
        end;
        v33 = v36;
    else
        l_default_0:logRobloxTelemetryEvent({
            eventName = "UniversalAppPolicyCallFailed", 
            backends = {
                v15.TelemetryBackends.Points
            }, 
            throttlingPercentage = v18.GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent(), 
            lastUpdated = {
                24, 
                8, 
                22
            }, 
            description = "Call to UniversalAppPolicy (GUAC) failed in Report Ad popup"
        }, nil, {
            assetId = v31[1].assetId, 
            encryptedAdTrackingData = v31[1].encryptedAdTrackingData, 
            encryptionMetadata = v31[1].encryptionMetadata
        });
    end;
    local v41 = v2.useCallback(function(v37, v38) --[[ Line: 143 ]]
        -- upvalues: v19 (ref), v29 (copy), l_ScreenshotManager_0 (ref), l_Players_0 (ref), v30 (ref), v32 (copy), v21 (ref)
        if v19 then
            v29.onClose();
        end;
        l_ScreenshotManager_0:TakeScreenshotWithCallback(function(v39) --[[ Line: 147 ]]
            -- upvalues: l_Players_0 (ref), v30 (ref), v37 (copy), v38 (copy), v32 (ref), v21 (ref)
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 ~= nil then
                v30 = buildReport(l_LocalPlayer_0.UserId, v39, v37, v38, v32);
                l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v30);
                v21.logReportAdEvent("submit");
            end;
        end, nil);
        if v19 and v29.onOpen then
            v29.onOpen();
        end;
        return true;
    end, {});
    local v42 = v3.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 20)
        }), 
        v3.createElement(l_AppStyleProvider_0, {
            style = {
                themeName = "Dark", 
                fontName = "Gotham"
            }
        }, {
            AbuseReportFlow = v3.createElement(l_DefaultTwoStepReportFlow_0, {
                analyticsContext = "Ad", 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = function() --[[ Line: 179 ]] --[[ Name: onAbandon ]]
                        -- upvalues: v21 (ref), v29 (copy)
                        v21.logReportAdEvent("close");
                        v29.onClose();
                    end
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v41
                }, 
                onComplete = v29.onClose, 
                reportCategories = v22, 
                reportCategoryDefaultKey = v22[1].value, 
                isReportCategoryReadonly = true, 
                localizationKeys = {
                    formTitle = "CoreScripts.Ads.Label.ReportAd", 
                    completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou", 
                    completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
                }, 
                scaleDialog = {
                    X = 0.8, 
                    Y = 1
                }, 
                footerContent = if l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 then nil else function() --[[ Line: 204 ]]
                    -- upvalues: v33 (ref), v3 (ref), v17 (ref), v31 (copy)
                    if v33 then
                        return v3.createElement(v17, {
                            assetId = v31[1].assetId
                        });
                    else
                        return nil;
                    end;
                end
            })
        })
    });
    return v3.createElement("ScreenGui", {
        ResetOnSpawn = false, 
        IgnoreGuiInset = true, 
        DisplayOrder = v5.Modal, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        Enabled = v29.showReportAdPopup
    }, v3.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        v3.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0.8, 0, 0.6, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            v42
        })
    }));
end;
return ReportAdPopup;