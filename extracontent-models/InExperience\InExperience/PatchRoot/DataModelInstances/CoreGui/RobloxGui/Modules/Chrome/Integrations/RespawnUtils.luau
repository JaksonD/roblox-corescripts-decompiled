local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_MappedSignal_0 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils).MappedSignal;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagRespawnChromeShortcutTelemetry);
local v7 = false;
local v8 = l_Signal_0.new();
local v9 = l_MappedSignal_0.new(v8, function() --[[ Line: 17 ]]
    -- upvalues: v7 (ref)
    return v7;
end);
task.defer(function() --[[ Line: 21 ]]
    -- upvalues: l_RobloxGui_0 (copy), v7 (ref), v8 (copy)
    local v10 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v10.CurrentPageSignal:connect(function(v11) --[[ Line: 23 ]]
        -- upvalues: v7 (ref), v10 (copy), v8 (ref)
        v7 = v11 == v10.Instance.ResetCharacterPage.Page.Name;
        v8:fire();
    end);
end);
local function v19(v12) --[[ Line: 33 ]] --[[ Name: respawnPage ]]
    -- upvalues: l_RobloxGui_0 (copy), v7 (ref), v6 (copy)
    local v13 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    local l_ResetCharacterPage_0 = v13.Instance.ResetCharacterPage;
    local function _() --[[ Line: 36 ]] --[[ Name: switchToRespawnPage ]]
        -- upvalues: v12 (copy), v13 (copy), l_ResetCharacterPage_0 (copy)
        local v15 = {
            used_shortcut = if v12 then v12.usedShortcut else nil
        };
        v13.Instance:SwitchToPage(l_ResetCharacterPage_0, true, nil, nil, nil, v15);
    end;
    if v13:GetVisibility() then
        if v7 then
            v13:SetVisibility(false);
            return;
        elseif v6 then
            local v17 = {
                used_shortcut = if v12 then v12.usedShortcut else nil
            };
            v13.Instance:SwitchToPage(l_ResetCharacterPage_0, true, nil, nil, nil, v17);
            return;
        else
            v13.Instance:SwitchToPage(l_ResetCharacterPage_0, true);
            return;
        end;
    elseif v6 then
        v13:SetVisibility(true);
        local v18 = {
            used_shortcut = if v12 then v12.usedShortcut else nil
        };
        v13.Instance:SwitchToPage(l_ResetCharacterPage_0, true, nil, nil, nil, v18);
        return;
    else
        v13:SetVisibility(true, false, l_ResetCharacterPage_0);
        return;
    end;
end;
return {
    respawnPageOpenSignal = v9, 
    respawnPage = v19
};