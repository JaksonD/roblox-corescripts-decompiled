local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_Parent_0.AppComposition);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v7 = require(l_script_FirstAncestor_0.CollectionLayoutStore.CollectionLayoutStoreContext);
local v8 = require(l_script_FirstAncestor_0.CollectionLayoutStore.getItemsPerRow);
local v9 = require(l_script_FirstAncestor_0.CollectionLayoutStore.getMainCollectionLayoutStore);
return function(v10) --[[ Line: 25 ]] --[[ Name: useCollectionLayout ]]
    -- upvalues: v2 (copy), l_CollectionItemSize_0 (copy), v5 (copy), v3 (copy), v7 (copy), v9 (copy), v4 (copy), v8 (copy)
    local v11 = v2.Hooks.useTokens();
    local v12 = v10 or l_CollectionItemSize_0.Small;
    local v13 = v5.useCompositionLayout();
    local v14 = v3.useContext(v7) or v9(false);
    local v15 = v4.useSignalState(v14.getCollectionItemBreakpoint);
    return v3.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v13 (copy), v11 (copy), v8 (ref), v15 (copy), v12 (copy), v14 (copy)
        return {
            margin = v13.margin, 
            gutter = v13.gutter, 
            carouselPeek = v13.carouselPeek, 
            verticalGap = v11.Gap.Large, 
            itemsPerRow = v8(v15, v12), 
            getContainerWidth = v14.getContainerWidth, 
            getDesignSpaceContainerWidth = v14.getDesignSpaceContainerWidth
        };
    end, {
        v13, 
        v15, 
        v11, 
        v12, 
        v14
    });
end;