local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local function _(v2) --[[ Line: 4 ]] --[[ Name: throwNotImplemented ]]
    -- upvalues: l_Parent_0 (copy)
    require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v2);
end;
local function v4() --[[ Line: 13 ]]
    return {};
end;
local function v5(v6, v7) --[[ Line: 49 ]] --[[ Name: class ]]
    -- upvalues: v4 (copy), v5 (copy), l_Parent_0 (copy)
    local v8 = v7 or v4;
    local v9 = {
        name = v6
    };
    v9.new = function(...) --[[ Line: 65 ]] --[[ Name: new ]]
        -- upvalues: v8 (copy), v9 (copy)
        local v10 = v8(...);
        setmetatable(v10, {
            __index = v9, 
            __tostring = v9.toString, 
            __eq = v9.equals, 
            __lt = v9.__lt, 
            __le = v9.__le, 
            __add = v9.__add, 
            __sub = v9.__sub, 
            __mul = v9.__mul, 
            __div = v9.__div, 
            __mod = v9.__mod
        });
        v10.Class = v9;
        v10:_init(...);
        return v10;
    end;
    v9._init = function(_) --[[ Line: 114 ]] --[[ Name: _init ]]

    end;
    v9.isInstance = function(v12) --[[ Line: 133 ]] --[[ Name: isInstance ]]
        -- upvalues: v9 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 134 ]]
            -- upvalues: v12 (copy), v9 (ref)
            local v13 = getmetatable(v12);
            while true do
                if v13 then
                    if v13.__index == v9 then
                        return true;
                    else
                        v13 = getmetatable(v13.__index);
                    end;
                else
                    return false;
                end;
            end;
        end);
        return l_status_0 and l_result_0;
    end;
    v9.extend = function(v16, v17, v18) --[[ Line: 184 ]] --[[ Name: extend ]]
        -- upvalues: v5 (ref), v9 (copy)
        local v19 = v5(v17, v18 or v9.new);
        setmetatable(v19, {
            __index = v16
        });
        return v19;
    end;
    v9.toString = function(v20) --[[ Line: 222 ]] --[[ Name: toString ]]
        return v20.name;
    end;
    v9.equals = function(v21, v22) --[[ Line: 230 ]] --[[ Name: equals ]]
        return (rawequal(v21, v22));
    end;
    v9.__lt = function(_, _) --[[ Line: 238 ]] --[[ Name: __lt ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        local v25 = {
            methodName = "__lt", 
            className = v6
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v25);
    end;
    v9.__le = function(_, _) --[[ Line: 250 ]] --[[ Name: __le ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        local v28 = {
            methodName = "__le", 
            className = v6
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v28);
    end;
    v9.__add = function(_) --[[ Line: 257 ]] --[[ Name: __add ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        local v30 = {
            methodName = "__add", 
            className = v6
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v30);
    end;
    v9.__sub = function(_) --[[ Line: 263 ]] --[[ Name: __sub ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        local v32 = {
            methodName = "__sub", 
            className = v6
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v32);
    end;
    v9.__mul = function(_) --[[ Line: 269 ]] --[[ Name: __mul ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        local v34 = {
            methodName = "__mul", 
            className = v6
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v34);
    end;
    v9.__div = function(_) --[[ Line: 275 ]] --[[ Name: __div ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        local v36 = {
            methodName = "__div", 
            className = v6
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v36);
    end;
    v9.__mod = function(_) --[[ Line: 281 ]] --[[ Name: __mod ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        local v38 = {
            methodName = "__mod", 
            className = v6
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v38);
    end;
    return v9;
end;
return v5;