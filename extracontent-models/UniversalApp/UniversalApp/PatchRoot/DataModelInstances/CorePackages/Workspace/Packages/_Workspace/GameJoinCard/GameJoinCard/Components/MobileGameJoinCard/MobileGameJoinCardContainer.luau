local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactUtils);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_useDispatch_0 = v2.Hooks.RoactRodux.useDispatch;
local v5 = require(script.Parent.MobileGameJoinCard);
return function() --[[ Line: 11 ]] --[[ Name: MobileGameJoinCardContainer ]]
    -- upvalues: l_useDispatch_0 (copy), v1 (copy), l_NavigateBack_0 (copy), v5 (copy)
    local v6 = l_useDispatch_0();
    local v7 = v1.useCallback(function() --[[ Line: 14 ]]
        -- upvalues: v6 (copy), l_NavigateBack_0 (ref)
        v6(l_NavigateBack_0(true));
    end, {
        v6
    });
    return v1.createElement(v5, {
        onClose = v7
    });
end;