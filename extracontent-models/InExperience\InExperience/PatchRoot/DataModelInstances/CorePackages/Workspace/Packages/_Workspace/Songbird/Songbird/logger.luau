local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Lumberyak).Logger.new(nil, "Songbird");
local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
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
    prefix = "[{loggerName} - {level}] - "
});
v1:addSink({
    maxLevel = v1.Levels.fromString(l_result_0.level), 
    log = function(_, v5, _) --[[ Line: 24 ]] --[[ Name: log ]]
        -- upvalues: l_result_0 (ref)
        if v5:match(l_result_0.pattern) then
            print(v5);
        end;
    end
});
return v1;