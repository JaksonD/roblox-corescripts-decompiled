local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.MenuConfigs.getToastMessageFromAbuseReason);
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.createVoiceAbuseReportRequest);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v8 = require(l_script_FirstAncestor_0.ReportAnything.Utility.AbuseReportBuilder);
local v9 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v10 = require(l_script_FirstAncestor_0.Components.Constants);
local v11 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local v12 = require(l_CorePackages_0.Packages.Cryo);
local v13 = require(l_script_FirstAncestor_0.Utility.submitChatLineReport);
local l_FFlagInGameMenuAddChatLineReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting;
isEligibleForVoiceSubmit = function(v15, v16) --[[ Line: 22 ]] --[[ Name: isEligibleForVoiceSubmit ]]
    -- upvalues: l_Players_0 (copy)
    local v17 = false;
    if v15.allegedAbuser ~= nil then
        v17 = false;
        if v15.allegedAbuserId ~= nil then
            v17 = false;
            if v15.abuseReason ~= nil then
                v17 = false;
                if v15.methodOfAbuse ~= nil then
                    v17 = false;
                    if v16.analyticsState.menuOpenedUnixTimestampMilliseconds ~= nil then
                        v17 = l_Players_0.LocalPlayer ~= nil;
                    end;
                end;
            end;
        end;
    end;
    return v17;
end;
isEligibleForRAOtherSubmit = function(v18) --[[ Line: 31 ]] --[[ Name: isEligibleForRAOtherSubmit ]]
    -- upvalues: l_Players_0 (copy)
    local v19 = false;
    if v18.allegedAbuser ~= nil then
        v19 = false;
        if v18.allegedAbuserId ~= nil then
            v19 = false;
            if v18.abuseReason ~= nil then
                v19 = l_Players_0.LocalPlayer ~= nil;
            end;
        end;
    end;
    return v19;
end;
isEligibleForTextSubmit = function(v20) --[[ Line: 37 ]] --[[ Name: isEligibleForTextSubmit ]]
    -- upvalues: l_FFlagInGameMenuAddChatLineReporting_0 (copy)
    if l_FFlagInGameMenuAddChatLineReporting_0 then
        return (not (v20.selectedMessage == nil) or v20.allegedAbuser ~= nil) and v20.abuseReason ~= nil;
    else
        local v21 = false;
        if v20.allegedAbuser ~= nil then
            v21 = v20.abuseReason ~= nil;
        end;
        return v21;
    end;
