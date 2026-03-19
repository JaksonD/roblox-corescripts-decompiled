local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AvatarExperienceCommon);
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.Utils.makeAXResponseHandler);
local v6 = require(script.Parent.normalizeCatalogCategories);
local v7 = require(script.Parent.constants);
return {
    getCatalogCategories = function(v8, v9) --[[ Line: 15 ]] --[[ Name: getCatalogCategories ]]
        -- upvalues: l_Url_0 (copy), v5 (copy), v6 (copy), v7 (copy)
        local v10 = l_Url_0:makeQueryString({
            versionId = v9
        });
        local v11, v12 = v8(("%*marketplace-widgets/v1/pills?%*"):format(l_Url_0.APIS_URL, v10), "GET");
        return v5(v11, v6, {
            modelMismatchCounter = v7.FETCH_CATALOG_CATEGORIES_MODEL_MISMATCH_COUNTER_NAME, 
            latencyCounter = v7.FETCH_CATALOG_CATEGORIES_LATENCY_COUNTER_NAME
        }), v12;
    end
};