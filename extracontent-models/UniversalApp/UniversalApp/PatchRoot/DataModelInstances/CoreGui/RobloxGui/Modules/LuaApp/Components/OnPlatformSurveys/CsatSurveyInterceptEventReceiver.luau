local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.Cryo);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v13 = require(l_CorePackages_0.Packages.t);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v15 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v17 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v19 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v20 = require(l_Modules_0.LuaApp.Http.Requests.GetSurvey);
local v21 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForSurveyPrompt);
local v22 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForSurveyPromptWithSurvBlox);
local v23 = require(script.Parent.CsatSurveyConstants);
local v24 = require(script.Parent.CsatSurveyInterceptUtils);
local v25 = require(script.Parent.CsatSurveyTelemetryConfig);
local v26 = require(script.Parent.GetFFlagSurvBloxEnabled);
local v27 = require(script.Parent.GetFFlagSurvBloxLocalStorageEnabled);
local v28 = require(script.Parent.GetFFlagSurvBloxAddSurveyLinkParamsEnabled);
local v29 = require(script.Parent.GetFIntSurvBloxRequiredCooldownMs);
local v30 = require(script.Parent.GetFFlagSurvBloxTrackingFixes);
local l_FFlagEnableSurveyPromptOnAbuseReport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSurveyPromptOnAbuseReport;
local v32 = v9.PureComponent:extend("CsatSurveyInterceptEventReceiver");
v32.validateProps = v13.strictInterface({
    RobloxEventReceiver = v13.table, 
    baseUrlFormat = v13.optional(v13.string), 
    surveyId = v13.optional(v13.string), 
    isQualified = v13.optional(v13.boolean), 
    restrictTextInput = v13.boolean, 
    openWebView = v13.callback, 
    openSurveyPrompt = v13.optional(v13.callback), 
    openSurveyPromptWithSurvBlox = v13.optional(v13.callback), 
    eventType = v13.optional(v13.string), 
    showPrompt = v13.optional(v13.boolean), 
    analyticsService = v13.optional(v13.union(v13.Instance, v13.table)), 
    titleText = v13.optional(v13.string), 
    bodyText = v13.optional(v13.string), 
    cancelButtonText = v13.optional(v13.string), 
    confirmButtonText = v13.optional(v13.string), 
    sessionService = v13.optional(v13.union(v13.Instance, v13.table)), 
    localization = v13.optional(v13.table), 
    surveyName = v13.optional(v13.string), 
    menuVersion = v13.optional(v13.string), 
    networking = v13.callback
});
v32.defaultProps = {
    baseUrlFormat = "", 
    surveyId = "", 
    isQualified = false, 
    restrictTextInput = false, 
    eventType = "", 
    showPrompt = false, 
    analyticsService = l_RbxAnalyticsService_0, 
    titleText = "", 
    bodyText = "", 
    cancelButtonText = "", 
    confirmButtonText = "", 
    surveyName = "", 
    menuVersion = ""
};
v32.getSurveyUrl = function(v33, v34, _) --[[ Line: 82 ]] --[[ Name: getSurveyUrl ]]
    -- upvalues: v13 (copy), l_Players_0 (copy), v26 (copy), v20 (copy), v30 (copy), v28 (copy), v19 (copy), v23 (copy)
    assert(v13.boolean(v33.props.restrictTextInput));
    local v36 = v34 or tostring(l_Players_0.LocalPlayer.UserId);
    assert(v13.string(v36));
    local v37 = v33.props.sessionService:generateSessionInfoString(false, true, false, false);
    if v26() then
        local v38, v39 = v20(v33.props.networking):await();
        if v30() then
            if v38 and v39 then
                v33:trackSurveyIdLocally();
                if v39.shouldPromptSurvey then
                    if v28() then
                        return v19.fromString(v39.surveyLink)({
                            userId = v36 or "0", 
                            restrictTextInput = tostring(v33.props.restrictTextInput) or "true", 
                            sessionIds = v37
                        });
                    else
                        return v39.surveyLink;
                    end;
                end;
            end;
        elseif v38 and v39 and v39.shouldPromptSurvey then
            if v28() then
                return v19.fromString(v39.surveyLink)({
                    userId = v36 or "0", 
                    restrictTextInput = tostring(v33.props.restrictTextInput) or "true", 
                    sessionIds = v37
                });
            else
                return v39.surveyLink;
            end;
        end;
        return "";
    else
        assert(v13.string(v33.props.baseUrlFormat));
        assert(v13.string(v33.props.surveyId));
        return (v19.fromString(v33.props.baseUrlFormat)({
            surveyId = v33.props.surveyId or "", 
            userId = v36 or "0", 
            restrictTextInput = tostring(v33.props.restrictTextInput) or "true", 
            sessionIds = v37, 
            menuVersion = v33.props.surveyName == v23.CHROME_SURVEY_NAME and v33.props.menuVersion or ""
        }));
    end;
