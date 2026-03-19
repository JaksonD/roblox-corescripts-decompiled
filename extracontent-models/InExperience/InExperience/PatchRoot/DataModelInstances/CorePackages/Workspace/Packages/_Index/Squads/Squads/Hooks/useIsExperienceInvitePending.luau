local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingSquads_0 = v1.NetworkingSquads;
local l_NetworkStatus_0 = v1.RoduxNetworking.Enum.NetworkStatus;
local l_useSelector_0 = v1.Hooks.useSelector;
return function() --[[ Line: 8 ]] --[[ Name: useIsExperienceInvitePending ]]
    -- upvalues: l_useSelector_0 (copy), l_NetworkingSquads_0 (copy), l_NetworkStatus_0 (copy)
    return (l_useSelector_0(function(v5) --[[ Line: 9 ]]
        -- upvalues: l_NetworkingSquads_0 (ref), l_NetworkStatus_0 (ref)
        local v6 = v5.Squad and v5.Squad.Squad;
        local v7 = v6 and v6.currentSquad and v6.currentSquad.squadId;
        if not v7 then
            return false;
        elseif v6 and v6.currentExperienceInviteStatus then
            return true;
        else
            local v8 = l_NetworkingSquads_0.CreateExperienceInvite.getStatus(v5, v7);
            local v9 = v6 and v6.currentExperienceInvite;
            if v8 == l_NetworkStatus_0.Fetching or v9 then
                return true;
            else
                return false;
            end;
        end;
    end));
end;