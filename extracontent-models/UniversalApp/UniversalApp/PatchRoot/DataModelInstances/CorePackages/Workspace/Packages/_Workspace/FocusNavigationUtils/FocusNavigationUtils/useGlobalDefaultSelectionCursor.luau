local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v2 = require(l_Parent_0.React);
local l_useCursor_0 = require(l_Parent_0.UIBlox).App.SelectionCursor.useCursor;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function() --[[ Line: 10 ]] --[[ Name: useGlobalDefaultSelectionCursor ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useCursor_0 (copy), v2 (copy), l_CoreGui_0 (copy)
    local v6 = l_useDesignTokens_0(function(v5) --[[ Line: 11 ]]
        return {
            width = v5.Global.Size_25, 
            radius = UDim.new(0, v5.Semantic.Radius.Medium), 
            offset = v5.Global.Space_25
        };
    end);
    local v7 = l_useCursor_0(v6.radius, v6.offset, v6.width);
    local v8 = if v7 then v7.current else nil;
    v2.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: l_CoreGui_0 (ref), v8 (copy)
        if l_CoreGui_0.SelectionImageObject == nil and v8 ~= nil then
            l_CoreGui_0.SelectionImageObject = v8;
            return function() --[[ Line: 26 ]]
                -- upvalues: l_CoreGui_0 (ref)
                l_CoreGui_0.SelectionImageObject = nil;
            end;
        else
            return nil;
        end;
    end, {
        v8
    });
end;