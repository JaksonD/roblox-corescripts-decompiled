local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_VRService_0 = game:GetService("VRService");
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local v3 = require(l_Parent_0.NavigationRodux);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Responsive);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_Parent_0.RobloxAppEnums);
local v8 = require(l_Parent_0.RobloxAppHooks);
local l_AppPage_0 = v7.AppPage;
local l_NavigateDown_0 = v3.Thunks.NavigateDown;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_usePreferredInput_0 = v5.usePreferredInput;
local l_useRoactService_0 = v8.useRoactService;
return function() --[[ Line: 24 ]] --[[ Name: useOpenLink ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_usePreferredInput_0 (copy), v5 (copy), v4 (copy), l_VRService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v14 = l_useDispatch_0();
    local v15 = l_useRoactService_0(l_AppLinking_0);
    local v16 = l_usePreferredInput_0() == v5.Input.Directional;
    return v4.useCallback(function(v17, v18) --[[ Line: 29 ]]
        -- upvalues: v16 (copy), l_VRService_0 (ref), v15 (copy), v14 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v18 then
            if v16 or l_VRService_0.VREnabled then
                v15:openURL(v18);
                return;
            else
                v14(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = v18, 
                    extraProps = {
                        title = v17
                    }
                }));
            end;
        end;
    end, {
        v15, 
        v14, 
        v16
    });
end;