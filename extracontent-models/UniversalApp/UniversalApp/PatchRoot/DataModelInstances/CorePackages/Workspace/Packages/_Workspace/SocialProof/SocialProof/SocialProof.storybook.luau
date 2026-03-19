local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProof");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.Rodux);
local v6 = require(l_Parent_0.Style);
local v7 = require(l_Parent_0.Foundation);
local v8 = require(l_Parent_0.RoactNavigation);
local l_FoundationProvider_0 = v7.FoundationProvider;
local l_StyleProviderWithDefaultTheme_0 = v6.StyleProviderWithDefaultTheme;
local l_DesignTokenProvider_0 = v6.DesignTokenProvider;
local function v13(_) --[[ Line: 18 ]] --[[ Name: createStore ]]
    -- upvalues: v5 (copy)
    return v5.Store.new(function() --[[ Line: 19 ]]
        return {
            ScreenSize = Vector2.new(600, 600), 
            TopBar = {
                topBarHeight = 100
            }, 
            GlobalGuiInset = {
                left = 0, 
                top = 0, 
                right = 0, 
                bottom = 34
            }
        };
    end, {}, {
        v5.thunkMiddleware
    });
end;
local function v17(v14) --[[ Line: 35 ]] --[[ Name: mockNavigation ]]
    -- upvalues: v2 (copy), v8 (copy)
    return v2.createElement(v8.Provider, {
        value = {
            state = {
                routeName = "appPage"
            }, 
            isFocused = function() --[[ Line: 41 ]] --[[ Name: isFocused ]]
                return true;
            end, 
            addListener = function() --[[ Line: 44 ]] --[[ Name: addListener ]]
                return {
                    remove = function() --[[ Line: 46 ]] --[[ Name: remove ]]

                    end
                };
            end, 
            getParam = function(_, v16) --[[ Line: 49 ]] --[[ Name: getParam ]]
                return v16;
            end, 
            navigate = function() --[[ Line: 52 ]] --[[ Name: navigate ]]

            end
        }
    }, {
        Child = v14
    });
end;
return {
    name = "SocialProof", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v18) --[[ Line: 64 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v4 (copy), v13 (copy), v17 (copy), l_FoundationProvider_0 (copy), v7 (copy), l_DesignTokenProvider_0 (copy)
        return function(v19) --[[ Line: 65 ]]
            -- upvalues: v2 (ref), l_StyleProviderWithDefaultTheme_0 (ref), v4 (ref), v13 (ref), v17 (ref), l_FoundationProvider_0 (ref), v7 (ref), l_DesignTokenProvider_0 (ref), v18 (copy)
            return v2.createElement(l_StyleProviderWithDefaultTheme_0, {
                withDarkTheme = true, 
                withUiModeSupport = false
            }, {
                v2.createElement(v4.StoreProvider, {
                    store = v13(nil)
                }, {
                    navigationProvider = v17(v2.createElement(l_FoundationProvider_0, {
                        theme = v7.Enums.Theme.Light
                    }, {
                        designTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, {
                            Child = v18(v19)
                        })
                    }))
                })
            });
        end;
    end
};