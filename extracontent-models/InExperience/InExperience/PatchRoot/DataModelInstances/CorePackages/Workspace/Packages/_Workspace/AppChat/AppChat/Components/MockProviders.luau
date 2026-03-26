local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v4 = require(l_Parent_0.Style);
local l_StyleProviderWithDefaultTheme_0 = v4.StyleProviderWithDefaultTheme;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v7 = require(l_Parent_0.UIBlox);
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_LayerCollectorProvider_0 = v7.Core.Layout.LayerCollector.LayerCollectorProvider;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v11 = require(l_Parent_0.Cryo);
local v12 = require(l_Parent_0.UniversalAppPolicy);
local v13 = require(l_Parent_0.SocialPolicies);
local v14 = require(l_Parent_0.UserProfiles);
local v15 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local v17 = require(l_script_FirstAncestor_0.Users.MockUserData);
local l_RealtimeProvider_0 = require(l_Parent_0.RealtimeDelivery).RealtimeProvider;
local v19 = require(l_Parent_0.InteractionFeedback);
local l_HapticFeedbackConfig_0 = require(l_script_FirstAncestor_0.Utils.HapticFeedback).HapticFeedbackConfig;
local v21 = require(l_Parent_0.Rodux);
local v22 = require(l_Parent_0.RoactRodux);
local v23 = require(l_Parent_0.RoactNavigation);
local v24 = {
    withUiModeSupport = false, 
    withLayerCollector = true, 
    withApolloProvider = true
};
return function(v25) --[[ Line: 57 ]] --[[ Name: MockProviders ]]
    -- upvalues: v11 (copy), v24 (copy), l_RealtimeProvider_0 (copy), l_FoundationProvider_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Signal_0 (copy), l_LayerCollectorProvider_0 (copy), v22 (copy), v21 (copy), v12 (copy), v13 (copy), v4 (copy), l_mockApolloClient_0 (copy), v17 (copy), v14 (copy), v15 (copy), v19 (copy), l_HapticFeedbackConfig_0 (copy), v23 (copy), v2 (copy), l_ProviderContainer_0 (copy)
    local v26 = v11.Dictionary.union(v24, v25);
    local v27 = {};
    if v26.realtime then
        table.insert(v27, {
            class = l_RealtimeProvider_0, 
            props = {
                realtime = v26.realtime
            }
        });
    end;
    table.insert(v27, {
        class = l_FoundationProvider_0, 
        props = {
            device = "Desktop", 
            theme = v26.themeName
        }
    });
    table.insert(v27, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = v26.themeName ~= "Light", 
            withUiModeSupport = v26.withUiModeSupport
        }
    });
    table.insert(v27, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v29) --[[ Line: 90 ]] --[[ Name: Format ]]
                    return v29;
                end, 
                changed = l_Signal_0.new()
            }
        }
    });
    if v26.withLayerCollector then
        table.insert(v27, {
            class = l_LayerCollectorProvider_0, 
            props = {}
        });
    end;
    table.insert(v27, {
        class = v22.StoreProvider, 
        props = {
            store = v26.rodux and v26.rodux.store or v21.Store.new(function() --[[ Line: 108 ]]
                -- upvalues: v26 (copy)
                return v26.rodux and v26.rodux.state or {};
            end, v26.rodux and v26.rodux.state, {
                v21.thunkMiddleware
            })
        }
    });
    table.insert(v27, {
        class = v12.RoactAppPolicy.Provider, 
        props = {
            policy = {
                v12.AppFeaturePolicies, 
                v13.ChatPolicies
            }
        }
    });
    table.insert(v27, {
        class = v4.DesignTokenProvider, 
        props = {
            tokenMappers = {}
        }
    });
    if v26.withApolloProvider then
        local v30 = l_mockApolloClient_0({});
        local v31 = v17.createMockApolloProfiles();
        v14.TestUtils.writeProfileDataToCache(v30, v31);
        table.insert(v27, {
            class = v15.ApolloProvider, 
            props = {
                client = v30
            }
        });
    end;
    table.insert(v27, {
        class = v19.InteractionFeedbackContext.Provider, 
        props = {
            value = l_HapticFeedbackConfig_0
        }
    });
    table.insert(v27, {
        class = v23.Provider, 
        props = {
            value = {
                state = {
                    params = {}, 
                    routeName = "", 
                    key = ""
                }, 
                dispatch = function() --[[ Line: 157 ]] --[[ Name: dispatch ]]

                end, 
                goBack = function() --[[ Line: 158 ]] --[[ Name: goBack ]]

                end, 
                addListener = function() --[[ Line: 159 ]] --[[ Name: addListener ]]

                end, 
                isFocused = function() --[[ Line: 160 ]] --[[ Name: isFocused ]]

                end, 
                setParams = function() --[[ Line: 161 ]] --[[ Name: setParams ]]

                end, 
                getParam = function() --[[ Line: 162 ]] --[[ Name: getParam ]]

                end, 
                replace = function() --[[ Line: 163 ]] --[[ Name: replace ]]

                end, 
                push = function() --[[ Line: 164 ]] --[[ Name: push ]]

                end, 
                getScreenProps = function() --[[ Line: 165 ]] --[[ Name: getScreenProps ]]

                end
            }
        }
    });
    return v2.createElement(l_ProviderContainer_0, {
        providers = v27
    }, v26.children);
end;