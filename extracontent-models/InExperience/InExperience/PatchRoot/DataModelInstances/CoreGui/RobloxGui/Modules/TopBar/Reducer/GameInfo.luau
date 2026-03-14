local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.SetGameName);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateGameInfoRodux) then
    return nil;
else
    return v1.createReducer({
        name = v2:FormatByKey("CoreScripts.TopBar.GameNamePlaceHolder")
    }, {
        [v4.name] = function(_, v7) --[[ Line: 22 ]]
            return {
                name = v7.gameName
            };
        end
    });
end;