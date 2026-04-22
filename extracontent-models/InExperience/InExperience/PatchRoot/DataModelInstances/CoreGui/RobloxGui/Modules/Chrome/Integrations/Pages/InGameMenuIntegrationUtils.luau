local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_MappedSignal_0 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils).MappedSignal;
return {
    createPageOpenSignal = function(v6) --[[ Line: 15 ]] --[[ Name: createPageOpenSignal ]]
        -- upvalues: l_Signal_0 (copy), l_MappedSignal_0 (copy), l_RobloxGui_0 (copy)
        local v7 = false;
        local v8 = l_Signal_0.new();
        local v9 = l_MappedSignal_0.new(v8, function() --[[ Line: 18 ]]
            -- upvalues: v7 (ref)
            return v7;
        end);
        task.defer(function() --[[ Line: 22 ]]
            -- upvalues: l_RobloxGui_0 (ref), v6 (copy), v7 (ref), v8 (copy)
            local v10 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            v10.CurrentPageSignal:connect(function(v11) --[[ Line: 24 ]]
                -- upvalues: v10 (copy), v6 (ref), v7 (ref), v8 (ref)
                v7 = v11 == v10.Instance[v6].Page.Name;
                v8:fire();
            end);
        end);
        return v9;
    end, 
    toggleIGMPage = function(v12, v13) --[[ Line: 34 ]] --[[ Name: toggleIGMPage ]]
        -- upvalues: l_RobloxGui_0 (copy)
        local v14 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        local v15 = v14.Instance[v12];
        if v14:GetVisibility() then
            if v13 then
                v14:SetVisibility(false);
                return;
            else
                v14:SwitchToPage(v15, true);
                return;
            end;
        else
            v14:SetVisibility(true, false, v15);
            return;
        end;
    end
};