local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = {};
v2.__index = v2;
v2.Levels = {
    Error = "Error", 
    Warning = "Warning", 
    Info = "Info", 
    Debug = "Debug", 
    Trace = "Trace"
};
local v3 = {
    v2.Levels.Error, 
    v2.Levels.Warning, 
    v2.Levels.Info, 
    v2.Levels.Debug, 
    v2.Levels.Trace
};
local v4 = {};
for v5, v6 in pairs(v3) do
    v4[v6] = v5;
end;
v2.Levels.fromString = function(v7) --[[ Line: 28 ]] --[[ Name: fromString ]]
    -- upvalues: v3 (copy)
    if type(v7) ~= "string" then
        return nil;
    else
        for _, v9 in pairs(v3) do
            if string.lower(v9) == string.lower(v7) then
                return v9;
            end;
        end;
        return nil;
    end;
end;
v2.new = function(v10, v11) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v12 = {
        name = v11, 
        sinks = {}, 
        children = {}, 
        parent = v10, 
        context = {}, 
        dirty = true, 
        active = {}, 
        cache = {
            sinks = {}, 
            context = {}
        }
    };
    for v13, _ in pairs(v2.Levels) do
        if v10 then
            v12.active[v13] = v10.active[v13];
        else
            v12.active[v13] = false;
        end;
    end;
    if v10 then
        v10.children[v12] = true;
    end;
    setmetatable(v12, v2);
    return v12;
end;
local function v15(v16, v17) --[[ Line: 72 ]] --[[ Name: setActive ]]
    -- upvalues: v4 (copy), v3 (copy), v15 (copy)
    local v18 = v4[v16];
    if v18 then
        for v19 = 1, v18 do
            v17.active[v3[v19]] = true;
        end;
        for v20, _ in pairs(v17.children) do
            v15(v16, v20);
        end;
    end;
end;
local function v22(v23) --[[ Line: 85 ]] --[[ Name: setDirty ]]
    -- upvalues: v22 (copy)
    v23.dirty = true;
    for v24, _ in pairs(v23.children) do
        v22(v24);
    end;
end;
local function v26(v27) --[[ Line: 93 ]] --[[ Name: updateCache ]]
    -- upvalues: v26 (copy), v1 (copy)
    if not v27.dirty then
        return;
    elseif not v27.parent then
        v27.cache.context = v27.context;
        v27.cache.sinks = v27.sinks;
        v27.dirty = false;
        return;
    else
        v26(v27.parent);
        v27.cache.context = v1.Dictionary.join(v27.parent.cache.context, v27.context);
        if v27.parent.cache.context.prefix and v27.context.prefix then
            v27.cache.context.prefix = v27.parent.cache.context.prefix .. v27.context.prefix;
        end;
        v27.cache.sinks = v1.List.join(v27.parent.cache.sinks, v27.sinks);
        v27.dirty = false;
        return;
    end;
end;
v2.setParent = function(v28, v29) --[[ Line: 117 ]] --[[ Name: setParent ]]
    -- upvalues: v26 (copy), v4 (copy), v15 (copy), v3 (copy), v22 (copy)
    if v28.parent then
        v28.parent.children[v28] = nil;
    end;
    v26(v29);
    v28.parent = v29;
    v28.parent.children[v28] = true;
    local v30 = -1;
    for _, v32 in pairs(v29.cache.sinks) do
        if v4[v32.maxLevel] then
            v30 = math.max(v30, v4[v32.maxLevel]);
        end;
    end;
    if v30 > -1 then
        v15(v3[v30], v28);
    end;
    v28.dirty = true;
    for v33, _ in pairs(v28.children) do
        v22(v33);
    end;
end;
v2.addSink = function(v35, v36) --[[ Line: 141 ]] --[[ Name: addSink ]]
    -- upvalues: v15 (copy), v22 (copy)
    v15(v36.maxLevel, v35);
    table.insert(v35.sinks, v36);
    v35.dirty = true;
    for v37, _ in pairs(v35.children) do
        v22(v37);
    end;
