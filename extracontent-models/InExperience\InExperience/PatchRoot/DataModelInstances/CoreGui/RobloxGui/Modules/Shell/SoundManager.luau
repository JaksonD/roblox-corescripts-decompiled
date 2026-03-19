local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v5 = {
    BackgroundLoop = "RobloxMusic.ogg", 
    Error = "Error.mp3", 
    ButtonPress = "ButtonPress.mp3", 
    MoveSelection = "MoveSelection.mp3", 
    OverlayOpen = "OverlayOpen.mp3", 
    PopUp = "PopUp.mp3", 
    PurchaseSuccess = "PurchaseSuccess.mp3", 
    ScreenChange = "ScreenChange.mp3", 
    SideMenuSlideIn = "SideMenuSlideIn.mp3"
};
local v6 = {};
local function _(v7, v8, v9, v10) --[[ Line: 33 ]] --[[ Name: EaseOutCirc ]]
    v7 = v7 / v10 - 1;
    return v9 * math.sqrt(1 - v7 * v7) + v8;
end;
local function v12() --[[ Line: 39 ]] --[[ Name: IsGameRunning ]]
    -- upvalues: l_RunService_0 (copy)
    if not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
        return true;
    else
        return l_RunService_0:IsRunning();
    end;
end;
GetSoundManager = function() --[[ Line: 46 ]]
    -- upvalues: v6 (copy), v5 (copy), v12 (copy), l_Utility_0 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    local v13 = {
        SoundHolder = nil
    };
    local v14 = {};
    local function _(v15) --[[ Line: 53 ]] --[[ Name: FindSoundObjectForName ]]
        -- upvalues: v6 (ref)
        if v6[v15] then
            local v16 = table.remove(v6[v15], 1);
            if v16 then
                table.insert(v6[v15], v16);
                return v16;
            end;
        end;
    end;
    v13.CreateSound = function(_, v19) --[[ Line: 63 ]] --[[ Name: CreateSound ]]
        -- upvalues: v5 (ref)
        local v20 = "rbxasset://sounds/ui/Shell/" .. v5[v19];
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.Name = v19;
        l_Sound_0.SoundId = v20;
        return l_Sound_0;
    end;
    v13.Play = function(_, v23, v24, v25, v26, ...) --[[ Line: 74 ]] --[[ Name: Play ]]
        -- upvalues: v5 (ref), v6 (ref), v14 (copy), v12 (ref)
        local v27 = false;
        local v28 = nil;
        if v5[v23] then
            local v29;
            if v6[v23] then
                local v30 = table.remove(v6[v23], 1);
                if v30 then
                    table.insert(v6[v23], v30);
                    v29 = v30;
                    v27 = true;
                end;
            end;
            if not v27 then
                v29 = nil;
            end;
            v27 = false;
            if v29 then
                v29.Volume = v24 or 1;
                v29.Looped = v25 or false;
                v29.Pitch = v26 or 1;
                v29:Play(...);
                v14[v29] = v29.Volume;
                if not v12() then
                    v29.Volume = 0;
                end;
                return v29;
            end;
        else
            spawn(function() --[[ Line: 95 ]]
                -- upvalues: v23 (copy)
                error("Unable to find sound: " .. tostring(v23));
            end);
        end;
        return v28;
    end;
    v13.IsPlaying = function(_, v32) --[[ Line: 103 ]] --[[ Name: IsPlaying ]]
        -- upvalues: v13 (copy)
        local l_FirstChild_0 = v13.SoundHolder:FindFirstChild(v32);
        if l_FirstChild_0 then
            return l_FirstChild_0.IsPlaying;
        else
            return false;
        end;
    end;
    v13.Stop = function(_, v35, ...) --[[ Line: 111 ]] --[[ Name: Stop ]]
        -- upvalues: v13 (copy), v5 (ref)
        if v13.SoundHolder and v5[v35] then
            local l_FirstChild_1 = v13.SoundHolder:FindFirstChild(v35);
            if l_FirstChild_1 then
                l_FirstChild_1:Stop();
            end;
        end;
    end;
    v13.TweenSound = function(_, v38, v39, v40) --[[ Line: 120 ]] --[[ Name: TweenSound ]]
        -- upvalues: v14 (copy), l_Utility_0 (ref), v12 (ref)
        v14[v38] = nil;
        l_Utility_0.PropertyTweener(v38, "Volume", v38.Volume, v39, v40, function(...) --[[ Line: 123 ]]
            -- upvalues: v12 (ref), l_Utility_0 (ref)
            return v12() and l_Utility_0.EaseInOutQuad(...) or 0;
        end, true, function() --[[ Line: 127 ]]
            -- upvalues: v14 (ref), v38 (copy), v39 (copy)
            v14[v38] = v39;
        end);
    end;
    (function() --[[ Line: 138 ]] --[[ Name: Initialize ]]
        -- upvalues: l_CoreGui_0 (ref), v13 (copy), v5 (ref), v6 (ref), l_GuiService_0 (ref), v12 (ref), v14 (copy)
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "AppShellSounds";
        l_Folder_0.Parent = l_CoreGui_0;
        v13.SoundHolder = l_Folder_0;
        for v42, _ in pairs(v5) do
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = v42;
            l_Folder_1.Parent = v13.SoundHolder;
            v6[v42] = {};
            local l_v13_Sound_0 = v13:CreateSound(v42);
            l_v13_Sound_0.Parent = l_Folder_1;
            table.insert(v6[v42], l_v13_Sound_0);
            l_v13_Sound_0 = v13:CreateSound(v42);
            l_v13_Sound_0.Parent = l_Folder_1;
            table.insert(v6[v42], l_v13_Sound_0);
            l_v13_Sound_0 = v13:CreateSound(v42);
            l_v13_Sound_0.Parent = l_Folder_1;
            table.insert(v6[v42], l_v13_Sound_0);
        end;
        local v46 = nil;
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function() --[[ Line: 159 ]]
            -- upvalues: l_GuiService_0 (ref), v46 (ref)
            local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
            if l_SelectedCoreObject_0 and v46 then
                local l_MoveSelection_0 = l_SelectedCoreObject_0:FindFirstChild("MoveSelection");
                if l_MoveSelection_0 and l_MoveSelection_0:IsA("Sound") then
                    l_MoveSelection_0.Volume = 0.35;
                    l_MoveSelection_0:Play();
                end;
            end;
            v46 = l_SelectedCoreObject_0;
        end);
        if not v12() then
            spawn(function() --[[ Line: 172 ]]
                -- upvalues: v12 (ref), v14 (ref)
                while not v12() do
                    wait(0.1);
                end;
                for v49, v50 in pairs(v14) do
                    v49.Volume = v50;
                end;
            end);
        end;
    end)();
    return v13;
end;
return GetSoundManager();