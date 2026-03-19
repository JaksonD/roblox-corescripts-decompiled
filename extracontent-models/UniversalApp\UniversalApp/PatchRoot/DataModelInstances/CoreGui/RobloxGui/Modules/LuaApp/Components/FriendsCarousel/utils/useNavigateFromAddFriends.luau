local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ContactImporter_0 = l_Modules_0.LuaApp.Components.ContactImporter;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local l_useContactImporterConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.useContactImporterConfiguration;
local v6 = require(l_ContactImporter_0.useNavigateToContactImporter);
return function(v7) --[[ Line: 11 ]]
    -- upvalues: v6 (copy), l_useContactImporterConfiguration_0 (copy), l_useDispatch_0 (copy), v4 (copy)
    local v8 = v6();
    local v9 = l_useContactImporterConfiguration_0(v7);
    local v10 = l_useDispatch_0();
    local function _() --[[ Line: 15 ]]
        -- upvalues: v10 (copy), v4 (ref)
        v10(v4());
    end;
    return function() --[[ Line: 19 ]]
        -- upvalues: v9 (copy), v8 (copy), v10 (copy), v4 (ref)
        if v9.shouldShowContactImporterModal then
            v8();
            return;
        else
            v10(v4());
            return;
        end;
    end;
end;