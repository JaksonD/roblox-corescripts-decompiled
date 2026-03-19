local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v3 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v4 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v4.ValueChangedSignal;
local l_AvailabilitySignal_0 = v4.AvailabilitySignal;
local l_SettingEnum_0 = v4.SettingEnum;
local l_LAYOUT_ORDER_0 = require(l_script_FirstAncestor_0.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER;
local function v11() --[[ Line: 23 ]] --[[ Name: PerfStatsValue ]]
    -- upvalues: l_ValueChangedSignal_0 (copy), l_GameSettings_0 (copy)
    local v9 = l_ValueChangedSignal_0.new(l_GameSettings_0.PerformanceStatsVisible);
    v9:connect(function(v10) --[[ Line: 26 ]]
        -- upvalues: l_GameSettings_0 (ref)
        if l_GameSettings_0.PerformanceStatsVisible == v10 then
            return;
        else
            l_GameSettings_0.PerformanceStatsVisible = v10;
            return;
        end;
    end);
    l_GameSettings_0.PerformanceStatsVisibleChanged:Connect(function() --[[ Line: 36 ]]
        -- upvalues: v9 (copy), l_GameSettings_0 (ref)
        v9:set(l_GameSettings_0.PerformanceStatsVisible);
    end);
    return v9;
end;
local v12 = l_AvailabilitySignal_0.new(not v3:IsSubjectToChinaPolicies());
return {
    id = "perf-stats", 
    field_type = l_SettingEnum_0.Toggle, 
    alreadyLocalized = false, 
    label = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats", 
    onChanged = v11(), 
    availability = v12, 
    layoutOrder = l_LAYOUT_ORDER_0.PerformanceStatsFrame
};