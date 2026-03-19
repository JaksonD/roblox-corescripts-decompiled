local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_UserInputService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.UserInputService;
local v2 = {};
return function(v3) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), l_UserInputService_0 (copy)
    if v2[v3] then
        return v2[v3];
    else
        local v4 = nil;
        local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v3);
        if l_l_UserInputService_0_ImageForKeyCode_0 and l_l_UserInputService_0_ImageForKeyCode_0 ~= "" then
            return {
                keyVisualType = "Image", 
                size = UDim2.fromScale(0.7, 0.7), 
                key = l_l_UserInputService_0_ImageForKeyCode_0
            };
        else
            l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v3);
            v4 = {
                keyVisualType = "String", 
                size = UDim2.fromScale(0.8, 0.8), 
                key = l_l_UserInputService_0_ImageForKeyCode_0 or ""
            };
            v2[v3] = v4;
            return v4;
        end;
    end;
end;