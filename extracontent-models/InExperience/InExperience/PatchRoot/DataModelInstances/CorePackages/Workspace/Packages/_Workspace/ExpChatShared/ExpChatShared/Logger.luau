local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
local v1 = require(l_Parent_0.Lumberyak).Logger.new(nil, "ExpChat");
local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
    return {
        level = game:DefineFastString("DebugLuaLogLevel", ""), 
        pattern = game:DefineFastString("DebugLuaLogPattern", "")
    };
end);
if not l_status_0 then
    l_result_0 = {
        level = "debug", 
        pattern = ""
    };
end;
v1:setContext({
    prefix = "[{loggerName} ({level})] - "
});
v1:addSink({
    maxLevel = v1.Levels.fromString(l_result_0.level), 
    log = function(_, v5, _) --[[ Line: 46 ]] --[[ Name: log ]]
        -- upvalues: l_result_0 (ref)
        if string.match(v5, l_result_0.pattern) then
            print(v5);
        end;
    end
});
return v1;