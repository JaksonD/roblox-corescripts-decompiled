local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.Localization);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.TeleportBack);
local v5 = require(script.Parent.TraversalTelemetry);
local l_Dialog_0 = v1.Dialog;
local l_DialogSize_0 = v1.Enums.DialogSize;
local l_ButtonVariant_0 = v1.Enums.ButtonVariant;
local l_Orientation_0 = v1.Enums.Orientation;
local l_useLocalization_0 = v2.Hooks.useLocalization;
return v3.memo(v3.forwardRef(function(v11, v12) --[[ Line: 40 ]] --[[ Name: TeleportLeaveConfirmation ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v5 (copy), v4 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v13 = l_useLocalization_0({
        leaveHeader = "CoreScripts.InGameMenu.Traversal.LeaveHeader", 
        leaveBody = {
            "CoreScripts.InGameMenu.Traversal.LeaveBody"; 
            PREVIOUS_EXPERIENCE = v11.teleportName
        }, 
        leaveContinueAction = "CoreScripts.InGameMenu.Actions.Continue", 
        leaveCancelAction = "CoreScripts.InGameMenu.Cancel"
    });
    local v14 = v3.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v5 (ref), v11 (copy), v4 (ref)
        v5.sendTeleportConfirmationActions({
            source = v11.source, 
            event_type = "confirm"
        });
        v4(v11.placeId);
    end, {
        v4, 
        v11.placeId
    });
    return v3.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        onClose = function(v15) --[[ Line: 65 ]] --[[ Name: onClose ]]
            -- upvalues: v5 (ref), v11 (copy)
            v5.sendTeleportConfirmationActions({
                source = v11.source, 
                event_type = "cancel"
            });
            if v11.onClose then
                v11.onClose(v15);
            end;
        end, 
        hasBackdrop = v11.hasBackdrop == nil or v11.hasBackdrop, 
        ref = v12
    }, {
        DialogTitle = v3.createElement(l_Dialog_0.Title, {
            text = v13.leaveHeader, 
            testId = "--foundation-dialog--title"
        }), 
        DialogContent = v3.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            DialogText = v3.createElement(l_Dialog_0.Text, {
                Text = v13.leaveBody
            })
        }), 
        DialogActions = v3.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            LayoutOrder = 3, 
            actions = {
                {
                    text = v13.leaveContinueAction, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v14, 
                    testId = "--teleport-leave-continue"
                }, 
                {
                    text = v13.leaveCancelAction, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]
                        -- upvalues: v5 (ref), v11 (copy)
                        v5.sendTeleportConfirmationActions({
                            source = v11.source, 
                            event_type = "cancel"
                        });
                        v11.onCancel();
                    end, 
                    testId = "--teleport-leave-cancel"
                }
            }
        })
    });
end));