local l_Players_0 = game:GetService("Players");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregatorManager);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsButton);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v7 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsViewer);
local v8 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)();
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = {};
local v13 = nil;
local v14 = nil;
if not v8 then
    v9 = Instance.new("Frame");
    v9.Name = "PerformanceStats";
    v10 = v4.getSingleton();
    v11 = v7.new();
    for _, v16 in ipairs(v6.AllStatTypes) do
        v12[v16] = v5.new(v16);
    end;
end;
ShowMasterFrame = function() --[[ Line: 48 ]] --[[ Name: ShowMasterFrame ]]
    -- upvalues: v9 (ref), l_CoreGui_0 (copy)
    v9.Visible = true;
    v9.Parent = l_CoreGui_0.RobloxGui;
end;
HideMasterFrame = function() --[[ Line: 53 ]] --[[ Name: HideMasterFrame ]]
    -- upvalues: v9 (ref)
    v9.Visible = false;
    v9.Parent = nil;
end;
ConfigureMasterFrame = function() --[[ Line: 59 ]] --[[ Name: ConfigureMasterFrame ]]
    -- upvalues: v9 (ref)
    v9.Position = UDim2.new(0, 0, 0, 0);
    v9.Size = UDim2.new(1, 0, 1, 0);
    v9.Selectable = false;
    v9.BackgroundTransparency = 1;
    v9.Active = false;
    v9.ZIndex = 0;
    HideMasterFrame();
end;
ConfigureStatButtonsInMasterFrame = function() --[[ Line: 77 ]] --[[ Name: ConfigureStatButtonsInMasterFrame ]]
    -- upvalues: v6 (copy)
    for v17, v18 in ipairs(v6.AllStatTypes) do
        AddButton(v18, v17);
    end;
end;
OnButtonToggled = function(v19) --[[ Line: 84 ]] --[[ Name: OnButtonToggled ]]
    -- upvalues: v12 (ref), v13 (ref)
    if not v12[v19]._isSelected then
        v13 = v19;
    else
        v13 = nil;
    end;
    UpdateButtonSelectedStates();
    UpdateViewerVisibility();
end;
UpdateButtonSelectedStates = function() --[[ Line: 99 ]] --[[ Name: UpdateButtonSelectedStates ]]
    -- upvalues: v6 (copy), v12 (ref), v13 (ref)
    for _, v21 in ipairs(v6.AllStatTypes) do
        v12[v21]:SetIsSelected(v21 == v13);
    end;
end;
UpdateViewerVisibility = function() --[[ Line: 106 ]] --[[ Name: UpdateViewerVisibility ]]
    -- upvalues: v13 (ref), v11 (ref), v10 (ref), l_RbxAnalyticsService_0 (copy)
    if v13 == nil then
        if v11:GetIsVisible() then
            v11:SetVisible(false);
            v11:SetStatsAggregator(nil);
            return;
        end;
    else
        local v22 = false;
        if not v11:GetIsVisible() then
            v22 = true;
            v11:SetVisible(true);
        end;
        if v13 ~= v11:GetStatType() then
            v11:SetStatType(v13);
            v11:SetStatsAggregator(v10:GetAggregator(v13));
            v22 = true;
        end;
        if v22 then
            l_RbxAnalyticsService_0:TrackEvent("Game", "Enlarge PerfStat", v13, 0);
        end;
    end;
end;
AddButton = function(v23, v24) --[[ Line: 135 ]] --[[ Name: AddButton ]]
    -- upvalues: v12 (ref), v9 (ref), v10 (ref), v6 (copy)
    local v25 = v12[v23];
    v25:SetParent(v9);
    v25:SetStatsAggregator(v10:GetAggregator(v23));
    local v26 = 1 / v6.NumButtonTypes;
    v25:SetSizeAndPosition(UDim2.new(v26, 0, 0, v6.ButtonHeight), (UDim2.new(v26 * (v24 - 1), 0, 0, 0)));
    v25:SetToggleCallbackFunction(OnButtonToggled);
end;
ConfigureStatViewerInMasterFrame = function() --[[ Line: 154 ]] --[[ Name: ConfigureStatViewerInMasterFrame ]]
    -- upvalues: v11 (ref), v9 (ref), v6 (copy)
    v11:SetParent(v9);
    local v27 = UDim2.new(0, v6.ViewerWidth, 0, v6.ViewerHeight);
    local v28 = UDim2.new(1, -v6.ViewerWidth, 0, v6.ButtonHeight + v6.ViewerTopMargin);
    v11:SetSizeAndPosition(v27, v28);