end;
return {
    componentType = "button", 
    getIsVisible = function(_) --[[ Line: 48 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    variant = "primary", 
    getIconSrc = function(_) --[[ Line: 52 ]] --[[ Name: getIconSrc ]]
        return "";
    end, 
    getButtonLabel = function(_) --[[ Line: 55 ]] --[[ Name: getButtonLabel ]]
        return "SubmitButton";
    end, 
    getIsDisabled = function(v25, v26) --[[ Line: 58 ]] --[[ Name: getIsDisabled ]]
        -- upvalues: v10 (copy), v11 (copy)
        local l_methodOfAbuse_0 = v25.methodOfAbuse;
        if l_methodOfAbuse_0 == v10.AbuseMethods.VoiceChat then
            return not isEligibleForVoiceSubmit(v25, v26);
        elseif l_methodOfAbuse_0 == v10.AbuseMethods.TextChat or l_methodOfAbuse_0 == nil or l_methodOfAbuse_0 == v10.AbuseMethods.Other and not v11.getReportAnythingAvatarEnabled() then
            return not isEligibleForTextSubmit(v25);
        elseif l_methodOfAbuse_0 == v10.AbuseMethods.Other or l_methodOfAbuse_0 == v10.AbuseMethods.Avatar then
            return not isEligibleForRAOtherSubmit(v25);
        else
            return false;
        end;
    end, 
    onClick = function(v28, _, v30) --[[ Line: 73 ]] --[[ Name: onClick ]]
        -- upvalues: v10 (copy), v6 (copy), l_Players_0 (copy), l_default_0 (copy), v12 (copy), v11 (copy), l_FFlagInGameMenuAddChatLineReporting_0 (copy), v13 (copy), v5 (copy), v8 (copy), v9 (copy)
        local l_allegedAbuser_0 = v28.allegedAbuser;
        local l_allegedAbuserId_0 = v28.allegedAbuserId;
        local l_abuseReason_0 = v28.abuseReason;
        local l_methodOfAbuse_1 = v28.methodOfAbuse;
        local l_menuOpenedUnixTimestampMilliseconds_0 = v30.analyticsState.menuOpenedUnixTimestampMilliseconds;
        if l_methodOfAbuse_1 == v10.AbuseMethods.VoiceChat then
            if isEligibleForVoiceSubmit(v28, v30) then
                pcall(function() --[[ Line: 86 ]]
                    -- upvalues: v6 (ref), l_Players_0 (ref), l_default_0 (ref), l_allegedAbuserId_0 (copy), v28 (copy), l_abuseReason_0 (copy), l_menuOpenedUnixTimestampMilliseconds_0 (copy), v12 (ref), v10 (ref), v30 (copy), l_allegedAbuser_0 (copy)
                    task.spawn(function() --[[ Line: 87 ]]
                        -- upvalues: v6 (ref), l_Players_0 (ref), l_default_0 (ref), l_allegedAbuserId_0 (ref), v28 (ref), l_abuseReason_0 (ref), l_menuOpenedUnixTimestampMilliseconds_0 (ref), v12 (ref), v10 (ref), v30 (ref), l_allegedAbuser_0 (ref)
                        local v37 = v6(l_Players_0, l_default_0, {
                            localUserId = l_Players_0.LocalPlayer.UserId, 
                            abuserUserId = l_allegedAbuserId_0, 
                            abuseComment = v28.comment, 
                            abuseReason = l_abuseReason_0, 
                            inExpMenuOpenedUnixMilli = l_menuOpenedUnixTimestampMilliseconds_0, 
                            sortedPlayerListUserIds = v12.List.map(v28.playerObjects, function(v36) --[[ Line: 94 ]]
                                return v36.UserId;
                            end), 
                            abuseVector = v10.AbuseVector.Voice
                        });
                        l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v37);
                        v30.analyticsDispatch({
                            type = v10.AnalyticsActions.SetSubmissionCompleted
                        });
                        v30.showReportSentPage(l_allegedAbuser_0);
                    end);
                end);
                return;
            end;
        elseif l_methodOfAbuse_1 == v10.AbuseMethods.TextChat or l_methodOfAbuse_1 == v10.AbuseMethods.Other and not v11.getReportAnythingAvatarEnabled() or l_methodOfAbuse_1 == nil then
            if isEligibleForTextSubmit(v28) then
                if l_FFlagInGameMenuAddChatLineReporting_0 and v28.selectedMessage then
                    v13({
                        localPlayerUserId = l_Players_0.LocalPlayer.UserId, 
                        abuserUserId = v28.selectedMessage.userId, 
                        abuseReason = l_abuseReason_0, 
                        selectedMessage = v28.selectedMessage, 
                        abuseDescription = v28.comment, 
                        orderedMessages = v28.orderedMessages, 
                        reportTargetUser = v28.selectedMessage.userId
                    });
                else
                    spawn(function() --[[ Line: 125 ]]
                        -- upvalues: l_Players_0 (ref), l_allegedAbuser_0 (copy), l_abuseReason_0 (copy), v28 (copy)
                        l_Players_0:ReportAbuse(l_allegedAbuser_0, l_abuseReason_0, v28.comment);
                    end);
                end;
                v30.analyticsDispatch({
                    type = v10.AnalyticsActions.SetSubmissionCompleted
                });
                local v38 = v5(l_abuseReason_0);
                v30.onReportComplete(v38);
                return;
            end;
        elseif (l_methodOfAbuse_1 == v10.AbuseMethods.Other or l_methodOfAbuse_1 == v10.AbuseMethods.Avatar) and isEligibleForRAOtherSubmit(v28) then
            pcall(function() --[[ Line: 135 ]]
                -- upvalues: v8 (ref), l_Players_0 (ref), l_allegedAbuserId_0 (copy), v28 (copy), l_abuseReason_0 (copy), v9 (ref), v30 (copy), l_methodOfAbuse_1 (copy), v10 (ref), v5 (ref)
                task.spawn(function() --[[ Line: 136 ]]
                    -- upvalues: v8 (ref), l_Players_0 (ref), l_allegedAbuserId_0 (ref), v28 (ref), l_abuseReason_0 (ref), v9 (ref), v30 (ref), l_methodOfAbuse_1 (ref), v10 (ref), v5 (ref)
                    local v39 = v8.buildOtherReportRequest({
                        localUserId = l_Players_0.LocalPlayer.UserId, 
                        formSelectedAbuserUserId = l_allegedAbuserId_0, 
                        abuseComment = v28.comment, 
                        abuseReason = l_abuseReason_0, 
                        menuEntryPoint = v9:getAbuseReportSessionEntryPoint(), 
                        variant = v8.Constants.Variant.NM
                    }, v30.reportAnythingState, v30.reportAnythingAnalytics.getAccumulatedParameters());
                    if game:GetEngineFeature("WHAM2165") and l_methodOfAbuse_1 == v10.AbuseMethods.Avatar then
                        l_Players_0:ReportAvatarAbuse(l_allegedAbuserId_0, v39);
                    else
                        l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v39);
                    end;
                    v30.analyticsDispatch({
                        type = v10.AnalyticsActions.SetSubmissionCompleted
                    });
                    local v40 = v5(l_abuseReason_0, true);
                    v30.onReportComplete(v40);
                end);
            end);
        end;
    end, 
    fieldLabel = "", 
    componentName = "SubmitButton"
};