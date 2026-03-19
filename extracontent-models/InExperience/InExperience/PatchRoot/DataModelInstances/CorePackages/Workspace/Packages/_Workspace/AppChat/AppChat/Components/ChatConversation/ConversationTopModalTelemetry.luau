local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v2 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
return {
    Events = {
        ModalRendered = v2.Events.modalRenderedWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationTopModal, 
            counterFormat = function(v3, _) --[[ Line: 12 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v3.modalVariant
                };
            end, 
            eventStreamFormat = function(v5, _) --[[ Line: 17 ]] --[[ Name: eventStreamFormat ]]
                return {
                    modalVariant = v5.modalVariant, 
                    modalContext = v5.modalContext
                };
            end
        }), 
        ModalAction = v2.Events.modalActionWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationTopModal, 
            counterFormat = function(v7, _) --[[ Line: 26 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v7.modalVariant, 
                    action = v7.action
                };
            end, 
            eventStreamFormat = function(v9, _) --[[ Line: 35 ]] --[[ Name: eventStreamFormat ]]
                return {
                    modalVariant = v9.modalVariant, 
                    action = v9.action, 
                    modalContext = v9.modalContext
                };
            end
        })
    }
};