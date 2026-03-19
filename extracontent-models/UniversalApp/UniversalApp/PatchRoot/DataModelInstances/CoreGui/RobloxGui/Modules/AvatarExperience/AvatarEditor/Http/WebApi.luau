local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v7 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return {
    GetAvatarData = function(v11, v12) --[[ Line: 27 ]] --[[ Name: GetAvatarData ]]
        -- upvalues: l_FFlagAXModeratedItemsFlow_0 (copy), v4 (copy)
        if l_FFlagAXModeratedItemsFlow_0 and v12 then
            local v13 = ("?%*"):format((v4:makeQueryString(v12)));
            return v11(("%*/v2/avatar/avatar%*"):format(v4.AVATAR_URL, v13), "GET");
        else
            return v11(string.format("%s/v2/avatar/avatar", v4.AVATAR_URL), "GET");
        end;
    end, 
    GetOutfit = function(v14, v15, v16) --[[ Line: 38 ]] --[[ Name: GetOutfit ]]
        -- upvalues: l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v4 (copy)
        if (l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0) and v16 then
            local v17 = ("?%*"):format((v4:makeQueryString(v16)));
            return v14(("%*/v3/outfits/%*/details%*"):format(v4.AVATAR_URL, v15, v17), "GET");
        else
            return v14(string.format("%s/v3/outfits/%s/details", v4.AVATAR_URL, v15), "GET");
        end;
    end, 
    GetRecommendations = function(v18, v19, v20, v21) --[[ Line: 50 ]] --[[ Name: GetRecommendations ]]
        -- upvalues: v5 (copy), v4 (copy)
        local v22 = nil;
        v22 = v21 or v5.NumRecommendedItems;
        local v23 = v4:makeQueryString({
            numItems = v22, 
            details = true
        });
        local v24 = "%s/v2/recommendations/user-inventory?bundleTypeId=%s&%s";
        if v20 then
            v24 = "%s/v2/recommendations/user-inventory?assetTypeId=%s&%s";
        end;
        return v18(string.format(v24, v4.CATALOG_URL, v19, v23), "GET");
    end, 
    GetMySharedAvatars = function(v25, v26, v27) --[[ Line: 71 ]] --[[ Name: GetMySharedAvatars ]]
        -- upvalues: v4 (copy)
        return v25(string.format("%s/look-api/v1/users/%s/looks?limit=50&cursor=%s", v4.APIS_URL, v26, v27 or ""), "GET");
    end, 
    GetRemoteUpranked = function(v28, v29, v30) --[[ Line: 77 ]] --[[ Name: GetRemoteUpranked ]]
        -- upvalues: v4 (copy)
        local v31 = v4:makeQueryString({
            unsavedItems = v30
        });
        return v28(("%*v1/users/%*/currently-wearing-outfits?%*"):format(v4.AVATAR_URL, v29, v31), "GET");
    end, 
    GetUserAvatarInventory = function(v32, v33, v34, v35, v36) --[[ Line: 87 ]] --[[ Name: GetUserAvatarInventory ]]
        -- upvalues: v7 (copy), v4 (copy)
        if v7() then
            local v37 = {
                pageLimit = v35, 
                sortOption = v34, 
                pageToken = v36
            };
            for v38, v39 in v33 do
                local v40 = v38 - 1;
                v37[("itemCategories[%*].itemType"):format(v40)] = v39.itemType;
                v37[("itemCategories[%*].itemSubType"):format(v40)] = tostring(v39.itemSubType);
            end;
            return v32(("%*v1/avatar-inventory?%*"):format(v4.AVATAR_URL, (v4:makeQueryString(v37))), "GET");
        else
            local v41 = "";
            for v42, v43 in v33 do
                local v44 = v42 - 1;
                v41 = v41 .. ("&itemCategories[%*].itemType=%*"):format(v44, v43.itemType) .. ("&itemCategories[%*].itemSubType=%*"):format(v44, v43.itemSubType);
            end;
            return v32(("%*v1/avatar-inventory?pageLimit=%*&sortOption=%*&pageToken=%*%*"):format(v4.AVATAR_URL, v35, v34, v36, v41), "GET");
        end;
    end, 
    GetPreviewLook = function(v45, v46) --[[ Line: 127 ]] --[[ Name: GetPreviewLook ]]
        -- upvalues: v4 (copy), l_HttpService_0 (copy)
        return v45(string.format("%slook-api/v1/looks/preview", v4.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                assets = v46
            })
        });
    end, 
    CreateLook = function(v47, v48, v49) --[[ Line: 134 ]] --[[ Name: CreateLook ]]
        -- upvalues: v4 (copy), l_HttpService_0 (copy)
        return v47(string.format("%slook-api/v1/looks/create", v4.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                assets = v48, 
                name = v49.name, 
                description = v49.description, 
                displayProperties = v49.displayProperties, 
                avatarProperties = v49.avatarProperties
            })
        });
    end
};