local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_FFlagCollectionViewMathChanges_0 = require(l_Parent_0.SharedFlags).FFlagCollectionViewMathChanges;
local _ = require(l_script_FirstAncestor_0.Carousel.calculateCarouselSpacingMetrics);
return function(v5, v6, v7, v8, v9, v10) --[[ Line: 14 ]] --[[ Name: useHorizontalWindowStartIndex ]]
    -- upvalues: v2 (copy), l_FFlagCollectionViewMathChanges_0 (copy)
    local v11, v12 = v2.useState(1);
    local v15 = v2.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v8 (copy), v5 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v9 (copy), v10 (copy), v6 (copy), v7 (copy), v12 (copy)
        if v8 then
            if v5.current ~= nil and (not l_FFlagCollectionViewMathChanges_0 or v9 > 0) then
                local l_X_0 = v5.current.CanvasPosition.X;
                local v14 = nil;
                v14 = if l_FFlagCollectionViewMathChanges_0 then v10:getValue().stride else v6:getValue().X + v7;
                if v14 > 0 then
                    v12((math.max(1, (math.floor(l_X_0 / v14)))));
                    return;
                else
                    v12(1);
                    return;
                end;
            end;
        else
            v12(1);
        end;
    end, {
        v8, 
        v5, 
        if l_FFlagCollectionViewMathChanges_0 then v10 else v6, 
        if l_FFlagCollectionViewMathChanges_0 then v9 else v7
    });
    v2.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy)
        v15();
    end, {
        v15
    });
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v8 (copy), v5 (copy), v15 (copy)
        if not v8 then
            return nil;
        else
            local v16 = {};
            if v5.current ~= nil then
                v15();
                table.insert(v16, v5.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v15));
                table.insert(v16, v5.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v15));
            end;
            return function() --[[ Line: 80 ]]
                -- upvalues: v16 (copy)
                for _, v18 in v16 do
                    v18:Disconnect();
                end;
            end;
        end;
    end, {
        v5, 
        v15, 
        v8
    });
    return v11;
end;