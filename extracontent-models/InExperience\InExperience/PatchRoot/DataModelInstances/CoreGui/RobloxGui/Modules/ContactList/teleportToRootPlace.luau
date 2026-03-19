local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_GamesMultigetPlaceDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
return function() --[[ Line: 14 ]]
    -- upvalues: l_GamesMultigetPlaceDetails_0 (copy), v5 (copy), l_TeleportService_0 (copy)
    if game.PlaceId ~= 0 then
        l_GamesMultigetPlaceDetails_0(v5, game.PlaceId):andThen(function(v6) --[[ Line: 16 ]]
            -- upvalues: l_TeleportService_0 (ref)
            local l_universeRootPlaceId_0 = v6.responseBody[1].universeRootPlaceId;
            l_TeleportService_0:Teleport(l_universeRootPlaceId_0);
        end, function() --[[ Line: 19 ]]

        end);
    end;
end;