local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local _ = require(script.Parent.Parent.core.types);
v0.createOperation = function(v4, v5) --[[ Line: 19 ]] --[[ Name: createOperation ]]
    -- upvalues: l_Object_0 (copy)
    local l_v5_0 = v5;
    local v7 = l_Object_0.assign({}, v4);
    local function v10(_, v9) --[[ Line: 22 ]] --[[ Name: setContext ]]
        -- upvalues: v7 (ref), l_Object_0 (ref)
        if typeof(v9) == "function" then
            v7 = l_Object_0.assign({}, v7, v9(v7));
            return;
        else
            v7 = l_Object_0.assign({}, v7, v9);
            return;
        end;
    end;
    local function v12(_) --[[ Line: 30 ]] --[[ Name: getContext ]]
        -- upvalues: l_Object_0 (ref), v7 (ref)
        return l_Object_0.assign({}, v7);
    end;
    return (setmetatable(l_v5_0, {
        __index = {
            setContext = v10, 
            getContext = v12
        }
    }));
end;
return v0;