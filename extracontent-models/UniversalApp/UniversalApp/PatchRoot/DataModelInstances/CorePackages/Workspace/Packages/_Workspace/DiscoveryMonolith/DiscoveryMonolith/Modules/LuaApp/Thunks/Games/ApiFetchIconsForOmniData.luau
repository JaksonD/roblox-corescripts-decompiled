local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local l_Constants_0 = require(l_Parent_0.UserLib).Utils.Constants;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiPreloadContentProviderThumbnail);
local function _(v7) --[[ Line: 14 ]]
    -- upvalues: l_OmniRecommendationsContentType_0 (copy), l_Constants_0 (copy)
    if v7 == l_OmniRecommendationsContentType_0.CatalogAsset then
        return l_Constants_0.RbxthumbTypes.Asset;
    elseif v7 == l_OmniRecommendationsContentType_0.CatalogBundle then
        return l_Constants_0.RbxthumbTypes.BundleThumbnail;
    else
        return nil;
    end;
end;
return function(_, v10) --[[ Line: 24 ]]
    -- upvalues: l_OmniRecommendationsContentType_0 (copy), l_Constants_0 (copy), v6 (copy), l_PromiseUtilities_0 (copy)
    return function(v11) --[[ Line: 25 ]]
        -- upvalues: v10 (copy), l_OmniRecommendationsContentType_0 (ref), l_Constants_0 (ref), v6 (ref), l_PromiseUtilities_0 (ref)
        local v12 = {};
        for v13, v14 in pairs(v10) do
            local v15 = {};
            for v16, _ in pairs(v14) do
                table.insert(v15, v16);
            end;
            local v18 = if v13 == l_OmniRecommendationsContentType_0.CatalogAsset then l_Constants_0.RbxthumbTypes.Asset else if v13 == l_OmniRecommendationsContentType_0.CatalogBundle then l_Constants_0.RbxthumbTypes.BundleThumbnail else nil;
            if v18 then
                table.insert(v12, v11:dispatch(v6(v15, v18, 150)));
            end;
        end;
        return l_PromiseUtilities_0.Batch(v12);
    end;
end;