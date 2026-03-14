local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.UrlMatcher);
local v2 = require(script.Parent.UrlValidation);
local _ = require(script.Parent.Types);
local v4 = require(l_Parent_0.Cryo);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy), v5 (copy)
    local v8 = v4.Dictionary.union(v6 or {}, {
        pathPatterns = v4.Dictionary.keys(v7)
    });
    local v9 = {
        _urlMatcher = v1.new(v8), 
        _urlMap = v7
    };
    setmetatable(v9, v5);
    return v9;
end;
v5.process = function(v10, v11) --[[ Line: 48 ]] --[[ Name: process ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v12 = v10._urlMatcher:match(v11);
    return v4.List.filterMap(v12, function(v13) --[[ Line: 50 ]]
        -- upvalues: v2 (ref), v10 (copy)
        local v14, v15 = v2.validateUrlMatch(v13, v10._urlMap);
        if v14 then
            return {
                startIndex = v13.startIndex, 
                endIndex = v13.endIndex, 
                result = v15
            };
        else
            return nil;
        end;
    end);
end;
return v5;