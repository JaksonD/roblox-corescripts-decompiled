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
return function(v14, v15) --[[ Line: 28 ]] --[[ Name: useOpenLink ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_usePreferredInput_0 (copy), v6 (copy), v13 (copy), v12 (copy), l_useCallback_0 (copy), l_VRService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_dependencyArray_0 (copy)
    local v16 = l_useDispatch_0();
    local v17 = l_useRoactService_0(l_AppLinking_0);
    local v18 = l_usePreferredInput_0() == v6.Input.Directional;
    local v19 = if v13 then v12(v14, v15) else nil;
    return (l_useCallback_0(function() --[[ Line: 34 ]]
        -- upvalues: v18 (copy), l_VRService_0 (ref), v17 (copy), v14 (copy), v13 (ref), v19 (copy), v16 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v15 (copy)
        if v18 or l_VRService_0.VREnabled then
            v17:openURL(v14);
            return;
        elseif v13 and v19 then
            v19();
            return;
        else
            v16(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v14, 
                extraProps = {
                    title = v15
                }
            }));
            return;
        end;
    end, l_dependencyArray_0(v14, v15, v16, v18, v17, v19)));
end;