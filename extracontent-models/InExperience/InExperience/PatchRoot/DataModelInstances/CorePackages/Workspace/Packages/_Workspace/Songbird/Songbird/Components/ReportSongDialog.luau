local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_script_FirstAncestor_0.Parent.AssetFavorites);
local v4 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v5 = require(l_script_FirstAncestor_0.Parent.GenericAbuseReporting);
local v6 = require(l_script_FirstAncestor_0.Parent.React);
local v7 = require(l_script_FirstAncestor_0.Parent.FocusNavigationUtils);
local v8 = require(l_script_FirstAncestor_0.logger);
local _ = require(l_script_FirstAncestor_0.types);
local l_FocusRoot_0 = v7.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local l_DefaultTwoStepReportFlow_0 = v5.UXFlows.DefaultTwoStepReportFlow;
local l_AbuseCategory_0 = v5.Enums.AbuseCategory;
local l_AbuseEntrypoint_0 = v5.Enums.AbuseEntrypoint;
local l_useCallback_0 = v6.useCallback;
local l_useLocalUserId_0 = v3.useLocalUserId;
local v17 = {
    {
        localizationKey = "Feature.SongDetails.Label.InappropriateAudio", 
        value = "InappropriateAudio"
    }, 
    {
        localizationKey = "Feature.SongDetails.Label.InappropriateThumbnail", 
        value = "InappropriateThumbnail"
    }
};
local v18 = {
    Audio = "audio", 
    Image = "image"
};
local function v23(v19) --[[ Line: 58 ]] --[[ Name: buildReport ]]
    -- upvalues: l_AbuseEntrypoint_0 (copy), l_AbuseCategory_0 (copy), l_HttpService_0 (copy)
    local v20 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = l_AbuseEntrypoint_0.APP
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v19.userId)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = l_AbuseCategory_0.ABUSE_CATEGORY_INAPT_CONTENT
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v19.comment
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v19.assetId
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v19.abuseVector
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v19.variant
                    }
                }
            }
        }
    };
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 111 ]]
        -- upvalues: l_HttpService_0 (ref), v20 (copy)
        return l_HttpService_0:JSONEncode(v20);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return nil;
    end;
end;
return v6.memo(function(v24) --[[ Line: 118 ]] --[[ Name: ReportSongDialog ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useCallback_0 (copy), v17 (copy), v23 (copy), v18 (copy), l_Players_0 (copy), v8 (copy), v6 (copy), v4 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_DefaultTwoStepReportFlow_0 (copy)
    local v25 = l_useLocalUserId_0();
    local v26 = l_useCallback_0(function() --[[ Line: 121 ]]
        -- upvalues: v24 (copy)
        if v24.onClose then
            v24.onClose();
        end;
    end, {
        v24.onClose
    });
    local v35 = l_useCallback_0(function(v27, v28) --[[ Line: 127 ]]
        -- upvalues: v17 (ref), v24 (copy), v23 (ref), v25 (copy), v18 (ref), l_Players_0 (ref), v8 (ref)
        local v29 = v27 == v17[1].value;
        local v30 = if v29 then v24.audio.assetId else v24.audio.thumbnailAssetId;
        if v30 then
            local v31 = v23({
                userId = v25, 
                comment = v28, 
                assetId = v30, 
                abuseVector = if v29 then v18.Audio else v18.Image, 
                variant = v24.analyticsSource
            });
            if v31 then
                local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                if l_LocalPlayer_0 then
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 143 ]]
                        -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (copy), v31 (copy)
                        l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v31);
                    end);
                    if l_status_1 then
                        v8:info((("Abuse report sent for asset [%*] with reason [%*] and comment [%*]"):format(v30, v27, v28)));
                    else
                        v8:warning((("Failed to submit abuse report for asset %*: %*"):format(v30, l_result_1)));
                    end;
                end;
            end;
        end;
        return true;
    end, {
        v24.analyticsSource, 
        v24.audio.assetId, 
        v24.audio.thumbnailAssetId, 
        v25
    });
    return v6.createElement(v4.View, {
        tag = "size-full-0 auto-y", 
        selectionGroup = true
    }, {
        FocusRoot = v6.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            AbuseReportFlow = v6.createElement(l_DefaultTwoStepReportFlow_0, {
                analyticsContext = v24.analyticsSource, 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = v26
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v35
                }, 
                onComplete = v26, 
                reportCategories = v17, 
                reportCategoryDefaultKey = v17[1].value, 
                localizationKeys = {
                    formTitle = "Feature.SongDetails.Action.ReportAudio"
                }
            })
        })
    });
end);