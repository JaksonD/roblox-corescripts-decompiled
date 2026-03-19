local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = require(l_Parent_0.Foundation);
local l_Toast_0 = v3.Toast;
local l_View_0 = v3.View;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local v7 = {
    dampingRatio = 1, 
    frequency = 3
};
local v8 = UDim.new(0, 296);
return function(v9) --[[ Line: 36 ]] --[[ Name: ToastController ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy), l_ButtonVariant_0 (copy), l_View_0 (copy), l_Toast_0 (copy), v8 (copy)
    local v10, v11 = v1.useState(false);
    local v12 = v1.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v10 (copy), v9 (copy)
        if not v10 then
            v9.onDismissed();
        end;
    end, {
        v10, 
        v9.onDismissed
    });
    local v13, v14 = v2.useAnimatedBinding(-200, v12);
    local v15 = v1.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v11 (copy), v14 (copy), v2 (ref), v7 (ref)
        v11(false);
        v14(v2.spring(-200, v7));
    end, {
        v14
    });
    v1.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v9 (copy), v11 (copy), v14 (copy), v2 (ref), v7 (ref), v15 (copy)
        if v9.show then
            v11(true);
            v14(v2.spring(20, v7));
            return;
        else
            v15();
            return;
        end;
    end, {
        v9.show, 
        v14, 
        v15
    });
    v1.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v9 (copy), v15 (copy)
        if v9.show and v9.duration > 0 then
            local v16 = task.delay(v9.duration, function() --[[ Line: 63 ]]
                -- upvalues: v15 (ref)
                v15();
            end);
            return function() --[[ Line: 66 ]]
                -- upvalues: v16 (copy)
                task.cancel(v16);
            end;
        else
            return nil;
        end;
    end, {
        v9.show, 
        v9.duration, 
        v15
    });
    local l_onAction_0 = v9.onAction;
    local v18 = v1.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v9 (copy), l_onAction_0 (copy), v15 (copy), l_ButtonVariant_0 (ref)
        if not v9.actionText then
            return nil;
        else
            return {
                {
                    text = v9.actionText, 
                    onActivated = function() --[[ Line: 81 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_onAction_0 (ref), v15 (ref)
                        if l_onAction_0 then
                            l_onAction_0();
                        end;
                        v15();
                    end, 
                    variant = l_ButtonVariant_0.Emphasis
                }
            };
        end;
    end, {
        v9.actionText, 
        l_onAction_0, 
        v15
    });
    local v20 = v13:map(function(v19) --[[ Line: 92 ]]
        return UDim2.new(0.5, 0, 0, v19);
    end);
    return v1.createElement(l_View_0, {
        tag = "size-full-0 auto-y col align-x-center anchor-top-center", 
        Position = v20
    }, {
        Toast = v1.createElement(l_Toast_0, {
            title = v9.title, 
            text = v9.text, 
            icon = v9.icon, 
            actions = v18, 
            width = v8
        })
    });
end;