local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v2.FFlagLuaAppCompositionSupport;
local l_FFlagCollectionViewMathChanges_0 = v2.FFlagCollectionViewMathChanges;
return function(v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: useHorizontalScrolledToEndThreshold ]]
    -- upvalues: v1 (copy), l_FFlagCollectionViewMathChanges_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy)
    local v9 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v8 (copy), v5 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v7 (copy), v6 (copy), v9 (copy), l_FFlagLuaAppCompositionSupport_0 (ref)
        if not v8 then
            return nil;
        else
            local v10 = {};
            local v11 = false;
            if v5.current ~= nil then
                v11 = l_FFlagCollectionViewMathChanges_0 or v7 ~= nil and v6 ~= nil;
            end;
            if v11 then
                local l_current_0 = v5.current;
                local function v15() --[[ Line: 36 ]] --[[ Name: checkThreshold ]]
                    -- upvalues: l_current_0 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v6 (ref), v9 (ref), v7 (ref)
                    local v13 = l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteWindowSize.X - if l_FFlagCollectionViewMathChanges_0 then v6 or 0 else v6;
                    local l_X_0 = l_current_0.CanvasPosition.X;
                    if l_X_0 < v13 and v9.current then
                        v9.current = false;
                        return;
                    else
                        if v13 < l_X_0 and not v9.current then
                            v9.current = true;
                            if l_FFlagCollectionViewMathChanges_0 then
                                if v7 then
                                    v7();
                                    return;
                                end;
                            else
                                v7();
                            end;
                        end;
                        return;
                    end;
                end;
                table.insert(v10, l_current_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 56 ]]
                    -- upvalues: v15 (copy)
                    v15();
                end));
                table.insert(v10, l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 63 ]]
                    -- upvalues: v15 (copy)
                    v15();
                end));
                table.insert(v10, l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 69 ]]
                    -- upvalues: v15 (copy)
                    v15();
                end));
                if l_FFlagLuaAppCompositionSupport_0 then
                    v15();
                end;
            end;
            return function() --[[ Line: 77 ]]
                -- upvalues: v10 (copy)
                for _, v17 in v10 do
                    v17:Disconnect();
                end;
            end;
        end;
    end, {
        v5, 
        v8, 
        v6, 
        v7
    });
end;