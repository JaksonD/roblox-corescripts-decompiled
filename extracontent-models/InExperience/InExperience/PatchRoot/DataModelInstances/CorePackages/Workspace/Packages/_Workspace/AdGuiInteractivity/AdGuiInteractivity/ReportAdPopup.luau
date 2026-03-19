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
local v20 = require(l_Parent_0.AdsInteractivityTelemetry);
local v21 = {
    {
        localizationKey = "CoreScripts.Ads.Label.InappropriateAd", 
        value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
    }
};
buildReport = function(v22, v23, v24, v25, v26) --[[ Line: 55 ]] --[[ Name: buildReport ]]
    -- upvalues: l_HttpService_0 (copy)
    local v27 = {
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
                        data = tostring(v22)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v24
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
                        data = v25
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
                        data = v23
                    }
                }
            }, 
            IDENTIFIED_ADS = {
                valueList = {
                    {
                        data = v26
                    }
                }
            }
        }
    };
    return l_HttpService_0:JSONEncode(v27);
end;
ReportAdPopup = function(v28) --[[ Line: 110 ]] --[[ Name: ReportAdPopup ]]
    -- upvalues: l_HttpService_0 (copy), l_getAppFeaturePolicies_0 (copy), l_default_0 (copy), v15 (copy), v18 (copy), v2 (copy), v19 (copy), l_ScreenshotManager_0 (copy), l_Players_0 (copy), v20 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_AppStyleProvider_0 (copy), l_DefaultTwoStepReportFlow_0 (copy), v21 (copy), v17 (copy), v5 (copy)
    local v29 = "";
    local v30 = {
        table.clone(v28.adInfo)
    };
    local v31 = l_HttpService_0:JSONEncode(v30);
    local v32 = true;
    local v33 = l_getAppFeaturePolicies_0();
    if v33 ~= nil then
        local v34 = v33.getShowIllegalContentReportingUI();
        local v35 = false;
        if v34 ~= nil then
            v35 = v34;
        end;
        v32 = v35;
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
            assetId = v30[1].assetId, 
            encryptedAdTrackingData = v30[1].encryptedAdTrackingData, 
            encryptionMetadata = v30[1].encryptionMetadata
        });
    end;
    local v40 = v2.useCallback(function(v36, v37) --[[ Line: 140 ]]
        -- upvalues: v19 (ref), v28 (copy), l_ScreenshotManager_0 (ref), l_Players_0 (ref), v29 (ref), v31 (copy), v20 (ref)
        if v19 then
            v28.onClose();
        end;
        l_ScreenshotManager_0:TakeScreenshotWithCallback(function(v38) --[[ Line: 144 ]]
            -- upvalues: l_Players_0 (ref), v29 (ref), v36 (copy), v37 (copy), v31 (ref), v20 (ref)
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 ~= nil then
                v29 = buildReport(l_LocalPlayer_0.UserId, v38, v36, v37, v31);
                l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v29);
                v20.logReportAdEvent("submit");
            end;
        end, nil);
        if v19 and v28.onOpen then
            v28.onOpen();
        end;
        return true;
    end, {});
    local v41 = v3.createElement(l_LocalizationProvider_0, {
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
                    onAbandon = function() --[[ Line: 176 ]] --[[ Name: onAbandon ]]
                        -- upvalues: v20 (ref), v28 (copy)
                        v20.logReportAdEvent("close");
                        v28.onClose();
                    end
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v40
                }, 
                onComplete = v28.onClose, 
                reportCategories = v21, 
                reportCategoryDefaultKey = v21[1].value, 
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
                footerContent = function() --[[ Line: 199 ]] --[[ Name: footerContent ]]
                    -- upvalues: v32 (ref), v3 (ref), v17 (ref), v30 (copy)
                    if v32 then
                        return v3.createElement(v17, {
                            assetId = v30[1].assetId
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
        Enabled = v28.showReportAdPopup
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
            v41
        })
    }));
end;
return ReportAdPopup;