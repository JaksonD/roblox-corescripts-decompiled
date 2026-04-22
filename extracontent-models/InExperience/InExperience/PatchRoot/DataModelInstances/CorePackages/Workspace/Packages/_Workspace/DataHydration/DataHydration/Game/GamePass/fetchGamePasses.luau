local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local _ = require(script.Parent.GamePassStoreTypes);
local v3 = require(script.Parent.GamePassUrlBuilder);
local v7 = v1.config({
    requestFunction = function(v4, v5, v6) --[[ Line: 15 ]] --[[ Name: requestFunction ]]
        -- upvalues: v1 (copy)
        return v1.requestFunctions.HttpRbxApi(v4, v5, v6);
    end
});
return function(v8) --[[ Line: 20 ]] --[[ Name: fetchGamePasses ]]
    -- upvalues: v3 (copy), v7 (copy)
    local v9 = v3.buildGamePassesUrl({
        universeId = v8
    });
    return v7(v9, "GET"):andThen(function(v10) --[[ Line: 22 ]]
        -- upvalues: v8 (copy)
        local v11 = v10.responseBody and v10.responseBody.gamePasses or {};
        return {
            universeId = v8, 
            gamePasses = v11
        };
    end);
end;