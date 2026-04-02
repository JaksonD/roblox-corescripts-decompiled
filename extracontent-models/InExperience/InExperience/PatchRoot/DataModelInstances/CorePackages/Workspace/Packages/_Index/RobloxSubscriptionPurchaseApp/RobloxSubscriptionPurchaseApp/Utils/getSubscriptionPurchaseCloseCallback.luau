local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_game_EngineFeature_0 = game:GetEngineFeature("ReadHasRobloxSubscriptionLua");
local l_game_EngineFeature_1 = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished");
return function() --[[ Line: 8 ]] --[[ Name: getSubscriptionPurchaseCloseCallback ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_Players_0 (copy), l_game_EngineFeature_1 (copy), l_MarketplaceService_0 (copy)
    local v4 = false;
    if l_game_EngineFeature_0 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
            -- upvalues: l_Players_0 (ref)
            return l_Players_0.LocalPlayer.HasRobloxSubscription;
        end);
        v4 = l_status_0 and l_result_0 == true;
    end;
    if not v4 and l_game_EngineFeature_1 then
        return function() --[[ Line: 18 ]]
            -- upvalues: l_MarketplaceService_0 (ref)
            l_MarketplaceService_0:signalPromptRobloxSubscriptionPurchaseFinished(" ", true);
        end;
    else
        return nil;
    end;
end;