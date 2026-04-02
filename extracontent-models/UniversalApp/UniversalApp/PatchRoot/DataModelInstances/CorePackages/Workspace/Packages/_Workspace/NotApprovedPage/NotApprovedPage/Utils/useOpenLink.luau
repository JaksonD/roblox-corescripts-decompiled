local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local l_useCallback_0 = require(l_Parent_0.React).useCallback;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v6 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v6.usePreferredInput;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v12 = require(l_Parent_0.NotApprovedPage.Utils.useWebView);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapNewWebView);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v15, v16) --[[ Line: 30 ]] --[[ Name: useOpenLink ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_usePreferredInput_0 (copy), v6 (copy), v13 (copy), v12 (copy), l_useCallback_0 (copy), l_VRService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v17 = l_useDispatch_0();
    local v18 = l_useRoactService_0(l_AppLinking_0);
    local v19 = l_usePreferredInput_0() == v6.Input.Directional;
    local v20 = if v13 then v12(v15, v16) else nil;
    return (l_useCallback_0(function() --[[ Line: 37 ]]
        -- upvalues: v19 (copy), l_VRService_0 (ref), v18 (copy), v15 (copy), v13 (ref), v20 (copy), v17 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v16 (copy)
        if v19 or l_VRService_0.VREnabled then
            v18:openURL(v15);
            return;
        elseif v13 and v20 then
            v20();
            return;
        else
            v17(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v15, 
                extraProps = {
                    title = v16
                }
            }));
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v15, 
        v16, 
        v17, 
        v19, 
        v18, 
        v20
    } else l_dependencyArray_0(v15, v16, v17, v19, v18, v20)));
end;