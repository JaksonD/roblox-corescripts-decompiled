local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification);
local v3 = require(l_CorePackages_0.Workspace.Packages.TnSAdIdentification);
local l_HttpService_0 = game:GetService("HttpService");
local l_getAvatarsForPoint_0 = v2.AvatarIdentification.getAvatarsForPoint;
local l_getAvatarsForRegion_0 = v2.AvatarIdentification.getAvatarsForRegion;
local l_getAdsForPoint_0 = v3.AdIdentification.getAdsForPoint;
local l_GetFFlagReportAnythingEnableAdReport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport;
local l_GetFFlagGetHumanoidDescription_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription;
local l_GetFFlagRAEnableCircleRegion_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion;
local l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E;
local l_getHumanoidDescription_0 = require(l_script_FirstAncestor_0.ReportAnything.Utility.GetHumanoidDescription).getHumanoidDescription;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v15 = {
    Variant = {
        CS = "ra/cs", 
        Sampling = "ra/sampling", 
        E1 = "ra/e1", 
        E2 = "ra/e2", 
        E3 = "ra/e3", 
        NM = "ra/nm", 
        Unknown = "ra/unknown"
    }
};
local function v20(v16) --[[ Line: 96 ]]
    local v17 = {};
    for _, v19 in ipairs(v16) do
        v17[#v17 + 1] = {
            v19.X, 
            v19.Y
        };
    end;
    return v17;
end;
local function v25(v21) --[[ Line: 104 ]]
    local v22 = {};
    for _, v24 in pairs(v21) do
        v22[#v22 + 1] = {
            assetId = v24.assetId, 
            distance = v24.distance, 
            boundingBox = {
                minX = v24.boundingBox.min.X, 
                minY = v24.boundingBox.min.Y, 
                maxX = v24.boundingBox.max.X, 
                maxY = v24.boundingBox.max.Y
            }, 
            adUnitName = v24.adUnitName, 
            encryptedAdTrackingData = v24.encryptedAdTrackingData, 
            encryptionMetadata = v24.encryptionMetadata
        };
    end;
    return v22;
end;
local function v30(v26) --[[ Line: 125 ]]
    -- upvalues: v20 (copy)
    local v27 = {};
    for v28, v29 in pairs(v26) do
        v27[#v27 + 1] = {
            userId = tostring(v28), 
            distance = v29.distance, 
            boundingBox = {
                minX = v29.boundingBox.min.X, 
                minY = v29.boundingBox.min.Y, 
                maxX = v29.boundingBox.max.X, 
                maxY = v29.boundingBox.max.Y
            }, 
            hitRate = v29.hitRate, 
            convexHull = v20(v29.convexHull)
        };
        if v29.pointProcessingStats ~= nil then
            v27[#v27].pointProcessingStats = {
                v29.pointProcessingStats.wasSkipped and 1 or 0, 
                v29.pointProcessingStats.total, 
                v29.pointProcessingStats.offScreenDiscardCount, 
                v29.pointProcessingStats.tooCloseDiscardCount
            };
        end;
    end;
    return v27;
end;
local _ = function(v31, v32) --[[ Line: 155 ]]
    -- upvalues: l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 (copy), l_getHumanoidDescription_0 (copy)
    local _ = nil;
    local _ = nil;
    if l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0() then
        local v35 = v32.identificationResults.identifiedAvatars[v31];
        if v35 and v35.humanoidDescription and v35.humanoidDescriptionStatus == "OK" then
            return v35.humanoidDescription, v35.humanoidDescriptionStatus;
        else
            local v36, v37 = l_getHumanoidDescription_0(v31);
            return v36, v37;
        end;
    else
        local v38, v39 = l_getHumanoidDescription_0(v31);
        return v38, v39;
    end;
