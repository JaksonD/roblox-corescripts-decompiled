local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = v1.interface({
    previousResult = v1.optional(v1.any), 
    isResolveConditionMet = v1.callback, 
    retryCallback = v1.callback, 
    retryCount = v1.number, 
    retryTimeMultiplier = v1.number, 
    waitImpl = v1.callback
});
local function v6(v7) --[[ Line: 96 ]] --[[ Name: retry ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy)
    local l_retryCount_0 = v7.retryCount;
    local l_previousResult_0 = v7.previousResult;
    local l_isResolveConditionMet_0 = v7.isResolveConditionMet;
    local l_retryCallback_0 = v7.retryCallback;
    local l_retryTimeMultiplier_0 = v7.retryTimeMultiplier;
    local l_waitImpl_0 = v7.waitImpl;
    if l_isResolveConditionMet_0(l_previousResult_0) then
        return v4.resolve(l_previousResult_0);
    else
        return v4.new(function(v14, _) --[[ Line: 108 ]]
            -- upvalues: l_waitImpl_0 (copy), l_retryTimeMultiplier_0 (copy), l_retryCount_0 (copy)
            coroutine.wrap(function() --[[ Line: 109 ]]
                -- upvalues: l_waitImpl_0 (ref), l_retryTimeMultiplier_0 (ref), l_retryCount_0 (ref), v14 (copy)
                l_waitImpl_0(l_retryTimeMultiplier_0 * math.pow(2, l_retryCount_0 - 1));
                v14();
            end)();
        end):andThen(function() --[[ Line: 116 ]]
            -- upvalues: l_retryCallback_0 (copy)
            return l_retryCallback_0();
        end):andThen(function(v16) --[[ Line: 119 ]]
            -- upvalues: l_retryCount_0 (copy), v6 (ref), v2 (ref), v7 (copy), v4 (ref)
            if l_retryCount_0 > 1 then
                return v6(v2.Dictionary.join(v7, {
                    retryCount = l_retryCount_0 - 1, 
                    previousResult = v16
                }));
            else
                return v4.reject();
            end;
        end);
    end;
end;
return function(v17) --[[ Line: 131 ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy)
    v3.assert(v5(v17));
    return v6(v17);
end;