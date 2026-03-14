local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_ItemInfoList_0 = require(l_CorePackages_0.Workspace.Packages.ItemDetails).ItemInfoList;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
return function(v9) --[[ Line: 27 ]] --[[ Name: PublishInfoList ]]
    -- upvalues: v1 (copy), l_LocalPlayer_0 (copy), l_useLocalization_0 (copy), l_GetGameNameAndDescription_0 (copy), v6 (copy), l_ItemInfoList_0 (copy)
    local v10 = v1.useRef(false);
    assert(l_LocalPlayer_0, "LocalPlayer must not be nil");
    local l_Name_0 = l_LocalPlayer_0.Name;
    local v12, v13 = v1.useState(nil);
    local l_typeName_0 = v9.typeName;
    local l_LayoutOrder_0 = v9.LayoutOrder;
    local v16 = l_useLocalization_0({
        creatorText = "Feature.Catalog.Label.Filter.Creator", 
        attributionText = "Feature.Catalog.Label.Attribution", 
        typeText = "Feature.Catalog.Label.CategoryType"
    });
    v1.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v10 (copy), l_GetGameNameAndDescription_0 (ref), v6 (ref), v13 (copy)
        v10.current = true;
        l_GetGameNameAndDescription_0(v6, game.GameId):andThen(function(v17) --[[ Line: 45 ]]
            -- upvalues: v10 (ref), v13 (ref)
            if v10.current and v17.Name then
                v13(v17.Name);
            end;
        end);
        return function() --[[ Line: 50 ]]
            -- upvalues: v10 (ref)
            v10.current = false;
        end;
    end, {});
    return v1.createElement(l_ItemInfoList_0, {
        rowData = {
            {
                infoName = v16.creatorText, 
                infoData = l_Name_0, 
                hasVerifiedBadge = l_LocalPlayer_0.HasVerifiedBadge, 
                isLoading = l_Name_0 == nil, 
                Selectable = false
            }, 
            {
                infoName = v16.attributionText, 
                infoData = v12, 
                isLoading = v12 == nil, 
                Selectable = false
            }, 
            {
                infoName = v16.typeText, 
                infoData = l_typeName_0, 
                isLoading = l_typeName_0 == nil, 
                Selectable = false
            }
        }, 
        LayoutOrder = l_LayoutOrder_0
    });
end;