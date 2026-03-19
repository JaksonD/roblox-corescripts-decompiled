local _ = require(script.Parent.AXPagesTypes);
local v1 = require(script.Parent.AXPagesImpl);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_getCatalogV2SearchItemDetails_0 = require(script.Parent.Parent.getCatalogV2SearchItemDetails).getCatalogV2SearchItemDetails;
local _ = require(l_script_FirstAncestor_0.Models.CatalogV2SearchItemDetails);
local function v13(v7, v8, v9) --[[ Line: 21 ]] --[[ Name: fetchNextPage ]]
    -- upvalues: l_getCatalogV2SearchItemDetails_0 (copy)
    if v9 and v9 ~= "" then
        v8.cursor = v9;
    end;
    local v10, _ = l_getCatalogV2SearchItemDetails_0(v7, v8);
    local v12 = v10:expect();
    return {
        data = v12 and v12.data or {}, 
        nextPageCursor = v12 and v12.nextPageCursor or nil
    };
end;
return {
    new = function(v14, v15, v16, v17) --[[ Line: 42 ]] --[[ Name: new ]]
        -- upvalues: v13 (copy), v1 (copy)
        local function v19(v18) --[[ Line: 49 ]] --[[ Name: fetchNextPageWithContext ]]
            -- upvalues: v13 (ref), v14 (copy), v15 (copy)
            return (v13(v14, v15, v18));
        end;
        return v1.new(v16, v17, v19);
    end
};