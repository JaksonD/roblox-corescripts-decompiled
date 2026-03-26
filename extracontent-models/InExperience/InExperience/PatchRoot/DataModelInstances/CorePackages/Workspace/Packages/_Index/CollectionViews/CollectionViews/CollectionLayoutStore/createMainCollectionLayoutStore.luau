local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Display);
local v3 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
local v5 = require(script.Parent.createCollectionLayoutStore);
return function() --[[ Line: 17 ]] --[[ Name: createMainCollectionLayoutStore ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy)
    local v6 = v2.GetDisplayStore(false);
    local v7, v8 = v3.createSignal(nil);
    local v11 = v3.createComputed(function(v9) --[[ Line: 22 ]]
        -- upvalues: v7 (copy), v6 (copy)
        local v10 = v7(v9);
        if v10 then
            return v10;
        else
            return v6.getViewportSize(v9).X;
        end;
    end);
    local v12 = v5(v11);
    return {
        getContainerWidth = v12.getContainerWidth, 
        getDesignSpaceContainerWidth = v12.getDesignSpaceContainerWidth, 
        getItemsPerRow = v12.getItemsPerRow, 
        getNumItemsForAllCategories = v12.getNumItemsForAllCategories, 
        setDefaultContentRegionWidth = v8
    };
end;