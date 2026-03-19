local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v4 = require(l_Parent_0.AppChatNetworking);
return function() --[[ Line: 8 ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), v3 (copy)
    return l_useSelector_0(function(v5) --[[ Line: 9 ]]
        -- upvalues: v4 (ref), v3 (ref)
        return v4.rodux.GetUserConversations.getStatus(v5, 1) == v3.Enum.NetworkStatus.Fetching;
    end);
end;