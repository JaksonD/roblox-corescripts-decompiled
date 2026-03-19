local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
if require(l_Modules_0.LuaApp.Flags.GetFFlagUseLocalizationFromAppTempCommon)() then
    return require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
else
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    local v3 = require(l_CorePackages_0.Packages.React);
    local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
    local l_RobloxLocaleIdKey_0 = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
    local l_LocalizationRoactContext_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationRoactContext;
    local l_localizeStrings_0 = require(l_CorePackages_0.Workspace.Packages.Localization).localizeStrings;
    local l_useSignal_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSignal;
    return function(v9) --[[ Line: 24 ]] --[[ Name: useLocalization ]]
        -- upvalues: v3 (copy), l_LocalizationRoactContext_0 (copy), l_LocalizationService_0 (copy), l_useSignal_0 (copy), v4 (copy), l_localizeStrings_0 (copy), l_RobloxLocaleIdKey_0 (copy)
        local v10 = v3.useContext(l_LocalizationRoactContext_0);
        local v11, v12 = v3.useState(l_LocalizationService_0.RobloxLocaleId);
        local v14 = v3.useCallback(function(v13) --[[ Line: 29 ]]
            -- upvalues: v10 (copy), v11 (copy), v12 (copy)
            v13 = v10:GetLocale();
            if v13 ~= v11 then
                v12(v13);
            end;
        end, {
            v10
        });
        l_useSignal_0(v10.changed, v14);
        v4.isType(v9, "table", "LocalizationConsumer.props.stringsToBeLocalized");
        local v15 = l_localizeStrings_0(v10, v9);
        v15[l_RobloxLocaleIdKey_0] = v11;
        return v15;
    end;
end;