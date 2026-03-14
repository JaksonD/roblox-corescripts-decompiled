local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_RoactNavigation_0 = v0.RoactNavigation;
local v3 = {
    state = {
        params = {}, 
        routeName = "", 
        key = ""
    }, 
    dispatch = function() --[[ Line: 11 ]] --[[ Name: dispatch ]]

    end, 
    goBack = function() --[[ Line: 12 ]] --[[ Name: goBack ]]

    end, 
    addListener = function() --[[ Line: 13 ]] --[[ Name: addListener ]]

    end, 
    isFocused = function() --[[ Line: 14 ]] --[[ Name: isFocused ]]

    end, 
    setParams = function() --[[ Line: 15 ]] --[[ Name: setParams ]]

    end, 
    getParam = function() --[[ Line: 16 ]] --[[ Name: getParam ]]

    end
};
return function(v4) --[[ Line: 19 ]]
    -- upvalues: l_Roact_0 (copy), l_RoactNavigation_0 (copy), v3 (copy)
    return l_Roact_0.createElement(l_RoactNavigation_0.Provider, {
        value = v3
    }, {
        Element = v4
    });
end;