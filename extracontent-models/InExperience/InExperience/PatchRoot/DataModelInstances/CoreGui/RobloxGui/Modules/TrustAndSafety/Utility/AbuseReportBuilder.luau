local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification);
local v2 = require(l_CorePackages_0.Workspace.Packages.TnSAdIdentification);
local l_HttpService_0 = game:GetService("HttpService");
local l_getAvatarsForPoint_0 = v1.AvatarIdentification.getAvatarsForPoint;
local l_getAvatarsForRegion_0 = v1.AvatarIdentification.getAvatarsForRegion;
local l_getAdsForPoint_0 = v2.AdIdentification.getAdsForPoint;
local l_GetFFlagReportAnythingEnableAdReport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport;
local l_GetFFlagGetHumanoidDescription_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription;
local l_GetFFlagRAEnableCircleRegion_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion;
local l_getHumanoidDescription_0 = require(script.Parent.GetHumanoidDescription).getHumanoidDescription;
local v11 = {
    annotationCircleRadius = 0, 
    screenSizeWidth = 0, 
    screenSizeHeight = 0, 
    screenshotId = "", 
    identifiedAvatars = {}, 
    avatarIDStats = nil, 
    identifiedAds = {}, 
    adIDStats = nil, 
    screenshotContentId = "", 
    annotationPoints = {}, 
    annotationOptionSeen = false, 
    annotationPageSeen = false, 
    selectedAbusers = {}, 
    selectedAds = {}
};
local v12 = {
    Variant = {
        CS = "ra/cs", 
        Sampling = "ra/sampling", 
        E1 = "ra/e1", 
        E2 = "ra/e2", 
        E3 = "ra/e3", 
        Unknown = "ra/unknown"
    }
};
local function v17(v13) --[[ Line: 121 ]]
    local v14 = {};
    for _, v16 in ipairs(v13) do
        v14[#v14 + 1] = {
            v16.X, 
            v16.Y
        };
    end;
    return v14;
end;
local function v22(v18) --[[ Line: 129 ]]
    local v19 = {};
    for _, v21 in pairs(v18) do
        v19[#v19 + 1] = {
            assetId = v21.assetId, 
            distance = v21.distance, 
            boundingBox = {
                minX = v21.boundingBox.min.X, 
                minY = v21.boundingBox.min.Y, 
                maxX = v21.boundingBox.max.X, 
                maxY = v21.boundingBox.max.Y
            }, 
            adUnitName = v21.adUnitName, 
            encryptedAdTrackingData = v21.encryptedAdTrackingData, 
            encryptionMetadata = v21.encryptionMetadata
        };
    end;
    return v19;
end;
local function v27(v23) --[[ Line: 150 ]]
    -- upvalues: v17 (copy)
    local v24 = {};
    for v25, v26 in pairs(v23) do
        v24[#v24 + 1] = {
            userId = tostring(v25), 
            distance = v26.distance, 
            boundingBox = {
                minX = v26.boundingBox.min.X, 
                minY = v26.boundingBox.min.Y, 
                maxX = v26.boundingBox.max.X, 
                maxY = v26.boundingBox.max.Y
            }, 
            hitRate = v26.hitRate, 
            convexHull = v17(v26.convexHull)
        };
        if v26.pointProcessingStats ~= nil then
            v24[#v24].pointProcessingStats = {
                v26.pointProcessingStats.wasSkipped and 1 or 0, 
                v26.pointProcessingStats.total, 
                v26.pointProcessingStats.offScreenDiscardCount, 
                v26.pointProcessingStats.tooCloseDiscardCount
            };
        end;
    end;
    return v24;
