local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.RoduxSquads);
local v5 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v6 = require(l_script_FirstAncestor_0.Thunks.fetchActiveSquad);
local v7 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.RealtimeDelivery);
local v10 = require(l_Parent_0.RoactUtils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = v10.Hooks.dependencyArray;
local l_useDispatch_0 = v10.Hooks.RoactRodux.useDispatch;
return function(v14) --[[ Line: 25 ]]
    -- upvalues: l_useDispatch_0 (copy), v8 (copy), v5 (copy), v9 (copy), v2 (copy), v3 (copy), v7 (copy), v4 (copy), v6 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v15 = l_useDispatch_0();
    local v16 = v8.useContext(v5);
    v9.useRealtimeNamespace(v2.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(v17) --[[ Line: 30 ]]
        -- upvalues: v2 (ref), v14 (copy), v3 (ref), v7 (ref), v15 (copy), v4 (ref), v6 (ref)
        if table.find(v2.PARENT_CHANNEL_TYPES, v17.ChannelType) and v14.currentParentChannelId and v14.currentParentChannelId == v17.ChannelId then
            v3:debug("Parent squad channel RTN received. Detail: {}, CurrentParentChannelId: {}", v7(v17), v14.currentParentChannelId);
            if v17.Type == v2.CHANNEL_DELETED_DETAIL_TYPE or v17.Type == v2.CHANNEL_ARCHIVED_DETAIL_TYPE or v17.Type == v2.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE then
                v15(v4.Actions.CurrentSquadUpdated(nil));
                return;
            elseif v17.Type == v2.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE then
                v15(v6());
            end;
        end;
    end, {
        v15, 
        v14.currentParentChannelId, 
        v16.fetchParentChannelDetails
    });
    v8.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v16 (copy), v15 (copy)
        if v14.currentParentChannelId and v14.currentParentChannelId ~= "" then
            v16.fetchParentChannelDetails(v15, v14.currentParentChannelId);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v15, 
        v14.currentParentChannelId, 
        v16.fetchParentChannelDetails
    } else l_dependencyArray_0(v15, v14.currentParentChannelId, v16.fetchParentChannelDetails));
    return nil;
end;