local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ModalBottomSheet_0 = require(l_Parent_0.UIBlox).ModalBottomSheet;
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(script.Parent.Logger);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_memo_0 = v6.memo;
local v8 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v9 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsTelemetryEvents);
local v10 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDialogTelemetryLayer);
local v13 = {
    conversationId = nil, 
    participantId = nil, 
    showRemoveUserButton = false, 
    showViewProfileButton = true, 
    viewProfileText = "localizedText.ViewProfile", 
    reportUserText = "localizedText.ReportUser", 
    removeFromGroupText = "localizedText.RemoveFromGroup", 
    cancelText = "localizedText.Cancel", 
    openViewProfile = function(_) --[[ Line: 49 ]] --[[ Name: openViewProfile ]]
        -- upvalues: v4 (copy)
        v4:warning("openViewProfile was not passed to ParticipantDialog");
    end, 
    openReportUser = function(...) --[[ Line: 52 ]] --[[ Name: openReportUser ]]
        -- upvalues: v4 (copy)
        v4:warning("openReportUser was not passed to ParticipantDialog");
    end, 
    openRemoveUserDialog = function(...) --[[ Line: 55 ]] --[[ Name: openRemoveUserDialog ]]
        -- upvalues: v4 (copy)
        v4:warning("openRemoveUserDialog was not passed to ParticipantDialog");
    end, 
    onDismiss = function(_) --[[ Line: 58 ]] --[[ Name: onDismiss ]]
        -- upvalues: v4 (copy)
        v4:warning("onDismiss was not passed to ParticipantDialog");
    end
};
ParticipantDialog = function(v14) --[[ Line: 65 ]] --[[ Name: ParticipantDialog ]]
    -- upvalues: v5 (copy), v13 (copy), v8 (copy), v10 (copy), v4 (copy), v9 (copy), v6 (copy), l_ModalBottomSheet_0 (copy)
    local v15 = v5.Dictionary.join(v13, v14);
    local v16 = v8(v10.Context);
    local l_conversationId_0 = v15.conversationId;
    local l_participantId_0 = v15.participantId;
    local l_showRemoveUserButton_0 = v15.showRemoveUserButton;
    local v20 = {};
    if v15.showViewProfileButton then
        table.insert(v20, {
            text = v15.viewProfileText, 
            onActivated = function() --[[ Line: 78 ]] --[[ Name: onActivated ]]
                -- upvalues: v4 (ref), l_participantId_0 (copy), v15 (copy)
                v4:info("User activated viewProfile | userId: {}", l_participantId_0);
                v15.openViewProfile(l_participantId_0);
            end
        });
    end;
    table.insert(v20, {
        text = v15.reportUserText, 
        onActivated = function() --[[ Line: 87 ]] --[[ Name: onActivated ]]
            -- upvalues: v4 (ref), l_participantId_0 (copy), l_conversationId_0 (copy), v16 (copy), v9 (ref), v15 (copy)
            v4:info("User activated reportUser | userId: {}, conversationId: {}", l_participantId_0, l_conversationId_0);
            v16.emit(v9.ParticipantDialogReportUserClicked, {});
            v15.openReportUser(l_participantId_0, l_conversationId_0);
        end
    });
    if l_showRemoveUserButton_0 then
        table.insert(v20, {
            text = v15.removeFromGroupText, 
            onActivated = function() --[[ Line: 97 ]] --[[ Name: onActivated ]]
                -- upvalues: v15 (copy), l_participantId_0 (copy), l_conversationId_0 (copy)
                v15.openRemoveUserDialog(l_participantId_0, l_conversationId_0);
            end
        });
    end;
    table.insert(v20, {
        text = v15.cancelText, 
        onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]

        end
    });
    return v6.createElement(l_ModalBottomSheet_0, {
        bottomGap = 10, 
        onDismiss = v15.onDismiss, 
        buttonModels = v20, 
        screenWidth = 400, 
        showImages = false
    });
end;
return l_memo_0(ParticipantDialog);