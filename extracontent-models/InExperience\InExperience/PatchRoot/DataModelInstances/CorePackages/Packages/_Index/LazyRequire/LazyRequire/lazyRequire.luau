return function(v0) --[[ Line: 1 ]]
    local v1 = {};
    local v2 = nil;
    local function _() --[[ Line: 5 ]]
        -- upvalues: v2 (ref), v0 (copy)
        if v2 then
            return v2;
        else
            v2 = require(v0);
            return v2;
        end;
    end;
    setmetatable(v1, {
        __index = function(_, v5) --[[ Line: 15 ]] --[[ Name: __index ]]
            -- upvalues: v2 (ref), v0 (copy)
            local v6;
            if v2 then
                v6 = v2;
            else
                v2 = require(v0);
                v6 = v2;
            end;
            return v6[v5];
        end, 
        __newindex = function(_, v8, v9) --[[ Line: 20 ]] --[[ Name: __newindex ]]
            -- upvalues: v2 (ref), v0 (copy)
            local v10;
            if v2 then
                v10 = v2;
            else
                v2 = require(v0);
                v10 = v2;
            end;
            v10[v8] = v9;
        end, 
        __call = function(_, ...) --[[ Line: 25 ]] --[[ Name: __call ]]
            -- upvalues: v2 (ref), v0 (copy)
            local v12;
            if v2 then
                v12 = v2;
            else
                v2 = require(v0);
                v12 = v2;
            end;
            return v12(...);
        end, 
        __len = function(_) --[[ Line: 30 ]] --[[ Name: __len ]]
            -- upvalues: v2 (ref), v0 (copy)
            local v14;
            if v2 then
                v14 = v2;
            else
                v2 = require(v0);
                v14 = v2;
            end;
            return #v14;
        end, 
        __iter = function(_) --[[ Line: 34 ]] --[[ Name: __iter ]]
            -- upvalues: v2 (ref), v0 (copy)
            local l_next_0 = next;
            if v2 then
                return l_next_0, v2;
            else
                v2 = require(v0);
                return l_next_0, v2;
            end;
        end, 
        __mode = "kv"
    });
    return v1;
end;