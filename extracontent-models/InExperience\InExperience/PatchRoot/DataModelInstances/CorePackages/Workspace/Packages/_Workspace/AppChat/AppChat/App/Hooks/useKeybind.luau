local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v2 = require(l_Parent_0.Cryo);
local l_useExternalEvent_0 = require(l_Parent_0.RoactUtils).Hooks.useExternalEvent;
return function(v4, v5, v6) --[[ Line: 15 ]] --[[ Name: useKeybind ]]
    -- upvalues: l_useExternalEvent_0 (copy), l_UserInputService_0 (copy), v2 (copy)
    l_useExternalEvent_0(l_UserInputService_0.InputBegan, function(v7) --[[ Line: 16 ]]
        -- upvalues: v4 (copy), v5 (copy)
        if v7.KeyCode == v4.keyCode and (v4.modifierKey == nil or v7:IsModifierKeyDown(v4.modifierKey)) then
            v5();
        end;
    end, v2.List.join({
        v4
    }, {
        v5
    }, v6));
end;