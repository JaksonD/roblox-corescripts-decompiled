local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v2.FoundationProvider;
local l_Theme_0 = v2.Enums.Theme;
local l_Device_0 = v2.Enums.Device;
local v6 = require(l_Parent_0.Rodux);
local v7 = require(l_Parent_0.RoactRodux);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.UIBlox).App.Style.AppStyleProvider;
local l_DesignTokenProvider_0 = require(l_Parent_0.Dev.Style).DesignTokenProvider;
local v11 = require(l_Parent_0.Dev.ReactRoblox);
local l_Localization_0 = require(l_Parent_0.Dev.AppLocales).Localization;
local l_AppStyleProvider_1 = require(l_Parent_0.Dev.Style).AppStyleProvider;
local function v14() --[[ Line: 19 ]] --[[ Name: createStore ]]
    -- upvalues: v6 (copy)
    return v6.Store.new(v6.createReducer({}, {}));
end;
local v15 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v16 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
local v17 = {
    Default = {
        themeName = "Dark", 
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
return {
    name = "AvatarExperienceCatalog", 
    roact = v1, 
    reactRoblox = v11, 
    mapStory = function(v18) --[[ Line: 48 ]] --[[ Name: mapStory ]]
        -- upvalues: v15 (copy), v1 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_AppStyleProvider_0 (copy), v17 (copy), l_AppStyleProvider_1 (copy), v7 (copy), v14 (copy), l_DesignTokenProvider_0 (copy), l_FoundationProvider_0 (copy), v16 (copy)
        return function(v19) --[[ Line: 49 ]]
            -- upvalues: v15 (ref), v1 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_AppStyleProvider_0 (ref), v17 (ref), l_AppStyleProvider_1 (ref), v7 (ref), v14 (ref), l_DesignTokenProvider_0 (ref), l_FoundationProvider_0 (ref), v16 (ref), v18 (copy)
            local v20 = v15[v19.theme];
            return v1.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                }), 
                LocalizationProvider = v1.createElement(l_LocalizationProvider_0, {
                    localization = l_Localization_0.new("en-us")
                }, {
                    AppStyleProvider = v1.createElement(l_AppStyleProvider_0, {
                        style = v19 and v17[v19.theme] or v17.Default
                    }, {
                        StyleProvider = v1.createElement(l_AppStyleProvider_1, {
                            style = v19 and v17[v19.theme] or v17.Default
                        }, {
                            StoreProvider = v1.createElement(v7.StoreProvider, {
                                store = v14()
                            }, {
                                DesignTokenProvider = v1.createElement(l_DesignTokenProvider_0, {
                                    tokenMappers = {}
                                }, {
                                    FoundationProvider = v1.createElement(l_FoundationProvider_0, {
                                        theme = v20, 
                                        device = v16[v19.platform], 
                                        preferences = v19.settings
                                    }, {
                                        Child = v1.createElement(v18, v19)
                                    })
                                })
                            })
                        })
                    })
                })
            });
        end;
    end
};