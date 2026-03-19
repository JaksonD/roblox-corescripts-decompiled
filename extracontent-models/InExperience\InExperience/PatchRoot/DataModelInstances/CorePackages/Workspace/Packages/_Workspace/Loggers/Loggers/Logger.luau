local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Lumberyak).Logger.new(nil, "Logger");
local v2 = game:DefineFastString("DebugLuaLogLevel", "");
local v3 = v1.Levels.fromString(v2);
local v4 = game:DefineFastString("DebugLuaLogPattern", "");
v1:setContext({
    prefix = "[{loggerName}] - "
});
v1:addSink({
    maxLevel = v3, 
    log = function(_, v6, _) --[[ Line: 14 ]] --[[ Name: log ]]
        -- upvalues: v4 (copy)
        if string.match(v6, v4) then
            print(v6);
        end;
    end
});
return v1;