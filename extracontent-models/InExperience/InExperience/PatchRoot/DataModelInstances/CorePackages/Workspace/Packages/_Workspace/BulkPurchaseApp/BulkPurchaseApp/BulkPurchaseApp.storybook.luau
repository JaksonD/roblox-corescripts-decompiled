local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.UIBlox);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v8 = require(l_Parent_0.RoactRodux);
local v9 = require(l_Parent_0.Rodux);
v4.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local function v12() --[[ Line: 16 ]] --[[ Name: createStore ]]
    -- upvalues: v9 (copy)
    local v11 = v9.createReducer({}, {});
    return v9.Store.new(v11, nil, {
        v9.makeThunkMiddleware({})
    });
end;
local v13 = {
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
    name = "BulkPurchaseApp", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v14) --[[ Line: 43 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_AppStyleProvider_0 (copy), v13 (copy), v8 (copy), v12 (copy), l_DesignTokenProvider_0 (copy)
        return function(v15) --[[ Line: 44 ]]
            -- upvalues: v2 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_AppStyleProvider_0 (ref), v13 (ref), v8 (ref), v12 (ref), l_DesignTokenProvider_0 (ref), v14 (copy)
            return v2.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new("en-us")
            }, {
                AppStyleProvider = v2.createElement(l_AppStyleProvider_0, {
                    style = v15 and v13[v15.theme] or v13.Default
                }, {
                    StoreProvider = v2.createElement(v8.StoreProvider, {
                        store = v12()
                    }, {
                        DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, {
                            Child = v2.createElement(v14, v15)
                        })
                    })
                })
            });
        end;
    end
};