local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local v6 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local v9 = require(script.Parent.Parent.Config.FlyoutContentSettings);
return function(v10) --[[ Line: 19 ]] --[[ Name: FlyoutReportLogs ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v1 (copy), v9 (copy), v6 (copy), l_useLocalization_0 (copy), v3 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v11 = l_useRoactService_0(l_AppEventIngestService_0);
    local v13 = v1.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v9 (ref), v6 (ref), v11 (copy)
        v10.closeDrawer();
        if v10.openReportLogConfirmation then
            v10.openReportLogConfirmation();
        end;
        local l_ReportLogs_0 = v9.ItemType.ReportLogs;
        v6.sendMoreLegacyAndFlyoutItemClickEvent(v11, l_ReportLogs_0);
    end, {
        v10.openReportLogConfirmation, 
        v10.closeDrawer, 
        v11
    });
    local v14 = l_useLocalization_0({
        text = "CommonUI.Features.Label.ReportLogs"
    });
    return v1.createElement(v3.Button, {
        text = v14.text, 
        variant = l_ButtonVariant_0.Standard, 
        LayoutOrder = v10.layoutOrder, 
        isDisabled = false, 
        size = l_ButtonSize_0.Large, 
        width = UDim.new(1, 0), 
        onActivated = v13
    });
end;