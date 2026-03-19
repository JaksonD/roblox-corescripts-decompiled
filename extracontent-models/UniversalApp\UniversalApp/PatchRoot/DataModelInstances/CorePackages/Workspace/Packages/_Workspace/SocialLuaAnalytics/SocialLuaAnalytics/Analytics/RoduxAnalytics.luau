local v0 = require(script.Actions);
local v1 = require(script.Selectors);
local v2 = require(script.Reducers);
local _ = require(script.AnalyticsTypes);
return {
    config = function(v4) --[[ Line: 7 ]] --[[ Name: config ]]
        -- upvalues: v2 (copy), v0 (copy), v1 (copy)
        return {
            installReducer = function() --[[ Line: 9 ]] --[[ Name: installReducer ]]
                -- upvalues: v2 (ref), v4 (copy)
                return v2(v4);
            end, 
            Actions = v0(v4), 
            Selectors = v1(v4)
        };
    end
};