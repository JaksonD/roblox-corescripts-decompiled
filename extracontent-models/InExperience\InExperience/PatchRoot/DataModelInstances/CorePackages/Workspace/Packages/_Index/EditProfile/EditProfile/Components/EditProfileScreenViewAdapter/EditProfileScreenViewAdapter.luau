local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Display);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v5 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_GetDisplayStore_0 = v3.GetDisplayStore;
local v8 = require(l_script_FirstAncestor_0.Hooks.useEditProfileScreenConfig);
local v9 = require(l_script_FirstAncestor_0.BaseComponents.EditProfileModal);
local v10 = require(l_script_FirstAncestor_0.BaseComponents.EditProfileScreen);
local v11 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
return function(v12) --[[ Line: 27 ]]
    -- upvalues: v8 (copy), l_GetDisplayStore_0 (copy), l_useTokens_0 (copy), v2 (copy), v5 (copy), v10 (copy), v9 (copy), v11 (copy)
    local l_params_0 = v12.navigation.state.params;
    local v14 = v8(l_params_0.screen);
    local v15 = l_GetDisplayStore_0(false);
    local v16 = l_useTokens_0();
    local v17 = v2.useRef(nil);
    local v18 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v17 (copy), v18 (copy)
        if v17.current and v17.current.focus and not v18.current then
            v18.current = true;
            v17.current.focus();
        end;
    end, {
        v17.current
    });
    local v20 = v2.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v17 (copy), v2 (ref)
        local v19 = {
            registerSaveHandler = v14.registerSaveHandler, 
            textBoxRef = v17
        };
        if v14.updateErrorState then
            v19.updateErrorState = v14.updateErrorState;
        end;
        return (v2.createElement(v14.component, v19));
    end, {
        v14.component, 
        v14.registerSaveHandler, 
        v17
    });
    local v21 = v5.Dictionary.join(v14, {
        component = v20, 
        isDisabled = v14.hasError == true
    });
    local v22 = v15.getDisplaySize(false) == Enum.DisplaySize.Small;
    local v23 = nil;
    v23 = if v22 then v2.createElement(v10, v21) else v2.createElement(v9, v21);
    return v11({
        onClose = v14.onClose
    }, {
        v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v16.Color.Common.Scrim.Transparency, 
            BackgroundColor3 = v16.Color.Common.Scrim.Color3, 
            Active = true, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = if not v22 then v14.onClose else nil
        }, {
            Content = v23
        })
    });
end;