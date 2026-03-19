local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v8 = require(l_Modules_0.NetworkPauseNotification);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v10 = game:DefineFastFlag("GameplayPausePausesInteraction", false);
local v11 = game:DefineFastFlag("GameplayPauseAntiFlicker2", false);
local v12 = game:DefineFastInt("RapidGameplayPauseIntervalMs", 1000);
local v13 = game:DefineFastInt("RapidGameplayPauseMinNotificationDurationMs", 500);
local v14 = true;
local v15 = false;
local v16 = os.clock();
local v17 = nil;
local v18 = nil;
local v19 = v8.new();
local v20 = v10 and l_Create_0("Frame")({
    Name = "Container", 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    Active = false
});
local v21 = l_Create_0("ScreenGui")({
    Name = "RobloxNetworkPauseNotification", 
    OnTopOfCoreBlur = true, 
    DisplayOrder = 8, 
    Parent = l_CoreGui_0, 
    IgnoreGuiInset = v10, 
    AutoLocalize = false; 
    v20
});
local function _() --[[ Line: 64 ]] --[[ Name: cancelNotificationDismissTimer ]]
    -- upvalues: v17 (ref)
    if v17 ~= nil then
        task.cancel(v17);
        v17 = nil;
    end;
end;
local function _() --[[ Line: 71 ]] --[[ Name: scheduleNotificationDismissTimer ]]
    -- upvalues: v17 (ref), v13 (copy), v18 (ref)
    if v17 ~= nil then
        task.cancel(v17);
        v17 = nil;
    end;
    v17 = task.delay(v13 / 1000, function() --[[ Line: 73 ]]
        -- upvalues: v17 (ref), v18 (ref)
        v17 = nil;
        v18();
    end);
end;
local function _(v24) --[[ Line: 79 ]] --[[ Name: setPauseUIState ]]
    -- upvalues: v19 (copy), v10 (copy), v20 (copy), l_RunService_0 (copy)
    if v24 then
        v19:Show();
    else
        v19:Hide();
    end;
    if v10 then
        v20.Active = v24;
    end;
    l_RunService_0:SetRobloxGuiFocused(v24);
end;
v18 = function() --[[ Line: 92 ]] --[[ Name: updatePauseState ]]
    -- upvalues: l_LocalPlayer_0 (ref), v21 (copy), v14 (ref), v19 (copy), v10 (copy), v20 (copy), l_RunService_0 (copy), v15 (ref), v16 (ref), v12 (copy), v17 (ref), v13 (copy), v18 (ref)
    local v26 = l_LocalPlayer_0.GameplayPaused and v21.Enabled and not v14;
    v14 = false;
    if v26 then
        if v26 then
            v19:Show();
        else
            v19:Hide();
        end;
        if v10 then
            v20.Active = v26;
        end;
        l_RunService_0:SetRobloxGuiFocused(v26);
        v15 = (os.clock() - v16) * 1000 < v12;
        if v17 ~= nil then
            task.cancel(v17);
            v17 = nil;
            return;
        end;
    else
        if v15 then
            if v17 ~= nil then
                task.cancel(v17);
                v17 = nil;
            end;
            v17 = task.delay(v13 / 1000, function() --[[ Line: 73 ]]
                -- upvalues: v17 (ref), v18 (ref)
                v17 = nil;
                v18();
            end);
        else
            v15 = false;
            if v26 then
                v19:Show();
            else
                v19:Hide();
            end;
            if v10 then
                v20.Active = v26;
            end;
            l_RunService_0:SetRobloxGuiFocused(v26);
        end;
        v16 = os.clock();
    end;
end;
local function v28() --[[ Line: 116 ]] --[[ Name: togglePauseState ]]
    -- upvalues: l_LocalPlayer_0 (ref), v21 (copy), v14 (ref), v19 (copy), v10 (copy), v20 (copy), l_RunService_0 (copy)
    local v27 = l_LocalPlayer_0.GameplayPaused and v21.Enabled and not v14;
    v14 = false;
    if v27 then
        v19:Show();
    else
        v19:Hide();
    end;
    if v10 then
        v20.Active = v27;
    end;
    l_RunService_0:SetRobloxGuiFocused(v27);
end;
if v11 then
    l_LocalPlayer_0:GetPropertyChangedSignal("GameplayPaused"):Connect(v18);
else
    l_LocalPlayer_0:GetPropertyChangedSignal("GameplayPaused"):Connect(v28);
end;
local function v31(v29) --[[ Line: 136 ]] --[[ Name: enableNotification ]]
    -- upvalues: v21 (copy), l_LocalPlayer_0 (ref), v14 (ref), v19 (copy), v10 (copy), v20 (copy), l_RunService_0 (copy)
    assert(type(v29) == "boolean", "Specified argument 'enabled' must be of type boolean");
    if v29 == v21.Enabled then
        return;
    else
        v21.Enabled = v29;
        local v30 = l_LocalPlayer_0.GameplayPaused and v21.Enabled and not v14;
        v14 = false;
        if v30 then
            v19:Show();
        else
            v19:Hide();
        end;
        if v10 then
            v20.Active = v30;
        end;
        l_RunService_0:SetRobloxGuiFocused(v30);
        return;
    end;
end;
if v10 then
    v19:SetParent(v20);
else
    v19:SetParent(v21);
end;
l_GuiService_0.NetworkPausedEnabledChanged:Connect(v31);