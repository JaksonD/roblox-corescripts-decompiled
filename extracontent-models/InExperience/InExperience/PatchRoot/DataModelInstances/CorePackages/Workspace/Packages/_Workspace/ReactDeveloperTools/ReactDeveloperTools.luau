local l_Parent_0 = script.Parent;
local v1 = game:DefineFastFlag("DebugLuaAppEnableReactDevTools", false);
local v2 = game:DefineFastFlag("DebugLuaAppsReactDevToolsProfileOnStart", false);
local v3 = game:DefineFastString("DebugLuaAppReactDevToolsHost", "localhost");
local v4 = game:DefineFastInt("DebugLuaAppReactDevToolsPort", 8097);
return {
    startup = function(v5) --[[ Line: 9 ]] --[[ Name: startup ]]
        -- upvalues: v1 (copy), l_Parent_0 (copy), v3 (copy), v4 (copy), v2 (copy)
        if v1 or v5 then
            _G.__PROFILE__ = true;
            _G.__DEV__ = true;
            require(l_Parent_0.Dev.ReactDevtoolsCore).backend.connectToDevtools({
                host = v3, 
                port = v4, 
                profileOnStart = v2
            });
        end;
    end
};