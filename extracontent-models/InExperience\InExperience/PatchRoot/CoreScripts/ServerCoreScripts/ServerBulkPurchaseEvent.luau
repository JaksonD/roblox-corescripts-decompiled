local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local l_FFlagAXEnableInspectAndBuyBulkPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase;
local l_FIntBulkPurchaseRequestLimit_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntBulkPurchaseRequestLimit;
local l_FIntBulkPurchaseThrottleLimit_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntBulkPurchaseThrottleLimit;
local l_FFlagFilterOutShopOnlyItemsOnBulkPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFilterOutShopOnlyItemsOnBulkPurchase;
if l_FFlagAXEnableInspectAndBuyBulkPurchase_0 then
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "ServerSideBulkPurchaseEvent";
    l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    local v12 = {};
    local v13 = {
        MyExperiencesOnly = "MyExperiencesOnly", 
        ExperiencesById = "ExperiencesById", 
        ExperiencesDevApiOnly = "ExperiencesDevApiOnly"
    };
    local v14 = if l_FFlagFilterOutShopOnlyItemsOnBulkPurchase_0 then {
        ShopOnly = "ShopOnly"
    } else nil;
    local v15 = {
        Limited = "Limited", 
        LimitedUnique = "LimitedUnique", 
        Collectible = "Collectible"
    };
    local v16 = {
        Bundle = Enum.MarketplaceProductType.AvatarBundle, 
        Asset = Enum.MarketplaceProductType.AvatarAsset
    };
    local function _(v17) --[[ Line: 67 ]] --[[ Name: getBatchItemDetailsServerSide ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 68 ]]
            -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v17 (copy), l_HttpRbxApiService_0 (ref)
            local v18 = l_Url_0.CATALOG_URL .. "v1/catalog/items/details";
            local v19 = l_HttpService_0:JSONEncode({
                items = v17
            });
            local v20 = l_HttpRbxApiService_0:PostAsyncFullUrl(v18, v19, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
            return l_HttpService_0:JSONDecode(v20);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return nil;
        end;
    end;
    local function v30(v24) --[[ Line: 97 ]] --[[ Name: isLimited ]]
        -- upvalues: v15 (copy)
        local l_itemRestrictions_0 = v24.itemRestrictions;
        local v26 = l_itemRestrictions_0 and table.find(l_itemRestrictions_0, v15.Limited);
        local v27 = l_itemRestrictions_0 and table.find(l_itemRestrictions_0, v15.LimitedUnique);
        local v28 = l_itemRestrictions_0 and table.find(l_itemRestrictions_0, v15.Collectible);
        local v29 = true;
        if v26 == nil then
            v29 = true;
            if v27 == nil then
                v29 = v28 ~= nil;
            end;
        end;
        return v29;
    end;
    local function _(v31) --[[ Line: 108 ]] --[[ Name: validatePlayer ]]
        if not v31.UserId or v31.UserId <= 0 then
            return false;
        else
            return true;
        end;
    end;
    local function v34(v33) --[[ Line: 119 ]] --[[ Name: validateItem ]]
        if type(v33) ~= "table" or v33.id == nil or v33.itemType == nil or type(v33.itemType) ~= "number" or type(v33.id) ~= "number" or v33.id == 0 or v33.itemType ~= Enum.AvatarItemType.Asset.Value and v33.itemType ~= Enum.AvatarItemType.Bundle.Value then
            return false;
        else
            return true;
        end;
    end;
    local function v40(v35) --[[ Line: 137 ]] --[[ Name: validateIncomingItems ]]
        -- upvalues: l_FIntBulkPurchaseRequestLimit_0 (copy), v34 (copy)
        local v36 = {};
        if not v35 then
            return nil;
        elseif type(v35) ~= "table" then
            return nil;
        elseif #v35 > l_FIntBulkPurchaseRequestLimit_0 then
            return nil;
        else
            local v37 = 0;
            for _, v39 in v35 do
                if l_FIntBulkPurchaseRequestLimit_0 > v37 then
                    if v34(v39) then
                        table.insert(v36, {
                            id = v39.id, 
                            itemType = v39.itemType
                        });
                        v37 = v37 + 1;
                    end;
                else
                    break;
                end;
            end;
            return v36;
        end;
    end;
    local function _(v41) --[[ Line: 170 ]] --[[ Name: isThrottled ]]
        -- upvalues: v12 (copy), l_FIntBulkPurchaseThrottleLimit_0 (copy)
        local v42 = v12[v41];
        if v42 and tick() < v42 then
            return true;
        else
            v12[v41] = tick() + l_FIntBulkPurchaseThrottleLimit_0;
            return false;
        end;
    end;
    l_Players_0.PlayerRemoving:Connect(function(v44) --[[ Line: 179 ]]
        -- upvalues: v12 (copy)
        v12[v44] = nil;
    end);
    l_RemoteEvent_0.OnServerEvent:Connect(function(v45, v46) --[[ Line: 183 ]]
        -- upvalues: v12 (copy), l_FIntBulkPurchaseThrottleLimit_0 (copy), v40 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), v13 (copy), v30 (copy), l_FFlagFilterOutShopOnlyItemsOnBulkPurchase_0 (copy), v14 (copy), v16 (copy), l_MarketplaceService_0 (copy)
        if not if v45.UserId then v45.UserId > 0 else false then
            return;
        else
            local v47 = v12[v45];
            local v48;
            if v47 and tick() < v47 then
                v48 = true;
            else
                v12[v45] = tick() + l_FIntBulkPurchaseThrottleLimit_0;
                v48 = false;
            end;
            if v48 then
                return;
            else
                v48 = v40(v46);
                if v48 == nil or #v48 == 0 then
                    return;
                else
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 68 ]]
                        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v48 (copy), l_HttpRbxApiService_0 (ref)
                        local v49 = l_Url_0.CATALOG_URL .. "v1/catalog/items/details";
                        local v50 = l_HttpService_0:JSONEncode({
                            items = v48
                        });
                        local v51 = l_HttpRbxApiService_0:PostAsyncFullUrl(v49, v50, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
                        return l_HttpService_0:JSONDecode(v51);
                    end);
                    v47 = if l_status_1 then l_result_1 else nil;
                    l_status_1 = {};
                    if v47 ~= nil then
                        for _, v55 in v47.data do
                            if (v55.saleLocationType ~= v13.MyExperiencesOnly and v55.saleLocationType ~= v13.ExperiencesById and v55.saleLocationType ~= v13.ExperiencesDevApiOnly or v55.unitsAvailableForConsumption == 0 and v30(v55)) and (not l_FFlagFilterOutShopOnlyItemsOnBulkPurchase_0 or not v14 or v55.saleLocationType ~= v14.ShopOnly or v55.unitsAvailableForConsumption == 0 and v30(v55)) then
                                table.insert(l_status_1, {
                                    Id = tostring(v55.id), 
                                    Type = v16[v55.itemType]
                                });
                            end;
                        end;
                    end;
                    if #l_status_1 > 0 then
                        l_MarketplaceService_0:PromptBulkPurchase(v45, l_status_1, {});
                    end;
                    return;
                end;
            end;
        end;
    end);
end;