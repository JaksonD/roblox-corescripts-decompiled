local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v4 = require(l_CoreGui_0.RobloxGui.Modules.StyleWidgets);
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local _ = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
LocalizeWithFallback = function(v7, v8) --[[ Line: 20 ]] --[[ Name: LocalizeWithFallback ]]
    -- upvalues: v5 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
        -- upvalues: v5 (ref), v7 (copy)
        return v5:FormatByKey(v7);
    end);
    if l_status_0 and l_result_0 then
        return l_result_0;
    else
        return v8;
    end;
end;
PingStatName = function() --[[ Line: 32 ]] --[[ Name: PingStatName ]]
    if game:GetEngineFeature("PerfStatNetworkPingEnabled2") then
        return "NetworkPing";
    else
        return "Ping";
    end;
end;
local v11 = {
    SelectedBackgroundColor = Color3.new(0.4, 0.4, 0.4), 
    FontColor = Color3.new(1, 1, 1), 
    GraphBarGreenColor = Color3.new(0.49411764705882355, 0.8274509803921568, 0.12941176470588237), 
    GraphBarYellowColor = Color3.new(0.8196078431372549, 0.8274509803921568, 0.12941176470588237), 
    GraphBarRedColor = Color3.new(0.8274509803921568, 0.34509803921568627, 0.12941176470588237), 
    GraphAverageLineColor = Color3.new(0.8156862745098039, 0.00392156862745098, 0.10588235294117647), 
    GraphAverageLineBorderColor = Color3.new(1, 1, 1), 
    NormalColor = Color3.fromRGB(31, 31, 31), 
    Transparency = 0.5, 
    MiniPanelTitleFontSize = Enum.FontSize.Size12, 
    MiniPanelValueFontSize = Enum.FontSize.Size10, 
    PanelTitleFontSize = Enum.FontSize.Size24, 
    PanelValueFontSize = Enum.FontSize.Size14, 
    PanelGraphFontSize = Enum.FontSize.Size10, 
    ButtonHeight = 36 + v4.TabSelectionHeight, 
    ViewerTopMargin = 10, 
    ViewerHeight = 144, 
    ViewerWidth = 306, 
    TextZIndex = 5, 
    GraphZIndex = 2, 
    GraphTargetLineInnerThickness = 2, 
    GraphAverageLineInnerThickness = 2, 
    GraphAverageLineBorderThickness = 1
};
v11.GraphAverageLineTotalThickness = v11.GraphAverageLineInnerThickness + 2 * v11.GraphAverageLineBorderThickness;
v11.TextPanelTitleHeightY = 52;
v11.TextPanelLegendItemHeightY = 20;
v11.TextPanelLeftMarginPix = 10;
v11.TextPanelTopMarginPix = 10;
v11.DecorationSize = 12;
v11.OvalKeySize = 8;
v11.TargetKeyWidth = 11;
v11.TargetKeyHeight = 2;
v11.DecorationMargin = 6;
v11.StatType_Memory = "st_Memory";
v11.StatType_CPU = "st_CPU";
v11.StatType_GPU = "st_GPU";
v11.StatType_NetworkSent = "st_NetworkSent";
v11.StatType_NetworkReceived = "st_NetworkReceived";
v11.StatType_Ping = "st_Ping";
v11.AllStatTypes = {
    v11.StatType_Memory, 
    v11.StatType_CPU, 
    v11.StatType_GPU, 
    v11.StatType_NetworkSent, 
    v11.StatType_NetworkReceived, 
    v11.StatType_Ping
};
v11.StatNames = {
    [v11.StatType_Memory] = "Memory", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = "NetworkSent", 
    [v11.StatType_NetworkReceived] = "NetworkReceived", 
    [v11.StatType_Ping] = "Ping"
};
v11.StatMaxNames = {
    [v11.StatType_Memory] = "MaxMemory", 
    [v11.StatType_CPU] = "MaxCPU", 
    [v11.StatType_GPU] = "MaxGPU", 
    [v11.StatType_NetworkSent] = "MaxNetworkSent", 
    [v11.StatType_NetworkReceived] = "MaxNetworkReceived", 
    [v11.StatType_Ping] = "MaxPing"
};
v11.NumButtonTypes = #v11.AllStatTypes;
local v12 = LocalizeWithFallback("InGame.UnknownNamespace.Network", "Network");
local v13 = LocalizeWithFallback("InGame.UnknownNamespace.Sent", "Sent") .. "\n" .. v12;
local v14 = LocalizeWithFallback("InGame.UnknownNamespace.Received", "Received") .. "\n" .. v12;
v11.TypeToName = {
    [v11.StatType_Memory] = "Memory", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = v13, 
    [v11.StatType_NetworkReceived] = v14, 
    [v11.StatType_Ping] = PingStatName()
};
v11.TypeToShortName = {
    [v11.StatType_Memory] = "Mem", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = "Sent", 
    [v11.StatType_NetworkReceived] = "Recv", 
    [v11.StatType_Ping] = PingStatName()
};
v11.MemoryAnalyzerTypeToName = {
    HumanoidTexture = "Humanoid Textures", 
    HumanoidTextureOrphan = "Humanoid Textures (Unused)", 
    OtherTexture = "Other Textures", 
    OtherTextureOrphan = "Other Textures (Unused)", 
    CoreScript = "Core Scripts", 
    UserScript = "User Scripts", 
    Sounds = "Sounds", 
    CSG = "Solid Models", 
    Meshes = "Meshes"
};
v11.GetMemoryAnalyzerStatName = function(v15) --[[ Line: 166 ]] --[[ Name: GetMemoryAnalyzerStatName ]]
    -- upvalues: v11 (copy)
    if v11.MemoryAnalyzerTypeToName[v15] == nil then
        return v15;
    else
        return v11.MemoryAnalyzerTypeToName[v15];
    end;
