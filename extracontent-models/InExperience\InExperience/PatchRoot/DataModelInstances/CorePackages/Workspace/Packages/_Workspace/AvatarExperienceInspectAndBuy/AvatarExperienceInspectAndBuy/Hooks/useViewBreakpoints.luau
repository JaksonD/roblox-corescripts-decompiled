local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.tutils);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v6 = require(l_script_FirstAncestor_0.Enums.ViewType);
local function v8(v7) --[[ Line: 32 ]] --[[ Name: selectView ]]
    return v7.view;
end;
return function(v9) --[[ Line: 44 ]] --[[ Name: useViewBreakpoints ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v6 (copy), l_useSelector_0 (copy), v8 (copy), v4 (copy)
    local v10 = l_useTokens_0();
    return v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v6 (ref), v9 (copy), v10 (copy)
        return {
            [v6.Wide] = {
                ContainerSize = UDim2.new(0, 800, 0.9, -v9), 
                ContainerAnchorPoint = Vector2.new(0.5, 0.5), 
                ContainerPosition = UDim2.new(0.5, 0, 0.5, v9 / 2), 
                OverlaySize = UDim2.new(1, 0, 1, v9), 
                OverlayPosition = UDim2.new(0, 0, 0, -v9)
            }, 
            [v6.WideLandscape] = {
                ContainerSize = UDim2.new(0.95, 0, 1, -v9), 
                ContainerAnchorPoint = Vector2.new(0.5, 0), 
                ContainerPosition = UDim2.new(0.5, 0, 0, v9 + v10.Padding.XSmall), 
                OverlaySize = UDim2.new(1, 0, 1, v9), 
                OverlayPosition = UDim2.new(0, 0, 0, -v9)
            }, 
            [v6.Compact] = {
                ContainerSize = UDim2.new(1, 0, 1, -v9), 
                ContainerAnchorPoint = Vector2.new(0, 0), 
                ContainerPosition = UDim2.new(0, 0, 0, v9 + v10.Padding.Small), 
                OverlaySize = UDim2.new(1, 0, 1, v9), 
                OverlayPosition = UDim2.new(0, 0, 0, -v9)
            }
        };
    end, {
        v9
    })[l_useSelector_0(v8, v4.deepEqual)] or {};
end;