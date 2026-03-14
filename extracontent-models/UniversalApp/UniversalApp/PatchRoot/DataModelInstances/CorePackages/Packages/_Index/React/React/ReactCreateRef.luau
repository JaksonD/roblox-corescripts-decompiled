local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local _ = require(l_Parent_0.Shared);
local v3 = require(script.Parent["ReactBinding.roblox"]);
return {
    createRef = function() --[[ Line: 26 ]]
        -- upvalues: v3 (copy), v1 (copy)
        local v4, _ = v3.create(nil);
        local v6 = {};
        if v1.__DEV__ then
            v4._source = debug.traceback("Ref created at:", 1);
        end;
        setmetatable(v6, {
            __index = function(_, v8) --[[ Line: 44 ]] --[[ Name: __index ]]
                -- upvalues: v4 (copy)
                if v8 == "current" then
                    return v4:getValue();
                else
                    return v4[v8];
                end;
            end, 
            __newindex = function(_, v10, v11) --[[ Line: 51 ]] --[[ Name: __newindex ]]
                -- upvalues: v3 (ref), v4 (copy)
                if v10 == "current" then
                    v3.update(v4, v11);
                end;
                v4[v10] = v11;
            end, 
            __tostring = function(_) --[[ Line: 62 ]] --[[ Name: __tostring ]]
                -- upvalues: v4 (copy)
                return string.format("Ref(%s)", (tostring(v4:getValue())));
            end
        });
        return v6;
    end
};