end;
if v8 then
    CreatePerformanceStatsUI = function() --[[ Line: 166 ]] --[[ Name: CreatePerformanceStatsUI ]]
        -- upvalues: v10 (ref), v4 (copy), v9 (ref), v12 (ref), v6 (copy), v5 (copy), v11 (ref), v7 (copy), v13 (ref)
        v10 = v4.getSingleton();
        v10:StartListening();
        v9 = Instance.new("Frame");
        v9.Name = "PerformanceStats";
        v12 = {};
        for _, v30 in v6.AllStatTypes do
            v12[v30] = v5.new(v30);
        end;
        v11 = v7.new();
        v13 = nil;
        ConfigureMasterFrame();
        ConfigureStatButtonsInMasterFrame();
        ConfigureStatViewerInMasterFrame();
        UpdateButtonSelectedStates();
        UpdateViewerVisibility();
        ShowMasterFrame();
    end;
    DestroyPerformanceStatsUI = function() --[[ Line: 192 ]] --[[ Name: DestroyPerformanceStatsUI ]]
        -- upvalues: v11 (ref), v6 (copy), v12 (ref), v9 (ref), v13 (ref), v10 (ref)
        if v11 then
            v11:OnPerformanceStatsShouldBeVisibleChanged();
        end;
        for _, v32 in ipairs(v6.AllStatTypes) do
            local v33 = v12[v32];
            if v33 then
                v33:OnPerformanceStatsShouldBeVisibleChanged();
            end;
        end;
        if v9 then
            v9:Destroy();
            v9 = nil;
        end;
        v11 = nil;
        v12 = {};
        v13 = nil;
        if v10 then
            v10:StopListening();
        end;
    end;
    UpdatePerformanceStatsVisibility = function() --[[ Line: 218 ]] --[[ Name: UpdatePerformanceStatsVisibility ]]
        -- upvalues: v6 (copy), v9 (ref), l_RbxAnalyticsService_0 (copy), v14 (ref)
        local v34 = v6.PerformanceStatsShouldBeVisible();
        if v34 == (v9 ~= nil) then
            return;
        else
            if v34 then
                CreatePerformanceStatsUI();
            else
                DestroyPerformanceStatsUI();
            end;
            local v35 = "Hide PerfStats";
            if v34 then
                v35 = "Show PerfStats";
            end;
            l_RbxAnalyticsService_0:TrackEvent("Game", v35, "", 0);
            if v34 then
                v14 = time();
                l_RbxAnalyticsService_0:ReportCounter("OpenPerformanceProfiler", 1);
                return;
            else
                if v14 then
                    local v36 = time() - v14;
                    l_RbxAnalyticsService_0:ReportStats("TimeOpenPerformanceProfiler", v36);
                end;
                return;
            end;
        end;
    end;
else
    UpdatePerformanceStatsVisibility = function() --[[ Line: 251 ]] --[[ Name: UpdatePerformanceStatsVisibility ]]
        -- upvalues: v6 (copy), v9 (ref), v11 (ref), v12 (ref), l_RbxAnalyticsService_0 (copy), v14 (ref)
        local v37 = v6.PerformanceStatsShouldBeVisible();
        if v37 == v9.Visible then
            return;
        else
            if v37 then
                ShowMasterFrame();
            else
                HideMasterFrame();
            end;
            v11:OnPerformanceStatsShouldBeVisibleChanged();
            for _, v39 in ipairs(v6.AllStatTypes) do
                v12[v39]:OnPerformanceStatsShouldBeVisibleChanged();
            end;
            local v40 = "Hide PerfStats";
            if v37 then
                v40 = "Show PerfStats";
            end;
            l_RbxAnalyticsService_0:TrackEvent("Game", v40, "", 0);
            if v37 then
                v14 = time();
                l_RbxAnalyticsService_0:ReportCounter("OpenPerformanceProfiler", 1);
                return;
            else
                if v14 then
                    local v41 = time() - v14;
                    l_RbxAnalyticsService_0:ReportStats("TimeOpenPerformanceProfiler", v41);
                end;
                return;
            end;
        end;
    end;
end;
l_GameSettings_0.PerformanceStatsVisibleChanged:connect(UpdatePerformanceStatsVisibility);
if not v8 then
    ConfigureMasterFrame();
    ConfigureStatButtonsInMasterFrame();
    ConfigureStatViewerInMasterFrame();
    UpdateButtonSelectedStates();
    UpdateViewerVisibility();
    UpdatePerformanceStatsVisibility();
end;
spawn(function() --[[ Line: 305 ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0.PlayerAdded:wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    UpdatePerformanceStatsVisibility();
end);