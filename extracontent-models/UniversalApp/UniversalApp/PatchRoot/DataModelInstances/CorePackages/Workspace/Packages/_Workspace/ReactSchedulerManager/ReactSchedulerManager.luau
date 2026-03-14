local l_Parent_0 = script.Parent;
local l_GetReactSchedulerIXPConfig_0 = require(l_Parent_0.SharedFlags).GetReactSchedulerIXPConfig;
local v2 = require(l_Parent_0.Scheduler);
local l_default_0 = require(l_Parent_0.AppStartup).AppStartupSequence.default;
local _ = require(l_Parent_0.AppCommonLib);
local v5 = game:DefineFastInt("LuaAppStartupReactSchedulerDelayMs", 0);
local v6 = game:DefineFastInt("LuaAppStartupReactSchedulerInterval", 15);
return {
    startup = function() --[[ Line: 13 ]] --[[ Name: startup ]]
        -- upvalues: l_GetReactSchedulerIXPConfig_0 (copy), v2 (copy), v5 (copy), v6 (copy), l_default_0 (copy)
        local v7 = l_GetReactSchedulerIXPConfig_0();
        if v7 then
            v2.unstable_setSchedulerFlags(v7);
        end;
        if v5 > 0 then
            local v8 = v2.unstable_getSchedulerFlags();
            v2.unstable_setSchedulerFlags({
                yieldInterval = v6
            });
            local v9 = nil;
            local v10 = nil;
            do
                local l_v9_0, l_v10_0 = v9, v10;
                local function v13() --[[ Line: 29 ]] --[[ Name: resetFlags ]]
                    -- upvalues: v2 (ref), v8 (copy), l_v10_0 (ref), l_v9_0 (ref)
                    v2.unstable_setSchedulerFlags(v8);
                    if l_v10_0 then
                        l_v10_0:disconnect();
                        l_v10_0 = nil;
                    end;
                    l_v9_0 = nil;
                end;
                l_v9_0 = task.delay(v5 / 1000, v13);
                l_v10_0 = l_default_0.changed:connect(function() --[[ Line: 40 ]]
                    -- upvalues: l_default_0 (ref), l_v9_0 (ref), v2 (ref), v8 (copy), l_v10_0 (ref)
                    if l_default_0.isInteractive and l_v9_0 then
                        task.cancel(l_v9_0);
                        v2.unstable_setSchedulerFlags(v8);
                        if l_v10_0 then
                            l_v10_0:disconnect();
                            l_v10_0 = nil;
                        end;
                        l_v9_0 = nil;
                    end;
                end);
            end;
        end;
    end
};