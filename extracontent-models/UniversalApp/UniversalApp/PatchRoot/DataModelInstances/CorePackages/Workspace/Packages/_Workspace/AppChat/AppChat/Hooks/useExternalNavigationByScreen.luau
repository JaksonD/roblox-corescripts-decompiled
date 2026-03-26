local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppCommonLib);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useCallback_0 = v2.useCallback;
local l_useReducer_0 = v2.useReducer;
local l_Immutable_0 = v1.Immutable;
local function v11(v9, v10) --[[ Line: 24 ]] --[[ Name: externalNavigationByScreenReducer ]]
    -- upvalues: l_Immutable_0 (copy)
    if v10.callback == nil then
        return l_Immutable_0.RemoveFromDictionary(v9, v10.screen);
    else
        assert(v10.callback ~= nil, "");
        return l_Immutable_0.Set(v9, v10.screen, v10.callback);
    end;
end;
return function() --[[ Line: 33 ]]
    -- upvalues: l_useReducer_0 (copy), v11 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v12, v13 = l_useReducer_0(v11, {});
    return v12, (l_useCallback_0(function(v14, v15) --[[ Line: 35 ]]
        -- upvalues: v13 (copy)
        v13({
            callback = v14, 
            screen = v15
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13
    } else l_dependencyArray_0(v13)));
end;