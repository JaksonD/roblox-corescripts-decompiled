local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.UIBlox);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.Dev.AppLocales).Localization;
local v8 = require(l_Parent_0.RoactRodux);
local v9 = require(l_Parent_0.Rodux);
local v10 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v10.FoundationProvider;
local l_Theme_0 = v10.Enums.Theme;
local l_Device_0 = v10.Enums.Device;
v4.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local function v16() --[[ Line: 22 ]] --[[ Name: createStore ]]
    -- upvalues: v9 (copy)
    local v15 = v9.createReducer({}, {});
    return v9.Store.new(v15, nil, {
        v9.makeThunkMiddleware({})
    });
end;
local v17 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v18 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
local v19 = {
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
    name = "AvatarExperienceSlotBasedEditor", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v20) --[[ Line: 59 ]] --[[ Name: mapStory ]]
        -- upvalues: v17 (copy), v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_AppStyleProvider_0 (copy), v19 (copy), v8 (copy), v16 (copy), l_DesignTokenProvider_0 (copy), l_FoundationProvider_0 (copy), v18 (copy)
        return function(v21) --[[ Line: 60 ]]
            -- upvalues: v17 (ref), v2 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_AppStyleProvider_0 (ref), v19 (ref), v8 (ref), v16 (ref), l_DesignTokenProvider_0 (ref), l_FoundationProvider_0 (ref), v18 (ref), v20 (copy)
            local v22 = v17[v21.theme];
            return v2.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new("en-us")
            }, {
                AppStyleProvider = v2.createElement(l_AppStyleProvider_0, {
                    style = v21 and v19[v21.theme] or v19.Default
                }, {
                    StoreProvider = v2.createElement(v8.StoreProvider, {
                        store = v16()
                    }, {
                        DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, {
                            FoundationProvider = v2.createElement(l_FoundationProvider_0, {
                                theme = v22, 
                                device = v18[v21.platform], 
                                preferences = v21.settings
                            }, {
                                Child = v2.createElement(v20, v21)
                            })
                        })
                    })
                })
            });
        end;
    end
};