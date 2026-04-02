local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCards");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Http);
local v6 = require(l_Parent_0.LuauPolyfill);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.SquadsCore);
local l_useCurrentSquadSelector_0 = require(l_Parent_0.RoduxSquads).Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_NetworkingSquads_0 = v8.Http.NetworkingSquads;
local l_SquadExternalContractContext_0 = v8.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadViewFlags_0 = v8.SquadExternalContractProvider.SquadViewFlags;
local l_clearInterval_0 = v6.clearInterval;
local l_setInterval_0 = v6.setInterval;
local v18 = require(l_script_FirstAncestor_0.Components.SquadCard.SquadStartedCard);
local v19 = require(l_script_FirstAncestor_0.Components.SquadCard.SquadEndedCard);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v21) --[[ Line: 38 ]] --[[ Name: SquadCard ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v7 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadSelector_0 (copy), v2 (copy), l_useNavigationFocus_0 (copy), l_SquadViewFlags_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_NetworkingSquads_0 (copy), v5 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), v18 (copy), v19 (copy), v4 (copy)
    local v22 = l_useDispatch_0();
    local v23 = l_useLocalUserId_0();
    local v24 = v7.useContext(l_SquadExternalContractContext_0);
    local v25 = l_useCurrentSquadSelector_0();
    local v26 = if v25 then v25.squadId == v21.group_up_id else false;
    local v32 = v7.useCallback(function(v27) --[[ Line: 51 ]]
        -- upvalues: v26 (copy), v25 (copy), v2 (ref), v23 (copy)
        if v26 then
            local v28 = {};
            for _, v30 in ipairs(v25.members) do
                table.insert(v28, v30.userId);
            end;
            return v28;
        else
            return v2.List.filter(v27, function(v31) --[[ Line: 59 ]]
                -- upvalues: v23 (ref)
                return tostring(v31) ~= v23;
            end);
        end;
    end, {
        v26, 
        v25, 
        v23
    });
    local v33, v34 = v7.useState(v21.is_alive);
    local v35, v36 = v7.useState(v32(v21.participant_user_ids));
    local v37 = l_useNavigationFocus_0();
    local v38 = v26 and v37;
    v7.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v38 (copy), v24 (copy), l_SquadViewFlags_0 (ref)
        if v38 then
            v24.updateSquadViewFlags(l_SquadViewFlags_0.SquadSystemMessage, true);
        end;
        return function() --[[ Line: 76 ]]
            -- upvalues: v38 (ref), v24 (ref), l_SquadViewFlags_0 (ref)
            if v38 then
                v24.updateSquadViewFlags(l_SquadViewFlags_0.SquadSystemMessage, false);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v24.updateSquadViewFlags, 
        v38
    } else l_dependencyArray_0(v24.updateSquadViewFlags, v38));
    v7.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v36 (copy), v32 (copy), v21 (copy)
        v36(v32(v21.participant_user_ids));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36, 
        v21.participant_user_ids, 
        v32
    } else l_dependencyArray_0(v36, v21.participant_user_ids, v32));
    local v45 = v7.useCallback(function(v39) --[[ Line: 97 ]]
        -- upvalues: v22 (copy), l_NetworkingSquads_0 (ref), v36 (copy), v5 (ref), v34 (copy)
        v22(l_NetworkingSquads_0.GetSquadFromSquadId.API({
            squadId = v39
        })):andThen(function(v40) --[[ Line: 99 ]]
            -- upvalues: v36 (ref)
            if v40 and v40.responseBody and v40.responseBody.groupUp and v40.responseBody.groupUp.members then
                local v41 = {};
                for _, v43 in ipairs(v40.responseBody.groupUp.members) do
                    table.insert(v41, v43.userId);
                end;
                v36(v41);
            end;
        end):catch(function(v44) --[[ Line: 113 ]]
            -- upvalues: v5 (ref), v34 (ref)
            if v44.StatusCode == v5.StatusCodes.NOT_FOUND then
                v34(false);
                return;
            else
                warn("Unsupported error type");
                return;
            end;
        end);
    end, {
        v22
    });
    v7.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v33 (copy), v26 (copy), l_setInterval_0 (ref), v45 (copy), v21 (copy), l_clearInterval_0 (ref)
        local v46 = nil;
        if v33 and not v26 then
            v46 = l_setInterval_0(function() --[[ Line: 127 ]]
                -- upvalues: v45 (ref), v21 (ref)
                v45(v21.group_up_id);
            end, 10000);
        end;
        return function() --[[ Line: 132 ]]
            -- upvalues: v46 (ref), l_clearInterval_0 (ref)
            if v46 then
                l_clearInterval_0(v46);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v45, 
        v33, 
        v26, 
        v21.group_up_id
    } else l_dependencyArray_0(v45, v33, v26, v21.group_up_id));
    local v47 = v7.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v33 (copy), v7 (ref), v18 (ref), v21 (copy), v35 (copy), v19 (ref)
        if v33 then
            return (v7.createElement(v18, {
                conversationId = v21.conversation_id, 
                participantUserIds = v35, 
                squadLocation = v21.moduleLocation
            }));
        else
            return (v7.createElement(v19, {
                conversationId = v21.conversation_id, 
                squadLocation = v21.moduleLocation
            }));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33, 
        v35, 
        v21.conversation_id, 
        v21.group_up_id
    } else l_dependencyArray_0(v33, v35, v21.conversation_id, v21.group_up_id));
    return v7.createElement(v4.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(0, 280, 0, 0)
    }, v47);
end;