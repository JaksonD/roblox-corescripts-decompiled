local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.UIBlox);
v1.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v3.FoundationProvider;
local l_Theme_0 = v3.Enums.Theme;
local l_Device_0 = v3.Enums.Device;
local v7 = require(l_Parent_0.Dev.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v9 = require(l_Parent_0.Dev.RoactRodux);
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_AppStyleProvider_1 = v1.App.Style.AppStyleProvider;
local v12 = require(l_Parent_0.Dev.ReactRoblox);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local function v16() --[[ Line: 19 ]] --[[ Name: createLocalization ]]
    return {
        Format = function(_, v15) --[[ Line: 21 ]] --[[ Name: Format ]]
            return v15;
        end, 
        GetLocale = function() --[[ Line: 24 ]] --[[ Name: GetLocale ]]
            return "locale";
        end
    };
end;
local function v17() --[[ Line: 30 ]] --[[ Name: createStore ]]
    -- upvalues: v7 (copy)
    return v7.Store.new(v7.createReducer({}, {}));
end;
local v18 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v19 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
local v20 = {
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
    name = "AvatarExperienceUIKit", 
    roact = v2, 
    reactRoblox = v12, 
    mapStory = function(v21) --[[ Line: 59 ]] --[[ Name: mapStory ]]
        -- upvalues: v18 (copy), v2 (copy), l_LocalizationProvider_0 (copy), v16 (copy), l_AppStyleProvider_1 (copy), v20 (copy), l_AppStyleProvider_0 (copy), v9 (copy), v17 (copy), l_DesignTokenProvider_0 (copy), l_FoundationProvider_0 (copy), v19 (copy)
        return function(v22) --[[ Line: 60 ]]
            -- upvalues: v18 (ref), v2 (ref), l_LocalizationProvider_0 (ref), v16 (ref), l_AppStyleProvider_1 (ref), v20 (ref), l_AppStyleProvider_0 (ref), v9 (ref), v17 (ref), l_DesignTokenProvider_0 (ref), l_FoundationProvider_0 (ref), v19 (ref), v21 (copy)
            local v23 = v18[v22.theme];
            return v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                }), 
                LocalizationProvider = v2.createElement(l_LocalizationProvider_0, {
                    localization = v16()
                }, {
                    AppStyleProvider = v2.createElement(l_AppStyleProvider_1, {
                        style = v22 and v20[v22.theme] or v20.Default
                    }, {
                        StyleProvider = v2.createElement(l_AppStyleProvider_0, {
                            style = v22 and v20[v22.theme] or v20.Default
                        }, {
                            StoreProvider = v2.createElement(v9.StoreProvider, {
                                store = v17()
                            }, {
                                DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                                    tokenMappers = {}
                                }, {
                                    FoundationProvider = v2.createElement(l_FoundationProvider_0, {
                                        theme = v23, 
                                        device = v19[v22.platform], 
                                        preferences = v22.settings
                                    }, {
                                        Child = v2.createElement(v21, v22)
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