local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Parent_0 = script.Parent;
local l_Reducers_0 = l_Parent_0.Reducers;
local v7 = require(l_Reducers_0.Reducer);
local l_Connection_0 = script.Parent.Components.Connection;
local l_Provider_0 = require(l_Connection_0.LayoutValues).Provider;
local v10 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_LayoutValuesContext_0 = v10.Common.LayoutValuesContext;
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_mockApolloClient_0 = require(l_CorePackages_0.Workspace.Packages.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local l_Array_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array;
local v15 = require(l_Parent_0.CreateLayoutValues);
local l_FFlagUseNewPlayerList_0 = v10.Flags.FFlagUseNewPlayerList;
return function(v17) --[[ Line: 33 ]] --[[ Name: TestProviders ]]
    -- upvalues: v2 (copy), v7 (copy), l_mockApolloClient_0 (copy), l_Array_0 (copy), v1 (copy), v3 (copy), l_ApolloProvider_0 (copy), l_Provider_0 (copy), v15 (copy), v4 (copy), l_FFlagUseNewPlayerList_0 (copy), l_LayoutValuesContext_0 (copy)
    local v18 = v2.Store.new(v7);
    local v26 = l_mockApolloClient_0({
        mockResolvers = {
            Query = {
                userProfiles = function(_, v20, _, _) --[[ Line: 38 ]] --[[ Name: userProfiles ]]
                    -- upvalues: l_Array_0 (ref)
                    return (l_Array_0.map(v20.userIds, function(v23) --[[ Line: 39 ]]
                        return {
                            userId = v23, 
                            names = {
                                alias = ("alias%*"):format(v23), 
                                combinedName = ("combinedName%*"):format(v23), 
                                contactName = ("contactName%*"):format(v23), 
                                displayName = ("displayName%*"):format(v23), 
                                username = ("username%*"):format(v23), 
                                platformName = ("platformName%*"):format(v23), 
                                inExperienceCombinedName = ("inExperienceCombinedName%*"):format(v23)
                            }
                        };
                    end));
                end
            }, 
            UserProfile = {
                id = function(v24) --[[ Line: 57 ]] --[[ Name: id ]]
                    return (tostring(v24.userId));
                end, 
                names = function(v25) --[[ Line: 60 ]] --[[ Name: names ]]
                    return v25.names;
                end
            }
        }
    });
    return v1.createElement(v3.StoreProvider, {
        store = v17.store or v18
    }, {
        ApolloProvider = v1.createElement(l_ApolloProvider_0, {
            client = v17.client or v26
        }, {
            LayoutValuesProvider_DEPRECATED = v1.createElement(l_Provider_0, {
                layoutValues = v17.layoutValues or v15(false)
            }, {
                ThemeProvider = v1.createElement(v4.App.Style.AppStyleProvider, {}, if l_FFlagUseNewPlayerList_0 and l_LayoutValuesContext_0 then {
                    LayoutValuesProvider = v1.createElement(l_LayoutValuesContext_0.Provider, {
                        value = v17.layoutValues or v15(false)
                    }, v17.children)
                } else v17.children)
            })
        })
    });
end;