end;
v11.StyleFrame = function(v16) --[[ Line: 174 ]] --[[ Name: StyleFrame ]]
    -- upvalues: v11 (copy)
    v16.BackgroundColor3 = v11.NormalColor;
    v16.BackgroundTransparency = v11.Transparency;
end;
v11.StyleButton = function(v17) --[[ Line: 179 ]] --[[ Name: StyleButton ]]
    -- upvalues: v11 (copy)
    v17.BackgroundColor3 = v11.NormalColor;
    v17.BackgroundTransparency = v11.Transparency;
end;
v11.StyleTextWidget = function(v18) --[[ Line: 184 ]] --[[ Name: StyleTextWidget ]]
    -- upvalues: v11 (copy)
    v18.BackgroundTransparency = 1;
    v18.TextColor3 = v11.FontColor;
    v18.Font = Enum.Font.SourceSansBold;
end;
v11.StyleButtonSelected = function(v19, v20) --[[ Line: 190 ]] --[[ Name: StyleButtonSelected ]]
    -- upvalues: v11 (copy)
    v11.StyleButton(v19);
    if v20 then
        v19.BackgroundColor3 = v11.SelectedBackgroundColor;
    end;
end;
v11.FormatTypedValue = function(v21, v22) --[[ Line: 197 ]] --[[ Name: FormatTypedValue ]]
    -- upvalues: v11 (copy)
    if v22 == v11.StatType_Memory then
        return string.format("%.2f MB", v21);
    elseif v22 == v11.StatType_CPU then
        return string.format("%.2f ms", v21);
    elseif v22 == v11.StatType_GPU then
        return string.format("%.2f ms", v21);
    elseif v22 == v11.StatType_NetworkSent then
        return string.format("%.2f KB/s", v21);
    elseif v22 == v11.StatType_NetworkReceived then
        return string.format("%.2f KB/s", v21);
    elseif v22 == v11.StatType_Ping then
        if game:GetEngineFeature("PerfStatNetworkPingEnabled2") then
            return string.format("%.0f ms", v21);
        else
            return string.format("%.2f ms", v21);
        end;
    else
        return;
    end;
end;
v11.StyleAverageLine = function(v23) --[[ Line: 217 ]] --[[ Name: StyleAverageLine ]]
    -- upvalues: v11 (copy)
    v23.BackgroundColor3 = v11.GraphAverageLineColor;
    v23.BorderSizePixel = v11.GraphAverageLineBorderThickness;
    v23.BorderColor3 = v11.GraphAverageLineBorderColor;
end;
v11.GetColorForValue = function(v24, v25) --[[ Line: 223 ]] --[[ Name: GetColorForValue ]]
    -- upvalues: v11 (copy)
    if v24 < 0.666 * v25 then
        return v11.GraphBarGreenColor;
    elseif v24 < 1.333 * v25 then
        return v11.GraphBarYellowColor;
    else
        return v11.GraphBarRedColor;
    end;
end;
v11.PerformanceStatsShouldBeVisible = function() --[[ Line: 233 ]] --[[ Name: PerformanceStatsShouldBeVisible ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    return l_GameSettings_0.PerformanceStatsVisible and l_LocalPlayer_0 ~= nil;
end;
return v11;