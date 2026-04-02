local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v4 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v6 = require(script.Parent.getResponsiveSize);
local v7 = require(script.Parent.useDialog);
return function(v8) --[[ Line: 16 ]] --[[ Name: useDialogResponsiveSize ]]
    -- upvalues: v5 (copy), v4 (copy), v7 (copy), v2 (copy), v6 (copy)
    local v9 = v5();
    local v10 = v4();
    local v11 = v7();
    local v12 = v2.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v11 (copy), v6 (ref), v8 (copy), v9 (copy)
        if not v10 then
            return;
        else
            v11.setResponsiveSize(v6(v10.AbsoluteSize.X, v8, v9));
            return;
        end;
    end, {
        v10, 
        v8, 
        v9, 
        v11.size
    });
    v2.useLayoutEffect(function() --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v12 (copy)
        if not v10 then
            return;
        else
            v12();
            local v13 = v10:GetPropertyChangedSignal("AbsoluteSize"):Connect(v12);
            return function() --[[ Line: 37 ]]
                -- upvalues: v13 (copy)
                v13:Disconnect();
            end;
        end;
    end, {
        v10, 
        v8, 
        v12
    });
end;