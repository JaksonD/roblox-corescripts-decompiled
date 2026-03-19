local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local _ = require(l_Parent_0.SystemInfoProtocol);
local v2 = {
    FailedToCaptureScreenshot = "FailedToCaptureScreenshot", 
    FailedToUploadScreenshot = "FailedToUploadScreenshot", 
    FailedToUploadDeviceLogs = "FailedToUploadDeviceLogs", 
    InvalidBugReportMetadata = "InvalidBugReportMetadata", 
    FailedToUploadBugReport = "FailedToUploadBugReport", 
    UnexpectedResponseBody = "UnexpectedResponseBody", 
    UnexpectedResponseCode = "UnexpectedResponseCode"
};
local v3 = {
    ReportInitiated = "ReportInitiated", 
    ReportOpened = "ReportOpened", 
    ReportSubmitted = "ReportSubmitted", 
    ReportSucceeded = "ReportSucceeded", 
    ReportAbandoned = "ReportAbandoned", 
    ScreenshotCaptured = "ScreenshotCaptured", 
    ScreenshotUploaded = "ScreenshotUploaded"
};
return {
    BugReporterErrorType = v2, 
    BugReporterCounterName = v3
};