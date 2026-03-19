local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local v5 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local v6 = require(l_script_FirstAncestor_0.ReportAnything.Utility.AbuseReportBuilder);
local v7 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v8 = require(l_script_FirstAncestor_0.MenuConfigs.getToastMessageFromAbuseReason);
return {
    componentType = "button", 
    getIsVisible = function(_) --[[ Line: 14 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    variant = "primary", 
    getIconSrc = function(_) --[[ Line: 18 ]] --[[ Name: getIconSrc ]]
        return "";
    end, 
    getButtonLabel = function(_) --[[ Line: 21 ]] --[[ Name: getButtonLabel ]]
        return "SubmitButton";
    end, 
    onClick = function(v12, _, v14) --[[ Line: 24 ]] --[[ Name: onClick ]]
        -- upvalues: l_Players_0 (copy), v5 (copy), v6 (copy), v7 (copy), v4 (copy), v8 (copy), l_MarketplaceService_0 (copy)
        local l_abuseReason_0 = v12.abuseReason;
        if l_abuseReason_0 ~= nil and l_Players_0.LocalPlayer ~= nil then
            if v5.getReportAnythingExperienceEnabled() then
                local v16 = v6.buildExperienceReportRequest({
                    localUserId = l_Players_0.LocalPlayer.UserId, 
                    placeId = game.PlaceId, 
                    abuseComment = v12.comment, 
                    abuseReason = l_abuseReason_0, 
                    menuEntryPoint = v7:getAbuseReportSessionEntryPoint(), 
                    variant = v6.Constants.Variant.NM
                }, v14.reportAnythingState, v14.reportAnythingAnalytics.getAccumulatedParameters());
                l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v16);
                v14.analyticsDispatch({
                    type = v4.AnalyticsActions.SetSubmissionCompleted
                });
                local v17 = v8(l_abuseReason_0, true);
                v14.onReportComplete(v17);
                return;
            else
                spawn(function() --[[ Line: 49 ]]
                    -- upvalues: l_MarketplaceService_0 (ref), v12 (copy), l_Players_0 (ref), l_abuseReason_0 (copy)
                    local v18 = tostring(game.PlaceId);
                    local v19 = "N/A";
                    local v20 = "N/A";
                    pcall(function() --[[ Line: 51 ]]
                        -- upvalues: l_MarketplaceService_0 (ref), v19 (ref), v20 (ref)
                        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                            local l_l_MarketplaceService_0_ProductInfoAsync_0 = l_MarketplaceService_0:GetProductInfoAsync(game.PlaceId, Enum.InfoType.Asset);
                            v19 = l_l_MarketplaceService_0_ProductInfoAsync_0.Name;
                            v20 = l_l_MarketplaceService_0_ProductInfoAsync_0.Description;
                            return;
                        else
                            local l_l_MarketplaceService_0_ProductInfo_0 = l_MarketplaceService_0:GetProductInfo(game.PlaceId, Enum.InfoType.Asset);
                            v19 = l_l_MarketplaceService_0_ProductInfo_0.Name;
                            v20 = l_l_MarketplaceService_0_ProductInfo_0.Description;
                            return;
                        end;
                    end);
                    local v23 = string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", v12.comment, v19, v18, v20);
                    l_Players_0:ReportAbuse(nil, l_abuseReason_0, v23);
                end);
                v14.analyticsDispatch({
                    type = v4.AnalyticsActions.SetSubmissionCompleted
                });
                local v24 = v8(l_abuseReason_0);
                v14.onReportComplete(v24);
            end;
        end;
    end, 
    fieldLabel = "", 
    componentName = "SubmitButton"
};