local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Style);
local l_StyleProviderWithDefaultTheme_0 = v5.StyleProviderWithDefaultTheme;
local l_FoundationProvider_0 = v4.FoundationProvider;
local l_DesignTokenProvider_0 = v5.DesignTokenProvider;
local v9 = require(l_Parent_0.Rodux);
local v10 = require(l_Parent_0.RoactNavigation);
local v11 = require(l_Parent_0.RoactRodux);
local l_Theme_0 = v4.Enums.Theme;
local v13 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local function v15(_) --[[ Line: 20 ]] --[[ Name: createStore ]]
    -- upvalues: v9 (copy)
    return v9.Store.new(function() --[[ Line: 21 ]]
        return {
            ScreenSize = Vector2.new(600, 600), 
            TopBar = {
                topBarHeight = 100
            }, 
            GlobalGuiInset = {
                left = 0, 
                top = 0, 
                right = 0, 
                bottom = 0
            }
        };
    end, {}, {
        v9.thunkMiddleware
    });
end;
local function v19(v16) --[[ Line: 37 ]] --[[ Name: mockNavigation ]]
    -- upvalues: v2 (copy), v10 (copy)
    return v2.createElement(v10.Provider, {
        value = {
            state = {
                routeName = "appPage"
            }, 
            isFocused = function() --[[ Line: 43 ]] --[[ Name: isFocused ]]
                return true;
            end, 
            addListener = function() --[[ Line: 46 ]] --[[ Name: addListener ]]
                return {
                    remove = function() --[[ Line: 48 ]] --[[ Name: remove ]]

                    end
                };
            end, 
            getParam = function(_, v18) --[[ Line: 51 ]] --[[ Name: getParam ]]
                return v18;
            end, 
            navigate = function() --[[ Line: 54 ]] --[[ Name: navigate ]]

            end
        }
    }, {
        Child = v16
    });
end;
return {
    name = "UserTile", 
    storyRoot = l_script_FirstAncestor_0.Stories, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v20) --[[ Line: 66 ]] --[[ Name: mapStory ]]
        -- upvalues: v13 (copy), v2 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v11 (copy), v15 (copy), v19 (copy), l_FoundationProvider_0 (copy), l_DesignTokenProvider_0 (copy)
        return function(v21) --[[ Line: 67 ]]
            -- upvalues: v13 (ref), v2 (ref), l_StyleProviderWithDefaultTheme_0 (ref), v11 (ref), v15 (ref), v19 (ref), l_FoundationProvider_0 (ref), l_DesignTokenProvider_0 (ref), v20 (copy)
            local v22 = v13[v21.theme];
            return v2.createElement(l_StyleProviderWithDefaultTheme_0, {
                withDarkTheme = true, 
                withUiModeSupport = false
            }, {
                v2.createElement(v11.StoreProvider, {
                    store = v15(nil)
                }, {
                    navigationProvider = v19(v2.createElement(l_FoundationProvider_0, {
                        theme = v22
                    }, {
                        designTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, {
                            Child = v20(v21)
                        })
                    }))
                })
            });
        end;
    end
};