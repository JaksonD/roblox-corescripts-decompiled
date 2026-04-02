local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v5.FFlagAXInventoryDurablesExpiredFilter;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return {
    GetAvatarData = function(v13, v14) --[[ Line: 29 ]] --[[ Name: GetAvatarData ]]
        -- upvalues: l_FFlagAXModeratedItemsFlow_0 (copy), v4 (copy)
        if l_FFlagAXModeratedItemsFlow_0 and v14 then
            local v15 = ("?%*"):format((v4:makeQueryString(v14)));
            return v13(("%*/v2/avatar/avatar%*"):format(v4.AVATAR_URL, v15), "GET");
        else
            return v13(string.format("%s/v2/avatar/avatar", v4.AVATAR_URL), "GET");
        end;
    end, 
    GetOutfit = function(v16, v17, v18) --[[ Line: 40 ]] --[[ Name: GetOutfit ]]
        -- upvalues: l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v4 (copy)
        if (l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0) and v18 then
            local v19 = ("?%*"):format((v4:makeQueryString(v18)));
            return v16(("%*/v3/outfits/%*/details%*"):format(v4.AVATAR_URL, v17, v19), "GET");
        else
            return v16(string.format("%s/v3/outfits/%s/details", v4.AVATAR_URL, v17), "GET");
        end;
    end, 
    GetRecommendations = function(v20, v21, v22, v23) --[[ Line: 52 ]] --[[ Name: GetRecommendations ]]
        -- upvalues: v6 (copy), v4 (copy)
        local v24 = nil;
        v24 = v23 or v6.NumRecommendedItems;
        local v25 = v4:makeQueryString({
            numItems = v24, 
            details = true
        });
        local v26 = "%s/v2/recommendations/user-inventory?bundleTypeId=%s&%s";
        if v22 then
            v26 = "%s/v2/recommendations/user-inventory?assetTypeId=%s&%s";
        end;
        return v20(string.format(v26, v4.CATALOG_URL, v21, v25), "GET");
    end, 
    GetMySharedAvatars = function(v27, v28, v29) --[[ Line: 73 ]] --[[ Name: GetMySharedAvatars ]]
        -- upvalues: v4 (copy)
        return v27(string.format("%s/look-api/v1/users/%s/looks?limit=50&cursor=%s", v4.APIS_URL, v28, v29 or ""), "GET");
    end, 
    GetRemoteUpranked = function(v30, v31, v32) --[[ Line: 79 ]] --[[ Name: GetRemoteUpranked ]]
        -- upvalues: v4 (copy)
        local v33 = v4:makeQueryString({
            unsavedItems = v32
        });
        return v30(("%*v1/users/%*/currently-wearing-outfits?%*"):format(v4.AVATAR_URL, v31, v33), "GET");
    end, 
    GetUserAvatarInventory = function(v34, v35, v36, v37, v38, v39) --[[ Line: 89 ]] --[[ Name: GetUserAvatarInventory ]]
        -- upvalues: v8 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v4 (copy)
        if v8() then
            local v40 = {
                pageLimit = v37, 
                sortOption = v36, 
                pageToken = v38, 
                availabilityStatus = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v39 else nil
            };
            for v41, v42 in v35 do
                local v43 = v41 - 1;
                v40[("itemCategories[%*].itemType"):format(v43)] = v42.itemType;
                v40[("itemCategories[%*].itemSubType"):format(v43)] = tostring(v42.itemSubType);
            end;
            return v34(("%*v1/avatar-inventory?%*"):format(v4.AVATAR_URL, (v4:makeQueryString(v40))), "GET");
        else
            local v44 = "";
            for v45, v46 in v35 do
                local v47 = v45 - 1;
                v44 = v44 .. ("&itemCategories[%*].itemType=%*"):format(v47, v46.itemType) .. ("&itemCategories[%*].itemSubType=%*"):format(v47, v46.itemSubType);
            end;
            local v48 = nil;
            if l_FFlagAXInventoryDurablesExpiredFilter_0 then
                local v49 = if v39 then ("&availabilityStatus=%*"):format(v39) else "";
                v48 = ("%*v1/avatar-inventory?pageLimit=%*&sortOption=%*&pageToken=%*%*%*"):format(v4.AVATAR_URL, v37, v36, v38, v44, v49);
            else
                v48 = ("%*v1/avatar-inventory?pageLimit=%*&sortOption=%*&pageToken=%*%*"):format(v4.AVATAR_URL, v37, v36, v38, v44);
            end;
            return v34(v48, "GET");
        end;
    end, 
    GetPreviewLook = function(v50, v51) --[[ Line: 139 ]] --[[ Name: GetPreviewLook ]]
        -- upvalues: v4 (copy), l_HttpService_0 (copy)
        return v50(string.format("%slook-api/v1/looks/preview", v4.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                assets = v51
            })
        });
    end, 
    CreateLook = function(v52, v53, v54) --[[ Line: 146 ]] --[[ Name: CreateLook ]]
        -- upvalues: v4 (copy), l_HttpService_0 (copy)
        return v52(string.format("%slook-api/v1/looks/create", v4.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                assets = v53, 
                name = v54.name, 
                description = v54.description, 
                displayProperties = v54.displayProperties, 
                avatarProperties = v54.avatarProperties
            })
        });
    end
};