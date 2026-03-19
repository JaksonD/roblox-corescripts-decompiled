local _ = require(script.Parent.types);
local function _(v1, v2, v3, v4) --[[ Line: 8 ]] --[[ Name: createMockRouteState ]]
    local v5 = {
        key = v1, 
        routeName = v1, 
        params = v2, 
        isTransitioning = v4
    };
    if v3 ~= nil then
        v5.routes = v3;
        v5.index = #v3;
    end;
    return v5;
end;
return {
    createMockStackState = function(v7, v8) --[[ Line: 27 ]] --[[ Name: createMockStackState ]]
        local v9 = {
            key = v7, 
            routeName = v7, 
            params = nil, 
            isTransitioning = false
        };
        if v8 ~= nil then
            v9.routes = v8;
            v9.index = #v8;
        end;
        return v9;
    end, 
    createMockSwitchState = function(v10, v11) --[[ Line: 31 ]] --[[ Name: createMockSwitchState ]]
        local v12 = {
            key = v10, 
            routeName = v10, 
            params = nil, 
            isTransitioning = nil
        };
        if v11 ~= nil then
            v12.routes = v11;
            v12.index = #v11;
        end;
        return v12;
    end, 
    createMockScreenState = function(v13, v14) --[[ Line: 35 ]] --[[ Name: createMockScreenState ]]
        return {
            key = v13, 
            routeName = v13, 
            params = v14, 
            isTransitioning = nil
        };
    end, 
    createMockNavigationObject = function(v15) --[[ Line: 39 ]] --[[ Name: createMockNavigationObject ]]
        return {
            state = v15, 
            dispatch = function() --[[ Line: 42 ]] --[[ Name: dispatch ]]

            end, 
            getParam = function(...) --[[ Line: 43 ]] --[[ Name: getParam ]]

            end, 
            addListener = function(_, _) --[[ Line: 46 ]] --[[ Name: addListener ]]
                return {
                    remove = function() --[[ Line: 47 ]] --[[ Name: remove ]]

                    end
                };
            end, 
            isFocused = function() --[[ Line: 49 ]] --[[ Name: isFocused ]]

            end, 
            getChildNavigation = function(_) --[[ Line: 50 ]] --[[ Name: getChildNavigation ]]
                return nil;
            end, 
            router = {
                getScreenOptions = function(_, _) --[[ Line: 54 ]] --[[ Name: getScreenOptions ]]
                    return {};
                end, 
                getStateForAction = function(_, v22) --[[ Line: 57 ]] --[[ Name: getStateForAction ]]
                    return v22;
                end, 
                getComponentForRouteName = function(_) --[[ Line: 60 ]] --[[ Name: getComponentForRouteName ]]
                    return function() --[[ Line: 61 ]]
                        return nil;
                    end;
                end, 
                getActionCreators = function() --[[ Line: 65 ]] --[[ Name: getActionCreators ]]
                    return {};
                end, 
                childRouters = {}
            }, 
            _dangerouslyGetParent = function() --[[ Line: 70 ]] --[[ Name: _dangerouslyGetParent ]]
                return nil;
            end
        };
    end
};