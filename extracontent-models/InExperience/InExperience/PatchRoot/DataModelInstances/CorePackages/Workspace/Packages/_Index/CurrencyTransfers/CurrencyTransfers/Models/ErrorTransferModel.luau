local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v4 = {};
v4.new = function(v5) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6) --[[ Line: 29 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    v6 = v6 or {};
    return (v4.new({
        failureReason = v6.failureReason, 
        errorMessage = v6.errorMessage or "", 
        ampRecourseActions = v6.ampRecourseActions, 
        ampFeatureCheck = v6.ampFeatureCheck
    }));
end;
v4.format = function(v7) --[[ Line: 42 ]] --[[ Name: format ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v8 = v7.FailureReason or v7.failureReason;
    local v9 = v7.ErrorMessage or v7.errorMessage or "";
    local v10 = v7.AmpRecourseActions or v7.ampRecourseActions;
    local v11 = v7.AmpFeatureCheck or v7.ampFeatureCheck;
    local v12 = v3.fromValue(v8);
    return (v4.new({
        failureReason = v12, 
        errorMessage = v9, 
        ampRecourseActions = v10, 
        ampFeatureCheck = v11
    }));
end;
v4.isValid = v2.strictInterface({
    failureReason = v2.optional(v2.string), 
    errorMessage = v2.string, 
    ampRecourseActions = v2.optional(v2.array(v2.string)), 
    ampFeatureCheck = v2.optional(v2.string)
});
return v4;