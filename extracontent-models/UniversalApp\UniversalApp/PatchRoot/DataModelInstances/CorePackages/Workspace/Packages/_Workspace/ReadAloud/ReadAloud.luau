local v0 = require(script.ReadAloudManager);
local v1 = require(script.ConnectReadAloudToSettings);
return {
    ReadAloudManager = v0, 
    ConnectReadAloudToSettings = function() --[[ Line: 5 ]] --[[ Name: ConnectReadAloudToSettings ]]
        -- upvalues: v1 (copy), v0 (copy)
        return v1(v0);
    end, 
    ["jest.config"] = script["jest.config"]
};