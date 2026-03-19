local l_GamepadService_0 = game:GetService("GamepadService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.SharedFlags);
local v4 = require(l_Parent_0.FocusUtils.FocusOffChromeSignal);
local l_FFlagVirtualCursorTopbarAlwaysVisible_0 = v3.FFlagVirtualCursorTopbarAlwaysVisible;
return function(v6) --[[ Line: 12 ]] --[[ Name: focusOffChrome ]]
    -- upvalues: l_FFlagVirtualCursorTopbarAlwaysVisible_0 (copy), l_GamepadService_0 (copy), v4 (copy)
    if l_FFlagVirtualCursorTopbarAlwaysVisible_0 and l_GamepadService_0.GamepadCursorEnabled then
        return;
    else
        v4:fire();
        if v6 then
            v6();
        end;
        return;
    end;
end;