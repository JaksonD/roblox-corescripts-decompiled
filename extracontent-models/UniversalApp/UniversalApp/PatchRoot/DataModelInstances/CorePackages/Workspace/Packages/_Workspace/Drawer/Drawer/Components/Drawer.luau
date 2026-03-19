local l_script_FirstAncestor_0 = script:FindFirstAncestor("Drawer");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.ReactOtter);
local v6 = require(l_Parent_0.Signals);
local v7 = require(script.Parent.Parent.Stores.GetDrawerVisibleStore);
local v8 = require(script.Parent.Parent.Hooks.useSetDrawerVisible);
local v9 = require(script.Parent.Parent.Hooks.useSetDrawerShouldMount);
local v10 = require(script.Parent.Scrim);
local v11 = require(script.Parent.Parent.Constants);
local _ = require(script.Parent.Parent.Types);
local l_DrawerPanelStatus_0 = require(script.Parent.Parent.Enum).DrawerPanelStatus;
local v14 = game:DefineFastFlag("EnableUnMountDrawerOnClose", false);
return v3.memo(function(v15) --[[ Line: 22 ]]
    -- upvalues: v8 (copy), v9 (copy), v3 (copy), l_DrawerPanelStatus_0 (copy), v14 (copy), v5 (copy), v11 (copy), v7 (copy), v6 (copy), l_UserInputService_0 (copy), v4 (copy), v10 (copy)
    local v16 = v8();
    local v17 = v9();
    local v18 = v3.useRef(nil);
    local v19 = v3.useRef(nil);
    local v20, v21 = v3.useBinding(l_DrawerPanelStatus_0.Scrollable);
    local v23 = v3.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref)
        return v20:map(function(v22) --[[ Line: 30 ]]
            -- upvalues: l_DrawerPanelStatus_0 (ref)
            return v22 == l_DrawerPanelStatus_0.Scrollable;
        end);
    end, {});
    local v25 = v3.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref)
        return v20:map(function(v24) --[[ Line: 36 ]]
            -- upvalues: l_DrawerPanelStatus_0 (ref)
            if v24 == l_DrawerPanelStatus_0.Movable then
                return 3;
            else
                return 1;
            end;
        end);
    end, {});
    local v26 = v3.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref), v21 (copy), v14 (ref), v17 (copy)
        if v20:getValue() == l_DrawerPanelStatus_0.Closing then
            v21(l_DrawerPanelStatus_0.Scrollable);
            if v14 then
                v17(false);
            end;
        end;
    end, {});
    local v27, v28 = v5.useAnimatedBinding(-v15.menuWidth, v26);
    local v29 = v3.useRef(v15.menuWidth);
    v29.current = v15.menuWidth;
    local v30 = v3.useRef(false);
    local v31, v32 = v3.useBinding(false);
    local v33, v34 = v5.useAnimatedBinding(1);
    local v36 = v3.useCallback(function(v35) --[[ Line: 64 ]]
        -- upvalues: v16 (copy), v21 (copy), l_DrawerPanelStatus_0 (ref), v15 (copy)
        v16(false);
        v21(l_DrawerPanelStatus_0.Closing);
        if v15.onDrawerClosedAnalytics then
            v15.onDrawerClosedAnalytics({
                source = v35
            });
        end;
    end, {
        v15.onDrawerClosedAnalytics
    });
    local v38 = v3.useCallback(function(v37) --[[ Line: 72 ]]
        -- upvalues: v30 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v18 (copy), v19 (copy), v21 (copy)
        if not v30.current then
            return;
        elseif v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            v18.current = v37.Position;
            v19.current = DateTime.now().UnixTimestampMillis;
            v21(l_DrawerPanelStatus_0.Static);
            return;
        end;
    end, {});
    local v42 = v3.useCallback(function(v39) --[[ Line: 84 ]]
        -- upvalues: v30 (copy), v18 (copy), v19 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v29 (copy), v11 (ref), v36 (copy), v28 (copy), v5 (ref), v21 (copy)
        if not v30.current then
            v18.current = nil;
            v19.current = nil;
            return;
        elseif v18.current == nil or v19.current == nil or v20:getValue() ~= l_DrawerPanelStatus_0.Movable then
            v18.current = nil;
            v19.current = nil;
            return;
        else
            local v40 = v18.current.X - v39.Position.X;
            if v29.current * v11.DRAWER_SWIPE_THRESHOLD_PERCENT <= v40 then
                v36("swipe");
            elseif v40 > 0 then
                local v41 = (DateTime.now().UnixTimestampMillis - v19.current) / 1000;
                if v41 > 0.01 and v40 / v41 >= v11.DRAWER_VELOCITY_THRESHOLD then
                    v36("swipe");
                end;
            end;
            if v20:getValue() ~= l_DrawerPanelStatus_0.Closing then
                v28(v5.ease(0, v11.DRAWER_ANIM_SETTINGS));
                v21(l_DrawerPanelStatus_0.Scrollable);
            end;
            v18.current = nil;
            v19.current = nil;
            return;
        end;
    end, {});
    local v46 = v3.useCallback(function(v43) --[[ Line: 122 ]]
        -- upvalues: v30 (copy), v18 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v21 (copy), v28 (copy), v5 (ref)
        if not v30.current then
            return;
        elseif v18.current == nil or v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            local v44 = v43.Position.X - v18.current.X;
            if v20:getValue() == l_DrawerPanelStatus_0.Static then
                local v45 = v43.Position.Y - v18.current.Y;
                if math.abs(v44) > math.abs(v45) then
                    v21(l_DrawerPanelStatus_0.Movable);
                else
                    v21(l_DrawerPanelStatus_0.Scrollable);
                end;
            end;
            if v20:getValue() == l_DrawerPanelStatus_0.Movable and v44 < 0 then
                v28((v5.instant(v44)));
            end;
            if v43.Position.X > v18.current.X then
                v18.current = v43.Position;
            end;
            return;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v7 (ref), v6 (ref), v30 (copy), v32 (copy), v29 (copy), v28 (copy), v5 (ref), v11 (ref), v34 (copy)
        local l_getDrawerVisible_0 = v7(false).getDrawerVisible;
        return v6.createEffect(function(v48) --[[ Line: 151 ]]
            -- upvalues: l_getDrawerVisible_0 (copy), v30 (ref), v32 (ref), v29 (ref), v28 (ref), v5 (ref), v11 (ref), v34 (ref)
            local v49 = l_getDrawerVisible_0(v48);
            v30.current = v49;
            v32(v49);
            local v50 = v49 and 0 or -v29.current;
            v28(v5.ease(v50, v11.DRAWER_ANIM_SETTINGS));
            local v51 = if v49 then v11.SCRIM_TRANSPARENCY else 1;
            v34(v5.ease(v51, v11.DRAWER_ANIM_SETTINGS));
        end);
    end, {});
    v3.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: l_UserInputService_0 (ref), v38 (copy), v42 (copy), v46 (copy)
        local v52 = l_UserInputService_0.TouchStarted:Connect(v38);
        local v53 = l_UserInputService_0.TouchEnded:Connect(v42);
        local v54 = l_UserInputService_0.TouchMoved:Connect(v46);
        return function() --[[ Line: 168 ]]
            -- upvalues: v52 (copy), v53 (copy), v54 (copy)
            v52:Disconnect();
            v53:Disconnect();
            v54:Disconnect();
        end;
    end, {});
    local v55 = v3.useCallback(function() --[[ Line: 175 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref), v36 (copy)
        if v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            if v20:getValue() ~= l_DrawerPanelStatus_0.Movable then
                v36("shield");
            end;
            return;
        end;
    end, {
        v20, 
        v36
    });
    local v57 = v3.joinBindings({
        v31, 
        v20
    }):map(function(v56) --[[ Line: 185 ]]
        -- upvalues: l_DrawerPanelStatus_0 (ref)
        return v56[1] or v56[2] == l_DrawerPanelStatus_0.Closing;
    end);
    return v3.createElement(v4.View, {
        Size = UDim2.fromScale(1, 1), 
        backgroundStyle = {
            Transparency = 1
        }, 
        Visible = v57
    }, {
        Scrim = v3.createElement(v10, {
            onActivated = v55, 
            transparencyBinding = v33, 
            zIndex = 1
        }), 
        DrawerAnimatedFrame = v3.createElement(v4.View, {
            Position = v27:map(function(v58) --[[ Line: 202 ]]
                return UDim2.fromOffset(v58, 0);
            end), 
            ZIndex = 2, 
            Size = UDim2.new(0, v15.menuWidth, 1, 0), 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            Selectable = false
        }, {
            TopSafeAreaFrame = if v15.topOffset and v15.topOffset > 0 then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v15.topOffset), 
                BackgroundColor3 = v15.backgroundColor, 
                BackgroundTransparency = v15.backgroundTransparency, 
                BorderSizePixel = 0, 
                Selectable = false, 
                ZIndex = 3
            }) else nil, 
            DrawerSidePanelContent = v3.createElement("ScrollingFrame", {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v15.backgroundColor, 
                BackgroundTransparency = v15.backgroundTransparency, 
                Selectable = false, 
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                Active = v23, 
                BorderSizePixel = 0, 
                ScrollBarThickness = 0, 
                ClipsDescendants = false, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollingEnabled = v23, 
                ZIndex = 2
            }, v15.children), 
            SinkInput = v3.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Selectable = false, 
                AutoButtonColor = false, 
                ZIndex = v25
            })
        })
    });
end);