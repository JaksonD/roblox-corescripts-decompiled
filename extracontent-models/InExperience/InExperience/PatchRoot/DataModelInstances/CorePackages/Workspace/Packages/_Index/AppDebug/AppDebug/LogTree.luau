local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppDebug");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Lumberyak);
local l_Levels_0 = v3.Logger.Levels;
local v5 = require(l_script_FirstAncestor_0.SharedSink);
local v6 = v3.Logger.new(nil, "root");
local v7 = tick();
local v8 = {
    ["*"] = v6
};
v6:setContext({
    tostring = function(v9) --[[ Line: 46 ]] --[[ Name: argToString ]]
        -- upvalues: v2 (copy)
        if typeof(v9) == "string" then
            return v9;
        else
            local v10 = getmetatable(v9);
            if v10 and v10.__tostring then
                return (tostring(v9));
            else
                return v2.pretty(v9);
            end;
        end;
    end
});
local function _(v11, v12) --[[ Line: 63 ]] --[[ Name: newLogger ]]
    -- upvalues: v3 (copy), v8 (copy)
    local v13 = v3.Logger.new(v11, v12);
    v8[v12] = v13;
    return v13;
end;
local function v25(v15) --[[ Line: 69 ]] --[[ Name: createLoggerTree ]]
    -- upvalues: v6 (copy), v8 (copy), v3 (copy)
    local v16 = v15:split(".");
    local v17 = "";
    local l_v6_0 = v6;
    for v19, v20 in v16 do
        if v20 == "" then
            error("Invalid log tag: " .. v15);
        end;
        if v19 == 1 then
            v17 = v20;
        else
            v17 = v17 .. "." .. v20;
        end;
        local v21 = v8[v17];
        if not v21 then
            local l_l_v6_0_0 = l_v6_0;
            local l_v17_0 = v17;
            local v24 = v3.Logger.new(l_l_v6_0_0, l_v17_0);
            v8[l_v17_0] = v24;
            v21 = v24;
        end;
        l_v6_0 = v21;
    end;
    return l_v6_0;
end;
local function v27(v26) --[[ Line: 88 ]] --[[ Name: logger ]]
    -- upvalues: v8 (copy), v25 (copy)
    return v8[v26] or v25(v26);
end;
local function _(v28) --[[ Line: 92 ]] --[[ Name: parseTag ]]
    -- upvalues: v2 (copy), l_Levels_0 (copy)
    local v29 = v28:split(":");
    if #v29 ~= 2 then
        warn("Invalid LogTree value: " .. v28);
        return nil, nil;
    else
        local v30, v31 = table.unpack(v29);
        return v2.trim(v30), l_Levels_0.fromString(v31);
    end;
end;
local function v39(v33, v34, v35) --[[ Line: 103 ]] --[[ Name: formatLog ]]
    -- upvalues: v7 (copy)
    local l_level_0 = v34.level;
    local v37 = string.format("%s [%s] %s", l_level_0:sub(1, 1), v34.loggerName, v33);
    if v35 then
        local v38 = tick() - v7;
        v37 = string.format("[%0.3f] %s", v38, v37);
    end;
    return v37;
end;
local function v46(_, v41, v42) --[[ Line: 113 ]] --[[ Name: logToConsole ]]
    -- upvalues: l_Levels_0 (copy)
    local l_level_1 = v42.level;
    local l_level_2 = v42.level;
    local v45 = string.format("%s [%s] %s", l_level_2:sub(1, 1), v42.loggerName, v41);
    if l_level_1 == l_Levels_0.Error or l_level_1 == l_Levels_0.Warning then
        warn(v45);
        return;
    else
        print(v45);
        return;
    end;
end;
local function _(v47) --[[ Line: 123 ]] --[[ Name: splitNonEmpty ]]
    -- upvalues: v2 (copy)
    local v48 = v2.splitOn(v47, "%s+");
    return v2.filter(v48, function(v49) --[[ Line: 125 ]]
        return #v49 > 0;
    end);
end;
return {
    logger = v27, 
    formatLog = v39, 
    logToConsole = v46, 
    setLogTags = function(v51, v52) --[[ Line: 130 ]] --[[ Name: setLogTags ]]
        -- upvalues: v5 (copy), v2 (copy), l_Levels_0 (copy), v8 (copy), v25 (copy)
        local v53 = v5.new(v52);
        local v54 = v2.splitOn(v51, "%s+");
        for _, v57 in (v2.filter(v54, function(v55) --[[ Line: 125 ]]
            return #v55 > 0;
        end)) do
            local v58 = v57:split(":");
            local v59, v60;
            if #v58 ~= 2 then
                warn("Invalid LogTree value: " .. v57);
                v59 = nil;
                v60 = nil;
            else
                local v61, v62 = table.unpack(v58);
                v59 = v2.trim(v61);
                v60 = l_Levels_0.fromString(v62);
            end;
            if v59 ~= nil then
                local v63 = tostring(v59);
                (v8[v63] or v25(v63)):addSink((v53:newSink(v60)));
            end;
        end;
    end
};