end;
v2.setContext = function(v39, v40) --[[ Line: 147 ]] --[[ Name: setContext ]]
    -- upvalues: v22 (copy)
    v39.context = v40;
    v39.dirty = true;
    for v41, _ in pairs(v39.children) do
        v22(v41);
    end;
end;
local function v57(v43, v44, v45) --[[ Line: 152 ]] --[[ Name: log ]]
    -- upvalues: v26 (copy), v4 (copy)
    if v44.dirty then
        v26(v44);
    end;
    local v46 = {
        level = v43, 
        rawMessage = v45, 
        loggerName = v44.name
    };
    for v47, v48 in pairs(v44.cache.context) do
        if type(v48) == "function" then
            v46[v47] = v48();
        else
            v46[v47] = v48;
        end;
    end;
    local v49 = nil;
    v49 = v45.n == 0 and "LUMBERYAK INTERNAL: No log message given" or v45[1];
    if v46.prefix then
        v49 = v46.prefix .. v49;
    end;
    if v49:find("{") then
        local v50 = 1;
        do
            local l_v50_0 = v50;
            v49 = v49:gsub("{(.-)}", function(v52) --[[ Line: 186 ]]
                -- upvalues: l_v50_0 (ref), v45 (copy), v46 (copy)
                if v52 == "" then
                    l_v50_0 = l_v50_0 + 1;
                    return (tostring(v45[l_v50_0]));
                else
                    local v53 = v46[v52];
                    return v53 and tostring(v53);
                end;
            end);
            if l_v50_0 < v45.n then
                v49 = v49 .. "\nLUMBERYAK INTERNAL: Too many arguments given for format string";
            elseif v45.n < l_v50_0 then
                v49 = v49 .. "\nLUMBERYAK INTERNAL: Too few arguments given for format string";
            end;
        end;
    elseif v45.n > 1 then
        v49 = v49 .. "\nLUMBERYAK INTERNAL: Too many arguments given for format string";
    end;
    local v54 = v4[v43];
    for _, v56 in pairs(v44.cache.sinks) do
        if v4[v56.maxLevel] and v54 <= v4[v56.maxLevel] then
            v56:log(v49, v46);
        end;
    end;
end;
v2.error = function(v58, ...) --[[ Line: 213 ]] --[[ Name: error ]]
    -- upvalues: v2 (copy), v57 (copy)
    if not v58.active[v2.Levels.Error] then
        return;
    else
        v57(v2.Levels.Error, v58, table.pack(...));
        return;
    end;
end;
v2.warning = function(v59, ...) --[[ Line: 220 ]] --[[ Name: warning ]]
    -- upvalues: v2 (copy), v57 (copy)
    if not v59.active[v2.Levels.Warning] then
        return;
    else
        v57(v2.Levels.Warning, v59, table.pack(...));
        return;
    end;
end;
v2.info = function(v60, ...) --[[ Line: 227 ]] --[[ Name: info ]]
    -- upvalues: v2 (copy), v57 (copy)
    if not v60.active[v2.Levels.Info] then
        return;
    else
        v57(v2.Levels.Info, v60, table.pack(...));
        return;
    end;
end;
v2.debug = function(v61, ...) --[[ Line: 234 ]] --[[ Name: debug ]]
    -- upvalues: v2 (copy), v57 (copy)
    if not v61.active[v2.Levels.Debug] then
        return;
    else
        v57(v2.Levels.Debug, v61, table.pack(...));
        return;
    end;
end;
v2.trace = function(v62, ...) --[[ Line: 241 ]] --[[ Name: trace ]]
    -- upvalues: v2 (copy), v57 (copy)
    if not v62.active[v2.Levels.Trace] then
        return;
    else
        v57(v2.Levels.Trace, v62, table.pack(...));
        return;
    end;
end;
return v2;