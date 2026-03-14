local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local v4 = require(l_CorePackages_0.Packages.React);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v6 = game:DefineFastString("PerfInsightsIXPLayer", "PerfRegressionTestLayer");
local v7 = game:DefineFastFlag("PerfInsightsEnabled", false);
local v8 = {
    hbMin = game:DefineFastInt("PerfInsightsHbMin", 0), 
    hbMax = game:DefineFastInt("PerfInsightsHbMax", 0), 
    inMin = game:DefineFastInt("PerfInsightsInMin", 0), 
    inMax = game:DefineFastInt("PerfInsightsInMax", 0)
};
local l_v8_0 = v8;
local v10 = 0;
PerformTask = function(v11, v12) --[[ Line: 24 ]] --[[ Name: PerformTask ]]
    local v13 = tick() + math.random(v11, v12) * 0.001;
    local v14 = 0;
    while tick() < v13 do
        v14 = v14 + 1;
    end;
end;
FrameWork = function() --[[ Line: 32 ]] --[[ Name: FrameWork ]]
    -- upvalues: v10 (ref), l_v8_0 (ref)
    if tick() < v10 + 2 then
        PerformTask(l_v8_0.hbMin, l_v8_0.hbMax);
    end;
end;
InputWork = function() --[[ Line: 38 ]] --[[ Name: InputWork ]]
    -- upvalues: l_v8_0 (ref)
    PerformTask(l_v8_0.inMin, l_v8_0.inMax);
end;
return function() --[[ Line: 42 ]]
    -- upvalues: v7 (copy), l_AppUserLayers_0 (copy), v6 (copy), l_v8_0 (ref), l_useUserExperiment_0 (copy), v8 (copy), v4 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), v10 (ref)
    if not v7 then
        return nil;
    else
        local v15 = l_AppUserLayers_0[v6];
        l_v8_0 = l_useUserExperiment_0({
            v15
        }, function(v16) --[[ Line: 51 ]]
            -- upvalues: v8 (ref), v15 (copy)
            local l_v8_1 = v8;
            local v18 = v16[v15];
            if v18 then
                l_v8_1.hbMin = v18.PerfInsightsHbMin or l_v8_1.hbMin;
                l_v8_1.hbMax = v18.PerfInsightsHbMax or l_v8_1.hbMax;
                l_v8_1.inMin = v18.PerfInsightsInMin or l_v8_1.inMin;
                l_v8_1.inMax = v18.PerfInsightsInMax or l_v8_1.inMax;
            end;
            return l_v8_1;
        end);
        local v19 = true;
        if l_v8_0.hbMin <= 0 then
            v19 = true;
            if l_v8_0.hbMax <= 0 then
                v19 = true;
                if l_v8_0.inMin <= 0 then
                    v19 = l_v8_0.inMax > 0;
                end;
            end;
        end;
        v4.useEffect(function() --[[ Line: 65 ]]
            -- upvalues: v19 (copy), l_RunService_0 (ref), l_UserInputService_0 (ref), v10 (ref)
            if not v19 then
                return function() --[[ Line: 67 ]]

                end;
            else
                local v20 = {};
                local v21 = false;
                local v22 = false;
                table.insert(v20, l_RunService_0.Stepped:Connect(FrameWork));
                table.insert(v20, l_UserInputService_0.InputBegan:Connect(function(v23) --[[ Line: 78 ]]
                    -- upvalues: v21 (ref), v10 (ref)
                    if v23.UserInputType == Enum.UserInputType.MouseButton1 or v23.UserInputType == Enum.UserInputType.Touch then
                        v21 = true;
                        v10 = tick();
                    end;
                end));
                table.insert(v20, l_UserInputService_0.InputChanged:Connect(function() --[[ Line: 91 ]]
                    -- upvalues: v21 (ref), v22 (ref), v10 (ref)
                    if v21 then
                        v22 = true;
                    end;
                    v10 = tick();
                end));
                table.insert(v20, l_UserInputService_0.InputEnded:Connect(function() --[[ Line: 101 ]]
                    -- upvalues: v21 (ref), v22 (ref)
                    if v21 and not v22 then
                        InputWork();
                    end;
                    v21 = false;
                    v22 = false;
                end));
                return function() --[[ Line: 110 ]]
                    -- upvalues: v20 (copy)
                    for _, v25 in v20 do
                        v25:Disconnect();
                    end;
                end;
            end;
        end, {
            v19
        });
        return nil;
    end;
end;