local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local v2 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
return {
    Events = {
        ModalRendered = v2.Events.modalRenderedWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationListOverlay, 
            counterFormat = function(v3, _) --[[ Line: 12 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v3.modalVariant
                };
            end, 
            eventStreamFormat = function(v5, _) --[[ Line: 17 ]] --[[ Name: eventStreamFormat ]]
                return {
                    modalVariant = v5.modalVariant, 
                    conversationId = v5.conversationId, 
                    impressionId = v5.impressionId
                };
            end
        }), 
        ModalAction = v2.Events.modalActionWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationListOverlay, 
            counterFormat = function(v7, _) --[[ Line: 27 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v7.modalVariant, 
                    action = v7.action
                };
            end, 
            eventStreamFormat = function(v9, _) --[[ Line: 36 ]] --[[ Name: eventStreamFormat ]]
                return {
                    modalVariant = v9.modalVariant, 
                    action = v9.action, 
                    conversationId = v9.conversationId, 
                    impressionId = v9.impressionId
                };
            end
        }), 
        ModalActionResult = v2.Events.modalActionResultWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationListOverlay, 
            counterFormat = function(v11, _) --[[ Line: 52 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v11.modalVariant, 
                    action = v11.action, 
                    actionResult = v11.actionResult
                };
            end, 
            eventStreamFormat = function(v13, _) --[[ Line: 65 ]] --[[ Name: eventStreamFormat ]]
                return {
                    modalVariant = v13.modalVariant, 
                    action = v13.action, 
                    actionResult = v13.actionResult, 
                    conversationId = v13.conversationId, 
                    impressionId = v13.impressionId
                };
            end
        })
    }
};