local l_TeleportService_0 = game:GetService("TeleportService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_CorePackages_0.Packages.Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local l_game_EngineFeature_0 = game:GetEngineFeature("TeleportHistoryButtons");
local v11 = 0;
local v12 = 0;
local v13 = 0;
if l_game_EngineFeature_0 then
    local l_l_TeleportService_0_ThirdPartyTeleportInfo_0, v15 = l_TeleportService_0:GetThirdPartyTeleportInfo(true);
    v12 = l_l_TeleportService_0_ThirdPartyTeleportInfo_0;
    v13 = v15;
end;
if l_game_EngineFeature_0 and v12 > 0 then
    v11 = v12;
end;
local function _(v16, v17) --[[ Line: 30 ]] --[[ Name: truncateWithEllipsis ]]
    if v17 < #v16 then
        return string.sub(v16, 1, v17 - 3) .. "...";
    else
        return v16;
    end;
end;
local v19 = nil;
local v23 = v4.defer(function(v20) --[[ Line: 39 ]]
    -- upvalues: v11 (ref), l_GetGameNameAndDescription_0 (copy), v7 (copy), v19 (ref)
    if v11 > 0 then
        l_GetGameNameAndDescription_0(v7, v11):andThen(function(v21) --[[ Line: 41 ]]
            -- upvalues: v19 (ref)
            local l_Name_0 = v21.Name;
            v19 = if #l_Name_0 > 30 then string.sub(l_Name_0, 1, 27) .. "..." else l_Name_0;
        end):await();
        v20();
        return;
    else
        v20();
        return;
    end;
end);
local v24 = {
    getTooltipText = function() --[[ Line: 51 ]]
        -- upvalues: v19 (ref), v8 (copy)
        if v19 == nil then
            return v8:FormatByKey("InGame.CommonUI.Label.ReturnFallback");
        else
            return v8:FormatByKey("InGame.CommonUI.Label.ReturnTo", {
                placeName = v19
            });
        end;
    end
};
v24.getTooltipTextTimeout = function() --[[ Line: 61 ]]
    -- upvalues: v19 (ref), v4 (copy), v23 (copy), v24 (copy)
    if v19 == nil then
        v4.any({
            v23, 
            v4.delay(1)
        }):await();
    end;
    return v24.getTooltipText();
end;
v24.getMenuText = function() --[[ Line: 67 ]]
    -- upvalues: v5 (copy), v24 (copy), v19 (ref), v23 (copy)
    local v25, v26 = v5.createBinding(v24.getTooltipText());
    if v19 == nil then
        pcall(function() --[[ Line: 70 ]]
            -- upvalues: v23 (ref), v26 (copy), v24 (ref)
            v23:andThen(function() --[[ Line: 71 ]]
                -- upvalues: v26 (ref), v24 (ref)
                v26(v24.getTooltipText());
            end);
        end);
    end;
    return v25;
end;
v24.initiateFrontButtonTeleport = function() --[[ Line: 78 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_TeleportService_0 (copy)
    if l_game_EngineFeature_0 then
        l_TeleportService_0:TeleportTrustedBackForth(true);
    end;
end;
v24.hasReturnUniverse = function() --[[ Line: 83 ]]
    -- upvalues: v11 (ref)
    return v11 > 0;
end;
return v24;