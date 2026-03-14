local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Telemetry.Telemetry);
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDetailsTelemetryLayer);
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDialogTelemetryLayer);
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v6 = require(l_script_FirstAncestor_0.Telemetry.DefaultTelemetryEvents);
local l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatTelemetryCounterWithEmittedInfo;
local l_namedCounterConfigurationNoEmittedInfo_0 = v6.namedCounterConfigurationNoEmittedInfo;
local l_namedCounterConfigurationAndFormat_0 = v6.namedCounterConfigurationAndFormat;
local l_EVENT_INGEST_NO_EMITTED_INFO_0 = v6.EVENT_INGEST_NO_EMITTED_INFO;
local l_namedCounterConfigurationNoEmittedInfo_1 = v6.namedCounterConfigurationNoEmittedInfo;
local l_EVENT_INGEST_NO_EMITTED_INFO_1 = v6.EVENT_INGEST_NO_EMITTED_INFO;
return {
    ScreenRendered = v2.new({
        name = "chatDetailsRendered", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            v6.eventIngestWithFormatFunction(function(v13) --[[ Line: 29 ]]
                return {
                    isGroupConversation = v13.isGroupConversation
                };
            end), 
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatDetails.Rendered", function(v14) --[[ Line: 36 ]]
                return {
                    isGroupConversation = v14.isGroupConversation
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatDetails.Rendered")
        }
    }), 
    ChatDetailsLeaveGroupBtnClicked = v2.new({
        name = "chatDetailsLeaveGroupBtnClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatDetails.Button.LeaveGroup"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatDetailsCreateUnfilteredChatCellClicked = v2.new({
        name = "chatDetailsCreateUnfilteredChatCellClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatDetails.Button.CreateUnfilteredChat"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatDetailsCreateUnfilteredChatCellRendered = v2.new({
        name = "chatDetailsCreateUnfilteredChatCellRendered", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatDetails.CreateUnfilteredChatCell.Rendered"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatDetailsAddFriendsBtnClicked = v2.new({
        name = "chatDetailsAddFriendsBtnClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatDetails.Button.AddFriends"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    LeaveGroupDialogRendered = v2.new({
        name = "chatDetailsLeaveGroupDialogRendered", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.LeaveGroup.Rendered"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_1
        }
    }), 
    LeaveGroupDialogLeaveClicked = v2.new({
        name = "chatDetailsLeaveGroupDialogLeaveClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.LeaveGroup.Button.Leave"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_1
        }
    }), 
    LeaveGroupDialogStayClicked = v2.new({
        name = "chatDetailsLeaveGroupDialogStayClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.LeaveGroup.Button.Stay"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_1
        }
    }), 
    ParticipantDialogReportUserClicked = v2.new({
        name = "chatDetailsReportUserClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            14
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.ParticipantDetails.Button.ReportUser"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_1
        }
    })
};