end;
local function v59(v41) --[[ Line: 177 ]]
    -- upvalues: l_GetFFlagRAEnableCircleRegion_0 (copy), l_getAvatarsForRegion_0 (copy), l_getAvatarsForPoint_0 (copy), l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_getAdsForPoint_0 (copy)
    local v42 = {};
    local v43 = {};
    local v44 = {};
    local v45 = {};
    for _, v47 in ipairs(v41.annotationPoints) do
        local v48 = 1e999;
        local v49 = nil;
        local v50 = {};
        v50 = if l_GetFFlagRAEnableCircleRegion_0() then l_getAvatarsForRegion_0(v41.identificationResults.identifiedAvatars, v47, v41.annotationCircleRadius, v41.annotationAreaWidth, v41.annotationAreaHeight) else l_getAvatarsForPoint_0(v41.identificationResults.identifiedAvatars, v47);
        for v51, _ in pairs(v50) do
            local l_distance_0 = v41.identificationResults.identifiedAvatars[v51].distance;
            if l_distance_0 < v48 then
                v48 = l_distance_0;
                v49 = v51;
            end;
        end;
        local v54 = nil;
        if l_GetFFlagReportAnythingEnableAdReport_0() then
            local v55 = l_getAdsForPoint_0(v41.identificationResults.identifiedAds, v47);
            v48 = 1e999;
            for v56, _ in pairs(v55) do
                local l_distance_1 = v41.identificationResults.identifiedAds[v56].distance;
                if l_distance_1 < v48 then
                    v48 = l_distance_1;
                    v54 = v56;
                end;
            end;
        end;
        if v49 ~= nil and not v42[v49] then
            v42[v49] = true;
            v44[#v44 + 1] = v41.identificationResults.identifiedAvatars[v49].player;
        elseif l_GetFFlagReportAnythingEnableAdReport_0() and v54 ~= nil and not v43[v54] then
            v43[v54] = true;
            v45[#v45 + 1] = v41.identificationResults.identifiedAds[v54];
        end;
    end;
    return v44, v45;
end;
local function v69(v60, _, v62) --[[ Line: 242 ]]
    -- upvalues: l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_HttpService_0 (copy), v30 (copy), v25 (copy), v20 (copy)
    local v63 = false;
    for _, _ in pairs(v60.identificationResults.identifiedAvatars) do
        v63 = true;
        break;
    end;
    local v66 = false;
    if l_GetFFlagReportAnythingEnableAdReport_0() then
        for _, _ in pairs(v60.identificationResults.identifiedAds) do
            v66 = true;
            break;
        end;
    end;
    if v63 then
        v62.tags.IDENTIFIED_AVATARS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v30(v60.identificationResults.identifiedAvatars)))
                }
            }
        };
    end;
    if v60.identificationResults.avatarIDStats then
        v62.tags.AVATAR_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v60.identificationResults.avatarIDStats)
                }
            }
        };
    end;
    if v66 and l_GetFFlagReportAnythingEnableAdReport_0() then
        v62.tags.IDENTIFIED_ADS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v25(v60.identificationResults.identifiedAds)))
                }
            }
        };
    end;
    if v60.identificationResults.adIDStats and l_GetFFlagReportAnythingEnableAdReport_0() then
        v62.tags.AD_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v60.identificationResults.adIDStats)
                }
            }
        };
    end;
    if #v60.screenshotId > 0 then
        v62.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v60.screenshotId
                }
            }
        };
    end;
    if #v60.annotationPoints > 0 then
        v62.tags.RA_ANNOTATION_POINTS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v20(v60.annotationPoints)))
                }
            }
        };
    end;
    v62.tags.RA_ANNOTATION_OPTION_SEEN = {
        valueList = {
            {
                data = tostring(v60.annotationOptionSeen)
            }
        }
    };
    v62.tags.RA_ANNOTATION_PAGE_SEEN = {
        valueList = {
            {
                data = tostring(v60.annotationPageSeen)
            }
        }
    };
