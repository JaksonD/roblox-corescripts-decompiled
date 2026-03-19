local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("VerifiedParentalConsentDialog").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v3.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_useLastInputMethod_0 = v3.useLastInputMethod;
local l_useAutoFocus_0 = v3.useAutoFocus;
local l_useDescendantHasFocus_0 = v3.useDescendantHasFocus;
return function(v10) --[[ Line: 22 ]] --[[ Name: useFocusNavigationSurface ]]
    -- upvalues: v2 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_useAutoFocus_0 (copy), l_useDescendantHasFocus_0 (copy), l_useLastInputMethod_0 (copy), l_GuiService_0 (copy)
    local v11, v12 = v2.useState(nil);
    local v13 = l_useRegisterFocusNavigableSurface_0();
    local v14 = l_useDeRegisterFocusNavigableSurface_0();
    local v15 = l_useAutoFocus_0({
        v11
    }, 0.1);
    local v16 = l_useDescendantHasFocus_0(v11);
    local v17 = l_useLastInputMethod_0();
    local v18 = true;
    if v17 ~= "Gamepad" then
        v18 = v17 == "Keyboard";
    end;
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v11 (copy), v13 (copy), v10 (copy), l_GuiService_0 (ref), v14 (copy)
        if v11 then
            v13(v10.focusNavigableSurfaceIdentifier, v11);
            l_GuiService_0:AddSelectionParent(v10.selectionGroupName, v11);
        else
            v14(v10.focusNavigableSurfaceIdentifier, v11);
            l_GuiService_0:RemoveSelectionGroup(v10.selectionGroupName);
            l_GuiService_0.SelectedCoreObject = nil;
        end;
        return function() --[[ Line: 42 ]]
            -- upvalues: v14 (ref), v10 (ref), v11 (ref), l_GuiService_0 (ref)
            v14(v10.focusNavigableSurfaceIdentifier, v11);
            l_GuiService_0:RemoveSelectionGroup(v10.selectionGroupName);
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end, {
        v11, 
        v10.focusNavigableSurfaceIdentifier, 
        v10.selectionGroupName
    });
    local v19 = v18 and v11 and not v16;
    v2.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy), v15 (copy)
        local v20 = nil;
        if v19 then
            v20 = v15();
        end;
        return function() --[[ Line: 57 ]]
            -- upvalues: v20 (ref)
            if v20 then
                v20.cancel();
            end;
        end;
    end, {
        v19, 
        v15
    });
    return v12;
end;