end;
local function v35(v28) --[[ Line: 181 ]]
    -- upvalues: v11 (ref), l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_HttpService_0 (copy), v27 (copy), v22 (copy), v17 (copy)
    local v29 = false;
    for _, _ in pairs(v11.identifiedAvatars) do
        v29 = true;
        break;
    end;
    local v32 = false;
    if l_GetFFlagReportAnythingEnableAdReport_0() then
        for _, _ in pairs(v11.identifiedAds) do
            v32 = true;
            break;
        end;
    end;
    if v29 then
        v28.tags.IDENTIFIED_AVATARS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v27(v11.identifiedAvatars)))
                }
            }
        };
    end;
    if v11.avatarIDStats then
        v28.tags.AVATAR_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v11.avatarIDStats)
                }
            }
        };
    end;
    if v32 and l_GetFFlagReportAnythingEnableAdReport_0() then
        v28.tags.IDENTIFIED_ADS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v22(v11.identifiedAds)))
                }
            }
        };
    end;
    if v11.adIDStats and l_GetFFlagReportAnythingEnableAdReport_0() then
        v28.tags.AD_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v11.adIDStats)
                }
            }
        };
    end;
    if #v11.screenshotId > 0 then
        v28.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v11.screenshotId
                }
            }
        };
    end;
    if #v11.annotationPoints > 0 then
        v28.tags.RA_ANNOTATION_POINTS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v17(v11.annotationPoints)))
                }
            }
        };
    end;
    v28.tags.RA_ANNOTATION_OPTION_SEEN = {
        valueList = {
            {
                data = tostring(v11.annotationOptionSeen)
            }
        }
    };
    v28.tags.RA_ANNOTATION_PAGE_SEEN = {
        valueList = {
            {
                data = tostring(v11.annotationPageSeen)
            }
        }
    };
end;
local function v38(v36) --[[ Line: 270 ]]
    -- upvalues: v12 (copy), v35 (copy), v11 (ref), l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_HttpService_0 (copy), v22 (copy)
    local v37 = {
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
                        data = tostring(v36.localUserId)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v36.abuseReason
                    }
                }
            }, 
            PLACE_ID = {
                valueList = {
                    {
                        data = tostring(v36.placeId)
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v36.abuseComment
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "place"
                    }
                }
            }, 
            IN_EXP_MENU_ENTRY_POINT = {
                valueList = {
                    {
                        data = v36.menuEntryPoint
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v36.variant or v12.Variant.CS
                    }
                }
            }
        }
    };
    v35(v37);
    if #v11.selectedAds > 0 and l_GetFFlagReportAnythingEnableAdReport_0() then
        v37.tags.REPORT_TARGET_ADS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v22(v11.selectedAds)))
                }
            }
        };
    end;
    return l_HttpService_0:JSONEncode(v37);
end;
local function v54(v39) --[[ Line: 343 ]]
    -- upvalues: v12 (copy), v35 (copy), v11 (ref), l_GetFFlagGetHumanoidDescription_0 (copy), l_getHumanoidDescription_0 (copy), l_HttpService_0 (copy)
    local v40 = {
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
                        data = tostring(v39.localUserId)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v39.abuseReason
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v39.abuseComment
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "avatar"
                    }
                }
            }, 
            IN_EXP_MENU_ENTRY_POINT = {
                valueList = {
                    {
                        data = v39.menuEntryPoint
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v39.variant or v12.Variant.Unknown
                    }
                }
            }
        }
    };
    v35(v40);
    if #v11.selectedAbusers > 0 then
        local v41 = tostring(v11.selectedAbusers[1].UserId);
        local v42 = {};
        for _, v44 in ipairs(v11.selectedAbusers) do
            v42[#v42 + 1] = tostring(v44.UserId);
        end;
        if l_GetFFlagGetHumanoidDescription_0() then
            local v45, v46 = l_getHumanoidDescription_0(v11.selectedAbusers[1].UserId);
            v40.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v45)
                    }
                }
            };
            v40.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                valueList = {
                    {
                        data = v46
                    }
                }
            };
            local v47 = {};
            for _, v49 in ipairs(v11.selectedAbusers) do
                local v50, v51 = l_getHumanoidDescription_0(v49.UserId);
                v47[#v47 + 1] = {
                    humanoidDescription = v50, 
                    outputMessage = v51
                };
            end;
            v40.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v47)
                    }
                }
            };
        end;
        v40.tags.REPORT_TARGET_USER_ID = {
            valueList = {
                {
                    data = tostring(v41)
                }
            }
        };
        v40.tags.RA_ALL_ANNOTATED_USER_IDS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v42)
                }
            }
        };
    elseif v39.formSelectedAbuserUserId then
        if l_GetFFlagGetHumanoidDescription_0() then
            local v52, v53 = l_getHumanoidDescription_0(v39.formSelectedAbuserUserId);
            v40.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v52)
                    }
                }
            };
            v40.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                valueList = {
                    {
                        data = v53
                    }
                }
            };
        end;
        v40.tags.REPORT_TARGET_USER_ID = {
            valueList = {
                {
                    data = tostring(v39.formSelectedAbuserUserId)
                }
            }
        };
    end;
    return l_HttpService_0:JSONEncode(v40);
