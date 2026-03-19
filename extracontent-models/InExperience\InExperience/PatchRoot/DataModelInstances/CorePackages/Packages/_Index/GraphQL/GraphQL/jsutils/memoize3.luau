local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local function _(v3) --[[ Line: 19 ]] --[[ Name: replaceNil ]]
    -- upvalues: v2 (copy)
    if v3 == nil then
        return v2;
    else
        return v3;
    end;
end;
local function _() --[[ Line: 26 ]] --[[ Name: newWeakMap ]]
    return (setmetatable({}, {
        __mode = "kv"
    }));
end;
return {
    memoize3 = function(v6) --[[ Line: 33 ]] --[[ Name: memoize3 ]]
        -- upvalues: v2 (copy)
        local v7 = nil;
        return function(v8, v9, v10) --[[ Line: 36 ]]
            -- upvalues: v2 (ref), v7 (ref), v6 (copy)
            local v11 = if v8 == nil then v2 else v8;
            local v12 = if v9 == nil then v2 else v9;
            local v13 = if v10 == nil then v2 else v10;
            if not v7 then
                v7 = setmetatable({}, {
                    __mode = "kv"
                });
            end;
            local v14 = v7[v11];
            local v15 = nil;
            if v14 then
                v15 = v14[v12];
                if v15 then
                    local v16 = v15[v13];
                    if v16 ~= nil then
                        if v16 == v2 then
                            return nil;
                        else
                            return v16;
                        end;
                    end;
                end;
            else
                v14 = setmetatable({}, {
                    __mode = "kv"
                });
                v7[v11] = v14;
            end;
            if not v15 then
                v15 = setmetatable({}, {
                    __mode = "kv"
                });
                v14[v12] = v15;
            end;
            local v17 = v6(v8, v9, v10);
            v15[v13] = if v17 == nil then v2 else v17;
            return v17;
        end;
    end
};