local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v7 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
UpdateLocalizationWithLocale = function(v8) --[[ Line: 12 ]] --[[ Name: UpdateLocalizationWithLocale ]]
    -- upvalues: l_LocalizationService_0 (copy), v7 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    v8:SetLocale(l_RobloxLocaleId_0);
    v7:updateSharedAttributes({
        Locale = l_RobloxLocaleId_0
    });
end;
return function(v10) --[[ Line: 21 ]]
    -- upvalues: v5 (copy), l_LocalizationService_0 (copy), v4 (copy), v6 (copy)
    local l_localization_0 = v10.localization;
    v5.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: l_localization_0 (copy), l_LocalizationService_0 (ref)
        if l_localization_0:GetLocale() ~= l_LocalizationService_0.RobloxLocaleId then
            UpdateLocalizationWithLocale(l_localization_0);
        end;
    end, {
        v10.localization
    });
    return v4.createElement(v6, {
        event = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), 
        callback = function() --[[ Line: 35 ]] --[[ Name: callback ]]
            -- upvalues: l_localization_0 (copy)
            UpdateLocalizationWithLocale(l_localization_0);
        end
    });
end;