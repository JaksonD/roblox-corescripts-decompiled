local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(l_script_FirstAncestor_0.Models.CatalogV2SearchItemDetails);
local v6 = require(l_script_FirstAncestor_0.Utils.makeAXResponseHandler);
local v7 = require(script.Parent.normalizeCatalogV2SearchItemDetails);
local v8 = require(script.Parent.constants);
local v9 = {
    assetTypeIds = true, 
    bundleTypeIds = true
};
local l_FFlagAXCatalogV2EncodeParams_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXCatalogV2EncodeParams;
local function v17(v11) --[[ Line: 23 ]] --[[ Name: buildQueryStringWithArrayParams ]]
    -- upvalues: v9 (copy), l_FFlagAXCatalogV2EncodeParams_0 (copy), l_HttpService_0 (copy)
    local v12 = {};
    for v13, v14 in v11 do
        if v9[v13] and type(v14) == "table" then
            for _, v16 in v14 do
                if l_FFlagAXCatalogV2EncodeParams_0 then
                    table.insert(v12, (("%*=%*"):format(v13, (l_HttpService_0:UrlEncode((tostring(v16)))))));
                else
                    table.insert(v12, (("%*=%*"):format(v13, v16)));
                end;
            end;
        elseif not v9[v13] then
            if l_FFlagAXCatalogV2EncodeParams_0 then
                table.insert(v12, (("%*=%*"):format(v13, (l_HttpService_0:UrlEncode((tostring(v14)))))));
            else
                table.insert(v12, (("%*=%*"):format(v13, v14)));
            end;
        end;
    end;
    return table.concat(v12, "&");
end;
return {
    getCatalogV2SearchItemDetails = function(v18, v19) --[[ Line: 49 ]] --[[ Name: getCatalogV2SearchItemDetails ]]
        -- upvalues: v17 (copy), l_Url_0 (copy), v6 (copy), v7 (copy), v8 (copy)
        local v20 = v17(v19);
        local v21, v22 = v18(("%*v2/search/items/details?%*"):format(l_Url_0.CATALOG_URL, v20), "GET");
        return v6(v21, v7, {
            modelMismatchCounter = v8.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_MODEL_MISMATCH_COUNTER_NAME, 
            latencyCounter = v8.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_LATENCY_COUNTER_NAME
        }), v22;
    end, 
    buildQueryStringWithArrayParams = v17
};