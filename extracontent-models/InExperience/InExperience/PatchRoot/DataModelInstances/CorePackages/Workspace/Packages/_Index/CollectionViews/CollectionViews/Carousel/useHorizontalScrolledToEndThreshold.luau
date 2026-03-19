local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
local l_FFlagCollectionViewMathChanges_0 = require(l_Parent_0.SharedFlags).FFlagCollectionViewMathChanges;
return function(v3, v4, v5, v6) --[[ Line: 8 ]] --[[ Name: useHorizontalScrolledToEndThreshold ]]
    -- upvalues: v1 (copy), l_FFlagCollectionViewMathChanges_0 (copy)
    local v7 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v6 (copy), v3 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v5 (copy), v4 (copy), v7 (copy)
        if not v6 then
            return nil;
        else
            local v8 = {};
            local v9 = false;
            if v3.current ~= nil then
                v9 = l_FFlagCollectionViewMathChanges_0 or v5 ~= nil and v4 ~= nil;
            end;
            if v9 then
                local l_current_0 = v3.current;
                local function v13() --[[ Line: 34 ]] --[[ Name: checkThreshold ]]
                    -- upvalues: l_current_0 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v4 (ref), v7 (ref), v5 (ref)
                    local v11 = l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteWindowSize.X - if l_FFlagCollectionViewMathChanges_0 then v4 or 0 else v4;
                    local l_X_0 = l_current_0.CanvasPosition.X;
                    if l_X_0 < v11 and v7.current then
                        v7.current = false;
                        return;
                    else
                        if v11 < l_X_0 and not v7.current then
                            v7.current = true;
                            if l_FFlagCollectionViewMathChanges_0 then
                                if v5 then
                                    v5();
                                    return;
                                end;
                            else
                                v5();
                            end;
                        end;
                        return;
                    end;
                end;
                table.insert(v8, l_current_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 54 ]]
                    -- upvalues: v13 (copy)
                    v13();
                end));
                table.insert(v8, l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 61 ]]
                    -- upvalues: v13 (copy)
                    v13();
                end));
                table.insert(v8, l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 67 ]]
                    -- upvalues: v13 (copy)
                    v13();
                end));
            end;
            return function() --[[ Line: 72 ]]
                -- upvalues: v8 (copy)
                for _, v15 in v8 do
                    v15:Disconnect();
                end;
            end;
        end;
    end, {
        v3, 
        v6, 
        v4, 
        v5
    });
end;