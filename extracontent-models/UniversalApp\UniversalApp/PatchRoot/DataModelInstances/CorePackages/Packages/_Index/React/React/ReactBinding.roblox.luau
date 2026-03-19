local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local _ = require(l_Parent_0.Shared);
local l_Symbol_0 = v2.Symbol;
local v6 = require(script.Parent["createSignal.roblox"]);
local v7 = l_Symbol_0("BindingImpl");
local v8 = {};
local v13 = {
    __index = {
        getValue = function(v9) --[[ Line: 48 ]] --[[ Name: getValue ]]
            -- upvalues: v8 (copy)
            return v8.getValue(v9);
        end, 
        map = function(v10, v11) --[[ Line: 52 ]] --[[ Name: map ]]
            -- upvalues: v8 (copy)
            return v8.map(v10, v11);
        end
    }, 
    __tostring = function(v12) --[[ Line: 61 ]] --[[ Name: __tostring ]]
        return string.format("RoactBinding(%s)", (tostring(v12:getValue())));
    end
};
v8.update = function(v14, v15) --[[ Line: 66 ]] --[[ Name: update ]]
    -- upvalues: v7 (copy)
    return v14[v7].update(v15);
end;
v8.subscribe = function(v16, v17) --[[ Line: 70 ]] --[[ Name: subscribe ]]
    -- upvalues: v7 (copy)
    return v16[v7].subscribe(v17);
end;
v8.getValue = function(v18) --[[ Line: 74 ]] --[[ Name: getValue ]]
    -- upvalues: v7 (copy)
    return v18[v7]:getValue();
end;
v8.create = function(v19) --[[ Line: 78 ]] --[[ Name: create ]]
    -- upvalues: v6 (copy), v1 (copy), l_ReactSymbols_0 (copy), v7 (copy), v13 (copy)
    local v20, v21 = v6();
    local v22 = {
        value = v19, 
        subscribe = v20
    };
    v22.update = function(v23) --[[ Line: 85 ]] --[[ Name: update ]]
        -- upvalues: v22 (copy), v21 (copy)
        v22.value = v23;
        v21(v23);
    end;
    v22.getValue = function() --[[ Line: 90 ]] --[[ Name: getValue ]]
        -- upvalues: v22 (copy)
        return v22.value;
    end;
    local v24 = nil;
    if v1.__DEV__ then
        v24 = debug.traceback("Binding created at:", 3);
    end;
    return setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v7] = v22, 
        _source = v24
    }, v13), v22.update;
end;
v8.map = function(v25, v26) --[[ Line: 108 ]] --[[ Name: map ]]
    -- upvalues: v1 (copy), l_ReactSymbols_0 (copy), v8 (copy), v7 (copy), v13 (copy)
    if v1.__DEV__ then
        local v27 = false;
        if typeof(v25) == "table" then
            v27 = v25["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        assert(v27, "Expected `self` to be a binding");
        assert(typeof(v26) == "function", "Expected arg #1 to be a function");
    end;
    local v31 = {
        subscribe = function(v28) --[[ Line: 124 ]] --[[ Name: subscribe ]]
            -- upvalues: v8 (ref), v25 (copy), v26 (copy)
            return v8.subscribe(v25, function(v29) --[[ Line: 125 ]]
                -- upvalues: v28 (copy), v26 (ref)
                v28(v26(v29));
            end);
        end, 
        update = function(_) --[[ Line: 130 ]] --[[ Name: update ]]
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2);
        end, 
        getValue = function() --[[ Line: 134 ]] --[[ Name: getValue ]]
            -- upvalues: v26 (copy), v25 (copy)
            return v26(v25:getValue());
        end
    };
    local v32 = nil;
    if v1.__DEV__ then
        v32 = debug.traceback("Mapped binding created at:", 3);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v7] = v31, 
        _source = v32
    }, v13));
end;
v8.join = function(v33) --[[ Line: 155 ]] --[[ Name: join ]]
    -- upvalues: v1 (copy), l_ReactSymbols_0 (copy), v8 (copy), v7 (copy), v13 (copy)
    if v1.__DEV__ then
        assert(typeof(v33) == "table", "Expected arg #1 to be of type table");
        for v34, v35 in v33 do
            if typeof(v35) ~= "table" or v35["$$typeof"] ~= l_ReactSymbols_0.REACT_BINDING_TYPE then
                local v36 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v34)));
                error(v36, 2);
            end;
        end;
    end;
    local v37 = {};
    local function v41() --[[ Line: 176 ]] --[[ Name: getValue ]]
        -- upvalues: v33 (copy)
        local v38 = {};
        for v39, v40 in pairs(v33) do
            v38[v39] = v40:getValue();
        end;
        return v38;
    end;
    v37.subscribe = function(v42) --[[ Line: 187 ]] --[[ Name: subscribe ]]
        -- upvalues: v33 (copy), v8 (ref), v41 (copy)
        local v43 = {};
        for v44, v45 in v33 do
            v43[v44] = v8.subscribe(v45, function(_) --[[ Line: 192 ]]
                -- upvalues: v42 (copy), v41 (ref)
                v42((v41()));
            end);
        end;
        return function() --[[ Line: 197 ]]
            -- upvalues: v43 (ref)
            if v43 == nil then
                return;
            else
                for _, v48 in v43 do
                    v48();
                end;
                v43 = nil;
                return;
            end;
        end;
    end;
    v37.update = function(_) --[[ Line: 210 ]] --[[ Name: update ]]
        error("Bindings created by joinBindings(...) cannot be updated directly", 2);
    end;
    v37.getValue = function() --[[ Line: 214 ]] --[[ Name: getValue ]]
        -- upvalues: v41 (copy)
        return (v41());
    end;
    local v50 = nil;
    if v1.__DEV__ then
        v50 = debug.traceback("Joined binding created at:", 2);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v7] = v37, 
        _source = v50
    }, v13));
end;
return v8;