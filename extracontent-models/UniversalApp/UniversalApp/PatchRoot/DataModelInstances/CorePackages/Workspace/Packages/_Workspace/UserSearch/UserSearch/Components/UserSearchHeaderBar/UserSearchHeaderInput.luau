local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.React);
local l_UserSearchBar_0 = require(l_Parent_0.SocialCommon).Components.UserSearchBar.UserSearchBar;
local v3 = game:DefineFastFlag("FixDoubleSubmit", false);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v5) --[[ Line: 21 ]] --[[ Name: UserSearchHeaderInput ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), v1 (copy), v3 (copy), l_UserSearchBar_0 (copy)
    local l_initialInputText_0 = v5.initialInputText;
    local l_searchPlaceholderText_0 = v5.searchPlaceholderText;
    local l_cancelText_0 = v5.cancelText;
    local l_onCancel_0 = v5.onCancel;
    local l_onSubmit_0 = v5.onSubmit;
    local l_captureFocusOnMount_0 = v5.captureFocusOnMount;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    if l_FFlagEnableLeftNavOnConsole_0 then
        v16 = v1.useRef("");
        v17 = v1.useRef("");
    else
        local v18, v19 = v1.useState(l_initialInputText_0);
        v12 = v18;
        v13 = v19;
        v18, v19 = v1.useState("");
        v14 = v18;
        v15 = v19;
    end;
    local v21 = v1.useCallback(function(v20) --[[ Line: 42 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), v17 (ref), v16 (ref), v13 (ref)
        if l_FFlagEnableLeftNavOnConsole_0 then
            v17.current = v16.current;
            v16.current = v20;
            return;
        else
            v13(v20);
            return;
        end;
    end, {});
    local v22 = v1.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), v16 (ref), v17 (ref), l_onSubmit_0 (copy), v12 (ref), v14 (ref), v15 (ref)
        if l_FFlagEnableLeftNavOnConsole_0 then
            if v16.current ~= v17.current then
                v17.current = v16.current;
                l_onSubmit_0(v16.current);
                return;
            end;
        elseif v12 ~= v14 then
            v15(v12);
            l_onSubmit_0(v12);
        end;
    end, {
        l_onSubmit_0, 
        if l_FFlagEnableLeftNavOnConsole_0 then nil else v12, 
        if l_FFlagEnableLeftNavOnConsole_0 then nil else v14
    });
    local v25 = v1.useCallback(function(v23, v24) --[[ Line: 72 ]]
        -- upvalues: v3 (ref), v22 (copy), l_onSubmit_0 (copy), v12 (ref)
        if v23 == false and v24 then
            if v3 then
                v22();
                return;
            else
                l_onSubmit_0(v12);
            end;
        end;
    end, {
        v12, 
        l_onSubmit_0
    });
    local v26 = v1.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v3 (ref), v22 (copy), l_onSubmit_0 (copy), v12 (ref)
        if v3 then
            v22();
            return;
        else
            l_onSubmit_0(v12);
            return;
        end;
    end, {
        v12, 
        l_onSubmit_0
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        maxSize = v1.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(400, 1e999)
        }), 
        userSearchBar = v1.createElement(l_UserSearchBar_0, {
            initialInputText = l_initialInputText_0, 
            cancelText = l_cancelText_0, 
            searchPlaceholderText = l_searchPlaceholderText_0, 
            captureFocusOnMount = l_captureFocusOnMount_0, 
            cancelCallback = l_onCancel_0, 
            textChangedCallback = v21, 
            focusChangedCallback = v25, 
            returnPressedFromOnScreenKeyboardCallback = v26
        })
    });
end;