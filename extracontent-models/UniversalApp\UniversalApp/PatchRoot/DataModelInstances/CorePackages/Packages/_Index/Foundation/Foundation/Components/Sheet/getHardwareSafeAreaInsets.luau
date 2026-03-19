local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local v2 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_GuiService_0 = v2.Services.GuiService;
local l_CoreGui_0 = v2.Services.CoreGui;
local l_RunService_0 = v2.Services.RunService;
local l_Players_0 = v2.Services.Players;
local v7 = if l_Players_0.LocalPlayer and l_RunService_0:IsRunning() then l_Players_0.LocalPlayer:WaitForChild("PlayerGui", 3) else nil;
local v8 = require(l_script_FirstAncestor_0.Utility.isPluginSecurity);
return function() --[[ Line: 19 ]] --[[ Name: getHardwareSafeAreaInsets ]]
    -- upvalues: v1 (copy), l_GuiService_0 (copy), v8 (copy), l_CoreGui_0 (copy), v7 (copy)
    if v1.FoundationUseGetInsetArea then
        local l_l_GuiService_0_InsetArea_0 = l_GuiService_0:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets);
        local l_l_GuiService_0_InsetArea_1 = l_GuiService_0:GetInsetArea(Enum.ScreenInsets.None);
        return {
            left = l_l_GuiService_0_InsetArea_0.Min.X - l_l_GuiService_0_InsetArea_1.Min.X, 
            top = l_l_GuiService_0_InsetArea_0.Min.Y - l_l_GuiService_0_InsetArea_1.Min.Y, 
            right = l_l_GuiService_0_InsetArea_1.Max.X - l_l_GuiService_0_InsetArea_0.Max.X, 
            bottom = l_l_GuiService_0_InsetArea_1.Max.Y - l_l_GuiService_0_InsetArea_0.Max.Y
        };
    else
        local v11 = if v8() then l_CoreGui_0 else v7;
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "_FullscreenTestGui";
        l_ScreenGui_0.Parent = v11;
        l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.None;
        local l_ScreenGui_1 = Instance.new("ScreenGui");
        l_ScreenGui_1.Name = "_DeviceTestGui";
        l_ScreenGui_1.Parent = v11;
        l_ScreenGui_1.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
        local v14 = l_ScreenGui_1.AbsolutePosition - l_ScreenGui_0.AbsolutePosition;
        local v15 = l_ScreenGui_0.AbsolutePosition + l_ScreenGui_0.AbsoluteSize - (l_ScreenGui_1.AbsolutePosition + l_ScreenGui_1.AbsoluteSize);
        local v16 = {
            left = v14.X, 
            top = v14.Y, 
            right = v15.X, 
            bottom = v15.Y
        };
        l_ScreenGui_0.Parent = nil;
        l_ScreenGui_1.Parent = nil;
        l_ScreenGui_0:Destroy();
        l_ScreenGui_1:Destroy();
        return v16;
    end;
end;