end;
v32.getCompletedSurveyIds = function(v40) --[[ Line: 140 ]] --[[ Name: getCompletedSurveyIds ]]
    -- upvalues: l_AppStorageService_0 (copy), v23 (copy), l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 142 ]]
        -- upvalues: l_AppStorageService_0 (ref), v23 (ref)
        return l_AppStorageService_0:GetItem(v23.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS);
    end);
    if l_status_0 and l_result_0 ~= "" then
        return l_HttpService_0:JSONDecode(l_result_0);
    else
        warn("Unable to fetch completed survey ids from app storage ", l_result_0);
        v40.props.analyticsService:SetRBXEventStream(v23.ANALYTICS_CONTEXT_APP, v23.ANALYTICS_SURVEY_EVENT, v23.ANALYTICS_EXPERIMENT_MENU_GET_COMPLETED_SURVEY_IDS_FIELD, {
            error = l_result_0
        });
        return {};
    end;
end;
v32.hasCompletedSurvey = function(v43) --[[ Line: 163 ]] --[[ Name: hasCompletedSurvey ]]
    -- upvalues: v13 (copy)
    assert(v13.string(v43.props.surveyId));
    for _, v45 in ipairs(v43.completedSurveyIds) do
        if v45 == v43.props.surveyId then
            return true;
        end;
    end;
    return false;
end;
v32.trackSurveyIdLocally = function(v46) --[[ Line: 175 ]] --[[ Name: trackSurveyIdLocally ]]
    -- upvalues: v26 (copy), v27 (copy), l_AppStorageService_0 (copy), v23 (copy), v13 (copy), v10 (copy), l_HttpService_0 (copy)
    if v26() then
        if v27() then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 178 ]]
                -- upvalues: l_AppStorageService_0 (ref), v23 (ref)
                l_AppStorageService_0:SetItem(v23.LOCAL_STORAGE_KEY_CSAT_LAST_SURVBLOX_CALL_TIMESTAMP, (tostring(DateTime.now().UnixTimestampMillis)));
                l_AppStorageService_0:Flush();
            end);
            if not l_status_1 then
                warn("Uncaught exception for setting last SurvBlox call timestamp on app storage", l_result_1);
                return;
            end;
        end;
    else
        assert(v13.string(v46.props.surveyId));
        if v46:hasCompletedSurvey() then
            return;
        else
            if #v46.completedSurveyIds >= v23.LOCAL_STORAGE_CSAT_SURVEY_IDS_LIMIT then
                v46.completedSurveyIds = v10.List.getRange(v46.completedSurveyIds, 2, #v46.completedSurveyIds);
            end;
            table.insert(v46.completedSurveyIds, v46.props.surveyId);
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 208 ]]
                -- upvalues: l_HttpService_0 (ref), v46 (copy), l_AppStorageService_0 (ref), v23 (ref)
                local v49 = l_HttpService_0:JSONEncode(v46.completedSurveyIds);
                l_AppStorageService_0:SetItem(v23.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, v49 or "{}");
                l_AppStorageService_0:Flush();
            end);
            if not l_status_2 then
                warn("Uncaught exception for setting completed CSAT survey ids on app storage", l_result_2);
                v46.props.analyticsService:SetRBXEventStream(v23.ANALYTICS_CONTEXT_APP, v23.ANALYTICS_SURVEY_EVENT, v23.ANALYTICS_EXPERIMENT_MENU_SET_COMPLETED_SURVEY_IDS_FIELD, {
                    error = l_result_2
                });
            end;
        end;
    end;
