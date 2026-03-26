local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_Parent_0.AppComposition);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v7 = require(l_script_FirstAncestor_0.CollectionLayoutStore.CollectionLayoutStoreContext);
local v8 = require(l_script_FirstAncestor_0.CollectionLayoutStore.getMainCollectionLayoutStore);
return function(v9) --[[ Line: 23 ]] --[[ Name: useCollectionLayout ]]
    -- upvalues: v2 (copy), l_CollectionItemSize_0 (copy), v5 (copy), v3 (copy), v7 (copy), v8 (copy), v4 (copy)
    local v10 = v2.Hooks.useTokens();
    local v11 = v9 or l_CollectionItemSize_0.Small;
    local v12 = v5.useCompositionLayout();
    local v13 = v3.useContext(v7) or v8(false);
    local v14 = v4.useSignalState(v13.getItemsPerRow[v11]);
    return v3.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v10 (copy), v14 (copy), v13 (copy)
        return {
            margin = v12.margin, 
            gutter = v12.gutter, 
            carouselPeek = v12.carouselPeek, 
            verticalGap = v10.Gap.Large, 
            itemsPerRow = v14, 
            getContainerWidth = v13.getContainerWidth, 
            getDesignSpaceContainerWidth = v13.getDesignSpaceContainerWidth
        };
    end, {
        v12, 
        v14, 
        v10, 
        v13
    });
end;