local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AccountSettingsUpsell_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).AccountSettingsUpsell;
local v6 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v7 = require(l_script_FirstAncestor_0.LuaApp.Http.UrlBuilder);
local v8 = require(l_CorePackages_0.Packages.Cryo);
return function(v9) --[[ Line: 12 ]]
    -- upvalues: l_useDispatch_0 (copy), v6 (copy), v3 (copy), v7 (copy), v8 (copy), v2 (copy), l_AccountSettingsUpsell_0 (copy)
    local v10 = l_useDispatch_0();
    local function v12(v11) --[[ Line: 14 ]]
        -- upvalues: v10 (copy), v6 (ref), v3 (ref), v7 (ref)
        v10(v6({
            name = v3.GenericWebPage, 
            detail = v7.static.settings.account(), 
            extraProps = {
                title = v11
            }
        }));
    end;
    local v13 = v8.Dictionary.join(v9 or {}, {
        openAccountSettings = v12
    });
    return v2.createElement(l_AccountSettingsUpsell_0, v13);
end;