local l_Parent_0 = script:FindFirstAncestor("SocialToast").Parent;
local v1 = require(l_Parent_0.NavigationRodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = v1.Thunks.NavigateDown;
return function() --[[ Line: 11 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v7 = l_useDispatch_0();
    return v2.useCallback(function(v8) --[[ Line: 14 ]]
        -- upvalues: v7 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v7(l_NavigateDown_0({
            name = l_AppPage_0.SocialToast, 
            extraProps = {
                toastContent = v8
            }
        }, nil));
    end, {});
end;