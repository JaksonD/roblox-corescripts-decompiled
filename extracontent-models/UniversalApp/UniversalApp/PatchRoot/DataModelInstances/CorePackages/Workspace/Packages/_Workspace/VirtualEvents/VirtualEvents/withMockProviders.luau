local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local v2 = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v5 = require(l_script_FirstAncestor_0.Parent.RoactNavigation);
local v6 = require(l_script_FirstAncestor_0.Parent.RoactRodux);
local v7 = require(l_script_FirstAncestor_0.Parent.RobloxAppLocales);
local v8 = require(l_script_FirstAncestor_0.Parent.Localization);
local v9 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_DesignTokenProvider_0 = require(l_script_FirstAncestor_0.Parent.Style).DesignTokenProvider;
local v11 = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local l_MockContentProvider_0 = v9.UnitTestHelpers.MockContentProvider;
local l_FoundationProvider_0 = require(l_script_FirstAncestor_0.Parent.Foundation).FoundationProvider;
local l_AppStyleProvider_0 = v9.App.Style.AppStyleProvider;
local l_Constants_0 = v9.App.Style.Constants;
local l_ContentProvider_0 = v9.App.Context.ContentProvider;
local v17 = v4.combineReducers({
    VirtualEvents = v11.installReducer()
});
return function(v18, v19) --[[ Line: 32 ]] --[[ Name: withMockProviders ]]
    -- upvalues: v4 (copy), v17 (copy), v3 (copy), v6 (copy), l_ContentProvider_0 (copy), l_MockContentProvider_0 (copy), v8 (copy), v7 (copy), l_FoundationProvider_0 (copy), l_AppStyleProvider_0 (copy), l_Constants_0 (copy), v5 (copy), l_DesignTokenProvider_0 (copy), v2 (copy), v1 (copy)
    local v20 = (if v19 then v19.store else nil) or v4.Store.new(v17, if v19 then v19.initialStoreState else nil, {
        v4.thunkMiddleware
    });
    local v21 = {
        StoreProvider = v3.createElement(v6.StoreProvider, {
            store = v20
        }, {
            ContentProvider = v3.createElement(l_ContentProvider_0.Provider, {
                value = l_MockContentProvider_0.new()
            }, {
                LocalizationProvider = v3.createElement(v8.LocalizationProvider, {
                    localization = v7.Localization.new("en-us")
                }, {
                    FoundationProvider = v3.createElement(l_FoundationProvider_0, {
                        theme = "Dark"
                    }, {
                        StyleProvider = v3.createElement(l_AppStyleProvider_0, {
                            style = {
                                themeName = l_Constants_0.ThemeName.Dark, 
                                fontName = l_Constants_0.FontName.Gotham
                            }
                        }, {
                            NavigationProvider = v3.createElement(v5.Provider, {
                                value = {
                                    isFocused = function() --[[ Line: 61 ]] --[[ Name: isFocused ]]
                                        return true;
                                    end, 
                                    goBack = function() --[[ Line: 64 ]] --[[ Name: goBack ]]

                                    end, 
                                    addListener = function() --[[ Line: 65 ]] --[[ Name: addListener ]]
                                        return {
                                            remove = function() --[[ Line: 67 ]] --[[ Name: remove ]]

                                            end
                                        };
                                    end
                                }
                            }, {
                                DesignTokenProvider = v3.createElement(l_DesignTokenProvider_0, {
                                    tokenMappers = {}
                                }, {
                                    Children = v3.createElement(v3.Fragment, nil, v18)
                                })
                            })
                        })
                    })
                })
            })
        })
    };
    if v19 then
        if v19.mockResolvers then
            local v22 = v2.GraphQLServer.new({
                mockResolvers = v19.mockResolvers
            });
            local v25 = v1.ApolloClient.new({
                cache = v1.InMemoryCache.new({}), 
                link = v1.HttpLink.new({
                    uri = "/api", 
                    fetch = function(_, v24) --[[ Line: 95 ]] --[[ Name: fetch ]]
                        -- upvalues: v22 (copy)
                        return v22:fetchLocal(v24);
                    end
                })
            });
            v21 = {
                ApolloProvider = v3.createElement(v1.ApolloProvider, {
                    client = v25
                }, v21)
            };
        end;
        if v19.mockNavigation then
            v21 = {
                NavigationProvider = v3.createElement(v5.Provider, {
                    value = v19.mockNavigation
                }, v21)
            };
        end;
    end;
    return v3.createElement(v3.Fragment, nil, v21);
end;