end;
v32.canShowSurvey = function(v52) --[[ Line: 229 ]] --[[ Name: canShowSurvey ]]
    -- upvalues: v26 (copy), v27 (copy), l_AppStorageService_0 (copy), v23 (copy), v25 (copy), v29 (copy), v13 (copy), v24 (copy)
    if v26() then
        if v27() then
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 232 ]]
                -- upvalues: l_AppStorageService_0 (ref), v23 (ref)
                return l_AppStorageService_0:GetItem(v23.LOCAL_STORAGE_KEY_CSAT_LAST_SURVBLOX_CALL_TIMESTAMP);
            end);
            if not l_status_3 then
                warn("Unable to fetch last time a call to SurvBlox was made ", l_result_3);
                v25.logGetLastSurvBloxCallTimestampError();
            else
                local v55 = tonumber(l_result_3);
                if v55 == -1 then
                    return true;
                elseif DateTime.now().UnixTimestampMillis - v55 >= v29() then
                    return true;
                end;
            end;
            return false;
        else
            return true;
        end;
    else
        assert(v13.string(v52.props.surveyId));
        if v52.props.surveyId == "" or v52.props.surveyId == nil then
            return false;
        elseif v52:hasCompletedSurvey() then
            return false;
        elseif v52.props.surveyName == v23.CHROME_SURVEY_NAME then
            local v56 = v24.canShowChromeSurvey(v52.props.menuVersion);
            return v52.props.isQualified and v56;
        else
            return v52.props.isQualified;
        end;
    end;
end;
v32.openSurveyWebviewWithPrompt = function(v57, v58, v59) --[[ Line: 278 ]] --[[ Name: openSurveyWebviewWithPrompt ]]
    -- upvalues: v30 (copy)
    v57.surveyPromptFunc = function() --[[ Line: 279 ]]
        -- upvalues: v57 (copy), v58 (copy), v59 (copy)
        wait(0.2);
        v57.props.openWebView(v58, v59);
        v57:trackSurveyIdLocally();
    end;
    v57.surveyPromptClose = function() --[[ Line: 289 ]]
        -- upvalues: v57 (copy)
        v57:trackSurveyIdLocally();
    end;
    if v30() then
        v57.props.openSurveyPromptWithSurvBlox(v57.surveyPromptFunc, v57.surveyPromptClose);
        return;
    else
        v57.props.openSurveyPrompt(v57.surveyPromptFunc, v57.surveyPromptClose, v57.props.titleText, v57.props.bodyText, v57.props.cancelButtonText, v57.props.confirmButtonText);
        return;
    end;
end;
v32.openSurveyWebview = function(v60, v61, v62) --[[ Line: 308 ]] --[[ Name: openSurveyWebview ]]
    -- upvalues: v23 (copy), v26 (copy), v30 (copy)
    if v60:canShowSurvey() then
        local v63 = v60:getSurveyUrl(v61, v62);
        local v64 = v60.props.localization:Format(v23.WEBVIEW_NAME_KEY);
        if v26() and v63 == "" then
            return;
        elseif v30() then
            v60:openSurveyWebviewWithPrompt(v63, v64);
            return;
        elseif v60.props.showPrompt then
            v60:openSurveyWebviewWithPrompt(v63, v64);
            return;
        else
            wait(0.2);
            v60.props.openWebView(v63, v64);
            v60:trackSurveyIdLocally();
        end;
    end;
