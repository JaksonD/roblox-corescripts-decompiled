local l_AdService_0 = game:GetService("AdService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v5 = require(l_CorePackages_0.Packages.Promise);
local v6 = require(l_CorePackages_0.Packages.Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local l_game_EngineFeature_0 = game:GetEngineFeature("TeleportHistoryButtons");
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local v12 = false;
local v13 = 0;
local l_l_AdService_0_AdTeleportInfo_0, v15 = l_AdService_0:GetAdTeleportInfo();
if l_l_AdService_0_AdTeleportInfo_0 > 0 and (v15 == 0 or v15 == game.GameId) then
    v13 = l_l_AdService_0_AdTeleportInfo_0;
    if l_game_EngineFeature_0 then
        v12 = true;
    end;
end;
if l_game_EngineFeature_0 and v13 == 0 then
    local l_l_TeleportService_0_ThirdPartyTeleportInfo_0, _ = l_TeleportService_0:GetThirdPartyTeleportInfo(false);
    if l_l_TeleportService_0_ThirdPartyTeleportInfo_0 > 0 then
        v13 = l_l_TeleportService_0_ThirdPartyTeleportInfo_0;
    end;
    v12 = false;
end;
local function _(v18, v19) --[[ Line: 37 ]] --[[ Name: truncateWithEllipsis ]]
    if v19 < #v18 then
        return string.sub(v18, 1, v19 - 3) .. "...";
    else
        return v18;
    end;
end;
local v21 = nil;
local v25 = v5.defer(function(v22) --[[ Line: 46 ]]
    -- upvalues: v13 (ref), l_GetGameNameAndDescription_0 (copy), v8 (copy), v21 (ref), l_game_EngineFeature_0 (copy)
    if v13 > 0 then
        l_GetGameNameAndDescription_0(v8, v13):andThen(function(v23) --[[ Line: 48 ]]
            -- upvalues: v21 (ref), l_game_EngineFeature_0 (ref)
            v21 = v23.Name;
            if l_game_EngineFeature_0 then
                local l_Name_0 = v23.Name;
                v21 = if #l_Name_0 > 30 then string.sub(l_Name_0, 1, 27) .. "..." else l_Name_0;
            end;
        end):await();
        v22();
        return;
    else
        v22();
        return;
    end;
end);
local v26 = {
    getTooltipText = function() --[[ Line: 62 ]]
        -- upvalues: v21 (ref), v10 (copy)
        if v21 == nil then
            return v10:FormatByKey("InGame.CommonUI.Label.ReturnFallback");
        else
            return v10:FormatByKey("InGame.CommonUI.Label.ReturnTo", {
                placeName = v21
            });
        end;
    end
};
v26.getTooltipTextTimeout = function() --[[ Line: 72 ]]
    -- upvalues: v21 (ref), v5 (copy), v25 (copy), v26 (copy)
    if v21 == nil then
        v5.any({
            v25, 
            v5.delay(1)
        }):await();
    end;
    return v26.getTooltipText();
end;
v26.getMenuText = function() --[[ Line: 79 ]]
    -- upvalues: v6 (copy), v26 (copy), v21 (ref), v25 (copy)
    local v27, v28 = v6.createBinding(v26.getTooltipText());
    if v21 == nil then
        pcall(function() --[[ Line: 82 ]]
            -- upvalues: v25 (ref), v28 (copy), v26 (ref)
            v25:andThen(function() --[[ Line: 83 ]]
                -- upvalues: v28 (ref), v26 (ref)
                v28(v26.getTooltipText());
            end);
        end);
    end;
    return v27;
end;
v26.initiateBackButtonTeleport = function(v29) --[[ Line: 91 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v12 (ref), l_AdService_0 (copy), l_TeleportService_0 (copy)
    if l_game_EngineFeature_0 then
        if v12 then
            l_AdService_0:ReturnToPublisherExperience(v29);
        else
            l_TeleportService_0:TeleportTrustedBackForth(false);
        end;
    end;
    l_AdService_0:ReturnToPublisherExperience(v29);
end;
v26.hasReturnUniverse = function() --[[ Line: 102 ]]
    -- upvalues: v13 (ref)
    return v13 > 0;
end;
return v26;