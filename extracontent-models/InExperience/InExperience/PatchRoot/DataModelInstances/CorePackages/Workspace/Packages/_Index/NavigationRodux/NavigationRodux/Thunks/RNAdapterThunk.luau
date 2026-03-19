local l_Parent_0 = script:FindFirstAncestor("NavigationRodux").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v3 = {};
local v4 = l_Symbol_0.named("RNAdapterThunkTag");
v3.middleware = function(v5) --[[ Line: 19 ]] --[[ Name: middleware ]]
    -- upvalues: v1 (copy), v4 (copy)
    v1.isType(v5, "function", "rnDispatcher");
    return function(v6, v7) --[[ Line: 22 ]]
        -- upvalues: v4 (ref), v5 (copy)
        return function(v8) --[[ Line: 23 ]]
            -- upvalues: v4 (ref), v7 (copy), v5 (ref), v6 (copy)
            if typeof(v8) == "table" and v8[v4] == true then
                return v8(v7, v5);
            else
                return v6(v8);
            end;
        end;
    end;
end;
v3.new = function(v9, v10) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v4 (copy)
    v1.isNonEmptyString(v9, "name");
    v1.isType(v10, "function", "onInvoke");
    return (setmetatable({
        [v4] = true, 
        type = v9
    }, {
        __call = function(_, ...) --[[ Line: 41 ]] --[[ Name: __call ]]
            -- upvalues: v10 (copy)
            v10(...);
        end
    }));
end;
v3.test = function(v12, v13, v14) --[[ Line: 47 ]] --[[ Name: test ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_assert_0 = v1.assert;
    local v16 = false;
    if type(v12) == "table" then
        v16 = v12[v4] == true;
    end;
    l_assert_0(v16, "'thunk' must be a valid RNAdapterThunk");
    return v12(v13, v14);
end;
v3.is = function(v17) --[[ Line: 56 ]] --[[ Name: is ]]
    -- upvalues: v4 (copy)
    if type(v17) == "table" then
        return v17[v4] == true;
    else
        return false;
    end;
end;
return v3;