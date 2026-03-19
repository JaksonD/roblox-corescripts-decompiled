local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local _ = require(l_script_FirstAncestor_0.Types);
return function(_) --[[ Line: 13 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v8 = l_useDispatch_0();
    return v2.useCallback(function(v9) --[[ Line: 15 ]]
        -- upvalues: v8 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v8(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v9
        }));
    end, {
        v8
    });
end;