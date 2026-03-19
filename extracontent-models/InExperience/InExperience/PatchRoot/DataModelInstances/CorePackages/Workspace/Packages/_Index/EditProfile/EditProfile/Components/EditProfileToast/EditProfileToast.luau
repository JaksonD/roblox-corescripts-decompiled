local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Snackbar_0 = v2.Snackbar;
local l_Enums_0 = v2.Enums;
return function(v5) --[[ Line: 12 ]] --[[ Name: EditProfileToast ]]
    -- upvalues: v1 (copy), l_Snackbar_0 (copy), l_Enums_0 (copy)
    local v6, v7 = v1.useState(true);
    local v8 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v8 (copy), v7 (copy)
        if v8.current then
            task.cancel(v8.current);
        end;
        v8.current = task.delay(5, function() --[[ Line: 25 ]]
            -- upvalues: v7 (ref)
            v7(false);
        end);
        return function() --[[ Line: 30 ]]
            -- upvalues: v8 (ref)
            if v8.current then
                task.cancel(v8.current);
                v8.current = nil;
            end;
        end;
    end, {});
    if v6 then
        return v1.createElement(l_Snackbar_0, {
            title = v5.text, 
            icon = {
                name = l_Enums_0.IconName.CircleCheck, 
                variant = l_Enums_0.IconVariant.Filled
            }, 
            Position = UDim2.new(0.5, 0, 0, 50), 
            AnchorPoint = Vector2.new(0.5, 0)
        });
    else
        return nil;
    end;
end;