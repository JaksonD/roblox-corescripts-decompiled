local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreScriptsPlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v6 = require(l_script_FirstAncestor_0.Components.PlayerFeedbackPrompts);
local l_CoreGui_0 = game:GetService("CoreGui");
local v8 = l_CoreGui_0:FindFirstChild("RobloxGui") or l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
    -- upvalues: v8 (copy)
    if v8 then
        return require(v8.Modules.Common.renderWithCoreScriptsStyleProvider);
    else
        return nil;
    end;
end);
v9 = l_status_0 and l_result_0 or function(v12) --[[ Line: 29 ]]
    return v12.App;
end;
return function(v13) --[[ Line: 35 ]] --[[ Name: createApp ]]
    -- upvalues: v9 (ref), v3 (copy), v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), v6 (copy)
    local v14 = v13 or v9;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.AutoLocalize = false;
    l_ScreenGui_0.DisplayOrder = -1;
    local v16 = v3.createRoot(l_ScreenGui_0);
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v16:render((v14({
        App = v2.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            PlayerFeedbackPrompts = v2.createElement(v6, {
                enableInputDelayed = true
            })
        })
    })));
    return {
        instance = l_ScreenGui_0, 
        unmount = function() --[[ Line: 65 ]] --[[ Name: unmount ]]
            -- upvalues: v16 (copy)
            v16:unmount();
        end
    };
end;