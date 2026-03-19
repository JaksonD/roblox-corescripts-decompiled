local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_Parent_0.AppChatNetworking);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_useSelector_0 (copy), v2 (copy)
    return l_useSelector_0(function(v6) --[[ Line: 13 ]]
        -- upvalues: v5 (copy), v2 (ref)
        if not v5 then
            return nil;
        else
            return (v2(v6, "ChatAppReducer.Modals.conversationTopModals") or {})[v5];
        end;
    end);
end;