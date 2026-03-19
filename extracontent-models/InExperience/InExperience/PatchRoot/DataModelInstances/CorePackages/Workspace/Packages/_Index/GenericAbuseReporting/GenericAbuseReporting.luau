local v0 = require(script.Enums.AbuseEntrypoint);
local v1 = require(script.Enums.AbuseVector);
return {
    Components = {
        ReportCompleteDialog = require(script.Dialogs.ReportCompleteDialog), 
        ReportFailedDialog = require(script.Dialogs.ReportFailedDialog)
    }, 
    Enums = {
        AbuseCategory = require(script.Enums.AbuseCategory), 
        AbuseEntrypoint = v0, 
        AbuseVector = v1
    }, 
    Thunks = {
        OpenDynamicAbuseReport = require(script.Thunks.OpenDynamicAbuseReport)
    }, 
    UXFlows = {
        DefaultTwoStepReportFlow = require(script.UXFlow.ReportWithReasonAndComment.AREntrypoint), 
        DefaultReportDialog = require(script.UXFlow.ReportWithReasonAndComment.ReportWithReasonAndComment), 
        DefaultDualDropdownDialog = require(script.UXFlow.DualDropdownReport.DualDropdownReport), 
        DefaultDualDropdownDialogV2 = require(script.UXFlow.DualDropdownReport.DualDropdownReportV2), 
        DynamicReportContainer = require(script.UXFlow.DynamicReport.DynamicReportContainer)
    }, 
    ["jest.config"] = script["jest.config"]
};