end;
local function v72() --[[ Line: 470 ]]
    -- upvalues: v11 (ref), l_GetFFlagRAEnableCircleRegion_0 (copy), l_getAvatarsForRegion_0 (copy), l_getAvatarsForPoint_0 (copy), l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_getAdsForPoint_0 (copy)
    local v55 = {};
    local v56 = {};
    local v57 = {};
    local v58 = {};
    for _, v60 in ipairs(v11.annotationPoints) do
        local v61 = 1e999;
        local v62 = nil;
        local v63 = {};
        v63 = if l_GetFFlagRAEnableCircleRegion_0() then l_getAvatarsForRegion_0(v11.identifiedAvatars, v60, v11.annotationCircleRadius, v11.screenSizeWidth, v11.screenSizeHeight) else l_getAvatarsForPoint_0(v11.identifiedAvatars, v60);
        for v64, _ in pairs(v63) do
            local l_distance_0 = v11.identifiedAvatars[v64].distance;
            if l_distance_0 < v61 then
                v61 = l_distance_0;
                v62 = v64;
            end;
        end;
        local v67 = nil;
        if l_GetFFlagReportAnythingEnableAdReport_0() then
            local v68 = l_getAdsForPoint_0(v11.identifiedAds, v60);
            v61 = 1e999;
            for v69, _ in pairs(v68) do
                local l_distance_1 = v11.identifiedAds[v69].distance;
                if l_distance_1 < v61 then
                    v61 = l_distance_1;
                    v67 = v69;
                end;
            end;
        end;
        if v62 ~= nil and not v55[v62] then
            v55[v62] = true;
            v57[#v57 + 1] = v11.identifiedAvatars[v62].player;
        elseif l_GetFFlagReportAnythingEnableAdReport_0() and v67 ~= nil and not v56[v67] then
            v56[v67] = true;
            v58[#v58 + 1] = v11.identifiedAds[v67];
        end;
    end;
    v11.selectedAbusers = v57;
    v11.selectedAds = v58;
end;
return {
    setAnnotationCircleRadius = function(v73) --[[ Line: 537 ]] --[[ Name: setAnnotationCircleRadius ]]
        -- upvalues: v11 (ref)
        v11.annotationCircleRadius = v73;
    end, 
    getAnnotationCircleRadius = function() --[[ Line: 540 ]] --[[ Name: getAnnotationCircleRadius ]]
        -- upvalues: v11 (ref)
        return v11.annotationCircleRadius;
    end, 
    setAspectRatioDimensions = function(v74, v75) --[[ Line: 543 ]] --[[ Name: setAspectRatioDimensions ]]
        -- upvalues: v11 (ref)
        v11.screenSizeWidth = v74;
        v11.screenSizeHeight = v75;
    end, 
    setScreenshotId = function(v76) --[[ Line: 547 ]] --[[ Name: setScreenshotId ]]
        -- upvalues: v11 (ref)
        v11.screenshotId = v76;
    end, 
    setIdentifiedAds = function(v77) --[[ Line: 550 ]] --[[ Name: setIdentifiedAds ]]
        -- upvalues: v11 (ref)
        v11.identifiedAds = v77;
    end, 
    getIdentifiedAds = function() --[[ Line: 553 ]] --[[ Name: getIdentifiedAds ]]
        -- upvalues: v11 (ref)
        return v11.identifiedAds;
    end, 
    setIdentifiedAvatars = function(v78) --[[ Line: 556 ]] --[[ Name: setIdentifiedAvatars ]]
        -- upvalues: v11 (ref)
        v11.identifiedAvatars = v78;
    end, 
    getIdentifiedAvatars = function() --[[ Line: 559 ]] --[[ Name: getIdentifiedAvatars ]]
        -- upvalues: v11 (ref)
        return v11.identifiedAvatars;
    end, 
    setAvatarIDStats = function(v79) --[[ Line: 562 ]] --[[ Name: setAvatarIDStats ]]
        -- upvalues: v11 (ref)
        v11.avatarIDStats = v79;
    end, 
    setAdIDStats = function(v80) --[[ Line: 565 ]] --[[ Name: setAdIDStats ]]
        -- upvalues: v11 (ref)
        v11.adIDStats = v80;
    end, 
    setScreenshotContentId = function(v81) --[[ Line: 568 ]] --[[ Name: setScreenshotContentId ]]
        -- upvalues: v11 (ref)
        v11.screenshotContentId = v81;
        v11.annotationPoints = {};
        v11.selectedAbusers = {};
    end, 
    getScreenshotContentId = function() --[[ Line: 575 ]] --[[ Name: getScreenshotContentId ]]
        -- upvalues: v11 (ref)
        return v11.screenshotContentId;
    end, 
    setAnnotationPoints = function(v82) --[[ Line: 578 ]] --[[ Name: setAnnotationPoints ]]
        -- upvalues: v11 (ref), v72 (copy)
        v11.annotationPoints = v82;
        v11.annotationOptionSeen = true;
        v11.annotationPageSeen = true;
        v72();
    end, 
    getSelectedAbusers = function() --[[ Line: 584 ]] --[[ Name: getSelectedAbusers ]]
        -- upvalues: v11 (ref)
        return v11.selectedAbusers;
    end, 
    getSelectedAds = function() --[[ Line: 587 ]] --[[ Name: getSelectedAds ]]
        -- upvalues: v11 (ref)
        return v11.selectedAds;
    end, 
    clearAnnotationPoints = function() --[[ Line: 590 ]] --[[ Name: clearAnnotationPoints ]]
        -- upvalues: v11 (ref), l_GetFFlagReportAnythingEnableAdReport_0 (copy)
        v11.annotationPoints = {};
        v11.selectedAbusers = {};
        if l_GetFFlagReportAnythingEnableAdReport_0() then
            v11.selectedAds = {};
        end;
        v11.annotationOptionSeen = false;
        v11.annotationPageSeen = false;
    end, 
    getAnnotationPoints = function() --[[ Line: 600 ]] --[[ Name: getAnnotationPoints ]]
        -- upvalues: v11 (ref)
        return v11.annotationPoints;
    end, 
    setAnnotationOptionSeen = function(v83) --[[ Line: 603 ]] --[[ Name: setAnnotationOptionSeen ]]
        -- upvalues: v11 (ref)
        v11.annotationOptionSeen = v83;
    end, 
    getAnnotationOptionSeen = function() --[[ Line: 606 ]] --[[ Name: getAnnotationOptionSeen ]]
        -- upvalues: v11 (ref)
        return v11.annotationOptionSeen;
    end, 
    setAnnotationPageSeen = function(v84) --[[ Line: 609 ]] --[[ Name: setAnnotationPageSeen ]]
        -- upvalues: v11 (ref)
        v11.annotationPageSeen = v84;
    end, 
    getAnnotationPageSeen = function() --[[ Line: 612 ]] --[[ Name: getAnnotationPageSeen ]]
        -- upvalues: v11 (ref)
        return v11.annotationPageSeen;
    end, 
    buildExperienceReportRequest = v38, 
    buildOtherReportRequest = v54, 
    clear = function() --[[ Line: 617 ]] --[[ Name: clear ]]
        -- upvalues: v11 (ref)
        v11 = {
            annotationCircleRadius = 0, 
            screenSizeWidth = 0, 
            screenSizeHeight = 0, 
            screenshotId = "", 
            identifiedAvatars = {}, 
            avatarIDStats = nil, 
            identifiedAds = {}, 
            adIDStats = nil, 
            screenshotContentId = "", 
            annotationPoints = {}, 
            annotationOptionSeen = false, 
            annotationPageSeen = false, 
            selectedAbusers = {}, 
            selectedAds = {}
        };
    end, 
    getAnalyticsParameters = function() --[[ Line: 635 ]] --[[ Name: getAnalyticsParameters ]]
        -- upvalues: v11 (ref)
        return {
            finalAnnotationOptionSeen = v11.annotationOptionSeen, 
            finalAnnotationPageSeen = v11.annotationPageSeen, 
            finalAnnotationCount = #v11.annotationPoints, 
            finalAnnotatedAvatarsCount = #v11.selectedAbusers
        };
    end, 
    Constants = v12
};