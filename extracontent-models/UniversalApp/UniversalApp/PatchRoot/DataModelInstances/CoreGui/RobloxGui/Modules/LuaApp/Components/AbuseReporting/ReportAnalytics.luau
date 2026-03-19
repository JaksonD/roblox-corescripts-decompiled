local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v2 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local l_COMMON_FORMAT_ENTRY_POINT_0 = v2.COMMON_FORMAT_ENTRY_POINT;
local l_REPORT_ENTRYPOINT_0 = v2.REPORT_ENTRYPOINT;
local v5 = {
    platform = "", 
    dialogEntryPoint = "", 
    selectItemCount = 0, 
    backButtonClickCount = 0, 
    isSeenSummaryPage = false
};
local function v8(v6, v7) --[[ Line: 24 ]] --[[ Name: sendEventData ]]
    -- upvalues: l_EventIngestService_0 (copy)
    if v6.platform ~= "" and v6.dialogEntryPoint ~= "" then
        l_EventIngestService_0:SendEventDeferred(v6.platform, v6.dialogEntryPoint, v7, v6);
    end;
end;
local function v10(v9) --[[ Line: 35 ]] --[[ Name: getCommonFormattedEntryPoint ]]
    -- upvalues: l_COMMON_FORMAT_ENTRY_POINT_0 (copy), l_REPORT_ENTRYPOINT_0 (copy)
    if v9 == l_COMMON_FORMAT_ENTRY_POINT_0.Profile or v9 == l_COMMON_FORMAT_ENTRY_POINT_0.Chat or v9 == l_COMMON_FORMAT_ENTRY_POINT_0.Experience or v9 == l_COMMON_FORMAT_ENTRY_POINT_0.Item then
        return v9;
    elseif v9 == l_REPORT_ENTRYPOINT_0.Profile then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Profile;
    elseif v9 == l_REPORT_ENTRYPOINT_0.Chat then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Chat;
    elseif v9 == l_REPORT_ENTRYPOINT_0.ExperienceDetails then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Experience;
    elseif v9 == l_REPORT_ENTRYPOINT_0.Item then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Item;
    else
        return "";
    end;
end;
local v11 = {
    SET_BASIC_INFO = "SET_BASIC_INFO", 
    INCREMENT_SELECTION_ITEM = "INCREMENT_SELECTION_ITEM", 
    INCREMENT_BACK_BUTTON_CLICK = "INCREMENT_BACK_BUTTON_CLICK", 
    SET_IS_SEEN_SUMMARY_PAGE = "SET_IS_SEEN_SUMMARY_PAGE"
};
return {
    reportAnalyticsReducer = function(v12, v13) --[[ Line: 67 ]] --[[ Name: reportAnalyticsReducer ]]
        -- upvalues: v11 (copy), v10 (copy)
        local v14 = table.clone(v12);
        if v13.type == v11.SET_BASIC_INFO then
            v14.platform = v13.platform;
            v14.dialogEntryPoint = v10(v13.dialogEntryPoint);
            return v14;
        elseif v13.type == v11.INCREMENT_SELECTION_ITEM then
            v14.selectItemCount = v14.selectItemCount + 1;
            return v14;
        elseif v13.type == v11.INCREMENT_BACK_BUTTON_CLICK then
            v14.backButtonClickCount = v14.backButtonClickCount + 1;
            return v14;
        else
            if v13.type == v11.SET_IS_SEEN_SUMMARY_PAGE then
                v14.isSeenSummaryPage = true;
            end;
            return v14;
        end;
    end, 
    EMPTY_LOGGING_STATE = v5, 
    sendEventData = v8, 
    ActionTypes = v11
};