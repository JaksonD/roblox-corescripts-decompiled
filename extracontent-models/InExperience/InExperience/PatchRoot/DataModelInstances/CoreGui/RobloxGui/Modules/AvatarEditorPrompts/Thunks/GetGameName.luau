local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Actions.GameNameFetched);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
return function(v9) --[[ Line: 20 ]]
    -- upvalues: v4 (copy), l_GetGameNameAndDescription_0 (copy), v5 (copy), v7 (copy)
    if game.GameId == 0 then
        return v4.resolve();
    else
        return l_GetGameNameAndDescription_0(v5, game.GameId):andThen(function(v10) --[[ Line: 25 ]]
            -- upvalues: v9 (copy), v7 (ref)
            v9:dispatch(v7(v10.Name));
            return v10.Name;
        end, function() --[[ Line: 29 ]]
            -- upvalues: v4 (ref)
            warn("Unable to get game name for Avatar Editor Prompts");
            return v4.reject();
        end);
    end;
end;