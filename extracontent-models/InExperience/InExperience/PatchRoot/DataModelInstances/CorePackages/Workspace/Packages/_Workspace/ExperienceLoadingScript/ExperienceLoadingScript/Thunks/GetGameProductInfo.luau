local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local v2 = require(l_script_FirstAncestor_0.Actions.SetGameProductInfo);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_MarketplaceService_0 (copy), v2 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), l_MarketplaceService_0 (ref), v2 (ref)
        coroutine.wrap(function() --[[ Line: 8 ]]
            -- upvalues: v3 (ref), l_MarketplaceService_0 (ref), v4 (copy), v2 (ref)
            local l_v3_0 = v3;
            if not l_v3_0 or l_v3_0 <= 0 then
                while game.PlaceId <= 0 do
                    wait();
                end;
                l_v3_0 = game.PlaceId;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
                -- upvalues: l_MarketplaceService_0 (ref), l_v3_0 (ref), v4 (ref), v2 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    local l_l_MarketplaceService_0_ProductInfoAsync_0 = l_MarketplaceService_0:GetProductInfoAsync(l_v3_0);
                    v4:dispatch(v2(l_l_MarketplaceService_0_ProductInfoAsync_0));
                    return;
                else
                    local l_l_MarketplaceService_0_ProductInfo_0 = l_MarketplaceService_0:GetProductInfo(l_v3_0);
                    v4:dispatch(v2(l_l_MarketplaceService_0_ProductInfo_0));
                    return;
                end;
            end);
            if not l_status_0 then
                print("LoadingScreen:GetGameProductInfo: %s", l_result_0);
            end;
        end)();
    end;
end;