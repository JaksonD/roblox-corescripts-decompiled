local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_RobloxLocaleIdKey_0 = require(l_Parent_0.Localization).RobloxLocaleIdKey;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_getCurrentRouteState_0 = require(l_Parent_0.Navigation).getCurrentRouteState;
local l_useCurrentCamera_0 = require(l_Parent_0.RobloxAppHooks).useCurrentCamera;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local l_InfoNames_0 = l_SystemInfoProtocol_0.InfoNames;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local _ = require(script.Parent.BugReporterModal);
local l_BugReporterCounterName_0 = require(script.Parent.BugReporterTypes).BugReporterCounterName;
local v16 = require(script.Parent.SharedConstants);
local v17 = {
    [l_InfoNames_0.APP_VERSION] = "Feature.InAppBugReporting.Message.AppVersion", 
    [l_InfoNames_0.DEVICE_NAME] = "Feature.InAppBugReporting.Message.DeviceName", 
    [l_InfoNames_0.SYSTEM_VERSION] = "Feature.InAppBugReporting.Message.SystemVersion", 
    [v16.SCREEN_SUMMARY_KEY] = "Feature.InAppBugReporting.Message.Screen"
};
local function _(v18, v19, v20) --[[ Line: 51 ]] --[[ Name: validateCommentText ]]
    local v21 = false;
    local v22 = nil;
    if type(v19) ~= "string" or v19 == "" then
        return v21, v18.commentEmptyError;
    else
        if #v19 < v20 then
            v22 = v18.commmentTooShortError;
        end;
        if v20 <= #v19 then
            v21 = true;
        end;
        return v21, v22;
    end;
end;
local function v29(v24, v25) --[[ Line: 75 ]] --[[ Name: makeDeviceLocalizationKeys ]]
    -- upvalues: v1 (copy), v16 (copy), v17 (copy)
    return v1.reduce(v16.DEVICE_SUMMARY_ORDERED_KEYS, function(v26, v27) --[[ Line: 76 ]]
        -- upvalues: v24 (copy), v25 (copy), v17 (ref)
        local v28 = v24[v27] or v25[v27] or ("Unknown (%*)"):format(v27);
        v26[v27] = {
            v17[v27]; 
            value = v28
        };
        return v26;
    end, {});
end;
local function _(v30) --[[ Line: 83 ]] --[[ Name: formatDeviceSummaryString ]]
    -- upvalues: v1 (copy), v16 (copy)
    local v32 = v1.map(v16.DEVICE_SUMMARY_ORDERED_KEYS, function(v31) --[[ Line: 84 ]]
        -- upvalues: v30 (copy)
        return v30[v31];
    end);
    return table.concat(v32, "\n");
end;
local function _(v34) --[[ Line: 91 ]]
    -- upvalues: l_getCurrentRouteState_0 (copy)
    local v35 = l_getCurrentRouteState_0(v34);
    return v35 and v35.routeName or "Unknown";
end;
local function _(v37) --[[ Line: 96 ]] --[[ Name: round ]]
    return (math.floor(v37 or 0.5));
