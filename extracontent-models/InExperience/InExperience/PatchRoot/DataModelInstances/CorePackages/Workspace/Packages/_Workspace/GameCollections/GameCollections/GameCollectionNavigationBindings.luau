local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v5 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SeeAll, 
    [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.HoldToPlay
};
local v6 = {};
local function v11(v7, v8) --[[ Line: 23 ]] --[[ Name: useControllerBarFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v9 = v1.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v7 (copy), v3 (ref), v8 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SeeAll] = if v7 then {
                handler = v3.onRelease(v7)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.HoldToPlay] = if v8 then {
                handler = v8
            } else nil
        };
    end, {
        v7, 
        v8
    });
    local v10 = v2.useEventMap(v5);
    return v2.useEventHandlerMap(v9, v10);
end;
v6.useControllerBarFocusNavigationBindings = v11;
v6.OnSeeAllControllerBarNavigateWrapper = function(v12) --[[ Line: 45 ]] --[[ Name: OnSeeAllControllerBarNavigateWrapper ]]
    -- upvalues: v11 (copy), v1 (copy)
    local v13 = v11(v12.onSeeAll);
    return v1.createElement("Frame", {
        ref = v13, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, v12.children);
end;
return v6;