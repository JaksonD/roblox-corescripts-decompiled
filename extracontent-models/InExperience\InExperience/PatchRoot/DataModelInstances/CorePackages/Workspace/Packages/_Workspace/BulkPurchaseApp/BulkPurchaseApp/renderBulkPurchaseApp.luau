local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.RoactRodux);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.HttpRequest);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v13 = require(l_Parent_0.ReactFocusNavigation);
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local v15 = require(l_Parent_0.UIBlox);
local l_SelectionCursorProvider_0 = v15.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v15.App.SelectionCursor.CursorProvider;
local v18 = require(l_script_FirstAncestor_0.BulkPurchaseApp);
local v19 = require(l_script_FirstAncestor_0.Store.Reducers.BulkPurchaseReducer);
local l_NetworkContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).NetworkContext;
local v21 = {
    themeName = "dark", 
    fontName = "gotham"
};
local function _() --[[ Line: 32 ]] --[[ Name: createFocusNavigationService ]]
    -- upvalues: v13 (copy)
    return v13.FocusNavigationService.new(v13.EngineInterface.CoreGui);
end;
local function v26() --[[ Line: 36 ]] --[[ Name: createNetworkImpl ]]
    -- upvalues: v8 (copy)
    return v8.config({
        requestFunction = function(v23, v24, v25) --[[ Line: 38 ]] --[[ Name: requestFunction ]]
            -- upvalues: v8 (ref)
            return (v8.requestFunctions.HttpRbxApi(v23, v24, v25));
        end, 
        maxRetryCount = game:DefineFastInt("BulkPurchaseMaxHttpRequestRetries", 2), 
        maxWaitTime = game:DefineFastInt("BulkPurchaseMaxHttpRequestWaitTime", 1)
    });
end;
local function _() --[[ Line: 47 ]] --[[ Name: createStore ]]
    -- upvalues: v4 (copy), v19 (copy)
    return v4.Store.new(v19, nil, {
        v4.makeThunkMiddleware()
    });
end;
return function() --[[ Line: 53 ]] --[[ Name: renderBulkPurchaseApp ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy), v19 (copy), v26 (copy), v13 (copy), v7 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_AppStyleProvider_0 (copy), v21 (copy), l_NetworkContext_0 (copy), v6 (copy), l_DesignTokenProvider_0 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy), l_Provider_0 (copy), v18 (copy), v5 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "BulkPurchaseApp";
    l_Folder_0.Parent = l_CoreGui_0;
    local v29 = v4.Store.new(v19, nil, {
        v4.makeThunkMiddleware()
    });
    local v30 = v26();
    local v31 = v13.FocusNavigationService.new(v13.EngineInterface.CoreGui);
    local v32 = v7.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        StyleProvider = v7.createElement(l_AppStyleProvider_0, {
            style = v21
        }, {
            NetworkProvider = v7.createElement(l_NetworkContext_0.Provider, {
                value = v30
            }, {
                StoreProvider = v7.createElement(v6.StoreProvider, {
                    store = v29
                }, {
                    DesignTokenProvider = v7.createElement(l_DesignTokenProvider_0, {
                        tokenMappers = {}
                    }, {
                        CursorProvider = v7.createElement(l_SelectionCursorProvider_0, {}, {
                            NewCursorProvider = v7.createElement(l_CursorProvider_0, {}, {
                                FocusNavigationProvider = v7.createElement(v13.FocusNavigationContext.Provider, {
                                    value = v31
                                }, {
                                    FocusNavigationRegistryProvider = v7.createElement(l_Provider_0, nil, {
                                        BulkPurchaseApp = v7.createElement(v18)
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    });
    local v33 = v5.createRoot(l_Folder_0);
    v33:render(v32);
    return v33;
end;