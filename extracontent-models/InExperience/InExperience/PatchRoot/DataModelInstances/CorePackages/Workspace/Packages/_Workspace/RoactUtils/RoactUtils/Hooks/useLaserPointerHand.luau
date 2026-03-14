local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useExternalEvent);
local v4 = {
    Right = "Right", 
    Left = "Left"
};
return function() --[[ Line: 19 ]] --[[ Name: useLaserPointerHand ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), l_VRService_0 (copy)
    local v5, v6 = v2.useState(v4.Right);
    local v8 = v2.useCallback(function(v7) --[[ Line: 22 ]]
        -- upvalues: v5 (copy), v4 (ref), v6 (copy)
        if (v7.KeyCode == Enum.KeyCode.ButtonR1 or v7.KeyCode == Enum.KeyCode.ButtonR2 or v7.KeyCode == Enum.KeyCode.ButtonR3 or v7.KeyCode == Enum.KeyCode.ButtonA or v7.KeyCode == Enum.KeyCode.ButtonB) and v5 ~= v4.Right then
            v6(v4.Right);
            return;
        else
            if (v7.KeyCode == Enum.KeyCode.ButtonL1 or v7.KeyCode == Enum.KeyCode.ButtonL2 or v7.KeyCode == Enum.KeyCode.ButtonL3 or v7.KeyCode == Enum.KeyCode.ButtonX or v7.KeyCode == Enum.KeyCode.ButtonY) and v5 ~= v4.Left then
                v6(v4.Left);
            end;
            return;
        end;
    end);
    v3(l_VRService_0.LaserPointerTriggered, v8);
    return v5;
end;