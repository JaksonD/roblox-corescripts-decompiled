local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.tutils);
local v5 = require(l_Parent_0.Http);
local l_Url_0 = v5.Url;
local l_StatusCodes_0 = v5.StatusCodes;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v9 = require(script.Parent.formatBugReportContent);
local v10 = require(script.Parent.Parent.SharedConstants);
local l_BugReporterErrorType_0 = require(script.Parent.Parent.BugReporterTypes).BugReporterErrorType;
local v12 = game:DefineFastInt("InAppBugReporterMaxTitleLength", 100);
local v13 = v3.interface({
    manufacturer = v3.string, 
    deviceName = v3.string, 
    baseOs = v3.string, 
    systemVersion = v3.string, 
    appVersion = v3.string, 
    networkType = v3.string
});
local v14 = v3.strictInterface({
    screen = v3.string, 
    locale = v3.string, 
    clientChannel = v3.string, 
    coreScriptVersion = v3.string
});
local v15 = v3.strictInterface({
    userId = v3.number, 
    userDisplayName = v3.string, 
    screenshotId = v3.string, 
    description = v3.string, 
    logUrl = v3.string, 
    systemInfo = v13, 
    additionalInfo = v14
});
local v16 = v3.interface({
    responseBody = v3.strictInterface({
        issue = v3.interface({
            id = v3.string
        })
    }), 
    responseCode = v3.number
});
local v17 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "feedback/v1/issues"
});
return function(v18, v19) --[[ Line: 63 ]]
    -- upvalues: v15 (copy), v12 (copy), l_mutedError_0 (copy), v9 (copy), v10 (copy), v17 (copy), l_StatusCodes_0 (copy), v2 (copy), l_BugReporterErrorType_0 (copy), v16 (copy), v4 (copy)
    local v20, v21 = v15(v19);
    local l_v12_0 = v12;
    if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ and not v20 then
        l_mutedError_0(v21);
    end;
    local v23 = v9(v19, l_v12_0);
    local v24 = {
        channel = v10.ISSUE_CHANNEL, 
        title = v23.title, 
        description = v23.description, 
        attachmentUniformResourceNames = {
            (("%*:%*"):format(v10.SCREENSHOT_URN_PREFIX, v19.screenshotId))
        }
    };
    return v18(v17(), "POST", {
        postBody = v24
    }):andThen(function(v25) --[[ Line: 85 ]]
        -- upvalues: l_StatusCodes_0 (ref), v2 (ref), l_BugReporterErrorType_0 (ref), v16 (ref), v4 (ref)
        if v25.responseCode ~= l_StatusCodes_0.OK then
            return v2.reject({
                type = l_BugReporterErrorType_0.UnexpectedResponseCode, 
                message = ("Unexpected response code: %*"):format(v25.responseCode)
            });
        else
            local v26, v27 = v16(v25);
            if not v26 then
                return v2.reject({
                    type = l_BugReporterErrorType_0.UnexpectedResponseBody, 
                    message = ("Unexpected response body: %* \n%*"):format(v27, (v4.toString(v25.responseBody)))
                });
            else
                return v2.resolve(v25.responseBody);
            end;
        end;
    end, function(v28) --[[ Line: 102 ]]
        -- upvalues: v2 (ref), l_BugReporterErrorType_0 (ref)
        return v2.reject({
            type = l_BugReporterErrorType_0.FailedToUploadBugReport, 
            message = ("Request failure %* %*"):format(v28.StatusCode, v28.StatusMessage)
        });
    end);
end;