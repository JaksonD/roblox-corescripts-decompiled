local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local v2 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
return {
    Events = {
        ModalRendered = v2.Events.modalRenderedWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationOverlay, 
            counterFormat = function(v3, _) --[[ Line: 12 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v3.modalVariant
                };
            end
        }), 
        ModalAction = v2.Events.modalActionWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationOverlay, 
            counterFormat = function(v5, _) --[[ Line: 20 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v5.modalVariant, 
                    action = v5.action
                };
            end
        }), 
        ModalActionResult = v2.Events.modalActionResultWithSequence({
            modalSequence = v2.Enums.ModalSequence.ConversationOverlay, 
            counterFormat = function(v7, _) --[[ Line: 32 ]] --[[ Name: counterFormat ]]
                return {
                    modalVariant = v7.modalVariant, 
                    action = v7.action, 
                    actionResult = v7.actionResult
                };
            end
        })
    }
};