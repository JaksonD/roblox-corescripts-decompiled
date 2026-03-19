local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.OpenPrompt);
local v6 = require(l_Parent_0.PromptType);
return function(v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), l_MarketplaceService_0 (copy), v5 (copy), v6 (copy), l_AvatarEditorService_0 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v8 (copy), l_MarketplaceService_0 (ref), v7 (copy), v5 (ref), v6 (ref), v9 (copy), l_AvatarEditorService_0 (ref)
        return v3.new(function(v11, v12) --[[ Line: 14 ]]
            -- upvalues: v8 (ref), l_MarketplaceService_0 (ref), v7 (ref), v10 (copy), v5 (ref), v6 (ref), v9 (ref), l_AvatarEditorService_0 (ref)
            local v13 = nil;
            v13 = if v8 == Enum.AvatarItemType.Asset then Enum.InfoType.Asset else Enum.InfoType.Bundle;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
                -- upvalues: l_MarketplaceService_0 (ref), v7 (ref), v13 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return l_MarketplaceService_0:GetProductInfoAsync(v7, v13);
                else
                    return l_MarketplaceService_0:GetProductInfo(v7, v13);
                end;
            end);
            if l_status_0 then
                v10:dispatch(v5(v6.SetFavorite, {
                    itemId = v7, 
                    itemName = l_result_0.Name, 
                    itemType = v8, 
                    shouldFavorite = v9
                }));
                v11();
            else
                l_AvatarEditorService_0:SignalSetFavoriteFailed();
                v12();
            end;
        end);
    end;
end;