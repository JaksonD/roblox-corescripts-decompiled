local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v7) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v6 (copy), v4 (copy), v5 (copy)
    assert(v2.callback(v7) or v2.none(v7));
    return v6({
        name = v4.GenericWebPage, 
        detail = v5.static.friends(), 
        extraProps = {
            titleKey = "CommonUI.Features.Label.Friends", 
            onClose = v7, 
            searchParams = {
                searchType = "Players"
            }
        }
    });
end;