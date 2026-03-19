local l_Parent_0 = script:FindFirstAncestor("GraphQlShared").Parent;
local v1 = require(l_Parent_0.Promise);
return {
    SuccessfulRequest = function(v2) --[[ Line: 5 ]] --[[ Name: SuccessfulRequest ]]
        -- upvalues: v1 (copy)
        return function(_, _, _, _, _) --[[ Line: 6 ]]
            -- upvalues: v2 (copy), v1 (ref)
            local v8 = {
                responseCode = 200, 
                responseTimeMs = 480, 
                isJSONValid = true, 
                v2, 
                responseBody = v2
            };
            return v1.resolve(v8);
        end;
    end
};