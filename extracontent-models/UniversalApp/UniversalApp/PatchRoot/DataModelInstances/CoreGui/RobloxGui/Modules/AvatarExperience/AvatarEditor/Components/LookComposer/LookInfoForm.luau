local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetails);
local v12 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit);
local v16 = game:DefineFastString("AXFormPositionWhenKeyboardVisible", "-0.4");
local v17 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v18 = {
    toastMessage = "Feature.Avatar.Toast.AvatarTitleExceedMaximum", 
    isLocalized = false, 
    toastType = v9.InformationMessage
};
local v19 = {
    toastMessage = "Feature.Avatar.Toast.AvatarCaptionExceedMaximum", 
    isLocalized = false, 
    toastType = v9.InformationMessage
};
local function _(v20, v21) --[[ Line: 46 ]] --[[ Name: getSafePositionFromString ]]
    return tonumber(v20) or v21;
end;
return function(v23) --[[ Line: 51 ]] --[[ Name: LookInfoForm ]]
    -- upvalues: l_useDispatch_0 (copy), l_useStyle_0 (copy), v3 (copy), l_useDesignTokens_0 (copy), v15 (copy), v12 (copy), l_useSelector_0 (copy), v10 (copy), v17 (copy), v11 (copy), v8 (copy), v18 (copy), v19 (copy), l_UserInputService_0 (copy), v16 (copy), l_ExternalEventConnection_0 (copy)
    local v24 = l_useDispatch_0();
    local v25 = l_useStyle_0();
    local v26 = v3.useRef(nil);
    local v27 = v3.useRef(nil);
    local v28 = l_useDesignTokens_0();
    local v29, v30 = v3.useState(false);
    local v31, v32 = v3.useState(UDim2.new(0, 0, 0, 0));
    local v33 = v3.useRef(nil);
    local v34 = if v15() then v12({
        avatarTitle = "Feature.Avatar.Placeholder.NameYourAvatar", 
        describeAvatar = "Feature.Avatar.Placeholder.WriteAvatarCaption"
    }) else nil;
    local v36 = l_useSelector_0(function(v35) --[[ Line: 67 ]]
        -- upvalues: v10 (ref)
        return v35.AvatarExperience.AvatarScene.Looks[v10.DraftLookId];
    end);
    local v37 = l_useSelector_0(v17);
    v3.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v36 (copy), v26 (copy), v27 (copy)
        if v36 and v26.current and v27.current then
            v26.current.Text = v36.name or "";
            v27.current.Text = v36.description or "";
        end;
    end, {
        v36, 
        v26, 
        v27
    });
    v3.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v26 (copy)
        if v26.current then
            v26.current:CaptureFocus();
        end;
    end, {});
    local v38 = v3.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v26 (copy), v27 (copy), v24 (copy), v11 (ref), v10 (ref)
        if v26.current and v27.current then
            v24(v11(v10.DraftLookId, {
                name = v26.current.Text, 
                description = v27.current.Text
            }));
        end;
    end, {
        v26, 
        v27, 
        v24
    });
    local v43 = v3.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v26 (copy), v27 (copy), v23 (copy), v24 (copy), v8 (ref), v18 (ref), v19 (ref)
        local v39 = if v26 and v26.current then string.len(v26.current.Text) else 0;
        local v40 = if v27 and v27.current then string.len(v27.current.Text) else 0;
        local v41 = false;
        if v39 >= 1 then
            v41 = v39 <= 50;
        end;
        local v42 = v40 < 1001;
        if v23.disableNextButton then
            v23.disableNextButton(not (v41 and v42));
        end;
        if v39 > 50 then
            v24(v8(v18));
        end;
        if v40 >= 1001 then
            v24(v8(v19));
        end;
    end, {
        v36, 
        v26, 
        v27, 
        v24
    });
    local v44 = v3.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v23 (copy), v26 (copy), v43 (copy)
        if v23.onTitleChange and v26 and v26.current then
            v23.onTitleChange(v26.current.Text);
        end;
        if v43 then
            v43();
        end;
    end, {
        v26, 
        v23.onTitleChange, 
        v43
    });
    local v45 = v3.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v23 (copy), v27 (copy), v43 (copy)
        if v23.onSubtitleChange and v27 and v27.current then
            v23.onSubtitleChange(v27.current.Text);
        end;
        if v43 then
            v43();
        end;
    end, {
        v27, 
        v23.onSubtitleChange, 
        v43
    });
    local v47 = v3.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v30 (copy), l_UserInputService_0 (ref)
        v30(function(v46) --[[ Line: 135 ]]
            -- upvalues: l_UserInputService_0 (ref)
            if v46 ~= l_UserInputService_0.OnScreenKeyboardVisible then
                return l_UserInputService_0.OnScreenKeyboardVisible;
            else
                return v46;
            end;
        end);
    end, {
        v37
    });
    v3.useEffect(function() --[[ Line: 143 ]]
        -- upvalues: v37 (copy), v16 (ref), v29 (copy), v32 (copy)
        if not v37 then
            return;
        else
            local v48 = tonumber(v16) or -0.4;
            local v49 = if v29 then UDim2.new(0, 0, v48, 0) else UDim2.new(0, 0, 0, 0);
            v32(v49);
            return;
        end;
    end, {
        v29, 
        v37
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v25.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Position = if v37 then v31 else nil, 
        ref = if v37 then v33 else nil
    }, {
        KeyboardConnection = if v37 then v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"), 
            callback = v47
        }) else nil, 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v28.Global.Space_150), 
            PaddingBottom = UDim.new(0, v28.Global.Space_150), 
            PaddingLeft = UDim.new(0, v28.Global.Space_150), 
            PaddingRight = UDim.new(0, v28.Global.Space_150)
        }), 
        ListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, v28.Global.Space_150), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        NameBox = v3.createElement("TextBox", {
            ref = v26, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = v25.Font.Header2.Font, 
            ClearTextOnFocus = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v25.Font.BaseSize * v25.Font.Header2.RelativeSize, 
            TextColor3 = v25.Theme.TextEmphasis.Color, 
            PlaceholderColor3 = v25.Theme.TextDefault.Color, 
            PlaceholderText = if v15() then v34.avatarTitle else "Name your Avatar", 
            Interactable = v23.interactable, 
            LayoutOrder = 1, 
            [v3.Event.FocusLost] = v38, 
            [v3.Change.Text] = v44
        }), 
        Spacer = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = v25.Theme.Divider.Color, 
            BackgroundTransparency = v25.Theme.Divider.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }), 
        DescriptionBox = v3.createElement("TextBox", {
            ref = v27, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            MultiLine = true, 
            ClearTextOnFocus = false, 
            Font = v25.Font.Body.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v25.Font.BaseSize * v25.Font.Body.RelativeSize, 
            TextColor3 = v25.Theme.TextDefault.Color, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            PlaceholderColor3 = v25.Theme.TextDefault.Color, 
            PlaceholderText = if v15() then v34.describeAvatar else "Describe your Avatar (Optional)", 
            Interactable = v23.interactable, 
            LayoutOrder = 3, 
            [v3.Event.FocusLost] = v38, 
            [v3.Change.Text] = v45
        })
    });
end;