local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_Snackbar_0 = v1.Snackbar;
local l_useScaledValue_0 = v1.Hooks.useScaledValue;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
return v2.memo(function(v7) --[[ Line: 39 ]] --[[ Name: SnackbarWrapper ]]
    -- upvalues: v2 (copy), l_useSelector_0 (copy), l_useScaledValue_0 (copy), l_Snackbar_0 (copy)
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v7 (copy)
        local v8 = nil;
        if v7.autoDismissDelaySeconds then
            v8 = task.delay(v7.autoDismissDelaySeconds, v7.closeSnackbar);
        end;
        return function() --[[ Line: 48 ]]
            -- upvalues: v8 (ref)
            if v8 then
                task.cancel(v8);
                v8 = nil;
            end;
        end;
    end, {
        v7.closeSnackbar, 
        v7.autoDismissDelaySeconds
    });
    local v11 = v2.useCallback(function(_, v10) --[[ Line: 56 ]]
        -- upvalues: v7 (copy)
        if v10 == Enum.SwipeDirection.Up then
            v7.closeSnackbar();
        end;
    end, {
        v7.closeSnackbar
    });
    local v12 = if v7.buttonText and v7.onButtonActivated then {
        text = v7.buttonText, 
        onActivated = v7.onButtonActivated
    } else nil;
    local v14 = l_useSelector_0(function(v13) --[[ Line: 68 ]]
        return v13.GlobalGuiInset or {
            left = 0, 
            top = 0, 
            right = 0, 
            bottom = 0
        };
    end);
    local v16 = l_useSelector_0(function(v15) --[[ Line: 77 ]]
        return v15.TopBar.statusBarHeight;
    end);
    local v17 = l_useScaledValue_0(20);
    local v18 = v7.Position or UDim2.new(0.5, 0, 0, v17 + v14.top + v16);
    return v2.createElement("Frame", {
        AnchorPoint = v7.AnchorPoint or Vector2.new(0.5, 0), 
        Position = v18, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Selectable = false, 
        Active = true, 
        [v2.Event.TouchSwipe] = v11
    }, {
        v2.createElement(l_Snackbar_0, {
            title = v7.titleText, 
            icon = v7.icon, 
            action = v12, 
            onClose = if v7.hideCloseAffordance then nil else v7.closeSnackbar
        })
    });
end);