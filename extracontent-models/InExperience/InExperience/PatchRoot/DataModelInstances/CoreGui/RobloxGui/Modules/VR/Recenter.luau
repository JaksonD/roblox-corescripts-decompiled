local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v8 = false;
local v9 = {
    ModuleName = "Recenter", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = false
};
l_VRHub_0:RegisterModule(v9);
local v10 = l_Panel3D_0.Get("RecenterCountdown");
v10:SetType(l_Panel3D_0.Type.HorizontalFollow);
v10:ResizeStuds(5, 3, 128);
v10:SetCanFade(false);
local v11 = l_Create_0("TextLabel")({
    Parent = v10:GetGUI(), 
    Position = UDim2.new(0.5, -64, 0.5, -64), 
    Size = UDim2.new(0, 128, 0, 128), 
    BackgroundTransparency = 0.9, 
    BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
    TextColor3 = Color3.new(1, 1, 1), 
    Text = "", 
    TextScaled = true, 
    Font = Enum.Font.SourceSansBold, 
    Visible = true
});
local _ = l_Create_0("ImageLabel")({
    Parent = v10:GetGUI(), 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    Image = "rbxasset://textures/ui/VR/recenterFrame.png"
});
v10:SetVisible(false);
local v13 = false;
local function _() --[[ Line: 55 ]] --[[ Name: cancelCountdown ]]
    -- upvalues: v13 (ref), v10 (copy)
    v13 = false;
    v10:SetVisible(false);
end;
l_VRHub_0.ModuleOpened.Event:connect(function(v15) --[[ Line: 60 ]]
    -- upvalues: v9 (copy), l_VRHub_0 (copy), v13 (ref), v10 (copy)
    if v15 ~= v9.ModuleName and l_VRHub_0:GetModule(v15).VRIsExclusive then
        v13 = false;
        v10:SetVisible(false);
    end;
end);
v9.SetVisible = function(_, v17) --[[ Line: 69 ]] --[[ Name: SetVisible ]]
    -- upvalues: v8 (ref), v13 (ref), v10 (copy), l_VRHub_0 (copy), v9 (copy), l_ContextActionService_0 (copy), v11 (copy), l_UserInputService_0 (copy)
    v8 = v17;
    if v8 then
        if v13 then
            v13 = false;
            v10:SetVisible(false);
            l_VRHub_0:FireModuleClosed(v9.ModuleName);
            return;
        else
            l_VRHub_0:FireModuleOpened(v9.ModuleName);
            spawn(function() --[[ Line: 81 ]]
                -- upvalues: v13 (ref), v10 (ref), l_ContextActionService_0 (ref), v11 (ref), l_UserInputService_0 (ref), l_VRHub_0 (ref), v9 (ref)
                v13 = true;
                v10:SetVisible(true);
                l_ContextActionService_0:BindCoreAction("CancelRecenterShortcut", function(_, v19, _) --[[ Line: 85 ]]
                    -- upvalues: v13 (ref), v10 (ref)
                    if v19 == Enum.UserInputState.Begin then
                        v13 = false;
                        v10:SetVisible(false);
                    end;
                end, false, Enum.KeyCode.ButtonB);
                if v13 then
                    v11.Text = tostring(3);
                    wait(1);
                end;
                if v13 then
                    v11.Text = tostring(2);
                    wait(1);
                end;
                if v13 then
                    v11.Text = tostring(1);
                    wait(1);
                end;
                if v13 then
                    l_UserInputService_0:RecenterUserHeadCFrame();
                end;
                v10:SetVisible(false);
                v13 = false;
                l_ContextActionService_0:UnbindCoreAction("CancelRecenterShortcut");
                l_VRHub_0:FireModuleClosed(v9.ModuleName);
            end);
            return;
        end;
    else
        v13 = false;
        v10:SetVisible(false);
        l_VRHub_0:FireModuleClosed(v9.ModuleName);
        return;
    end;
end;
v9.IsVisible = function(_) --[[ Line: 115 ]] --[[ Name: IsVisible ]]
    -- upvalues: v8 (ref)
    return v8;
end;
return v9;