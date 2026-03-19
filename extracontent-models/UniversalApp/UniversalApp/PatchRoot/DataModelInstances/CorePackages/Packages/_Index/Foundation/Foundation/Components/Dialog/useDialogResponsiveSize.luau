local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v4 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local v7 = require(script.Parent.getResponsiveSize);
local v8 = require(script.Parent.useDialog);
return function(v9) --[[ Line: 18 ]] --[[ Name: useDialogResponsiveSize ]]
    -- upvalues: v5 (copy), v4 (copy), v8 (copy), v2 (copy), v7 (copy), v6 (copy)
    local v10 = v5();
    local v11 = v4();
    local v12 = v8();
    local v13 = v2.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v11 (copy), v12 (copy), v7 (ref), v9 (copy), v10 (copy)
        if not v11 then
            return;
        else
            v12.setResponsiveSize(v7(v11.AbsoluteSize.X, v9, v10));
            return;
        end;
    end, {
        v11, 
        v9, 
        v10, 
        v12.size
    });
    (if v6.FoundationDialogFixResponsiveSize then v2.useLayoutEffect else v2.useEffect)(function() --[[ Line: 34 ]]
        -- upvalues: v11 (copy), v13 (copy)
        if not v11 then
            return;
        else
            v13();
            local v14 = v11:GetPropertyChangedSignal("AbsoluteSize"):Connect(v13);
            return function() --[[ Line: 43 ]]
                -- upvalues: v14 (copy)
                v14:Disconnect();
            end;
        end;
    end, {
        v11, 
        v9
    });
end;