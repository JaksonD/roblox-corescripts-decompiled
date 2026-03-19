local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_script_FirstAncestor_0.Service);
local v5 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_MappedSignal_0 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils).MappedSignal;
local v8 = false;
local v9 = l_Signal_0.new();
local v10 = l_MappedSignal_0.new(v9, function() --[[ Line: 20 ]]
    -- upvalues: v8 (ref)
    return v8;
end);
task.defer(function() --[[ Line: 25 ]]
    -- upvalues: l_RobloxGui_0 (copy), v8 (ref), v9 (copy)
    local v11 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v11.CurrentPageSignal:connect(function(v12) --[[ Line: 27 ]]
        -- upvalues: v8 (ref), v11 (copy), v9 (ref)
        v8 = v12 == v11.Instance.ReportAbusePage.Page.Name;
        v9:fire();
    end);
end);
return v4:register({
    initialAvailability = v4.AvailabilitySignal.Available, 
    id = "trust_and_safety", 
    label = "CoreScripts.InGameMenu.QuickActions.Report", 
    activated = function(_) --[[ Line: 37 ]] --[[ Name: activated ]]
        -- upvalues: l_RobloxGui_0 (copy), v8 (ref)
        local v14 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if v14:GetVisibility() then
            if v8 then
                v14:SetVisibility(false);
                return;
            else
                v14:SwitchToPage(v14.Instance.ReportAbusePage, true);
                return;
            end;
        else
            v14:SetVisibility(true, false, v14.Instance.ReportAbusePage);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 49 ]] --[[ Name: isActivated ]]
        -- upvalues: v10 (copy)
        return v10:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 53 ]] --[[ Name: Icon ]]
            -- upvalues: v5 (copy), v10 (copy)
            return v5("icons/menu/safety_off", "icons/menu/safety_on", v10);
        end
    }
});