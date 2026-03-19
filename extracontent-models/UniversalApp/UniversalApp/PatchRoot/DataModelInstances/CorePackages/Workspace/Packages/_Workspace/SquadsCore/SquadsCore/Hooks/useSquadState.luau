local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local l_NetworkStatus_0 = require(l_script_FirstAncestor_0.Http.RoduxNetworking).Enum.NetworkStatus;
local v5 = require(l_script_FirstAncestor_0.Enums.SquadState);
local v6 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadId);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 13 ]]
    -- upvalues: v6 (copy), v2 (copy), v3 (copy), l_useSelector_0 (copy), v5 (copy), l_NetworkStatus_0 (copy)
    local v8 = v6() or "";
    local v10 = v2.useCallback(function(v9) --[[ Line: 16 ]]
        -- upvalues: v3 (ref)
        return v3.JoinSquad.getStatus(v9, {});
    end, {});
    local v11 = l_useSelector_0(v10);
    local v13 = v2.useCallback(function(v12) --[[ Line: 21 ]]
        -- upvalues: v3 (ref)
        return v3.CreateOrJoinSquad.getStatus(v12, {});
    end, {});
    local v14 = l_useSelector_0(v13);
    local l_Idle_0 = v5.Idle;
    if v8 ~= "" then
        return v5.Active;
    else
        if v11 == l_NetworkStatus_0.Fetching or v14 == l_NetworkStatus_0.Fetching then
            l_Idle_0 = v5.Initializing;
        end;
        return l_Idle_0;
    end;
end;