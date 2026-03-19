local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.Style);
local v8 = require(l_Parent_0.ApolloClient);
local v9 = require(l_Parent_0.Foundation);
local v10 = require(l_Parent_0.RoactNavigation);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v12 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
local l_UniversalAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy;
v5.init(v12);
local l_FoundationProvider_0 = v9.FoundationProvider;
local l_StyleProviderWithDefaultTheme_0 = v7.StyleProviderWithDefaultTheme;
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local l_Theme_0 = v9.Enums.Theme;
local l_Device_0 = v9.Enums.Device;
v2.setGlobalConfig({
    elementTracing = true
});
local v20 = {
    language = "en-us"
};
local v21 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v22 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
local function v24(v23) --[[ Line: 44 ]]
    -- upvalues: v4 (copy), v6 (copy)
    return v4.Store.new(function() --[[ Line: 45 ]]
        -- upvalues: v6 (ref), v23 (copy)
        return v6.Dictionary.join(v23, {
            ScreenSize = Vector2.new(600, 600), 
            TopBar = {
                topBarHeight = 0
            }, 
            GlobalGuiInset = {
                left = 0, 
                top = 0, 
                right = 0, 
                bottom = 0
            }
        });
    end, {}, {
        v4.thunkMiddleware
    });
end;
return {
    name = "SocialCarousel", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    roactRodux = v3, 
    mapDefinition = function(v25) --[[ Line: 66 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v6 (copy), v20 (copy)
        local v26 = v6.Dictionary.join(v20, v25.controls or {});
        return v6.Dictionary.join(v25, {
            controls = v26
        });
    end, 
    mapStory = function(v27) --[[ Line: 70 ]] --[[ Name: mapStory ]]
        -- upvalues: v21 (copy), v2 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_UniversalAppPolicy_0 (copy), v10 (copy), v3 (copy), v24 (copy), v8 (copy), l_mockApolloClient_0 (copy), l_FoundationProvider_0 (copy), v22 (copy), l_DesignTokenProvider_0 (copy), l_mockLocale_0 (copy)
        return function(v28) --[[ Line: 71 ]]
            -- upvalues: v21 (ref), v2 (ref), l_StyleProviderWithDefaultTheme_0 (ref), l_UniversalAppPolicy_0 (ref), v10 (ref), v3 (ref), v24 (ref), v8 (ref), l_mockApolloClient_0 (ref), l_FoundationProvider_0 (ref), v22 (ref), l_DesignTokenProvider_0 (ref), l_mockLocale_0 (ref), v27 (copy)
            local v29 = v21[v28.theme];
            local v30 = v28.definition.state or {};
            return v2.createElement(l_StyleProviderWithDefaultTheme_0, {
                withDarkTheme = true, 
                withUiModeSupport = false
            }, {
                v2.createElement(l_UniversalAppPolicy_0.Provider, {
                    policy = {
                        function() --[[ Line: 80 ]]
                            return {
                                useGridPageLayout = function() --[[ Line: 82 ]] --[[ Name: useGridPageLayout ]]
                                    return true;
                                end
                            };
                        end
                    }
                }, {
                    navigationProvider = v2.createElement(v10.Provider, {
                        value = {
                            state = {
                                routeName = "appPage"
                            }, 
                            isFocused = function() --[[ Line: 94 ]] --[[ Name: isFocused ]]
                                return false;
                            end, 
                            addListener = function() --[[ Line: 97 ]] --[[ Name: addListener ]]
                                return {
                                    remove = function() --[[ Line: 99 ]] --[[ Name: remove ]]

                                    end
                                };
                            end, 
                            getParam = function(_, v32) --[[ Line: 102 ]] --[[ Name: getParam ]]
                                return v32;
                            end, 
                            navigate = function() --[[ Line: 105 ]] --[[ Name: navigate ]]

                            end
                        }
                    }, {
                        storeProvider = v2.createElement(v3.StoreProvider, {
                            store = v24(v30)
                        }, {
                            apolloClient = v2.createElement(v8.ApolloProvider, {
                                client = l_mockApolloClient_0({})
                            }, {
                                foundationProvider = v2.createElement(l_FoundationProvider_0, {
                                    theme = v29, 
                                    device = v22[v28.platform], 
                                    preferences = v28.settings
                                }, {
                                    designTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                                        tokenMappers = {}
                                    }, {
                                        Child = l_mockLocale_0(v27, v28)
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