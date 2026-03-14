local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
return function() --[[ Line: 7 ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy)
    return l_useSelector_0(function(v4) --[[ Line: 8 ]]
        -- upvalues: v3 (ref)
        local v5 = v3(v4, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled");
        if v5 == nil then
            return true;
        else
            return v5;
        end;
    end);
end;