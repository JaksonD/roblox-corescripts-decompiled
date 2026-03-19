local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local v5 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v6 = require(l_script_FirstAncestor_0.Integrations.Constants);
local v7 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v7.ValueChangedSignal;
local l_AvailabilitySignal_0 = v7.AvailabilitySignal;
local l_SettingEnum_0 = v7.SettingEnum;
local v11 = require(script.Parent.Parent.Parent.Parent.DevConsoleMaster);
local l_LAYOUT_ORDER_0 = v6.GAMESETTINGS.LAYOUT_ORDER;
local function _() --[[ Line: 22 ]] --[[ Name: DeveloperConsoleValue ]]
    -- upvalues: l_ValueChangedSignal_0 (copy), v11 (copy)
    local v13 = l_ValueChangedSignal_0.new();
    v13:connect(function() --[[ Line: 25 ]]
        -- upvalues: v11 (ref)
        if v11 then
            v11:SetVisibility(true);
            local v14 = require(script.Parent.Parent.Parent.SettingsHub);
            if v14 then
                v14:SetVisibility(false);
            end;
        end;
    end);
    return v13;
end;
local function v18() --[[ Line: 40 ]] --[[ Name: DeveloperConsoleAvailability ]]
    -- upvalues: l_AvailabilitySignal_0 (copy), l_RunService_0 (copy), v5 (copy), l_Players_0 (copy)
    local v16 = l_AvailabilitySignal_0.new(false);
    if l_RunService_0:IsStudio() then
        v16:set(true);
        return v16;
    else
        spawn(function() --[[ Line: 46 ]]
            -- upvalues: v5 (ref), l_Players_0 (ref), v16 (copy)
            local v17 = v5.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer);
            v16:set(v17);
        end);
        return v16;
    end;
end;
local v19 = l_ValueChangedSignal_0.new();
v19:connect(function() --[[ Line: 25 ]]
    -- upvalues: v11 (copy)
    if v11 then
        v11:SetVisibility(true);
        local v20 = require(script.Parent.Parent.Parent.SettingsHub);
        if v20 then
            v20:SetVisibility(false);
        end;
    end;
end);
local l_v19_0 = v19;
v19 = v18();
return {
    field_type = l_SettingEnum_0.TextButton, 
    id = "developer-console", 
    onActivated = l_v19_0, 
    label = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole", 
    text = "CoreScripts.InGameMenu.GameSettings.Open", 
    layoutOrder = l_LAYOUT_ORDER_0.DeveloperConsoleButton, 
    alreadyLocalized = false, 
    availability = v19
};