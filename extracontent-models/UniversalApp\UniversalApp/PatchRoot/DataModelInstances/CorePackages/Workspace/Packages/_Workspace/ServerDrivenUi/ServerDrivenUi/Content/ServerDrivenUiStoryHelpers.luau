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
        return {
            appPage = "Home", 
            dataUpdatedTimestamp = os.clock(), 
            dependencies = {
                dispatch = v3, 
                getNavigation = function() --[[ Line: 25 ]] --[[ Name: getNavigation ]]
                    -- upvalues: v3 (ref)
                    return {
                        navigate = v3
                    };
                end, 
                linkingProtocol = {
                    detectURL = v3, 
                    isURLRegistered = function(_, v7) --[[ Line: 30 ]] --[[ Name: isURLRegistered ]]
                        return v7 == "roblox://registered-with-mock/";
                    end
                }, 
                localization = l_Localization_0.new("en-us"), 
                cursors = {
                    tileCursor = nil
                }
            }, 
            buildSduiComponent = function() --[[ Line: 37 ]] --[[ Name: buildSduiComponent ]]
                return nil;
            end, 
            componentDefinitions = {
                getComponentDefinition = function(_, v9) --[[ Line: 41 ]] --[[ Name: getComponentDefinition ]]
                    -- upvalues: v5 (copy)
                    return v5[v9];
                end, 
                getComponent = function(_, v11) --[[ Line: 44 ]] --[[ Name: getComponent ]]
                    -- upvalues: v5 (copy)
                    return v5[v11] and v5[v11].component;
                end, 
                getPropParsers = function(_, v13) --[[ Line: 47 ]] --[[ Name: getPropParsers ]]
                    -- upvalues: v5 (copy)
                    return v5[v13] and v5[v13].propParsers;
                end, 
                getPropInterface = function(_, v15) --[[ Line: 50 ]] --[[ Name: getPropInterface ]]
                    -- upvalues: v5 (copy)
                    return v5[v15] and v5[v15].propInterface;
                end, 
                doesParserRequireRenderContext = function(_, v17) --[[ Line: 53 ]] --[[ Name: doesParserRequireRenderContext ]]
                    -- upvalues: v5 (copy)
                    return v5[v17] and v5[v17].doesParserRequireRenderContext;
                end, 
                registerComponent = function(_, v19, v20) --[[ Line: 56 ]] --[[ Name: registerComponent ]]
                    -- upvalues: v5 (copy)
                    v5[v19] = v20;
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
            getPageLayoutConfig = function(_) --[[ Line: 69 ]] --[[ Name: getPageLayoutConfig ]]
                -- upvalues: v1 (ref), v4 (copy)
                return v1.createComputed(function(v22) --[[ Line: 70 ]]
                    -- upvalues: v4 (ref)
                    return v4(v22);
                end);
            end
        };
    end
};