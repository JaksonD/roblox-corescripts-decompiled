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
    local v23 = v3.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref)
        return v20:map(function(v22) --[[ Line: 29 ]]
            -- upvalues: l_DrawerPanelStatus_0 (ref)
            return v22 == l_DrawerPanelStatus_0.Scrollable;
        end);
    end, {});
    local v25 = v3.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref)
        return v20:map(function(v24) --[[ Line: 35 ]]
            -- upvalues: l_DrawerPanelStatus_0 (ref)
            if v24 == l_DrawerPanelStatus_0.Movable then
                return 3;
            else
                return 1;
            end;
        end);
    end, {});
    local v26 = v15.topOffset or 0;
    local v27 = v15.bottomOffset or 0;
    local v28 = v15.leftOffset or 0;
    local v29 = v15.menuWidth + v28;
    local v30 = v3.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref), v21 (copy), v14 (ref), v17 (copy)
        if v20:getValue() == l_DrawerPanelStatus_0.Closing then
            v21(l_DrawerPanelStatus_0.Scrollable);
            if v14 then
                v17(false);
            end;
        end;
    end, {});
    local v31, v32 = v5.useAnimatedBinding(-v29, v30);
    local v33 = v3.useRef(v29);
    v33.current = v29;
    local v34 = v3.useRef(false);
    local v35, v36 = v3.useBinding(false);
    local v37, v38 = v5.useAnimatedBinding(1);
    local v40 = v3.useCallback(function(v39) --[[ Line: 67 ]]
        -- upvalues: v16 (copy), v21 (copy), l_DrawerPanelStatus_0 (ref), v15 (copy)
        v16(false);
        v21(l_DrawerPanelStatus_0.Closing);
        if v15.onDrawerClosedAnalytics then
            v15.onDrawerClosedAnalytics({
                source = v39
            });
        end;
    end, {
        v15.onDrawerClosedAnalytics
    });
    local v42 = v3.useCallback(function(v41) --[[ Line: 75 ]]
        -- upvalues: v34 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v18 (copy), v19 (copy), v21 (copy)
        if not v34.current then
            return;
        elseif v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            v18.current = v41.Position;
            v19.current = DateTime.now().UnixTimestampMillis;
            v21(l_DrawerPanelStatus_0.Static);
            return;
        end;
    end, {});
    local v46 = v3.useCallback(function(v43) --[[ Line: 87 ]]
        -- upvalues: v34 (copy), v18 (copy), v19 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v33 (copy), v11 (ref), v40 (copy), v32 (copy), v5 (ref), v21 (copy)
        if not v34.current then
            v18.current = nil;
            v19.current = nil;
            return;
        elseif v18.current == nil or v19.current == nil or v20:getValue() ~= l_DrawerPanelStatus_0.Movable then
            v18.current = nil;
            v19.current = nil;
            return;
        else
            local v44 = v18.current.X - v43.Position.X;
            if v33.current * v11.DRAWER_SWIPE_THRESHOLD_PERCENT <= v44 then
                v40("swipe");
            elseif v44 > 0 then
                local v45 = (DateTime.now().UnixTimestampMillis - v19.current) / 1000;
                if v45 > 0.01 and v44 / v45 >= v11.DRAWER_VELOCITY_THRESHOLD then
                    v40("swipe");
                end;
            end;
            if v20:getValue() ~= l_DrawerPanelStatus_0.Closing then
                v32(v5.ease(0, v11.DRAWER_ANIM_SETTINGS));
                v21(l_DrawerPanelStatus_0.Scrollable);
            end;
            v18.current = nil;
            v19.current = nil;
            return;
        end;
    end, {});
    local v50 = v3.useCallback(function(v47) --[[ Line: 125 ]]
        -- upvalues: v34 (copy), v18 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v21 (copy), v32 (copy), v5 (ref)
        if not v34.current then
            return;
        elseif v18.current == nil or v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            local v48 = v47.Position.X - v18.current.X;
            if v20:getValue() == l_DrawerPanelStatus_0.Static then
                local v49 = v47.Position.Y - v18.current.Y;
                if math.abs(v48) > math.abs(v49) then
                    v21(l_DrawerPanelStatus_0.Movable);
                else
                    v21(l_DrawerPanelStatus_0.Scrollable);
                end;
            end;
            if v20:getValue() == l_DrawerPanelStatus_0.Movable and v48 < 0 then
                v32((v5.instant(v48)));
            end;
            if v47.Position.X > v18.current.X then
                v18.current = v47.Position;
            end;
            return;
        end;
    end, {});
    local v51 = if not v14 then v3.useRef(nil) else nil;
    v3.useEffect(function() --[[ Line: 153 ]]
        -- upvalues: v7 (ref), v6 (ref), v14 (ref), v51 (copy), v34 (copy), v36 (copy), v33 (copy), v32 (copy), v5 (ref), v11 (ref), v38 (copy)
        local l_getDrawerVisible_0 = v7(false).getDrawerVisible;
        return v6.createEffect(function(v53) --[[ Line: 155 ]]
            -- upvalues: v14 (ref), v51 (ref), l_getDrawerVisible_0 (copy), v34 (ref), v36 (ref), v33 (ref), v32 (ref), v5 (ref), v11 (ref), v38 (ref)
            if not v14 and v51 and v51.current and v51.current.CanvasPosition.Y > 0 then
                v51.current:ScrollToTop();
            end;
            local v54 = l_getDrawerVisible_0(v53);
            v34.current = v54;
            v36(v54);
            local v55 = v54 and 0 or -v33.current;
            v32(v5.ease(v55, v11.DRAWER_ANIM_SETTINGS));
            local v56 = if v54 then v11.SCRIM_TRANSPARENCY else 1;
            v38(v5.ease(v56, v11.DRAWER_ANIM_SETTINGS));
        end);
    end, {});
    v3.useEffect(function() --[[ Line: 177 ]]
        -- upvalues: l_UserInputService_0 (ref), v42 (copy), v46 (copy), v50 (copy)
        local v57 = l_UserInputService_0.TouchStarted:Connect(v42);
        local v58 = l_UserInputService_0.TouchEnded:Connect(v46);
        local v59 = l_UserInputService_0.TouchMoved:Connect(v50);
        return function() --[[ Line: 181 ]]
            -- upvalues: v57 (copy), v58 (copy), v59 (copy)
            v57:Disconnect();
            v58:Disconnect();
            v59:Disconnect();
        end;
    end, {});
    local v60 = v3.useCallback(function() --[[ Line: 188 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref), v40 (copy)
        if v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            if v20:getValue() ~= l_DrawerPanelStatus_0.Movable then
                v40("shield");
            end;
            return;
        end;
    end, {
        v20, 
        v40
    });
    local v62 = v3.joinBindings({
        v35, 
        v20
    }):map(function(v61) --[[ Line: 198 ]]
        -- upvalues: l_DrawerPanelStatus_0 (ref)
        return v61[1] or v61[2] == l_DrawerPanelStatus_0.Closing;
    end);
    return v3.createElement(v4.View, {
        Size = UDim2.fromScale(1, 1), 
        backgroundStyle = {
            Transparency = 1
        }, 
        Visible = v62
    }, {
        Scrim = v3.createElement(v10, {
            onActivated = v60, 
            transparencyBinding = v37, 
            zIndex = 1
        }), 
        DrawerAnimatedFrame = v3.createElement(v4.View, {
            Position = v31:map(function(v63) --[[ Line: 215 ]]
                return UDim2.fromOffset(v63, 0);
            end), 
            ZIndex = 2, 
            Size = UDim2.new(0, v29, 1, 0), 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            backgroundStyle = {
                Color3 = v15.backgroundColor, 
                Transparency = v15.backgroundTransparency
            }, 
            Selectable = false
        }, {
            DrawerContent = v3.createElement("ScrollingFrame", {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Size = UDim2.new(0, v15.menuWidth, 1, -v26 - v27), 
                Position = UDim2.new(0, v28, 0, v26), 
                CanvasSize = UDim2.new(0, v15.menuWidth, 0, 0), 
                Active = v23, 
                BorderSizePixel = 0, 
                ScrollBarThickness = 0, 
                ClipsDescendants = false, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollingEnabled = v23, 
                ZIndex = 2, 
                ref = if not v14 then v51 else nil
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