local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Responsive);
return function() --[[ Line: 7 ]] --[[ Name: useHideMouseCursorEffect ]]
    -- upvalues: v3 (copy), v2 (copy), l_UserInputService_0 (copy)
    local v4 = v3.useLastInput() == v3.Input.Pointer;
    v2.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: l_UserInputService_0 (ref), v4 (copy)
        l_UserInputService_0.MouseIconEnabled = v4;
    end, {
        v4
    });
end;