local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dev.ReactRoblox);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.Rodux);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_Parent_0.Style);
local v9 = require(l_Parent_0.ApolloClient);
local v10 = require(l_Parent_0.Foundation);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v12 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v6.init(v12);
local l_FoundationProvider_0 = v10.FoundationProvider;
local l_StyleProviderWithDefaultTheme_0 = v8.StyleProviderWithDefaultTheme;
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local l_Theme_0 = v10.Enums.Theme;
local l_Device_0 = v10.Enums.Device;
local v19 = require(l_Parent_0.UniversalAppPolicy);
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
local function v24(v23) --[[ Line: 40 ]]
    -- upvalues: v5 (copy), v7 (copy)
    return v5.Store.new(function() --[[ Line: 41 ]]
        -- upvalues: v7 (ref), v23 (copy)
        return v7.Dictionary.join(v23, {
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
        v5.thunkMiddleware
    });
end;
return {
    name = "EditProfile", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    roactRodux = v4, 
    mapDefinition = function(v25) --[[ Line: 63 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v7 (copy), v20 (copy)
        local v26 = v7.Dictionary.join(v20, v25.controls or {});
        return v7.Dictionary.join(v25, {
            controls = v26
        });
    end, 
    mapStory = function(v27) --[[ Line: 67 ]] --[[ Name: mapStory ]]
        -- upvalues: v21 (copy), v2 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v4 (copy), v24 (copy), v19 (copy), v9 (copy), l_mockApolloClient_0 (copy), l_FoundationProvider_0 (copy), v22 (copy), l_DesignTokenProvider_0 (copy), l_mockLocale_0 (copy)
        return function(v28) --[[ Line: 68 ]]
            -- upvalues: v21 (ref), v2 (ref), l_StyleProviderWithDefaultTheme_0 (ref), v4 (ref), v24 (ref), v19 (ref), v9 (ref), l_mockApolloClient_0 (ref), l_FoundationProvider_0 (ref), v22 (ref), l_DesignTokenProvider_0 (ref), l_mockLocale_0 (ref), v27 (copy)
            local v29 = v21[v28.theme];
            local v30 = v28.definition.state or {};
            return v2.createElement(l_StyleProviderWithDefaultTheme_0, {
                withDarkTheme = true, 
                withUiModeSupport = false
            }, {
                storeProvider = v2.createElement(v4.StoreProvider, {
                    store = v24(v30)
                }, {
                    policyProvider = v2.createElement(v19.RoactAppPolicy.Provider, {
                        policy = {
                            v19.AppFeaturePolicies
                        }
                    }, {
                        apolloClient = v2.createElement(v9.ApolloProvider, {
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
            });
        end;
    end
};