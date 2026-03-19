local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = require(l_Parent_0.Promise);
local v3 = nil;
local v4 = nil;
local v20 = {
    mapAsyncIterator = function(v5, v6, v7) --[[ Line: 25 ]] --[[ Name: mapAsyncIterator ]]
        -- upvalues: v2 (copy), l_Boolean_0 (copy), v3 (ref), v4 (ref)
        local v8 = nil;
        local v9 = nil;
        if typeof(v5["return"]) == "function" then
            v8 = v5["return"];
            v9 = function(v10) --[[ Line: 35 ]]
                -- upvalues: v2 (ref), v8 (ref), v5 (copy)
                local function v11() --[[ Line: 36 ]] --[[ Name: rethrow ]]
                    -- upvalues: v2 (ref), v10 (copy)
                    return v2.reject(v10);
                end;
                return v8(v5):andThen(v11, v11);
            end;
        end;
        local function v13(v12) --[[ Line: 47 ]] --[[ Name: mapResult ]]
            -- upvalues: l_Boolean_0 (ref), v3 (ref), v6 (copy), v4 (ref), v9 (ref)
            if l_Boolean_0.toJSBoolean(v12.done) then
                return v12;
            else
                return (v3(v12.value, v6):andThen(v4, v9));
            end;
        end;
        local v14 = nil;
        if v7 then
            v14 = function(v15) --[[ Line: 62 ]]
                -- upvalues: v3 (ref), v7 (copy), v4 (ref), v9 (ref)
                return v3(v15, v7):andThen(v4, v9);
            end;
        end;
        return {
            next = function(_) --[[ Line: 70 ]] --[[ Name: next ]]
                -- upvalues: v5 (copy), v13 (copy), v14 (ref)
                return v5:next():andThen(v13, v14);
            end, 
            ["return"] = function(_) --[[ Line: 76 ]]
                -- upvalues: l_Boolean_0 (ref), v8 (ref), v5 (copy), v13 (copy), v14 (ref), v2 (ref)
                if l_Boolean_0.toJSBoolean(v8) then
                    return (v8(v5):andThen(v13, v14));
                else
                    return (v2.resolve({
                        value = nil, 
                        done = true
                    }));
                end;
            end, 
            throw = function(_, v19) --[[ Line: 88 ]] --[[ Name: throw ]]
                -- upvalues: v5 (copy), v13 (copy), v14 (ref), v2 (ref), v9 (ref)
                if typeof(v5.throw) == "function" then
                    return v5.throw(v5, v19):andThen(v13, v14);
                else
                    return v2.reject(v19):catch(v9);
                end;
            end
        };
    end
};
v3 = function(v21, v22) --[[ Line: 108 ]] --[[ Name: asyncMapValue ]]
    -- upvalues: v2 (copy)
    return v2.new(function(v23) --[[ Line: 110 ]]
        -- upvalues: v22 (copy), v21 (copy)
        return v23(v22(v21));
    end);
end;
v4 = function(v24) --[[ Line: 116 ]] --[[ Name: iteratorResult ]]
    return {
        value = v24, 
        done = false
    };
end;
return v20;