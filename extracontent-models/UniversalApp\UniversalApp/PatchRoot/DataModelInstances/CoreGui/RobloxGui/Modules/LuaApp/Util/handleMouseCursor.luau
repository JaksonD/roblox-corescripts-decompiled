local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.Signals);
local v3 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v4 = v3.GetInputModeStore(false);
local l_Input_0 = v3.Input;
handleMouseCursor = function() --[[ Line: 10 ]] --[[ Name: handleMouseCursor ]]
    -- upvalues: v4 (copy), v2 (copy), l_Input_0 (copy), l_UserInputService_0 (copy)
    local l_getLastInputType_0 = v4.getLastInputType;
    return v2.createEffect(function(v7) --[[ Line: 12 ]]
        -- upvalues: l_getLastInputType_0 (copy), l_Input_0 (ref), l_UserInputService_0 (ref)
        local v8 = l_getLastInputType_0(v7);
        if v8 == l_Input_0.Pointer then
            l_UserInputService_0.MouseIconEnabled = true;
            return;
        else
            if v8 == l_Input_0.Touch or v8 == l_Input_0.Directional then
                l_UserInputService_0.MouseIconEnabled = false;
            end;
            return;
        end;
    end);
end;
return handleMouseCursor;