local v0 = require(script.ServiceLocator);
return {
    ServiceLocator = v0, 
    getService = function(v1) --[[ Line: 11 ]] --[[ Name: getService ]]
        -- upvalues: v0 (copy)
        return v0.get(v1);
    end, 
    setupMockServices = function(v2) --[[ Line: 16 ]] --[[ Name: setupMockServices ]]
        -- upvalues: v0 (copy)
        v0.clear();
        for v3, v4 in pairs(v2) do
            v0.register(v3, v4);
        end;
    end, 
    ["jest.config"] = script["jest.config"]
};