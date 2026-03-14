local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local l_stringify_0 = require(l_Parent_0.GraphQL).stringify;
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v6 = {
        body = v5
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.text = function(v7) --[[ Line: 28 ]] --[[ Name: text ]]
    -- upvalues: v1 (copy), l_stringify_0 (copy), l_Error_0 (copy)
    return v1.new(function(v8, v9) --[[ Line: 29 ]]
        -- upvalues: v7 (copy), l_stringify_0 (ref), l_Error_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
            -- upvalues: v7 (ref), l_stringify_0 (ref)
            if v7.body.errors then
                for v10, v11 in v7.body.errors do
                    if type(v11) == "table" and v11.name == "GraphQLError" then
                        v7.body.errors[v10] = {
                            message = v11.message, 
                            locations = v11.locations, 
                            extensions = v11.extensions, 
                            path = v11.path
                        };
                    end;
                end;
            end;
            return l_stringify_0(v7.body);
        end);
        if l_status_0 then
            v8(l_result_0);
            return;
        else
            v9(l_Error_0.new(l_result_0));
            return;
        end;
    end);
end;
return v4;