end;
return {
    buildExperienceReportRequest = function(v70, v71, v72) --[[ Line: 338 ]]
        -- upvalues: v15 (copy), v59 (copy), v69 (copy), l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_HttpService_0 (copy), v25 (copy)
        local v73 = {
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
                            data = tostring(v70.localUserId)
                        }
                    }
                }, 
                REPORTED_ABUSE_CATEGORY = {
                    valueList = {
                        {
                            data = v70.abuseReason
                        }
                    }
                }, 
                PLACE_ID = {
                    valueList = {
                        {
                            data = tostring(v70.placeId)
                        }
                    }
                }, 
                REPORTER_COMMENT = {
                    valueList = {
                        {
                            data = v70.abuseComment
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
                            data = v70.menuEntryPoint
                        }
                    }
                }, 
                VARIANT = {
                    valueList = {
                        {
                            data = v70.variant or v15.Variant.CS
                        }
                    }
                }
            }
        };
        local _, v75 = v59(v71);
        v69(v71, v72, v73);
        if #v75 > 0 and l_GetFFlagReportAnythingEnableAdReport_0() then
            v73.tags.REPORT_TARGET_ADS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode((v25(v75)))
                    }
                }
            };
        end;
        return l_HttpService_0:JSONEncode(v73);
    end, 
    buildOtherReportRequest = function(v76, v77, v78) --[[ Line: 417 ]]
        -- upvalues: v15 (copy), v59 (copy), v69 (copy), l_GetFFlagGetHumanoidDescription_0 (copy), l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 (copy), l_getHumanoidDescription_0 (copy), l_HttpService_0 (copy)
        local v79 = {
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
                            data = tostring(v76.localUserId)
                        }
                    }
                }, 
                REPORTED_ABUSE_CATEGORY = {
                    valueList = {
                        {
                            data = v76.abuseReason
                        }
                    }
                }, 
                REPORTER_COMMENT = {
                    valueList = {
                        {
                            data = v76.abuseComment
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
                            data = v76.menuEntryPoint
                        }
                    }
                }, 
                VARIANT = {
                    valueList = {
                        {
                            data = v76.variant or v15.Variant.Unknown
                        }
                    }
                }
            }
        };
        local v80, _ = v59(v77);
        v69(v77, v78, v79);
        if #v80 > 0 then
            local v82 = tostring(v80[1].UserId);
            local v83 = {};
            for _, v85 in ipairs(v80) do
                v83[#v83 + 1] = tostring(v85.UserId);
            end;
            if l_GetFFlagGetHumanoidDescription_0() then
                local l_UserId_0 = v80[1].UserId;
                local v87 = nil;
                local v88 = nil;
                if l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0() then
                    local v89 = v77.identificationResults.identifiedAvatars[l_UserId_0];
                    if v89 and v89.humanoidDescription and v89.humanoidDescriptionStatus == "OK" then
                        v87 = v89.humanoidDescription;
                        v88 = v89.humanoidDescriptionStatus;
                    else
                        local v90, v91 = l_getHumanoidDescription_0(l_UserId_0);
                        v87 = v90;
                        v88 = v91;
                    end;
                else
                    local v92, v93 = l_getHumanoidDescription_0(l_UserId_0);
                    v87 = v92;
                    v88 = v93;
                end;
                local l_v87_0 = v87;
                local l_v88_0 = v88;
                v79.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(l_v87_0)
                        }
                    }
                };
                v79.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                    valueList = {
                        {
                            data = l_v88_0
                        }
                    }
                };
                l_UserId_0 = {};
                for _, v97 in ipairs(v80) do
                    local l_UserId_1 = v97.UserId;
                    local v99 = nil;
                    local v100 = nil;
                    if l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0() then
                        local v101 = v77.identificationResults.identifiedAvatars[l_UserId_1];
                        if v101 and v101.humanoidDescription and v101.humanoidDescriptionStatus == "OK" then
                            v99 = v101.humanoidDescription;
                            v100 = v101.humanoidDescriptionStatus;
                        else
                            local v102, v103 = l_getHumanoidDescription_0(l_UserId_1);
                            v99 = v102;
                            v100 = v103;
                        end;
                    else
                        local v104, v105 = l_getHumanoidDescription_0(l_UserId_1);
                        v99 = v104;
                        v100 = v105;
                    end;
                    l_UserId_0[#l_UserId_0 + 1] = {
                        humanoidDescription = v99, 
                        outputMessage = v100
                    };
                end;
                v79.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(l_UserId_0)
                        }
                    }
                };
            end;
            v79.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v82)
                    }
                }
            };
            v79.tags.RA_ALL_ANNOTATED_USER_IDS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v83)
                    }
                }
            };
        elseif v76.formSelectedAbuserUserId then
            if l_GetFFlagGetHumanoidDescription_0() then
                local l_formSelectedAbuserUserId_0 = v76.formSelectedAbuserUserId;
                local v107 = nil;
                local v108 = nil;
                if l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0() then
                    local v109 = v77.identificationResults.identifiedAvatars[l_formSelectedAbuserUserId_0];
                    if v109 and v109.humanoidDescription and v109.humanoidDescriptionStatus == "OK" then
                        v107 = v109.humanoidDescription;
                        v108 = v109.humanoidDescriptionStatus;
                    else
                        local v110, v111 = l_getHumanoidDescription_0(l_formSelectedAbuserUserId_0);
                        v107 = v110;
                        v108 = v111;
                    end;
                else
                    local v112, v113 = l_getHumanoidDescription_0(l_formSelectedAbuserUserId_0);
                    v107 = v112;
                    v108 = v113;
                end;
                local l_v107_0 = v107;
                local l_v108_0 = v108;
                v79.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(l_v107_0)
                        }
                    }
                };
                v79.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                    valueList = {
                        {
                            data = l_v108_0
                        }
                    }
                };
            end;
            v79.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v76.formSelectedAbuserUserId)
                    }
                }
            };
        end;
        if game:GetEngineFeature("WHAM2165") then
            return v79;
        else
            return l_HttpService_0:JSONEncode(v79);
        end;
    end, 
    interpretAnnotations = v59, 
    Constants = v15
};