local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local v7 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v7.FoundationProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v11 = {
    themeName = l_Constants_0.ThemeName.Dark, 
    fontName = l_Constants_0.FontName.Gotham, 
    Tokens = {
        Global = {
            Size_350 = 28, 
            Size_500 = 40
        }
    }
};
local v12 = {
    ScreenSize = Vector2.new(500, 500), 
    SetAlias = {
        Aliases = {
            byUserId = {
                ["1"] = "foo"
            }
        }
    }
};
local function v17(v13, v14) --[[ Line: 42 ]]
    -- upvalues: v2 (copy)
    local v16 = v14 or function(v15) --[[ Line: 43 ]]
        return v15;
    end;
    return v2.Store.new(v16, v13 or {}, {
        v2.thunkMiddleware
    });
end;
local v18 = l_Localization_0.new("en-us");
return {
    mockServices = function(v19) --[[ Line: 52 ]]
        -- upvalues: v1 (copy), v3 (copy), v17 (copy), v12 (copy), l_FoundationProvider_0 (copy), v7 (copy), l_AppStyleProvider_0 (copy), v11 (copy), l_LocalizationProvider_0 (copy), v18 (copy), l_RoactServices_0 (copy)
        local v20 = {
            storeProvider = v1.createElement(v3.StoreProvider, {
                store = v17(v12)
            }, {
                foundationProvider = v1.createElement(l_FoundationProvider_0, {
                    theme = v7.Enums.Theme.Dark
                }, {
                    styleProvider = v1.createElement(l_AppStyleProvider_0, {
                        style = v11
                    }, {
                        localizationProvider = v1.createElement(l_LocalizationProvider_0, {
                            localization = v18
                        }, v19)
                    })
                })
            })
        };
        return (v1.createElement(l_RoactServices_0.ServiceProvider, {}, v20));
    end
};