local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.UIBlox);
v1.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v3.FoundationProvider;
local l_Theme_0 = v3.Enums.Theme;
local l_Device_0 = v3.Enums.Device;
local v7 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v9 = require(l_Parent_0.RoactRodux);
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_AppStyleProvider_1 = v1.App.Style.AppStyleProvider;
local v12 = require(l_Parent_0.ReactRoblox);
local function v13() --[[ Line: 18 ]] --[[ Name: createStore ]]
    -- upvalues: v7 (copy)
    return v7.Store.new(v7.createReducer({}, {}));
end;
local v14 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v15 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
local v16 = {
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
    name = "AvatarExperienceCommon", 
    roact = v2, 
    reactRoblox = v12, 
    mapStory = function(v17) --[[ Line: 47 ]] --[[ Name: mapStory ]]
        -- upvalues: v14 (copy), v2 (copy), l_AppStyleProvider_1 (copy), v16 (copy), l_AppStyleProvider_0 (copy), v9 (copy), v13 (copy), l_DesignTokenProvider_0 (copy), l_FoundationProvider_0 (copy), v15 (copy)
        return function(v18) --[[ Line: 48 ]]
            -- upvalues: v14 (ref), v2 (ref), l_AppStyleProvider_1 (ref), v16 (ref), l_AppStyleProvider_0 (ref), v9 (ref), v13 (ref), l_DesignTokenProvider_0 (ref), l_FoundationProvider_0 (ref), v15 (ref), v17 (copy)
            local v19 = v14[v18.theme];
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
                AppStyleProvider = v2.createElement(l_AppStyleProvider_1, {
                    style = v18 and v16[v18.theme] or v16.Default
                }, {
                    StyleProvider = v2.createElement(l_AppStyleProvider_0, {
                        style = v18 and v16[v18.theme] or v16.Default
                    }, {
                        StoreProvider = v2.createElement(v9.StoreProvider, {
                            store = v13()
                        }, {
                            DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                                tokenMappers = {}
                            }, {
                                FoundationProvider = v2.createElement(l_FoundationProvider_0, {
                                    theme = v19, 
                                    device = v15[v18.platform], 
                                    preferences = v18.settings
                                }, {
                                    Child = v2.createElement(v17, v18)
                                })
                            })
                        })
                    })
                })
            });
        end;
    end
};