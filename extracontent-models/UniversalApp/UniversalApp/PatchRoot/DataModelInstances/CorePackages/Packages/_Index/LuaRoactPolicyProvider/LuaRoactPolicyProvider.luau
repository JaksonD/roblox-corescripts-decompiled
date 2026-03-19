local v0 = require(script.connect);
local v1 = require(script.Provider);
local v2 = require(script.Logger);
local l_getPolicyImplementations_0 = script.getPolicyImplementations;
local v4 = require(l_getPolicyImplementations_0.fromMemStorageService);
local v5 = require(l_getPolicyImplementations_0.fromPolicyService);
local v6 = require(l_getPolicyImplementations_0.fromStaticSource);
local v7 = require(script.AppPolicyContext);
return {
    withGetPolicyImplementation = function(v8) --[[ Line: 12 ]] --[[ Name: withGetPolicyImplementation ]]
        -- upvalues: v0 (copy), v1 (copy)
        assert(v8.read, "expected getPolicyImpl to have `read` function");
        assert(v8.onPolicyChanged, "expected getPolicyImpl to have `onPolicyChanged` function");
        return {
            connect = v0(v8), 
            Provider = v1()
        };
    end, 
    GetPolicyImplementations = {
        MemStorageService = v4(), 
        PolicyService = v5(), 
        Static = v6()
    }, 
    Logger = v2, 
    AppPolicyContext = v7
};