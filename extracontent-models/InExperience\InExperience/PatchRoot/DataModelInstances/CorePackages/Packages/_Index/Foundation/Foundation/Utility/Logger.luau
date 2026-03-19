local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.Lumberyak);
local l_Logger_0 = v1.Logger;
local v6 = {
    maxLevel = l_Logger_0.Levels.Info, 
    log = function(_, v4, v5) --[[ Line: 18 ]] --[[ Name: log ]]
        -- upvalues: l_Logger_0 (copy)
        if v5.level == l_Logger_0.Levels.Error or v5.level == l_Logger_0.Levels.Warning then
            warn(v4);
            return;
        else
            print(v4);
            return;
        end;
    end
};
local function _(v7) --[[ Line: 27 ]]
    -- upvalues: v1 (copy), v6 (copy)
    local v8 = v1.Logger.new(nil, v7);
    v8:setContext({
        prefix = "[{loggerName} - {level}] - "
    });
    v8:addSink(v6);
    return v8;
end;
local v10 = v1.Logger.new(nil, "Foundation");
v10:setContext({
    prefix = "[{loggerName} - {level}] - "
});
v10:addSink(v6);
local l_v10_0 = v10;
v10 = {
    foundationSink = v6, 
    setLogLevel = function(v12, v13) --[[ Line: 38 ]] --[[ Name: setLogLevel ]]
        v12.foundationSink.maxLevel = v13;
        v12:addSink(v12.foundationSink);
    end, 
    enableTraceLog = function(v14) --[[ Line: 42 ]] --[[ Name: enableTraceLog ]]
        -- upvalues: l_Logger_0 (copy)
        v14:setLogLevel(l_Logger_0.Levels.Trace);
    end
};
setmetatable(v10, {
    __index = l_v10_0
});
return v10;