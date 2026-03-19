local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local v3 = require(l_Parent_0.LoggingProtocol);
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v5 = require(l_script_FirstAncestor_0.Telemetry.Telemetry);
local v6 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v7 = require(l_script_FirstAncestor_0.Telemetry.DefaultTelemetryEvents);
local l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatTelemetryCounterWithEmittedInfo;
local v9 = {};
local function v11(v10) --[[ Line: 16 ]] --[[ Name: eventIngestWithFormatFunction ]]
    -- upvalues: v2 (copy), v3 (copy)
    return {
        type = v2.Analytics.Enums.SupportedTelemetryBackends.EventIngest, 
        standardizedFields = {
            v3.StandardizedFields.addSessionId, 
            v3.StandardizedFields.addSessionInfo
        }, 
        format = v10, 
        overrideName = nil, 
        throttlingThousandths = nil
    };
end;
v9.Constants = {
    EventStreamCtx = v2.Analytics.Enums.Contexts.Party, 
    FaeModalShownField = "fae", 
    ConfirmFaeBtn = "confirmFae", 
    CancelFaeBtn = "cancelFae"
};
v9.Events = {
    FaeModalShown = v5.new({
        name = "authModalShown", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            v7.namedCounterConfigurationNoEmittedInfo("AppChat.ChatLandingModal.FaeModal.Shown"), 
            (v11(function(_, _) --[[ Line: 43 ]]
                -- upvalues: v9 (copy)
                return {
                    field = v9.Constants.FaeModalShownField, 
                    os_time = os.time(), 
                    os_clock = os.clock()
                };
            end))
        }, 
        eventStreamCtx = v9.Constants.EventStreamCtx
    }), 
    TelemetryFaeButtonClick = v5.new({
        name = "authButtonClick", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then v7.namedCounterConfigurationAndFormat("AppChat.ChatLandingModal.FaeButton.Click", function(v14) --[[ Line: 61 ]]
                return {
                    btn = v14.btn
                };
            end) else v7.namedCounterConfigurationNoEmittedInfo("AppChat.ChatLandingModal.FaeButton.Click"), 
            (v11(function(v15, _) --[[ Line: 74 ]]
                return {
                    state = v15.state, 
                    btn = v15.btn, 
                    os_time = os.time(), 
                    os_clock = os.clock()
                };
            end))
        }, 
        eventStreamCtx = v9.Constants.EventStreamCtx
    }), 
    ModalRendered = v6.Events.modalRenderedWithSequence({
        modalSequence = v6.Enums.ModalSequence.ChatLandingModal, 
        counterFormat = function(v17, _) --[[ Line: 91 ]] --[[ Name: counterFormat ]]
            return {
                modalVariant = v17.modalVariant
            };
        end
    }), 
    ModalAction = v6.Events.modalActionWithSequence({
        modalSequence = v6.Enums.ModalSequence.ChatLandingModal, 
        counterFormat = function(v19, _) --[[ Line: 99 ]] --[[ Name: counterFormat ]]
            return {
                modalVariant = v19.modalVariant, 
                action = v19.action
            };
        end
    }), 
    ModalActionResult = v6.Events.modalActionResultWithSequence({
        modalSequence = v6.Enums.ModalSequence.ChatLandingModal, 
        counterFormat = function(v21, _) --[[ Line: 111 ]] --[[ Name: counterFormat ]]
            return {
                modalVariant = v21.modalVariant, 
                action = v21.action, 
                actionResult = v21.actionResult
            };
        end
    })
};
return v9;