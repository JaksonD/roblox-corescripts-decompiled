local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.OpenReportMenu);
local v5 = require(l_Parent_0.Actions.CloseReportMenu);
local _ = require(l_Parent_0.Actions.OpenReportDialog);
local _ = require(l_Parent_0.Actions.OpenCategoryMenu);
local v8 = require(l_Parent_0.Actions.SelectReportCategory);
local v9 = require(l_Parent_0.Actions.OpenReportSentDialog);
local _ = require(l_Parent_0.Actions.CloseReportSentDialog);
local v11 = require(l_Parent_0.Actions.SelectReportListing);
local v12 = require(l_Parent_0.Actions.SetVoiceReportingFlow);
local v13 = require(l_Parent_0.Actions.SetIdentifiedAvatars);
local v14 = require(l_Parent_0.Actions.SetSelectedAvatars);
local v15 = require(l_Parent_0.Actions.BeginReportFlow);
local v16 = require(l_Parent_0.Actions.EndReportFlow);
local v17 = require(l_Parent_0.Actions.ScreenshotAnnotated);
local v18 = require(l_Parent_0.Actions.NavigateBack);
local v19 = require(l_Parent_0.Resources.Constants);
local v20 = require(l_Parent_0.Flags.GetFFlagReportAnythingScreenshot);
return v2.createReducer({
    currentPage = v19.Page.None, 
    history = {}, 
    voiceReportingFlowEnabled = true, 
    reportType = v19.ReportType.Any, 
    beginningReportType = v19.ReportType.Any, 
    reportCategory = v19.Category.None, 
    targetPlayer = nil, 
    beginningTimestamp = 0, 
    sortedUserIds = {}, 
    screenshotAnnotationPoints = {}, 
    identifiedAvatars = {}, 
    selectedAvatars = {}
}, {
    [v16.name] = function(v21, _) --[[ Line: 41 ]]
        -- upvalues: v1 (copy), v19 (copy)
        return v1.Dictionary.join(v21, {
            history = {}, 
            currentPage = v19.Page.None, 
            targetPlayer = v1.None, 
            reportType = v19.ReportType.Any, 
            identifiedAvatars = {}, 
            selectedAvatars = {}, 
            screenshotAnnotationPoints = {}
        });
    end, 
    [v15.name] = function(v23, v24) --[[ Line: 52 ]]
        -- upvalues: v19 (copy), v1 (copy)
        local v25 = {
            reportCategory = v19.Category.None, 
            beginningTimestamp = workspace:GetServerTimeNow(), 
            sortedUserIds = {}, 
            history = {
                v19.Page.None
            }
        };
        if v24.reportType == v19.ReportType.Place then
            return v1.Dictionary.join(v23, v25, {
                reportType = v24.reportType, 
                beginningReportType = v24.reportType, 
                currentPage = v19.Page.ReportForm, 
                targetPlayer = v1.None
            });
        elseif v24.reportType == v19.ReportType.Player then
            return v1.Dictionary.join(v23, v25, {
                reportType = v24.reportType, 
                beginningReportType = v24.reportType, 
                targetPlayer = v24.targetPlayer, 
                currentPage = if v23.voiceReportingFlowEnabled then v19.Page.Category else v19.Page.ReportForm
            });
        else
            return v1.Dictionary.join(v23, v25, {
                reportType = v19.ReportType.Any, 
                beginningReportType = v19.ReportType.Any, 
                targetPlayer = v1.None, 
                currentPage = if v23.voiceReportingFlowEnabled then v19.Page.Category else v19.Page.Listing
            });
        end;
    end, 
    [v18.name] = function(v26, _) --[[ Line: 86 ]]
        -- upvalues: v1 (copy)
        local v28 = v26.history[#v26.history] or v26.currentPage;
        local v29 = v1.List.removeIndex(v26.history, #v26.history);
        return v1.Dictionary.join(v26, {
            history = v29, 
            currentPage = v28
        });
    end, 
    [v8.name] = function(v30, v31) --[[ Line: 95 ]]
        -- upvalues: v19 (copy), v20 (copy), v1 (copy)
        local v32 = v31.reportCategory == v19.Category.Experience;
        local v33 = v30.beginningReportType == v19.ReportType.Player;
        local l_Listing_0 = v19.Page.Listing;
        local l_reportType_0 = v30.reportType;
        if v20() then
            if v32 then
                l_Listing_0 = v19.Page.ScreenshotDialog;
                l_reportType_0 = v19.ReportType.Place;
            elseif v33 then
                l_Listing_0 = v19.Page.ReportForm;
            end;
        elseif v32 or v33 then
            l_Listing_0 = v19.Page.ReportForm;
            if v32 then
                l_reportType_0 = v19.ReportType.Place;
            end;
        end;
        local v36 = v1.List.join(v30.history, {
            v30.currentPage
        });
        return v1.Dictionary.join(v30, {
            history = v36, 
            currentPage = l_Listing_0, 
            reportType = l_reportType_0, 
            reportCategory = v31.reportCategory
        });
    end, 
    [v11.name] = function(v37, v38) --[[ Line: 129 ]]
        -- upvalues: v1 (copy), v19 (copy)
        local v39 = v1.List.join(v37.history, {
            v37.currentPage
        });
        return v1.Dictionary.join(v37, {
            sortedUserIds = v1.List.join(v38.sortedUserIds or {}, {}), 
            history = v39, 
            currentPage = v19.Page.ReportForm, 
            reportType = v38.reportType, 
            targetPlayer = v38.targetPlayer or v1.None
        });
    end, 
    [v17.name] = function(v40, v41) --[[ Line: 140 ]]
        -- upvalues: v1 (copy), v19 (copy)
        local v42 = v1.List.join(v40.history, {
            v40.currentPage
        });
        local l_ReportForm_0 = v19.Page.ReportForm;
        return v1.Dictionary.join(v40, {
            history = v42, 
            currentPage = l_ReportForm_0, 
            screenshotAnnotationPoints = v41.annotationPoints
        });
    end, 
    [v4.name] = function(v44, _) --[[ Line: 151 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v44, {
            isReportMenuOpen = true
        });
    end, 
    [v5.name] = function(v46, _) --[[ Line: 156 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v46, {
            isReportMenuOpen = false
        });
    end, 
    [v9.name] = function(v48, v49) --[[ Line: 161 ]]
        -- upvalues: v1 (copy), v19 (copy)
        return v1.Dictionary.join(v48, {
            currentPage = v19.Page.ReportSent, 
            reportType = v49.reportType, 
            targetPlayer = v49.targetPlayer or v1.None
        });
    end, 
    [v12.name] = function(v50, v51) --[[ Line: 168 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v50, {
            voiceReportingFlowEnabled = v51.enable
        });
    end, 
    [v13.name] = function(v52, v53) --[[ Line: 173 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v52, {
            identifiedAvatars = v53.identifiedAvatars, 
            screenshotAnnotationPoints = {}
        });
    end, 
    [v14.name] = function(v54, v55) --[[ Line: 179 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v54, {
            selectedAvatars = v55.selectedAvatars
        });
    end
});