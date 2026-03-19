local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 11 ]]
    -- upvalues: l_useSelector_0 (copy), l_AppPage_0 (copy)
    return l_useSelector_0(function(v3) --[[ Line: 12 ]]
        -- upvalues: l_AppPage_0 (ref)
        if not v3.Navigation then
            return true;
        else
            local l_history_0 = v3.Navigation.history;
            if not l_history_0 then
                return false;
            else
                local v5 = l_history_0[#l_history_0];
                return (v5[#v5] and v5[#v5].name) == l_AppPage_0.Chat;
            end;
        end;
    end);
end;