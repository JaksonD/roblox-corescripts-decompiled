local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Actions.SetIsSubjectToChinaPolicies);
local v4 = require(l_script_FirstAncestor_0.Actions.SetGameProductInfo);
local v5 = require(l_script_FirstAncestor_0.Actions.SetUniverseId);
local v8 = v2.createReducer(nil, {
    [v4.name] = function(_, v7) --[[ Line: 10 ]]
        return v7.productInfo;
    end
});
local v11 = v2.createReducer(nil, {
    [v5.name] = function(_, v10) --[[ Line: 16 ]]
        return {
            universeId = v10.universeId, 
            placeId = v10.placeId
        };
    end
});
local v14 = v2.createReducer(nil, {
    [v3.name] = function(_, v13) --[[ Line: 25 ]]
        return v13.isSubjectToChinaPolicies;
    end
});
return v2.combineReducers({
    isSubjectToChinaPolicies = v14, 
    productInfo = v8, 
    gameIds = v11
});