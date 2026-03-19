local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2({
        extraProps = {
            postId = v3.postId, 
            userId = v3.userId
        }, 
        name = v1.ContentFeed
    });
end;