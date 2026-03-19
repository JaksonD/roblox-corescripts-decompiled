local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_inspect_0 = require(l_Modules_0.LuaApp.Util.inspect).inspect;
local v2 = require(l_Modules_0.LuaApp.Util.tableDiff);
local function v8(v3, v4, v5, v6) --[[ Line: 6 ]] --[[ Name: backtraceDetails ]]
    -- upvalues: v2 (copy)
    if type(v6.thrownValue) ~= "string" then
        return nil;
    else
        local v7 = v6.thrownValue:find("\n");
        if not v7 then
            return nil;
        else
            return {
                message = v6.message .. "\n" .. v6.thrownValue:sub(1, v7 - 1), 
                stacks = v6.thrownValue:sub(v7 + 1):split("\n\n"), 
                annotations = {
                    rodux_actions = v5, 
                    rodux_diff = v2(v3, v4) or {}
                }
            };
        end;
    end;
end;
return function(v9) --[[ Line: 24 ]]
    -- upvalues: l_inspect_0 (copy), v8 (copy), v2 (copy)
    return {
        reportReducerError = function(_, v11, v12) --[[ Line: 26 ]] --[[ Name: reportReducerError ]]
            -- upvalues: l_inspect_0 (ref), v9 (copy), v8 (ref)
            local v13 = string.format("%s\n\nAction:\n%s\n\nError contents:\n%s", v12.message, l_inspect_0(v11), (tostring(v12.thrownValue)));
            v9(v13, (v8({}, {}, {
                v11
            }, v12)));
        end, 
        reportUpdateError = function(v14, v15, v16, v17) --[[ Line: 35 ]] --[[ Name: reportUpdateError ]]
            -- upvalues: l_inspect_0 (ref), v2 (ref), v9 (copy), v8 (ref)
            local v18 = string.format("%s\n\nStore changes in the last flush:\n%s\n\nMost recent actions (starting with the oldest):\n%s\n\nError contents:\n%s", v17.message, l_inspect_0(v2(v14, v15)), l_inspect_0(v16), (tostring(v17.thrownValue)));
            v9(v18, (v8(v14, v15, v16, v17)));
        end
    };
end;