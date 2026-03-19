local l_Parent_0 = script:FindFirstAncestor("SceneManagement").Parent;
local v1 = require(l_Parent_0.React);
getCameraFacingCFrame = function(v2, v3) --[[ Line: 14 ]] --[[ Name: getCameraFacingCFrame ]]
    local v4 = v3.Position + v2 * v3.LookVector;
    return CFrame.lookAt(v4, v3.Position, v3.UpVector);
end;
getDimensionsToFillViewPort = function(v5, v6) --[[ Line: 23 ]] --[[ Name: getDimensionsToFillViewPort ]]
    local v7 = if v6.ViewportSize.Y > 0 then v6.ViewportSize.X / v6.ViewportSize.Y else 0;
    local v8 = v5 * 2 * math.tan((math.rad(v6.FieldOfView / 2)));
    local v9 = v8 * v7;
    return Vector2.new(v9, v8);
end;
return function(v10) --[[ Line: 35 ]] --[[ Name: useCameraFacingGeometry ]]
    -- upvalues: v1 (copy)
    local v11, v12 = v1.useState(workspace.CurrentCamera);
    local v13, v14 = v1.useBinding(Vector2.new());
    local v15, v16 = v1.useBinding(CFrame.new());
    local function _(v17) --[[ Line: 40 ]] --[[ Name: updateGeometry ]]
        -- upvalues: v14 (copy), v10 (copy), v16 (copy)
        v14(getDimensionsToFillViewPort(v10, v17));
        v16(getCameraFacingCFrame(v10, v17.CFrame));
    end;
    local function v24(v19) --[[ Line: 45 ]] --[[ Name: makeCameraPropConnections ]]
        -- upvalues: v14 (copy), v10 (copy), v16 (copy)
        local v20 = {};
        for _, v22 in {
            "CFrame", 
            "ViewportSize", 
            "FieldOfView"
        } do
            table.insert(v20, v19:GetPropertyChangedSignal(v22):Connect(function() --[[ Line: 50 ]]
                -- upvalues: v19 (copy), v14 (ref), v10 (ref), v16 (ref)
                local l_v19_0 = v19;
                v14(getDimensionsToFillViewPort(v10, l_v19_0));
                v16(getCameraFacingCFrame(v10, l_v19_0.CFrame));
            end));
        end;
        return v20;
    end;
    v1.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v12 (copy)
        local v25 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 59 ]]
            -- upvalues: v12 (ref)
            v12(workspace.CurrentCamera);
        end);
        return function() --[[ Line: 62 ]]
            -- upvalues: v25 (copy)
            v25:Disconnect();
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v11 (copy), v24 (copy), v14 (copy), v10 (copy), v16 (copy)
        local v26 = nil;
        if v11 then
            v26 = v24(v11);
            local l_v11_0 = v11;
            v14(getDimensionsToFillViewPort(v10, l_v11_0));
            v16(getCameraFacingCFrame(v10, l_v11_0.CFrame));
        end;
        return function() --[[ Line: 74 ]]
            -- upvalues: v26 (ref)
            if v26 then
                for _, v29 in v26 do
                    v29:Disconnect();
                end;
            end;
        end;
    end, {
        v11
    });
    return v1.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v13 (copy), v15 (copy)
        return {
            viewportFillDimensions = v13, 
            cFrame = v15
        };
    end, {});
end;