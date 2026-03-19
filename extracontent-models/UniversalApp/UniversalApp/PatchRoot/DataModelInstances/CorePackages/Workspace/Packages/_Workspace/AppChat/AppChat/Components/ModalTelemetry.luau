local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local _ = require(l_script_FirstAncestor_0.types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.SocialLuaAnalytics);
local _ = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_script_FirstAncestor_0.Telemetry.Telemetry);
local v6 = require(l_script_FirstAncestor_0.Telemetry.DefaultTelemetryEvents);
local l_namedCounterConfigurationAndFormat_0 = v6.namedCounterConfigurationAndFormat;
local l_eventIngestWithFormatFunction_0 = v6.eventIngestWithFormatFunction;
local v9 = require(l_Parent_0.Cryo);
local v10 = {};
local function v16(v11, v12) --[[ Line: 37 ]] --[[ Name: eventIngestWithModalFormatFunction ]]
    -- upvalues: v9 (copy), l_eventIngestWithFormatFunction_0 (copy)
    return l_eventIngestWithFormatFunction_0(function(v13, v14) --[[ Line: 38 ]]
        -- upvalues: v11 (copy), v9 (ref), v12 (copy)
        local v15 = v11(v13, v14);
        return v9.Dictionary.join({
            modalSequence = v12
        }, v15);
    end);
end;
v10.Events = {
    modalRenderedWithSequence = function(v17) --[[ Line: 48 ]] --[[ Name: modalRenderedWithSequence ]]
        -- upvalues: l_namedCounterConfigurationAndFormat_0 (copy), v16 (copy), v5 (copy)
        local v18 = {};
        local l_counterFormat_0 = v17.counterFormat;
        local l_eventStreamFormat_0 = v17.eventStreamFormat;
        if l_counterFormat_0 then
            table.insert(v18, l_namedCounterConfigurationAndFormat_0(("AppChat.Modal.%*.Rendered"):format(v17.modalSequence), l_counterFormat_0));
        end;
        if l_eventStreamFormat_0 then
            table.insert(v18, v16(l_eventStreamFormat_0, v17.modalSequence));
        end;
        return (v5.new({
            name = "appChatModalRendered", 
            description = "", 
            lastUpdated = {
                2025, 
                9, 
                8
            }, 
            backendsList = v18
        }));
    end, 
    modalActionWithSequence = function(v21) --[[ Line: 79 ]] --[[ Name: modalActionWithSequence ]]
        -- upvalues: l_namedCounterConfigurationAndFormat_0 (copy), v16 (copy), v5 (copy)
        local v22 = {};
        local l_counterFormat_1 = v21.counterFormat;
        local l_eventStreamFormat_1 = v21.eventStreamFormat;
        if l_counterFormat_1 then
            table.insert(v22, l_namedCounterConfigurationAndFormat_0(("AppChat.Modal.%*.Action"):format(v21.modalSequence), l_counterFormat_1));
        end;
        if l_eventStreamFormat_1 then
            table.insert(v22, v16(l_eventStreamFormat_1, v21.modalSequence));
        end;
        return (v5.new({
            name = "appChatModalAction", 
            description = "", 
            lastUpdated = {
                2025, 
                9, 
                8
            }, 
            backendsList = v22
        }));
    end, 
    modalActionResultWithSequence = function(v25) --[[ Line: 113 ]] --[[ Name: modalActionResultWithSequence ]]
        -- upvalues: l_namedCounterConfigurationAndFormat_0 (copy), v16 (copy), v5 (copy)
        local v26 = {};
        local l_counterFormat_2 = v25.counterFormat;
        local l_eventStreamFormat_2 = v25.eventStreamFormat;
        if l_counterFormat_2 then
            table.insert(v26, l_namedCounterConfigurationAndFormat_0(("AppChat.Modal.%*.ActionResult"):format(v25.modalSequence), l_counterFormat_2));
        end;
        if l_eventStreamFormat_2 then
            table.insert(v26, v16(l_eventStreamFormat_2, v25.modalSequence));
        end;
        return (v5.new({
            name = "appChatModalActionResult", 
            description = "", 
            lastUpdated = {
                2025, 
                9, 
                8
            }, 
            backendsList = v26
        }));
    end
};
v10.Enums = {
    ModalActions = {
        PrimaryCta = "primaryCta", 
        SecondaryCta = "secondaryCta", 
        Dismiss = "dismiss", 
        InlineCta = "inlineCta"
    }, 
    ModalActionResults = {
        Success = "success", 
        Failure = "failure"
    }, 
    ModalSequence = {
        ChatLandingModal = "ChatLandingModal", 
        ConversationOverlay = "ConversationOverlay", 
        ConversationTopModal = "ConversationTopModal", 
        ConversationListOverlay = "ConversationListOverlay"
    }
};
return v10;