end;
return function(v39) --[[ Line: 100 ]] --[[ Name: useBugReporterModalProps ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useCurrentCamera_0 (copy), v2 (copy), l_getCurrentRouteState_0 (copy), l_SystemInfoProtocol_0 (copy), l_useProperty_0 (copy), v29 (copy), v16 (copy), l_useLocalization_0 (copy), v1 (copy), l_RobloxLocaleIdKey_0 (copy), l_BugReporterCounterName_0 (copy)
    local v40 = l_useNavigation_0();
    local v41 = l_useDispatch_0();
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local v43 = l_useCurrentCamera_0();
    local v44 = v2.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: v43 (copy)
        return Vector2.new(math.floor(v43.ViewportSize.X or 0.5), (math.floor(v43.ViewportSize.Y or 0.5)));
    end, {
        v43.ViewportSize.X, 
        v43.ViewportSize.Y
    });
    local v45, v46 = v2.useState("");
    local v47, v48 = v2.useState(0);
    local v49, v50 = v2.useState("");
    local v51, v52 = v2.useState(nil);
    local v53 = #(v49 or "");
    local v56 = v2.useMemo(function() --[[ Line: 116 ]]
        -- upvalues: v39 (copy)
        local _, v55 = v39.guiService:GetGuiInset();
        return v55.Y;
    end, {
        v39.guiService
    });
    local v58 = v2.useMemo(function() --[[ Line: 121 ]]
        -- upvalues: v40 (copy), l_getCurrentRouteState_0 (ref)
        local v57 = l_getCurrentRouteState_0(v40);
        return v57 and v57.routeName or "Unknown";
    end, {
        v40
    });
    local v59 = v2.useMemo(function() --[[ Line: 124 ]]
        -- upvalues: v39 (copy), l_SystemInfoProtocol_0 (ref)
        return (v39.systemInfoProtocol:getSystemInfo(l_SystemInfoProtocol_0.ALL_INFO_NAMES));
    end, {
        v39.systemInfoProtocol
    });
    local v60 = l_useProperty_0(v39.userInputService, "OnScreenKeyboardSize");
    local v61 = v2.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v29 (ref), v59 (copy), v16 (ref), v58 (copy)
        return v29(v59, {
            [v16.SCREEN_SUMMARY_KEY] = v58
        });
    end, {
        v59, 
        v58
    });
    local v62 = l_useLocalization_0(v1.assign({
        title = "Feature.InAppBugReporting.Message.Title", 
        commentLabel = "Feature.InAppBugReporting.Message.CommentLabel", 
        commentPlaceholder = "Feature.InAppBugReporting.Message.CommentPlaceholder", 
        commentCharacterCount = {
            "Feature.InAppBugReporting.Message.MinCharacterCount"; 
            currentCount = v53, 
            minCount = v39.minCommentLength
        }, 
        commentEmptyError = "Feature.InAppBugReporting.Message.CommentEmptyError", 
        commentTooShortError = {
            "Feature.InAppBugReporting.Message.CommentTooShortError"; 
            minLength = v39.minCommentLength
        }, 
        screenshotAnnotation = "Feature.InAppBugReporting.Message.ScreenshotAnnotation", 
        submit = "CommonUI.Controls.Action.Submit"
    }, v61));
    local v64 = v1.map(v16.DEVICE_SUMMARY_ORDERED_KEYS, function(v63) --[[ Line: 84 ]]
        -- upvalues: v62 (copy)
        return v62[v63];
    end);
    local v65 = table.concat(v64, "\n");
    v64 = v62[l_RobloxLocaleIdKey_0];
    local v66 = v2.useMemo(function() --[[ Line: 157 ]]
        -- upvalues: v16 (ref), v58 (copy), v64 (copy), v39 (copy)
        return {
            [v16.SCREEN_SUMMARY_KEY] = v58, 
            locale = v64, 
            clientChannel = v39.runService:GetRobloxClientChannel(), 
            coreScriptVersion = v39.runService:GetCoreScriptVersion()
        };
    end, {
        v58, 
        v64, 
        v39.runService
    });
    local v67 = v2.useMemo(function() --[[ Line: 166 ]]
        -- upvalues: v62 (copy)
        return {
            commentEmptyError = v62.commentEmptyError, 
            commmentTooShortError = v62.commmentTooShortError
        };
    end, {
        v62.commentEmptyError, 
        v62.commmentTooShortError
    });
    local l_minCommentLength_0 = v39.minCommentLength;
    local v69 = false;
    local v70 = nil;
    local v71;
    if type(v49) ~= "string" or v49 == "" then
        v70 = v67.commentEmptyError;
        v71 = v69;
    else
        if #v49 < l_minCommentLength_0 then
            v70 = v67.commmentTooShortError;
        end;
        if l_minCommentLength_0 <= #v49 then
            v69 = true;
        end;
        v71 = v69;
    end;
    l_minCommentLength_0 = v2.useCallback(function() --[[ Line: 175 ]]
        -- upvalues: v39 (copy), l_BugReporterCounterName_0 (ref), v58 (copy)
        v39.logger.reportCounter(l_BugReporterCounterName_0.ReportOpened);
        v39.logger.reportMilestone(l_BugReporterCounterName_0.ReportOpened, {
            screen = v58
        });
    end, {
        v39.logger, 
        v58
    });
    v69 = v2.useCallback(function() --[[ Line: 181 ]]
        -- upvalues: v67 (copy), v49 (copy), v39 (copy), v45 (copy), v59 (copy), v66 (copy), v52 (copy), v41 (copy)
        local l_v67_0 = v67;
        local l_v49_0 = v49;
        local l_minCommentLength_1 = v39.minCommentLength;
        local v75 = false;
        local v76 = nil;
        local v77, v78;
        if type(l_v49_0) ~= "string" or l_v49_0 == "" then
            v76 = l_v67_0.commentEmptyError;
            v77 = v75;
            v78 = v76;
        else
            if #l_v49_0 < l_minCommentLength_1 then
                v76 = l_v67_0.commmentTooShortError;
            end;
            if l_minCommentLength_1 <= #l_v49_0 then
                v75 = true;
            end;
            v77 = v75;
            v78 = v76;
        end;
        if v77 then
            v39.onSubmitBugReport(v39.logger, {
                screenshotId = v45, 
                description = v49, 
                systemInfo = v59, 
                additionalInfo = v66
            });
            v52(nil);
            v41(v39.closeCentralOverlayThunk());
            return;
        else
            v52(v78);
            return;
        end;
    end, {
        v41, 
        v67, 
        v45, 
        v49, 
        v59, 
        v66, 
        v39.minCommentLength, 
        v39.closeCentralOverlayThunk, 
        v39.onSubmitBugReport, 
        v39.logger
    });
    v70 = v2.useCallback(function() --[[ Line: 211 ]]
        -- upvalues: v39 (copy), l_BugReporterCounterName_0 (ref), v58 (copy), v41 (copy)
        v39.logger.reportCounter(l_BugReporterCounterName_0.ReportAbandoned);
        v39.logger.reportMilestone(l_BugReporterCounterName_0.ReportAbandoned, {
            screen = v58
        });
        v41(v39.closeCentralOverlayThunk());
    end, {
        v41, 
        v39.closeCentralOverlayThunk, 
        v39.logger, 
        v58
    });
    local v80 = v2.useCallback(function(v79) --[[ Line: 217 ]]
        -- upvalues: v50 (copy)
        v50(v79.Text);
    end, {});
    local v82 = v2.useCallback(function(v81) --[[ Line: 221 ]]
        -- upvalues: v48 (copy)
        v48(v81.AbsoluteContentSize.Y);
    end, {});
    v2.useEffect(function() --[[ Line: 225 ]]
        -- upvalues: v39 (copy), v46 (copy)
        local v84 = v39.onScreenshotUploaded:connect(function(v83) --[[ Line: 226 ]]
            -- upvalues: v46 (ref)
            v46(v83);
        end);
        return function() --[[ Line: 230 ]]
            -- upvalues: v84 (copy)
            v84:disconnect();
        end;
    end, {
        v39.onScreenshotUploaded
    });
    local v85 = v2.useMemo(function() --[[ Line: 236 ]]
        -- upvalues: v44 (copy), v56 (copy), v59 (copy), v65 (copy), v39 (copy), v60 (copy), v47 (copy), v82 (copy), v49 (copy), v51 (copy), v80 (copy), v71 (copy), v69 (copy), l_minCommentLength_0 (copy), v70 (copy)
        return {
            screenSize = v44, 
            bottomInset = v56, 
            systemInfo = v59, 
            localizedDeviceSummary = v65, 
            screenshotContentId = v39.screenshotLocalId, 
            onScreenKeyboardSize = v60, 
            scrollContentHeight = v47, 
            onListLayoutSizeChange = v82, 
            commentText = v49, 
            commentErrorMessage = v51, 
            onCommentTextChange = v80, 
            canSubmit = v71, 
            onSubmit = v69, 
            onLoad = l_minCommentLength_0, 
            onClose = v70
        };
    end, {
        v44, 
        v56, 
        v59, 
        v65, 
        v39.screenshotLocalId, 
        v60, 
        v47, 
        v82, 
        v49, 
        v51, 
        v80, 
        v71, 
        v69, 
        l_minCommentLength_0, 
        v70
    });
    return v1.assign(v85, {
        designTokens = l_Tokens_0, 
        localizedStrings = v62
    });
end;