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
local v14 = game:DefineFastFlag("EnableUnMountDrawerOnClose1", false);
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
    local v31 = v3.useCallback(function(v30) --[[ Line: 50 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref), v21 (copy), v14 (ref), v29 (copy), v17 (copy)
        if v20:getValue() == l_DrawerPanelStatus_0.Closing then
            v21(l_DrawerPanelStatus_0.Scrollable);
        end;
        if v14 and v30 == -v29 then
            v17(false);
        end;
    end, {});
    local v32, v33 = v5.useAnimatedBinding(-v29, v31);
    local v34 = v3.useRef(v29);
    v34.current = v29;
    local v35 = v3.useRef(false);
    local v36, v37 = v5.useAnimatedBinding(1);
    local v39 = v3.useCallback(function(v38) --[[ Line: 66 ]]
        -- upvalues: v16 (copy), v21 (copy), l_DrawerPanelStatus_0 (ref), v15 (copy)
        v16(false);
        v21(l_DrawerPanelStatus_0.Closing);
        if v15.onDrawerClosedAnalytics then
            v15.onDrawerClosedAnalytics({
                source = v38
            });
        end;
    end, {
        v15.onDrawerClosedAnalytics
    });
    local v41 = v3.useCallback(function(v40) --[[ Line: 74 ]]
        -- upvalues: v35 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v18 (copy), v19 (copy), v21 (copy)
        if not v35.current then
            return;
        elseif v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            v18.current = v40.Position;
            v19.current = DateTime.now().UnixTimestampMillis;
            v21(l_DrawerPanelStatus_0.Static);
            return;
        end;
    end, {});
    local v45 = v3.useCallback(function(v42) --[[ Line: 86 ]]
        -- upvalues: v35 (copy), v18 (copy), v19 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v34 (copy), v11 (ref), v39 (copy), v33 (copy), v5 (ref), v21 (copy)
        if not v35.current then
            v18.current = nil;
            v19.current = nil;
            return;
        elseif v18.current == nil or v19.current == nil or v20:getValue() ~= l_DrawerPanelStatus_0.Movable then
            v18.current = nil;
            v19.current = nil;
            return;
        else
            local v43 = v18.current.X - v42.Position.X;
            if v34.current * v11.DRAWER_SWIPE_THRESHOLD_PERCENT <= v43 then
                v39("swipe");
            elseif v43 > 0 then
                local v44 = (DateTime.now().UnixTimestampMillis - v19.current) / 1000;
                if v44 > 0.01 and v43 / v44 >= v11.DRAWER_VELOCITY_THRESHOLD then
                    v39("swipe");
                end;
            end;
            if v20:getValue() ~= l_DrawerPanelStatus_0.Closing then
                v33(v5.ease(0, v11.DRAWER_ANIM_SETTINGS));
                v21(l_DrawerPanelStatus_0.Scrollable);
            end;
            v18.current = nil;
            v19.current = nil;
            return;
        end;
    end, {});
    local v49 = v3.useCallback(function(v46) --[[ Line: 124 ]]
        -- upvalues: v35 (copy), v18 (copy), v20 (copy), l_DrawerPanelStatus_0 (ref), v21 (copy), v33 (copy), v5 (ref)
        if not v35.current then
            return;
        elseif v18.current == nil or v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            local v47 = v46.Position.X - v18.current.X;
            if v20:getValue() == l_DrawerPanelStatus_0.Static then
                local v48 = v46.Position.Y - v18.current.Y;
                if math.abs(v47) > math.abs(v48) then
                    v21(l_DrawerPanelStatus_0.Movable);
                else
                    v21(l_DrawerPanelStatus_0.Scrollable);
                end;
            end;
            if v20:getValue() == l_DrawerPanelStatus_0.Movable and v47 < 0 then
                v33((v5.instant(v47)));
            end;
            if v46.Position.X > v18.current.X then
                v18.current = v46.Position;
            end;
            return;
        end;
    end, {});
    local v50 = if not v14 then v3.useRef(nil) else nil;
    v3.useEffect(function() --[[ Line: 152 ]]
        -- upvalues: v7 (ref), v6 (ref), v14 (ref), v50 (copy), v35 (copy), v34 (copy), v33 (copy), v5 (ref), v11 (ref), v37 (copy)
        local l_getDrawerVisible_0 = v7(false).getDrawerVisible;
        return v6.createEffect(function(v52) --[[ Line: 154 ]]
            -- upvalues: v14 (ref), v50 (ref), l_getDrawerVisible_0 (copy), v35 (ref), v34 (ref), v33 (ref), v5 (ref), v11 (ref), v37 (ref)
            if not v14 and v50 and v50.current and v50.current.CanvasPosition.Y > 0 then
                v50.current:ScrollToTop();
            end;
            local v53 = l_getDrawerVisible_0(v52);
            v35.current = v53;
            local v54 = v53 and 0 or -v34.current;
            v33(v5.ease(v54, v11.DRAWER_ANIM_SETTINGS));
            local v55 = if v53 then v11.SCRIM_TRANSPARENCY else 1;
            v37(v5.ease(v55, v11.DRAWER_ANIM_SETTINGS));
        end);
    end, {});
    v3.useEffect(function() --[[ Line: 175 ]]
        -- upvalues: l_UserInputService_0 (ref), v41 (copy), v45 (copy), v49 (copy)
        local v56 = l_UserInputService_0.TouchStarted:Connect(v41);
        local v57 = l_UserInputService_0.TouchEnded:Connect(v45);
        local v58 = l_UserInputService_0.TouchMoved:Connect(v49);
        return function() --[[ Line: 179 ]]
            -- upvalues: v56 (copy), v57 (copy), v58 (copy)
            v56:Disconnect();
            v57:Disconnect();
            v58:Disconnect();
        end;
    end, {});
    local v59 = v3.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: v20 (copy), l_DrawerPanelStatus_0 (ref), v39 (copy)
        if v20:getValue() == l_DrawerPanelStatus_0.Closing then
            return;
        else
            if v20:getValue() ~= l_DrawerPanelStatus_0.Movable then
                v39("shield");
            end;
            return;
        end;
    end, {
        v20, 
        v39
    });
    local v61 = v36:map(function(v60) --[[ Line: 197 ]]
        return v60 < 1;
    end);
    return v3.createElement(v4.View, {
        Size = UDim2.fromScale(1, 1), 
        backgroundStyle = {
            Transparency = 1
        }, 
        Visible = v61
    }, {
        Scrim = v3.createElement(v10, {
            onActivated = v59, 
            transparencyBinding = v36, 
            zIndex = 1
        }), 
        DrawerAnimatedFrame = v3.createElement(v4.View, {
            Position = v32:map(function(v62) --[[ Line: 214 ]]
                return UDim2.fromOffset(v62, 0);
            end), 
            ZIndex = 2, 
            Size = UDim2.new(0, v29, 1, 0), 
            BorderSizePixel = 0, 
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
                ClipsDescendants = true, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollingEnabled = v23, 
                ZIndex = 2, 
                ref = if not v14 then v50 else nil
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