local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v4) --[[ Line: 28 ]] --[[ Name: useMenuItemHover ]]
    -- upvalues: v2 (copy)
    v2.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v4 (copy)
        if v4.itemRef.current == nil then
            return;
        elseif typeof(v4.itemRef.current) ~= "Instance" then
            return;
        else
            local v5 = v4.itemRef.current:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 38 ]]
                -- upvalues: v4 (ref)
                if v4.isSubmenu then
                    if v4.isDisabled then
                        return;
                    elseif v4.itemRef.current.GuiState == Enum.GuiState.Hover then
                        if v4.hoverOpenAtDepth then
                            v4.hoverOpenAtDepth(v4.depth, v4.id);
                            return;
                        end;
                    elseif v4.hoverCloseAtDepth then
                        v4.hoverCloseAtDepth(v4.depth);
                        return;
                    end;
                elseif v4.itemRef.current.GuiState == Enum.GuiState.Hover and v4.hoverCloseAtDepth then
                    v4.hoverCloseAtDepth(v4.depth);
                end;
            end);
            return function() --[[ Line: 64 ]]
                -- upvalues: v5 (copy)
                v5:Disconnect();
            end;
        end;
    end, {
        v4.isSubmenu, 
        v4.isDisabled, 
        v4.id, 
        v4.depth, 
        v4.hoverCloseAtDepth, 
        v4.hoverOpenAtDepth, 
        v4.itemRef
    });
end;