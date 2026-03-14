local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.Signals);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local function v3() --[[ Line: 7 ]] --[[ Name: noop ]]

end;
return {
    mockSduiContextForStorybook = function() --[[ Line: 9 ]] --[[ Name: mockSduiContextForStorybook ]]
        -- upvalues: v1 (copy), v3 (copy), l_Localization_0 (copy)
        local v4 = v1.createSignal({
            numColumns = 3, 
            fractionalItemAmount = 0, 
            columnGap = 24, 
            sideMargin = 24, 
            verticalPadding = 16
        });
        local v5 = {};
        local v6 = {};
        local v7 = {};
        return {
            appPage = "Home", 
            dataUpdatedTimestamp = os.clock(), 
            dependencies = {
                dispatch = v3, 
                getNavigation = function() --[[ Line: 27 ]] --[[ Name: getNavigation ]]
                    -- upvalues: v3 (ref)
                    return {
                        navigate = v3
                    };
                end, 
                linkingProtocol = {
                    detectURL = v3, 
                    isURLRegistered = function(_, v9) --[[ Line: 32 ]] --[[ Name: isURLRegistered ]]
                        return v9 == "roblox://registered-with-mock/";
                    end
                }, 
                localization = l_Localization_0.new("en-us"), 
                cursors = {
                    tileCursor = nil
                }
            }, 
            buildSduiComponent = function() --[[ Line: 39 ]] --[[ Name: buildSduiComponent ]]
                return nil;
            end, 
            componentDefinitions = {
                getComponentDefinition = function(_, v11) --[[ Line: 43 ]] --[[ Name: getComponentDefinition ]]
                    -- upvalues: v5 (copy)
                    return v5[v11];
                end, 
                getComponent = function(_, v13) --[[ Line: 46 ]] --[[ Name: getComponent ]]
                    -- upvalues: v5 (copy)
                    return v5[v13] and v5[v13].component;
                end, 
                getPropParsers = function(_, v15) --[[ Line: 49 ]] --[[ Name: getPropParsers ]]
                    -- upvalues: v5 (copy)
                    return v5[v15] and v5[v15].propParsers;
                end, 
                getPropInterface = function(_, v17) --[[ Line: 52 ]] --[[ Name: getPropInterface ]]
                    -- upvalues: v5 (copy)
                    return v5[v17] and v5[v17].propInterface;
                end, 
                doesParserRequireRenderContext = function(_, v19) --[[ Line: 55 ]] --[[ Name: doesParserRequireRenderContext ]]
                    -- upvalues: v5 (copy)
                    return v5[v19] and v5[v19].doesParserRequireRenderContext;
                end, 
                registerComponent = function(_, v21, v22) --[[ Line: 58 ]] --[[ Name: registerComponent ]]
                    -- upvalues: v5 (copy)
                    v5[v21] = v22;
                end
            }, 
            actionHandlerRegistry = {
                getActionHandlerConfig = function(_, v24) --[[ Line: 63 ]] --[[ Name: getActionHandlerConfig ]]
                    -- upvalues: v7 (copy)
                    return v7[v24];
                end, 
                getActionHandler = function(_, v26) --[[ Line: 66 ]] --[[ Name: getActionHandler ]]
                    -- upvalues: v6 (copy)
                    return v6[v26];
                end, 
                registerActionHandlerConfig = function(_, v28, v29) --[[ Line: 69 ]] --[[ Name: registerActionHandlerConfig ]]
                    -- upvalues: v7 (copy)
                    v7[v28] = v29;
                end, 
                registerActionHandler = function(_, v31, v32) --[[ Line: 72 ]] --[[ Name: registerActionHandler ]]
                    -- upvalues: v6 (copy)
                    v6[v31] = v32;
                end
            }, 
            templateRegistry = {
                shouldResolveTemplate = v3, 
                resolveTemplateForConfig = v3
            }, 
            dataStore = {
                social = {
                    getInGameFriendsByGame = v1.createSignal({})
                }
            }, 
            getPageLayoutConfig = function(_) --[[ Line: 85 ]] --[[ Name: getPageLayoutConfig ]]
                -- upvalues: v1 (ref), v4 (copy)
                return v1.createComputed(function(v34) --[[ Line: 86 ]]
                    -- upvalues: v4 (ref)
                    return v4(v34);
                end);
            end
        };
    end
};