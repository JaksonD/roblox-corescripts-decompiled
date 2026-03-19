local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 = require(l_Parent_0.SharedFlags).FFlagAddItemHeightModeToSduiCollectionCarousel;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v6) --[[ Line: 38 ]] --[[ Name: SduiCollectionItem ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v1 (copy), l_ImpressionsTagUtility_0 (copy), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (copy), v2 (copy)
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    if l_FFlagSduiServerCompat_0 then
        v7 = v6.layoutOrder;
        v8 = v6.size;
        v9 = v6.position;
        v10 = v6.anchorPoint;
        v11 = v6.zIndex;
        v12 = v6.automaticSize;
    else
        v7 = v6.LayoutOrder;
        v8 = v6.Size;
        v9 = v6.Position;
        v10 = v6.AnchorPoint;
        v11 = v6.ZIndex;
        v12 = v6.AutomaticSize;
    end;
    local v13 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v13 (copy), v6 (copy)
        l_ImpressionsTagUtility_0.AddTag(v13, v6.impressionsTag, v6.index);
        return function() --[[ Line: 64 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v13 (ref), v6 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v13, v6.impressionsTag, v6.index);
        end;
    end, {
        v13, 
        v6.impressionsTag, 
        v6.index
    });
    local v15 = v1.useCallback(function(v14) --[[ Line: 69 ]]
        -- upvalues: v13 (copy), l_ImpressionsTagUtility_0 (ref), v6 (copy)
        v13.current = v14;
        if v14 then
            l_ImpressionsTagUtility_0.AddTag(v13, v6.impressionsTag, v6.index);
        end;
    end, {
        v6.impressionsTag, 
        v6.index
    });
    local v16 = nil;
    local l_children_0 = v6.children;
    if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then
        v16 = v1.useCallback(function(v18) --[[ Line: 80 ]]
            -- upvalues: v6 (copy)
            if v6.onItemSizeChanged then
                v6.onItemSizeChanged(v6.index, v18);
            end;
        end, {
            v6.onItemSizeChanged, 
            v6.index
        });
        if v6.minHeightBinding then
            l_children_0 = v2.Dictionary.join(l_children_0 or {}, {
                SizeConstraint = v1.createElement("UISizeConstraint", {
                    MinSize = v6.minHeightBinding:map(function(v19) --[[ Line: 89 ]]
                        return Vector2.new(0, if v19 and v19 > 0 then v19 else 0);
                    end)
                })
            });
        end;
    end;
    return v1.createElement("Frame", {
        ref = v15, 
        AnchorPoint = v10, 
        Position = v9, 
        Size = v8, 
        LayoutOrder = v7 or v6.index, 
        ZIndex = v11, 
        BackgroundTransparency = 1, 
        AutomaticSize = v12, 
        [v1.Change.AbsoluteSize] = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 and v6.onItemSizeChanged then v16 else nil, 
        [v1.Tag] = if v6.testId then ("data-testid=%*"):format(v6.testId) else nil
    }, l_children_0);
end);