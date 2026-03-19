local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
if require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then
    return function(v4, v5) --[[ Line: 9 ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (copy)
        v2.isType(v4, "string", "url");
        v2.isType(v5, "string", "titleKey");
        return function(v6) --[[ Line: 13 ]]
            -- upvalues: v3 (ref), v1 (ref), v4 (copy), v5 (copy)
            v6:dispatch(v3({
                name = v1.GenericWebPage, 
                detail = v4, 
                extraProps = {
                    titleKey = v5
                }
            }));
        end;
    end;
else
    return function(v7, v8) --[[ Line: 24 ]]
        -- upvalues: v3 (copy), v1 (copy)
        assert(type(v7) == "string", string.format("OpenWebview thunk expects url to be a string, was %s", (type(v7))));
        assert(type(v8) == "string", string.format("OpenWebview thunk expects title to be a string, was %s", (type(string))));
        return function(v9) --[[ Line: 31 ]]
            -- upvalues: v3 (ref), v1 (ref), v7 (copy), v8 (copy)
            v9:dispatch(v3({
                name = v1.GenericWebPage, 
                detail = v7, 
                extraProps = {
                    title = v8
                }
            }));
        end;
    end;
end;