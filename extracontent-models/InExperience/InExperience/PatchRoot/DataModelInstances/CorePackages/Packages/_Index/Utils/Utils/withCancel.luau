local l_Boolean_0 = require((nil).LuauPolyfill).Boolean;
local v1 = require((nil).Promise);
local v2 = {};
local _ = require((nil).Dev.JestGlobals).expect;
local l_memoize2_0 = require(script.Parent["memoize.js"]).memoize2;
local function v6(v5) --[[ Line: 14 ]] --[[ Name: defaultAsyncIteratorReturn ]]
    -- upvalues: v1 (copy)
    return v1.resolve():andThen(function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy)
        return {
            value = v5, 
            done = true
        };
    end);
end;
local v9 = l_memoize2_0(function(v7, v8) --[[ Line: 19 ]]
    return function(...) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v7 (copy)
        return Reflect:apply(v8, v7, {
            ...
        });
    end;
end);
local function v23(v10, v11) --[[ Line: 29 ]] --[[ Name: getAsyncIteratorWithCancel ]]
    -- upvalues: l_Boolean_0 (copy), v6 (copy), v1 (copy), v9 (copy)
    return Proxy.new(v10, {
        has = function(_, v13, v14) --[[ Line: 35 ]] --[[ Name: has ]]
            if v14 == "return" then
                return true;
            else
                return Reflect:has(v13, v14);
            end;
        end, 
        get = function(_, v16, v17, v18) --[[ Line: 41 ]] --[[ Name: get ]]
            -- upvalues: l_Boolean_0 (ref), v6 (ref), v1 (ref), v11 (copy), v9 (ref)
            local v19 = Reflect:get(v16, v17, v18);
            if v17 == "return" then
                local v20 = l_Boolean_0.toJSBoolean(v19) and v19 or v6;
                return function(v21) --[[ Line: 46 ]]
                    -- upvalues: v1 (ref), v11 (ref), v20 (copy), v16 (copy)
                    return v1.resolve():andThen(function() --[[ Line: 47 ]]
                        -- upvalues: v11 (ref), v21 (copy), v20 (ref), v16 (ref)
                        local v22 = v11(v21):expect();
                        return Reflect:apply(v20, v16, {
                            v22
                        });
                    end);
                end;
            elseif typeof(v19) == "function" then
                return v9(v16, v19);
            else
                return v19;
            end;
        end
    });
end;
v2.getAsyncIteratorWithCancel = v23;
local function v32(v24, v25) --[[ Line: 62 ]] --[[ Name: getAsyncIterableWithCancel ]]
    -- upvalues: v23 (copy), v9 (copy)
    return Proxy.new(v24, {
        get = function(_, v27, v28, v29) --[[ Line: 68 ]] --[[ Name: get ]]
            -- upvalues: v23 (ref), v25 (copy), v9 (ref)
            local v30 = Reflect:get(v27, v28, v29);
            if Symbol.asyncIterator == v28 then
                return function() --[[ Line: 71 ]]
                    -- upvalues: v30 (copy), v27 (copy), v23 (ref), v25 (ref)
                    local v31 = Reflect:apply(v30, v27, {});
                    return v23(v31, v25);
                end;
            elseif typeof(v30) == "function" then
                return v9(v27, v30);
            else
                return v30;
            end;
        end
    });
end;
v2.getAsyncIterableWithCancel = v32;
v2.withCancel = v32;
return v2;