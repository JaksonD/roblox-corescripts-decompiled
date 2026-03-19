local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local l_ConversationTopModal_0 = v2.Constants.ConversationTopModal;
local l_ConversationOverlay_0 = v2.Constants.ConversationOverlay;
local v8 = require(l_script_FirstAncestor_0.EnumScreens);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v10 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v11 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v12 = require(script.Parent.Parent.ConversationTopModalTelemetry);
local v13 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v14 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v16 = require(script.Parent.ConversationBanner);
local v17 = {
    [l_ConversationTopModal_0.AddTrustedConnection] = {
        onActivatedOverlayVariant = l_ConversationOverlay_0.AddTrustedConnectionU18
    }, 
    [l_ConversationTopModal_0.TrustedConnectionRequest] = {
        onActivatedOverlayVariant = l_ConversationOverlay_0.TrustedConnectionRequestU18
    }
};
local v18 = {
    actionText = "PLACEHOLDER Action", 
    bodyText = "PLACEHOLDER Body", 
    onDismissed = function() --[[ Line: 53 ]] --[[ Name: onDismissed ]]

    end
};
return v4.memo(function(v19) --[[ Line: 56 ]] --[[ Name: ConversationBannerContainer ]]
    -- upvalues: v3 (copy), v18 (copy), l_useNavigation_0 (copy), v17 (copy), v10 (copy), v11 (copy), v14 (copy), v4 (copy), v12 (copy), v13 (copy), v8 (copy), v16 (copy)
    local v20 = v3.Dictionary.union(v18, v19);
    local v21 = l_useNavigation_0();
    local v22 = v17[v20.modalVariant];
    local v23 = nil;
    local v24 = v10(v11.Context);
    local v25 = v14(v20.conversationId);
    if v25 and v25.participants then
        v23 = table.concat(v25.participants, ",");
    end;
    v4.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v24 (copy), v12 (ref), v20 (copy), v23 (ref)
        v24.emit(v12.Events.ModalRendered, {
            modalVariant = v20.modalVariant, 
            modalContext = v23
        });
    end, {
        v20.modalVariant
    });
    local v26 = v4.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v20 (copy), v24 (copy), v12 (ref), v13 (ref), v23 (ref)
        v20.onDismissed();
        v24.emit(v12.Events.ModalAction, {
            modalVariant = v20.modalVariant, 
            action = v13.Enums.ModalActions.Dismiss, 
            modalContext = v23
        });
    end, {
        v20.onDismissed
    });
    local v27 = v4.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v22 (copy), v21 (copy), v8 (ref), v20 (copy), v24 (copy), v12 (ref), v13 (ref), v23 (ref)
        if v22 then
            v21.navigate(v8.TrustedConnectionsUpsell, {
                modalVariant = v22.onActivatedOverlayVariant, 
                conversationId = v20.conversationId, 
                isOverlay = true
            });
        end;
        v24.emit(v12.Events.ModalAction, {
            modalVariant = v20.modalVariant, 
            action = v13.Enums.ModalActions.PrimaryCta, 
            modalContext = v23
        });
    end, {
        v21, 
        v22
    });
    if v22 then
        return v4.createElement(v16, {
            actionText = v20.actionText, 
            bodyText = v20.bodyText, 
            onDismissed = v26, 
            onActivated = v27, 
            layoutOrder = v20.layoutOrder
        });
    else
        return nil;
    end;
end);