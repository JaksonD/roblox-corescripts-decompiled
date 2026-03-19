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
local l_status_1, l_result_1 = pcall(function() --[[ Line: 32 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local _ = l_status_1 and l_result_1;
PingStatName = function() --[[ Line: 35 ]] --[[ Name: PingStatName ]]
    if game:GetEngineFeature("PerfStatNetworkPingEnabled2") then
        return "NetworkPing";
    else
        return "Ping";
    end;
end;
local v14 = {
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
v14.GraphAverageLineTotalThickness = v14.GraphAverageLineInnerThickness + 2 * v14.GraphAverageLineBorderThickness;
v14.TextPanelTitleHeightY = 52;
v14.TextPanelLegendItemHeightY = 20;
v14.TextPanelLeftMarginPix = 10;
v14.TextPanelTopMarginPix = 10;
v14.DecorationSize = 12;
v14.OvalKeySize = 8;
v14.TargetKeyWidth = 11;
v14.TargetKeyHeight = 2;
v14.DecorationMargin = 6;
v14.StatType_Memory = "st_Memory";
v14.StatType_CPU = "st_CPU";
v14.StatType_GPU = "st_GPU";
v14.StatType_NetworkSent = "st_NetworkSent";
v14.StatType_NetworkReceived = "st_NetworkReceived";
v14.StatType_Ping = "st_Ping";
v14.AllStatTypes = {
    v14.StatType_Memory, 
    v14.StatType_CPU, 
    v14.StatType_GPU, 
    v14.StatType_NetworkSent, 
    v14.StatType_NetworkReceived, 
    v14.StatType_Ping
};
v14.StatNames = {
    [v14.StatType_Memory] = "Memory", 
    [v14.StatType_CPU] = "CPU", 
    [v14.StatType_GPU] = "GPU", 
    [v14.StatType_NetworkSent] = "NetworkSent", 
    [v14.StatType_NetworkReceived] = "NetworkReceived", 
    [v14.StatType_Ping] = "Ping"
};
v14.StatMaxNames = {
    [v14.StatType_Memory] = "MaxMemory", 
    [v14.StatType_CPU] = "MaxCPU", 
    [v14.StatType_GPU] = "MaxGPU", 
    [v14.StatType_NetworkSent] = "MaxNetworkSent", 
    [v14.StatType_NetworkReceived] = "MaxNetworkReceived", 
    [v14.StatType_Ping] = "MaxPing"
};
v14.NumButtonTypes = #v14.AllStatTypes;
local v15 = LocalizeWithFallback("InGame.UnknownNamespace.Network", "Network");
local v16 = LocalizeWithFallback("InGame.UnknownNamespace.Sent", "Sent") .. "\n" .. v15;
local v17 = LocalizeWithFallback("InGame.UnknownNamespace.Received", "Received") .. "\n" .. v15;
v14.TypeToName = {
    [v14.StatType_Memory] = "Memory", 
    [v14.StatType_CPU] = "CPU", 
    [v14.StatType_GPU] = "GPU", 
    [v14.StatType_NetworkSent] = v16, 
    [v14.StatType_NetworkReceived] = v17, 
    [v14.StatType_Ping] = PingStatName()
};
v14.TypeToShortName = {
    [v14.StatType_Memory] = "Mem", 
    [v14.StatType_CPU] = "CPU", 
    [v14.StatType_GPU] = "GPU", 
    [v14.StatType_NetworkSent] = "Sent", 
    [v14.StatType_NetworkReceived] = "Recv", 
    [v14.StatType_Ping] = PingStatName()
};
v14.MemoryAnalyzerTypeToName = {
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
v14.GetMemoryAnalyzerStatName = function(v18) --[[ Line: 169 ]] --[[ Name: GetMemoryAnalyzerStatName ]]
    -- upvalues: v14 (copy)
    if v14.MemoryAnalyzerTypeToName[v18] == nil then
        return v18;
    else
        return v14.MemoryAnalyzerTypeToName[v18];
    end;
end;
v14.StyleFrame = function(v19) --[[ Line: 177 ]] --[[ Name: StyleFrame ]]
    -- upvalues: v14 (copy)
    v19.BackgroundColor3 = v14.NormalColor;
    v19.BackgroundTransparency = v14.Transparency;
end;
v14.StyleButton = function(v20) --[[ Line: 182 ]] --[[ Name: StyleButton ]]
    -- upvalues: v14 (copy)
    v20.BackgroundColor3 = v14.NormalColor;
    v20.BackgroundTransparency = v14.Transparency;
end;
v14.StyleTextWidget = function(v21) --[[ Line: 187 ]] --[[ Name: StyleTextWidget ]]
    -- upvalues: v14 (copy)
    v21.BackgroundTransparency = 1;
    v21.TextColor3 = v14.FontColor;
    v21.Font = Enum.Font.SourceSansBold;
end;
v14.StyleButtonSelected = function(v22, v23) --[[ Line: 193 ]] --[[ Name: StyleButtonSelected ]]
    -- upvalues: v14 (copy)
    v14.StyleButton(v22);
    if v23 then
        v22.BackgroundColor3 = v14.SelectedBackgroundColor;
    end;
end;
local l_status_2, l_result_2 = pcall(function() --[[ Line: 200 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v26 = l_status_2 and l_result_2;
v14.FormatTypedValue = function(v27, v28) --[[ Line: 203 ]] --[[ Name: FormatTypedValue ]]
    -- upvalues: v26 (copy), v14 (copy)
    if v26 then
        if v28 == v14.StatType_CPU or v28 == v14.StatType_GPU then
            return string.gsub(LocalizeWithFallback("InGame.StatsUtil.ms", string.format("%.2f MB", v27)), "{RBX_NUMBER}", string.format("%.2f", v27));
        elseif v28 == v14.StatType_NetworkSent or v28 == v14.StatType_NetworkReceived then
            return string.gsub(LocalizeWithFallback("InGame.StatsUtil.KBps", string.format("%.2f KB/s", v27)), "{RBX_NUMBER}", string.format("%.2f", v27));
        end;
    end;
    if v28 == v14.StatType_Memory then
        return string.format("%.2f MB", v27);
    elseif v28 == v14.StatType_CPU then
        return string.format("%.2f ms", v27);
    elseif v28 == v14.StatType_GPU then
        return string.format("%.2f ms", v27);
    elseif v28 == v14.StatType_NetworkSent then
        return string.format("%.2f KB/s", v27);
    elseif v28 == v14.StatType_NetworkReceived then
        return string.format("%.2f KB/s", v27);
    elseif v28 == v14.StatType_Ping then
        if game:GetEngineFeature("PerfStatNetworkPingEnabled2") then
            return string.format("%.0f ms", v27);
        else
            return string.format("%.2f ms", v27);
        end;
    else
        return;
    end;
end;
v14.StyleAverageLine = function(v29) --[[ Line: 237 ]] --[[ Name: StyleAverageLine ]]
    -- upvalues: v14 (copy)
    v29.BackgroundColor3 = v14.GraphAverageLineColor;
    v29.BorderSizePixel = v14.GraphAverageLineBorderThickness;
    v29.BorderColor3 = v14.GraphAverageLineBorderColor;
end;
v14.GetColorForValue = function(v30, v31) --[[ Line: 243 ]] --[[ Name: GetColorForValue ]]
    -- upvalues: v14 (copy)
    if v30 < 0.666 * v31 then
        return v14.GraphBarGreenColor;
    elseif v30 < 1.333 * v31 then
        return v14.GraphBarYellowColor;
    else
        return v14.GraphBarRedColor;
    end;
end;
v14.PerformanceStatsShouldBeVisible = function() --[[ Line: 253 ]] --[[ Name: PerformanceStatsShouldBeVisible ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    return l_GameSettings_0.PerformanceStatsVisible and l_LocalPlayer_0 ~= nil;
end;
return v14;