local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dev.ReactRoblox);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Dev.Rodux);
local v6 = require(l_Parent_0.Dev.RoactRodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
v4.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local function v13() --[[ Line: 27 ]] --[[ Name: createStore ]]
    -- upvalues: v5 (copy)
    local v12 = v5.createReducer({}, {});
    return v5.Store.new(v12, nil, {
        v5.thunkMiddleware
    });
end;
local v14 = {
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
local v17 = {
    Format = function(_, v16) --[[ Line: 48 ]] --[[ Name: Format ]]
        return v16;
    end, 
    GetLocale = function() --[[ Line: 51 ]] --[[ Name: GetLocale ]]
        return "en-us";
    end, 
    changed = l_Signal_0.new()
};
return {
    name = l_script_FirstAncestor_0 and l_script_FirstAncestor_0.Name or "Groups", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v18) --[[ Line: 62 ]] --[[ Name: mapStory ]]
        -- upvalues: v14 (copy), v2 (copy), l_LocalizationProvider_0 (copy), v17 (copy), l_FoundationProvider_0 (copy), l_AppStyleProvider_0 (copy), v6 (copy), v13 (copy), l_DesignTokenProvider_0 (copy)
        return function(v19) --[[ Line: 63 ]]
            -- upvalues: v14 (ref), v2 (ref), l_LocalizationProvider_0 (ref), v17 (ref), l_FoundationProvider_0 (ref), l_AppStyleProvider_0 (ref), v6 (ref), v13 (ref), l_DesignTokenProvider_0 (ref), v18 (copy)
            local v20 = v19 and v14[v19.theme] or v14.Default;
            local l_themeName_0 = v20.themeName;
            return v2.createElement(l_LocalizationProvider_0, {
                localization = v17
            }, {
                FoundationProvider = v2.createElement(l_FoundationProvider_0, {
                    device = "Desktop", 
                    theme = l_themeName_0
                }, {
                    AppStyleProvider = v2.createElement(l_AppStyleProvider_0, {
                        style = v20
                    }, {
                        StoreProvider = v2.createElement(v6.StoreProvider, {
                            store = v13()
                        }, {
                            DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                                tokenMappers = {}
                            }, {
                                Child = v2.createElement(v18, v19)
                            })
                        })
                    })
                })
            });
        end;
    end
};