local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
v3.init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
v1.setGlobalConfig({
    elementTracing = true, 
    propValidation = true
});
local v9 = {
    Default = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
local v10 = {
    language = "en-us"
};
local v11 = l_Localization_0.new("en-us");
local function v13(v12) --[[ Line: 40 ]]
    -- upvalues: v2 (copy)
    return v2.Store.new(function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy)
        return v12;
    end, {}, {
        v2.thunkMiddleware
    });
end;
return {
    roact = v1, 
    mapDefinition = function(v14) --[[ Line: 48 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v4 (copy), v10 (copy)
        local v15 = v4.join(v10, v14.controls or {});
        return v4.join(v14, {
            controls = v15
        });
    end, 
    mapStory = function(v16) --[[ Line: 52 ]] --[[ Name: mapStory ]]
        -- upvalues: v11 (copy), v1 (copy), v5 (copy), v13 (copy), l_AppStyleProvider_0 (copy), v9 (copy), l_LocalizationProvider_0 (copy)
        return function(v17) --[[ Line: 53 ]]
            -- upvalues: v11 (ref), v1 (ref), v5 (ref), v13 (ref), l_AppStyleProvider_0 (ref), v9 (ref), l_LocalizationProvider_0 (ref), v16 (copy)
            v11:SetLocale(v17.controls.language);
            local v18 = v17.definition.state or {};
            return v1.createElement(v5.StoreProvider, {
                store = v13(v18)
            }, {
                v1.createElement(l_AppStyleProvider_0, {
                    style = v17 and v9[v17.theme] or v9.Default
                }, {
                    v1.createElement(l_LocalizationProvider_0, {
                        localization = v11
                    }, {
                        Child = v1.createElement(v16, v17)
                    })
                })
            });
        end;
    end
};