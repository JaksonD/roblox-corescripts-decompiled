local v0 = {};
v0.new = function(v1) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {
        defaultConfig = v1, 
        defaultConfigKeys = {}
    };
    for v3 in pairs(v1) do
        table.insert(v2.defaultConfigKeys, v3);
    end;
    v2._currentConfig = setmetatable({}, {
        __index = function(_, v5) --[[ Line: 29 ]] --[[ Name: __index ]]
            -- upvalues: v2 (copy)
            local v6 = ("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(v5), table.concat(v2.defaultConfigKeys, ", "));
            error(v6, 3);
        end
    });
    v2.set = function(...) --[[ Line: 42 ]]
        -- upvalues: v0 (ref), v2 (copy)
        return v0.set(v2, ...);
    end;
    v2.get = function(...) --[[ Line: 46 ]]
        -- upvalues: v0 (ref), v2 (copy)
        return v0.get(v2, ...);
    end;
    v2.scoped = function(...) --[[ Line: 50 ]]
        -- upvalues: v0 (ref), v2 (copy)
        return v0.scoped(v2, ...);
    end;
    v2.set(v1);
    return v2;
end;
v0.set = function(v7, v8) --[[ Line: 59 ]] --[[ Name: set ]]
    local v9 = {};
    local v10 = {};
    for v11, v12 in pairs(v8) do
        if v7.defaultConfig[v11] == nil then
            table.insert(v9, v11);
        elseif typeof(v12) ~= "boolean" then
            table.insert(v10, tostring(v11) .. " (type " .. typeof(v12) .. ")");
        else
            v7._currentConfig[v11] = v12;
        end;
    end;
    if next(v9) ~= nil then
        local v13 = ("Invalid global configuration keys %s. Valid configuration keys are: %s"):format(table.concat(v9, ", "), table.concat(v7.defaultConfigKeys, ", "));
        error(v13, 3);
    end;
    if next(v10) ~= nil then
        local v14 = ("Invalid global configuration types for keys %s. All configuration values must be boolean."):format(table.concat(v10, ", "));
        error(v14, 3);
    end;
end;
v0.get = function(v15) --[[ Line: 98 ]] --[[ Name: get ]]
    return v15._currentConfig;
end;
return v0;