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
return function(v20) --[[ Line: 35 ]] --[[ Name: SquadCard ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v7 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadSelector_0 (copy), v2 (copy), l_useNavigationFocus_0 (copy), l_SquadViewFlags_0 (copy), l_dependencyArray_0 (copy), l_NetworkingSquads_0 (copy), v5 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), v18 (copy), v19 (copy), v4 (copy)
    local v21 = l_useDispatch_0();
    local v22 = l_useLocalUserId_0();
    local v23 = v7.useContext(l_SquadExternalContractContext_0);
    local v24 = l_useCurrentSquadSelector_0();
    local v25 = if v24 then v24.squadId == v20.group_up_id else false;
    local v31 = v7.useCallback(function(v26) --[[ Line: 48 ]]
        -- upvalues: v25 (copy), v24 (copy), v2 (ref), v22 (copy)
        if v25 then
            local v27 = {};
            for _, v29 in ipairs(v24.members) do
                table.insert(v27, v29.userId);
            end;
            return v27;
        else
            return v2.List.filter(v26, function(v30) --[[ Line: 56 ]]
                -- upvalues: v22 (ref)
                return tostring(v30) ~= v22;
            end);
        end;
    end, {
        v25, 
        v24, 
        v22
    });
    local v32, v33 = v7.useState(v20.is_alive);
    local v34, v35 = v7.useState(v31(v20.participant_user_ids));
    local v36 = l_useNavigationFocus_0();
    local v37 = v25 and v36;
    v7.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v37 (copy), v23 (copy), l_SquadViewFlags_0 (ref)
        if v37 then
            v23.updateSquadViewFlags(l_SquadViewFlags_0.SquadSystemMessage, true);
        end;
        return function() --[[ Line: 72 ]]
            -- upvalues: v37 (ref), v23 (ref), l_SquadViewFlags_0 (ref)
            if v37 then
                v23.updateSquadViewFlags(l_SquadViewFlags_0.SquadSystemMessage, false);
            end;
        end;
    end, l_dependencyArray_0(v23.updateSquadViewFlags, v37));
    v7.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v35 (copy), v31 (copy), v20 (copy)
        v35(v31(v20.participant_user_ids));
    end, l_dependencyArray_0(v35, v20.participant_user_ids, v31));
    local v44 = v7.useCallback(function(v38) --[[ Line: 84 ]]
        -- upvalues: v21 (copy), l_NetworkingSquads_0 (ref), v35 (copy), v5 (ref), v33 (copy)
        v21(l_NetworkingSquads_0.GetSquadFromSquadId.API({
            squadId = v38
        })):andThen(function(v39) --[[ Line: 86 ]]
            -- upvalues: v35 (ref)
            if v39 and v39.responseBody and v39.responseBody.groupUp and v39.responseBody.groupUp.members then
                local v40 = {};
                for _, v42 in ipairs(v39.responseBody.groupUp.members) do
                    table.insert(v40, v42.userId);
                end;
                v35(v40);
            end;
        end):catch(function(v43) --[[ Line: 100 ]]
            -- upvalues: v5 (ref), v33 (ref)
            if v43.StatusCode == v5.StatusCodes.NOT_FOUND then
                v33(false);
                return;
            else
                warn("Unsupported error type");
                return;
            end;
        end);
    end, {
        v21
    });
    v7.useEffect(function() --[[ Line: 109 ]]
        -- upvalues: v32 (copy), v25 (copy), l_setInterval_0 (ref), v44 (copy), v20 (copy), l_clearInterval_0 (ref)
        local v45 = nil;
        if v32 and not v25 then
            v45 = l_setInterval_0(function() --[[ Line: 113 ]]
                -- upvalues: v44 (ref), v20 (ref)
                v44(v20.group_up_id);
            end, 10000);
        end;
        return function() --[[ Line: 118 ]]
            -- upvalues: v45 (ref), l_clearInterval_0 (ref)
            if v45 then
                l_clearInterval_0(v45);
            end;
        end;
    end, l_dependencyArray_0(v44, v32, v25, v20.group_up_id));
    local v46 = v7.useMemo(function() --[[ Line: 125 ]]
        -- upvalues: v32 (copy), v7 (ref), v18 (ref), v20 (copy), v34 (copy), v19 (ref)
        if v32 then
            return (v7.createElement(v18, {
                conversationId = v20.conversation_id, 
                participantUserIds = v34, 
                squadLocation = v20.moduleLocation
            }));
        else
            return (v7.createElement(v19, {
                conversationId = v20.conversation_id, 
                squadLocation = v20.moduleLocation
            }));
        end;
    end, l_dependencyArray_0(v32, v34, v20.conversation_id, v20.group_up_id));
    return v7.createElement(v4.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(0, 280, 0, 0)
    }, v46);
end;