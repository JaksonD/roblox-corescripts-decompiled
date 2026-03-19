local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Error);
local v2 = require(l_Parent_0.format);
local v3 = v1.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}");
local v4 = v1.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}");
return function(v5, v6, v7) --[[ Line: 35 ]] --[[ Name: freeze ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local v8 = {};
    assert(type(v6) == "table", (("Attempted to call Dash.freeze with argument #2 of type %*, but it should be table "):format((type(v6)))));
    setmetatable(v8, {
        __index = function(_, v10) --[[ Line: 44 ]] --[[ Name: __index ]]
            -- upvalues: v6 (copy), v7 (copy), v4 (ref), v5 (copy)
            local v11 = v6[v10];
            if v11 == nil and v7 then
                v4:throw({
                    key = v10, 
                    objectName = v5
                });
            end;
            return v11;
        end, 
        __newindex = function(_, v13) --[[ Line: 55 ]] --[[ Name: __newindex ]]
            -- upvalues: v3 (ref), v5 (copy)
            v3:throw({
                key = v13, 
                objectName = v5
            });
        end, 
        __len = function() --[[ Line: 62 ]] --[[ Name: __len ]]
            -- upvalues: v6 (copy)
            return #v6;
        end, 
        __tostring = function() --[[ Line: 65 ]] --[[ Name: __tostring ]]
            -- upvalues: v2 (ref), v5 (copy)
            return v2("Frozen({})", v5);
        end, 
        __call = function(_, ...) --[[ Line: 68 ]] --[[ Name: __call ]]
            -- upvalues: v6 (copy)
            return v6(...);
        end
    });
    return v8;
end;