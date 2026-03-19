local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_CorePackages_0.Packages.Dash);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v8 = require(l_RobloxGui_0.Modules.VoiceChat.createVoiceAbuseReportRequest);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Resources.Constants);
local v12 = require(l_Parent_0.Utility.SendAnalytics);
local v13 = require(l_Parent_0.Utility.SessionUtility);
sendAnalytics = function(v14, v15, v16, v17) --[[ Line: 36 ]] --[[ Name: sendAnalytics ]]
    -- upvalues: v12 (copy), v11 (copy)
    v12(v14, v11.Analytics.ReportSubmittedName, {
        reportType = v14, 
        reportedEntityId = tostring(v15), 
        reportSource = v11.Analytics.ReportSourceInGame, 
        reason = v16, 
        abuseVector = v17
    });
end;
getAbuseVectorFromReportCategory = function(v18) --[[ Line: 50 ]] --[[ Name: getAbuseVectorFromReportCategory ]]
    -- upvalues: v11 (copy)
    if v18 == v11.Category.Voice then
        return "voice";
    elseif v18 == v11.Category.Text then
        return "chat";
    else
        return "other";
    end;
end;
submitUserAbuseReport = function(v19, v20) --[[ Line: 59 ]] --[[ Name: submitUserAbuseReport ]]
    -- upvalues: v11 (copy), l_Players_0 (copy), v8 (copy), l_default_0 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), v13 (copy)
    local v21 = v19.reportCategory == v11.Category.Voice;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        pcall(function() --[[ Line: 63 ]]
            -- upvalues: v19 (copy), v21 (copy), v8 (ref), l_Players_0 (ref), l_default_0 (ref), l_LocalPlayer_0 (copy), l_Url_0 (ref), l_HttpRbxApiService_0 (ref), v11 (ref), v13 (ref), v20 (copy)
            coroutine.wrap(function() --[[ Line: 64 ]]
                -- upvalues: v19 (ref), v21 (ref), v8 (ref), l_Players_0 (ref), l_default_0 (ref), l_LocalPlayer_0 (ref), l_Url_0 (ref), l_HttpRbxApiService_0 (ref), v11 (ref), v13 (ref), v20 (ref)
                local v23 = getAbuseVectorFromReportCategory(v19.reportCategory);
                if v21 then
                    local v24 = v8(l_Players_0, l_default_0, {
                        localUserId = l_LocalPlayer_0.UserId, 
                        abuserUserId = v19.abusingPlayer.UserId, 
                        abuseComment = v19.comment, 
                        abuseReason = v19.reason, 
                        inExpMenuOpenedUnixMilli = math.floor(v19.beginningTimestamp * 1000), 
                        sortedPlayerListUserIds = v19.sortedUserIds, 
                        abuseVector = v23
                    });
                    if game:GetEngineFeature("AbuseReportV3") then
                        l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v24);
                    else
                        local v25 = l_Url_0.APIS_URL .. "/abuse-reporting/v2/abuse-report";
                        l_HttpRbxApiService_0:PostAsyncFullUrl(v25, v24);
                    end;
                else
                    l_Players_0:ReportAbuse(v19.abusingPlayer, v19.reason, v19.comment);
                end;
                sendAnalytics(v11.Analytics.ReportTypeUser, v19.abusingPlayer.UserId, v19.reason, v23);
                v13.endAbuseReportSession();
                if v20 then
                    v20();
                end;
            end)();
        end);
    end;
end;
submitPlaceAbuseReport = function(v26, v27) --[[ Line: 99 ]] --[[ Name: submitPlaceAbuseReport ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), v11 (copy), v13 (copy)
    if v26.placeName ~= "" then
        coroutine.wrap(function() --[[ Line: 101 ]]
            -- upvalues: l_RunService_0 (ref), v26 (copy), l_Players_0 (ref), v11 (ref), v13 (ref), v27 (copy)
            if not l_RunService_0:IsStudio() then
                local v28 = string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", v26.comment, v26.placeName, tostring(v26.placeId), v26.placeDescription);
                l_Players_0:ReportAbuse(nil, v26.reason, v28);
            end;
            sendAnalytics(v11.Analytics.ReportTypeGame, v26.placeId, v26.reason);
            v13.endAbuseReportSession();
            if v27 then
                v27();
            end;
        end)();
    end;
end;
return {
    submitUserAbuseReport = submitUserAbuseReport, 
    submitPlaceAbuseReport = submitPlaceAbuseReport
};