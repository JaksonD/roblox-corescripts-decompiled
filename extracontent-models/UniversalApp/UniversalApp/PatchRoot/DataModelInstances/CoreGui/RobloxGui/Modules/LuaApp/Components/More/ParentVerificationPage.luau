local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_Modules_0.LuaApp.Thunks.Moderation.ResetModeration);
return function(v6) --[[ Line: 11 ]] --[[ Name: ParentVerificationPage ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), v5 (copy), v1 (copy)
    local v7 = l_useDispatch_0();
    v4.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v7 (copy), v5 (ref)
        return function() --[[ Line: 14 ]]
            -- upvalues: v7 (ref), v5 (ref)
            v7(v5());
        end;
    end, {});
    return v4.createElement(v1, {
        isVisible = true, 
        url = v6.url
    });
end;