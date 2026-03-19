local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v4 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadParentChannelId);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RealtimeDelivery);
local v7 = require(l_Parent_0.SharedFlags);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_FFlagSquadAppChatRTNFix_0 = v7.FFlagSquadAppChatRTNFix;
return function(v10) --[[ Line: 20 ]] --[[ Name: SquadAppChatEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v5 (copy), v3 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), v4 (copy), v6 (copy), v2 (copy)
    local v11 = l_useDispatch_0();
    local v12 = v5.useContext(v3);
    local v13 = if l_FFlagSquadAppChatRTNFix_0 then v4() else v10.conversationId;
    v6.useRealtimeNamespace(v2.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(v14) --[[ Line: 28 ]]
        -- upvalues: l_FFlagSquadAppChatRTNFix_0 (ref), v10 (copy), v2 (ref), v13 (copy), v12 (copy), v11 (copy)
        local v15 = not l_FFlagSquadAppChatRTNFix_0 and v10.conversationId and v10.conversationId == v14.ChannelId;
        if v14.ChannelType == v2.SQUAD_CHANNEL_TYPE then
            if l_FFlagSquadAppChatRTNFix_0 then
                v15 = v13 and v13 == v14.ParentChannelId;
            end;
            if v14.Type == v2.CHANNEL_CREATED_DETAIL_TYPE and not v15 or v14.Type == v2.CHANNEL_DELETED_DETAIL_TYPE then
                v12.fetchParentChannelDetails(v11, v14.ParentChannelId);
            end;
            if v14.Type == v2.CHANNEL_UPDATED_DETAIL_TYPE and v14.PreviousChannelStatus and v14.PreviousChannelStatus.ParentChannelId then
                v12.fetchParentChannelDetails(v11, v14.PreviousChannelStatus.ParentChannelId);
            end;
        end;
    end, {
        v11, 
        v13, 
        v12.fetchParentChannelDetails
    });
    return nil;
end;