end;
v32.triggerEventTypeIsAllowed = function(v65, v66) --[[ Line: 335 ]] --[[ Name: triggerEventTypeIsAllowed ]]
    -- upvalues: v30 (copy), v23 (copy), l_FFlagEnableSurveyPromptOnAbuseReport_0 (copy)
    if v30() then
        if v66 == v23.EVENT_TYPE_ENUM.ON_LEAVE_BUTTON_CLICK then
            return true;
        elseif l_FFlagEnableSurveyPromptOnAbuseReport_0 and v66 == v23.EVENT_TYPE_ENUM.REPORT_SUBMITTED then
            return true;
        end;
    elseif v65.props.eventType == v66 and v66 == v23.EVENT_TYPE_ENUM.ON_LEAVE_BUTTON_CLICK then
        return true;
    end;
    return false;
end;
v32.init = function(v67) --[[ Line: 355 ]] --[[ Name: init ]]
    -- upvalues: v30 (copy), l_MessageBus_0 (copy), v23 (copy)
    if not v30() then
        v67.completedSurveyIds = v67:getCompletedSurveyIds();
    end;
    v67.subscriber = l_MessageBus_0.Subscriber.new();
    v67.subscriber:subscribe(v23.ON_SURVEY_EVENT_DESCRIPTOR, function(v68) --[[ Line: 364 ]]
        -- upvalues: v67 (copy), v23 (ref)
        if v67:triggerEventTypeIsAllowed(v68.eventType) then
            v67.subscriber:unsubscribe(v23.ON_SURVEY_EVENT_DESCRIPTOR);
            v67:openSurveyWebview(v68.userId, v68.customProps);
        end;
    end);
end;
v32.render = function(_) --[[ Line: 373 ]] --[[ Name: render ]]

end;
v32 = if v30() then v11.connect(nil, function(v70) --[[ Line: 376 ]]
    -- upvalues: v14 (copy), v22 (copy)
    return {
        openWebView = function(v71, v72) --[[ Line: 378 ]] --[[ Name: openWebView ]]
            -- upvalues: v70 (copy), v14 (ref)
            return v70(v14(v71, v72));
        end, 
        openSurveyPromptWithSurvBlox = function(v73, v74) --[[ Line: 381 ]] --[[ Name: openSurveyPromptWithSurvBlox ]]
            -- upvalues: v70 (copy), v22 (ref)
            v70(v22(v73, v74));
        end
    };
end)(v32) else v11.connect(nil, function(v75) --[[ Line: 387 ]]
    -- upvalues: v14 (copy), v21 (copy)
    return {
        openWebView = function(v76, v77) --[[ Line: 389 ]] --[[ Name: openWebView ]]
            -- upvalues: v75 (copy), v14 (ref)
            return v75(v14(v76, v77));
        end, 
        openSurveyPrompt = function(v78, v79, v80, v81, v82, v83) --[[ Line: 392 ]] --[[ Name: openSurveyPrompt ]]
            -- upvalues: v75 (copy), v21 (ref)
            v75(v21(v78, v79, v80, v81, v82, v83));
        end
    };
end)(v32);
if not v30() then
    v32 = v17.connectUserLayer({
        l_AppUserLayers_0.GameLeaveLayer, 
        l_AppUserLayers_0.ExperienceMenuLayer
    }, function(v84, _) --[[ Line: 419 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        local v86 = v84[l_AppUserLayers_0.GameLeaveLayer] or {};
        local v87 = v84[l_AppUserLayers_0.ExperienceMenuLayer] or {};
        return {
            baseUrlFormat = v86.baseUrlFormat, 
            surveyId = v86.surveyId, 
            isQualified = v86.isQualified, 
            eventType = v86.eventType, 
            showPrompt = v86.showPrompt, 
            titleText = v86.titleText or "", 
            bodyText = v86.bodyText or "", 
            cancelButtonText = v86.cancelButtonText or "", 
            confirmButtonText = v86.confirmButtonText or "", 
            surveyName = v86.surveyName, 
            menuVersion = v87.menuVersion
        };
    end)(v32);
end;
v32 = l_RoactAppPolicy_0.connect(function(v88, _) --[[ Line: 442 ]]
    return {
        restrictTextInput = v88.getCsatSurveyRestrictTextInput() or false
    };
end)(v32);
return (l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0, 
    localization = v15, 
    networking = l_RoactNetworking_0
})(v32));