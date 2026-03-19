local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Contexts.TransferContext);
local v5 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v5.FoundationProvider;
local l_Localization_0 = require(l_Parent_0.AppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
return function(v9) --[[ Line: 16 ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_FoundationProvider_0 (copy), v5 (copy), v4 (copy)
    local v10 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return function(v11) --[[ Line: 18 ]]
        -- upvalues: v3 (ref), l_LocalizationProvider_0 (ref), v10 (copy), l_FoundationProvider_0 (ref), v5 (ref), v4 (ref), v9 (copy)
        return v3.createElement(l_LocalizationProvider_0, {
            localization = v10
        }, {
            v3.createElement(l_FoundationProvider_0, {
                theme = v5.Enums.Theme.Dark
            }, {
                v3.createElement(v4.Provider, {
                    value = v9.transferStore
                }, v11.children)
            })
        });
    end;
end;