local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_useOverlay_0 = require(l_Parent_0.Foundation).Hooks.useOverlay;
local l_useFocusGuiObject_0 = require(l_Parent_0.ReactFocusNavigation).useFocusGuiObject;
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v4.useFocusNavigableSurfaceRegistryConnection;
local l_wasLastInputGamepad_0 = require(l_Parent_0.RoactUtils).wasLastInputGamepad;
return function(v8) --[[ Line: 14 ]]
    -- upvalues: l_useOverlay_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useFocusGuiObject_0 (copy), l_wasLastInputGamepad_0 (copy), v1 (copy)
    local v9 = l_useOverlay_0();
    l_useFocusNavigableSurfaceRegistryConnection_0(v8.current, l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay);
    local v10 = l_useFocusGuiObject_0();
    local v11 = l_wasLastInputGamepad_0();
    v1.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v9 (copy), v11 (copy), v10 (copy)
        if v8.current and v9 == nil and v11 then
            task.delay(0.1, function() --[[ Line: 24 ]]
                -- upvalues: v10 (ref), v8 (ref)
                v10(v8.current);
            end);
        end;
    end, {
        v10, 
        v9, 
        v11
    });
    return v9;
end;