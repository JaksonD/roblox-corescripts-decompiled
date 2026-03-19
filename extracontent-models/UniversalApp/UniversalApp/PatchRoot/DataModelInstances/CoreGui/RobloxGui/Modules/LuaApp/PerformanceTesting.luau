local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_RunService_0 = game:GetService("RunService");
local l_Stats_0 = game:GetService("Stats");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules.LuaApp;
local v8 = require(l_LuaApp_0.Config);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Constants;
local v12 = {
    Mode = {
        None = "None", 
        Playing = "Playing", 
        Recording = "Recording"
    }, 
    LuaState = function(_) --[[ Line: 25 ]] --[[ Name: LuaState ]]
        -- upvalues: l_Stats_0 (copy)
        local l_FrameRateManager_0 = l_Stats_0:FindFirstChild("FrameRateManager");
        if not l_FrameRateManager_0 then
            warn("FrameRateManager not present in Stats");
            return {
                AverageFPS = 0, 
                FrameTimeVariance = 0
            };
        else
            return {
                AverageFPS = l_FrameRateManager_0:FindFirstChild("AverageFPS"):GetValue(), 
                FrameTimeVariance = l_FrameRateManager_0:FindFirstChild("FrameTimeVariance"):GetValue()
            };
        end;
    end
};
v12.ShowResults = function(_, v14) --[[ Line: 40 ]] --[[ Name: ShowResults ]]
    -- upvalues: v12 (copy), l_Create_0 (copy), l_Constants_0 (copy), v8 (copy), l_CoreGui_0 (copy)
    local v15 = v12:LuaState();
    l_Create_0("ScreenGui")({
        Name = "TestResults", 
        DisplayOrder = 5; 
        l_Create_0("Frame")({
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Constants_0.Color.WHITE, 
            BorderSizePixel = 0; 
            l_Create_0("UIListLayout")({
                SortOrder = "LayoutOrder"
            }), 
            l_Create_0("TextLabel")({
                Name = "Title", 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 100), 
                Text = "Test: " .. v8.General.PerformanceTestFilename
            }), 
            l_Create_0("TextLabel")({
                Name = "AverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 50), 
                Text = "AverageFPS:"
            }), 
            l_Create_0("TextLabel")({
                Name = "ExpectedAverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Expected: %g", v14.AverageFPS)
            }), 
            l_Create_0("TextLabel")({
                Name = "ActualAverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Actual  : %g", v15.AverageFPS)
            }), 
            l_Create_0("TextLabel")({
                Name = "ActualAverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Delta   : %g", v15.AverageFPS - v14.AverageFPS)
            }), 
            l_Create_0("TextLabel")({
                Name = "FrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 50), 
                Text = "FrameTimeVariance:"
            }), 
            l_Create_0("TextLabel")({
                Name = "ExpectedAFrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Expected: %g", v14.FrameTimeVariance)
            }), 
            l_Create_0("TextLabel")({
                Name = "ActualFrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Actual  : %g", v15.FrameTimeVariance)
            }), 
            l_Create_0("TextLabel")({
                Name = "ActualFrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Delta   : %g", v15.FrameTimeVariance - v14.FrameTimeVariance)
            })
        })
    }).Parent = l_CoreGui_0;
end;
v12.Record = function(v16) --[[ Line: 145 ]] --[[ Name: Record ]]
    -- upvalues: l_RunService_0 (copy), l_VirtualInputManager_0 (copy), l_HttpService_0 (copy)
    l_RunService_0:setThrottleFramerateEnabled(false);
    l_VirtualInputManager_0.RecordingCompleted:Connect(function(_) --[[ Line: 147 ]]
        -- upvalues: l_VirtualInputManager_0 (ref), l_HttpService_0 (ref), v16 (copy)
        print("*** Finished Recording Test ***");
        l_VirtualInputManager_0.AdditionalLuaState = l_HttpService_0:JSONEncode(v16:LuaState());
        print("~~~           DUMP          ~~~");
        l_VirtualInputManager_0:Dump();
    end);
    l_VirtualInputManager_0:StartRecording();
end;
v12.Play = function(v18, v19) --[[ Line: 156 ]] --[[ Name: Play ]]
    -- upvalues: l_RunService_0 (copy), l_VirtualInputManager_0 (copy), l_HttpService_0 (copy)
    print("PerformanceTesting:Play");
    l_RunService_0:setThrottleFramerateEnabled(false);
    l_VirtualInputManager_0.PlaybackCompleted:Connect(function() --[[ Line: 159 ]]
        -- upvalues: l_HttpService_0 (ref), l_VirtualInputManager_0 (ref), v18 (copy)
        print("*** Finished Playing Test ***");
        local v20 = l_HttpService_0:JSONDecode(l_VirtualInputManager_0.AdditionalLuaState);
        v18:ShowResults(v20);
    end);
    l_VirtualInputManager_0:StartPlaying(v19);
end;
v12.Stop = function(_) --[[ Line: 167 ]] --[[ Name: Stop ]]
    -- upvalues: v8 (copy), l_VirtualInputManager_0 (copy)
    if v8.General.PerformanceTestingMode == Enum.VirtualInputMode.Recording then
        l_VirtualInputManager_0:StopRecording();
    end;
end;
v12.Initialize = function(v22, v23) --[[ Line: 173 ]] --[[ Name: Initialize ]]
    -- upvalues: v8 (copy)
    if v8.General.PerformanceTestingMode == Enum.VirtualInputMode.None then
        return;
    else
        v22.appState = v23;
        if v8.General.PerformanceTestingMode == Enum.VirtualInputMode.Recording then
            v22:Record();
            return;
        else
            if v8.General.PerformanceTestingMode == Enum.VirtualInputMode.Playing then
                v22:Play(v8.General.PerformanceTestFilename);
            end;
            return;
        end;
    end;
end;
return v12;