local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore);
local v1 = require(script.Parent.Parent.Stores.createSortAndFiltersStore);
return function() --[[ Line: 19 ]] --[[ Name: createAvatarEditorStores ]]
    -- upvalues: v1 (copy)
    return {
        categoryInventoryStores = {}, 
        sortAndFiltersStore = v1()
    };
end;