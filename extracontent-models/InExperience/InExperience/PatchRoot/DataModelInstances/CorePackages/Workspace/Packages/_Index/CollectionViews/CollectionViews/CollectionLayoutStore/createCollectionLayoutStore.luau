local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Display);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v5 = require(script.Parent.CollectionBreakpointConfig);
local l_resolveBreakpoint_0 = v5.resolveBreakpoint;
local l_getItemsPerRow_0 = v5.getItemsPerRow;
local l_FFlagSduiCarouselHoverFixes_0 = require(l_Parent_0.SharedFlags).FFlagSduiCarouselHoverFixes;
return function(v9, v10) --[[ Line: 27 ]] --[[ Name: createCollectionLayoutStore ]]
    -- upvalues: v3 (copy), l_FFlagSduiCarouselHoverFixes_0 (copy), v2 (copy), l_resolveBreakpoint_0 (copy), l_CollectionItemSize_0 (copy), l_getItemsPerRow_0 (copy)
    local l_getPlatformScale_0 = v3.GetDisplayStore(false).getPlatformScale;
    local v12 = nil;
    local v13 = nil;
    if l_FFlagSduiCarouselHoverFixes_0 then
        v12 = v2.createComputed(function(v14) --[[ Line: 37 ]]
            -- upvalues: v9 (copy)
            return v9(v14) > 0;
        end);
        v13 = if v10 then v2.createComputed(function(v15) --[[ Line: 42 ]]
            -- upvalues: v9 (copy), v10 (copy)
            local v16 = v9(v15);
            if v16 > 0 then
                return v16;
            else
                return v10.getContainerWidth(v15);
            end;
        end) else v9;
    else
        v13 = v9;
    end;
    local v18 = v2.createComputed(function(v17) --[[ Line: 54 ]]
        -- upvalues: v13 (ref), l_getPlatformScale_0 (copy)
        return v13(v17) / l_getPlatformScale_0(v17);
    end);
    local v20 = v2.createComputed(function(v19) --[[ Line: 58 ]]
        -- upvalues: l_resolveBreakpoint_0 (ref), v18 (copy)
        return l_resolveBreakpoint_0(v18(v19));
    end);
    local v21 = {
        l_CollectionItemSize_0.XSmall, 
        l_CollectionItemSize_0.Small, 
        l_CollectionItemSize_0.Medium, 
        l_CollectionItemSize_0.Large, 
        l_CollectionItemSize_0.XLarge
    };
    local v22 = {};
    for _, v24 in v21 do
        v22[v24] = v2.createComputed(function(v25) --[[ Line: 72 ]]
            -- upvalues: l_getItemsPerRow_0 (ref), v20 (copy), v24 (copy)
            return l_getItemsPerRow_0(v20(v25), v24);
        end);
    end;
    local v30 = v2.createComputed(function(v26) --[[ Line: 78 ]]
        -- upvalues: v22 (copy)
        local v27 = {};
        for v28, v29 in v22 do
            v27[v28] = v29(v26);
        end;
        return v27;
    end);
    return {
        getContainerWidth = v13, 
        getDesignSpaceContainerWidth = v18, 
        getItemsPerRow = v22, 
        getNumItemsForAllCategories = v30, 
        getIsContainerMeasured = if l_FFlagSduiCarouselHoverFixes_0 then v12 else nil
    };
end;