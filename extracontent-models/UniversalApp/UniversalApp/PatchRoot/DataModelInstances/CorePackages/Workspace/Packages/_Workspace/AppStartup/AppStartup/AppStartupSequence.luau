local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_game_EngineFeature_0 = game:GetEngineFeature("LuaAppCompression");
local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v4 (copy)
    local v5 = {
        changed = l_Signal_0.new(), 
        isInteractive = false
    };
    setmetatable(v5, v4);
    return v5;
end;
v4.setInteractive = function(v6) --[[ Line: 31 ]] --[[ Name: setInteractive ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_ScriptContext_0 (copy)
    if v6.isInteractive then
        return;
    else
        v6.isInteractive = true;
        if l_game_EngineFeature_0 then
            l_ScriptContext_0:CompressLuaApp();
        end;
        v6.changed:fire();
        return;
    end;
end;
v4.default = v4.new();
return v4;