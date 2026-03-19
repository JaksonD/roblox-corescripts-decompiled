local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_HttpService_0 = game:GetService("HttpService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = require(l_script_FirstAncestor_0.logger);
local v6 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v7 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v8 = require(l_script_FirstAncestor_0.Parent.GenericAbuseReporting);
local v9 = require(l_script_FirstAncestor_0.Parent.React);
local l_DefaultTwoStepReportFlow_0 = v8.UXFlows.DefaultTwoStepReportFlow;
local v11 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v12 = require(l_script_FirstAncestor_0.Analytics.sendChromeWindowAnalytics);
local v13 = require(l_script_FirstAncestor_0.Components.ReportAudioPopupContext);
local v14 = {
    {
        localizationKey = "CoreScripts.TopBar.Label.InappropriateAudio", 
        value = "ABUSE_CATEGORY_INAPT_CONTENT"
    }
};
local v15 = {
    maxSize = v4.BIG_VECTOR, 
    onClose = function() --[[ Line: 33 ]] --[[ Name: onClose ]]

    end, 
    Players = l_Players_0
};
buildReport = function(v16, v17, v18, v19) --[[ Line: 49 ]] --[[ Name: buildReport ]]
    -- upvalues: l_HttpService_0 (copy)
    local v20 = {
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
                        data = tostring(v16)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v17
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v18
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = tostring(v19)
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "audio"
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = "ChromeMusicWhatsPlaying"
                    }
                }
            }
        }
    };
    return l_HttpService_0:JSONEncode(v20);
end;
return function(v21) --[[ Line: 98 ]] --[[ Name: ReportAudioPopup ]]
    -- upvalues: v6 (copy), v15 (copy), v13 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), v5 (copy), v12 (copy), v11 (copy), v9 (copy), v7 (copy), l_DefaultTwoStepReportFlow_0 (copy), v4 (copy), v14 (copy)
    local v22 = v6.Dictionary.join(v15, v21);
    local v23 = v13.use();
    local function v24() --[[ Line: 102 ]]
        -- upvalues: v22 (copy), v23 (copy)
        v22.onClose();
        v23.setVisibility(false);
    end;
    local function v32(v25, v26) --[[ Line: 108 ]]
        -- upvalues: v22 (copy), v23 (copy), l_MarketplaceService_0 (ref), l_Players_0 (ref), v5 (ref), v12 (ref), v11 (ref)
        local l_LocalPlayer_0 = v22.Players.LocalPlayer;
        if l_LocalPlayer_0 and v23.assetId then
            local l_assetId_0 = v23.assetId;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 113 ]]
                -- upvalues: l_MarketplaceService_0 (ref), l_assetId_0 (copy)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return l_MarketplaceService_0:GetProductInfoAsync(l_assetId_0);
                else
                    return l_MarketplaceService_0:GetProductInfo(l_assetId_0);
                end;
            end);
            if l_status_0 then
                if l_result_0.AssetTypeId == Enum.AssetType.Audio.Value then
                    local v31 = buildReport(l_LocalPlayer_0.UserId, v25, v26, v23.assetId);
                    if v31 then
                        l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v31);
                        v5:info("Audio abuse report submitted for asset [" .. tostring(v23.assetId) .. "] with reason [" .. v25 .. "] and comment [" .. v26 .. "]");
                        v12({
                            assetId = l_assetId_0, 
                            action = v11.SubmitAudioReport
                        });
                    end;
                else
                    v5:info("Atempted to submit report for non-audio asset [" .. tostring(v23.assetId) .. "] with reason [" .. v25 .. "] and comment [" .. v26 .. "]");
                    v12({
                        assetId = l_assetId_0, 
                        action = v11.PreventNonAudioReport
                    });
                end;
            else
                v5:warning("Failed to fetch ProductInfo for asset [" .. tostring(v23.assetId) .. "]");
                v12({
                    assetId = l_assetId_0, 
                    action = v11.PreventNonAudioReport
                });
            end;
        end;
        return true;
    end;
    if v23.isVisible then
        return (v9.createElement(v7.View, {
            tag = "size-full", 
            sizeConstraint = nil
        }, {
            AbuseReportFlow = v9.createElement(l_DefaultTwoStepReportFlow_0, {
                analyticsContext = v4.AUDIO_ANALYTICS_CONTEXT, 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = v24
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v32
                }, 
                onComplete = v24, 
                reportCategories = v14, 
                reportCategoryDefaultKey = v14[1].value, 
                isReportCategoryReadonly = true, 
                localizationKeys = {
                    formTitle = "CoreScripts.TopBar.Label.ReportAudio"
                }
            })
        }));
    else
        return nil;
    end;
end;