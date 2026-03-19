local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.PeopleService);
local l_View_0 = v1.View;
local l_Icon_0 = v1.Icon;
local l_IconButton_0 = v1.IconButton;
local l_Button_0 = v1.Button;
local l_ButtonVariant_0 = v1.Enums.ButtonVariant;
local l_FillBehavior_0 = v1.Enums.FillBehavior;
local l_IconSize_0 = v1.Enums.IconSize;
local l_useTokens_0 = v1.Hooks.useTokens;
local l_useCursor_0 = v1.Hooks.useCursor;
local l_useSignalState_0 = v3.useSignalState;
local v16 = v5.getService("Flags");
local l_GetFFlagAddPeoplePageCardLayout_0 = v16.GetFFlagAddPeoplePageCardLayout;
local l_GetFFlagNewPeoplePageIcons_0 = v16.GetFFlagNewPeoplePageIcons;
local function v22(v19, v20, v21) --[[ Line: 45 ]] --[[ Name: useIconName ]]
    -- upvalues: v2 (copy)
    return v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v19 (copy), v20 (copy), v21 (copy)
        if v19.animatedIcon then
            return v20;
        elseif v19.icon then
            if v19.icon.off and v19.buttonState then
                if v21 then
                    return v19.icon.off;
                else
                    return v19.icon.on;
                end;
            else
                return v19.icon.on;
            end;
        else
            return "";
        end;
    end, {
        v20, 
        v21, 
        v19.icon, 
        v19.animatedIcon, 
        v19.buttonState
    });
end;
local function _(v23, v24) --[[ Line: 63 ]] --[[ Name: useTransparency ]]
    -- upvalues: v2 (copy)
    return v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v23 (copy), v24 (copy)
        if v23 then
            return v24.Color.Common.Shadow.Transparency;
        else
            return nil;
        end;
    end, {
        v23
    });
end;
local function _(v26, v27) --[[ Line: 73 ]] --[[ Name: useButtonSize ]]
    -- upvalues: v2 (copy), l_GetFFlagNewPeoplePageIcons_0 (copy)
    return v2.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v26 (copy), l_GetFFlagNewPeoplePageIcons_0 (ref), v27 (copy)
        if v26 then
            if l_GetFFlagNewPeoplePageIcons_0() then
                return UDim2.fromOffset(v27.Size.Size_1800 * 2, v27.Size.Size_1000);
            else
                return UDim2.new(0, v27.Size.Size_1800 * 2, 1, 0);
            end;
        else
            return UDim2.fromOffset(v27.Size.Size_1000, v27.Size.Size_1000);
        end;
    end, {
        v26
    });
end;
local function v37(v29) --[[ Line: 87 ]] --[[ Name: MemoizedIconElement ]]
    -- upvalues: l_useTokens_0 (copy), l_useSignalState_0 (copy), v4 (copy), v22 (copy), v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_ButtonVariant_0 (copy), l_Icon_0 (copy)
    local v30 = l_useTokens_0();
    local v31 = l_useSignalState_0(v29.animatedIcon or v4.createSignal(""));
    local v32 = l_useSignalState_0(v29.buttonState or v4.createSignal(false));
    local v33 = l_useSignalState_0(v29.isGrayedOut or v4.createSignal(false));
    local v34 = v22(v29, v31, v32);
    local v35 = v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v33 (copy), v30 (copy)
        if v33 then
            return v30.Color.Common.Shadow.Transparency;
        else
            return nil;
        end;
    end, {
        v33
    });
    local v36 = if v29.isBuilderIcon then nil else v35;
    return v2.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v34 (copy), v29 (copy), v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_ButtonVariant_0 (ref), v33 (copy), l_Icon_0 (ref), v36 (copy)
        if not v34 or v34 == "" then
            return nil;
        elseif v29.isBuilderIcon then
            return (v2.createElement(l_IconButton_0, {
                icon = v34, 
                size = l_IconSize_0.Medium, 
                LayoutOrder = v29.LayoutOrder, 
                Selectable = false, 
                variant = l_ButtonVariant_0.Utility, 
                isDisabled = v33, 
                onActivated = v29.onActivated, 
                ref = v29.onMount
            }));
        else
            return (v2.createElement(l_Icon_0, {
                name = v34, 
                size = l_IconSize_0.Medium, 
                LayoutOrder = v29.LayoutOrder, 
                style = {
                    Transparency = v36
                }
            }));
        end;
    end, {
        v29.isBuilderIcon, 
        v34, 
        v29.LayoutOrder, 
        v33, 
        v29.onActivated, 
        v29.onMount, 
        v36
    });
end;
local function _(v38, v39, v40, v41, v42) --[[ Line: 145 ]] --[[ Name: createTextElement ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy)
    if not v38 then
        return nil;
    else
        return v2.createElement(l_Button_0, {
            text = v38, 
            fillBehavior = l_FillBehavior_0.Fill, 
            Selectable = false, 
            variant = if v39 then l_ButtonVariant_0.Text else v40, 
            onActivated = v41, 
            LayoutOrder = v42
        });
    end;
end;
return function(v44) --[[ Line: 166 ]] --[[ Name: PersonButton ]]
    -- upvalues: l_useTokens_0 (copy), l_useSignalState_0 (copy), v4 (copy), v2 (copy), l_GetFFlagNewPeoplePageIcons_0 (copy), l_useCursor_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), l_View_0 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v37 (copy)
    local v45 = l_useTokens_0();
    local v46 = l_useSignalState_0(v44.isDisabled or v4.createSignal(false));
    local v47 = l_useSignalState_0(type(v44.text) == "function" and v44.text or v4.createSignal(v44.text));
    local v48 = l_useSignalState_0(type(v44.buttonVariant) == "function" and v44.buttonVariant or v4.createSignal(v44.buttonVariant));
    local v49 = v44.text ~= nil;
    local l_v49_0 = v49 --[[ copy: 6 -> 9 ]];
    local v51 = v2.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: l_v49_0 (copy), l_GetFFlagNewPeoplePageIcons_0 (ref), v45 (copy)
        if l_v49_0 then
            if l_GetFFlagNewPeoplePageIcons_0() then
                return UDim2.fromOffset(v45.Size.Size_1800 * 2, v45.Size.Size_1000);
            else
                return UDim2.new(0, v45.Size.Size_1800 * 2, 1, 0);
            end;
        else
            return UDim2.fromOffset(v45.Size.Size_1000, v45.Size.Size_1000);
        end;
    end, {
        v49
    });
    v49 = l_useCursor_0({
        radius = UDim.new(0, v45.Radius.Medium), 
        offset = v45.Size.Size_150, 
        borderWidth = v45.Stroke.Thicker
    });
    local l_onActivated_0 = v44.onActivated;
    local v53 = if not v47 then nil else v2.createElement(l_Button_0, {
        text = v47, 
        fillBehavior = l_FillBehavior_0.Fill, 
        Selectable = false, 
        variant = if v46 then l_ButtonVariant_0.Text else v48, 
        onActivated = l_onActivated_0, 
        LayoutOrder = 2
    });
    return v2.createElement(l_View_0, {
        tag = if l_GetFFlagAddPeoplePageCardLayout_0() then {
            ["radius-medium row align-y-center align-x-center"] = true, 
            ["bg-action-standard"] = not v44.text and not v44.isBackgroundTransparent
        } else {
            ["radius-medium row align-y-center align-x-center"] = v44.text ~= nil, 
            ["radius-medium row align-y-center align-x-center bg-action-standard"] = v44.text == nil
        }, 
        Size = v51, 
        LayoutOrder = v44.LayoutOrder, 
        onActivated = v44.onActivated, 
        isDisabled = v46, 
        selection = {
            SelectionImageObject = v49
        }, 
        ref = v44.onMount
    }, {
        Icon = v2.createElement(v37, {
            icon = v44.icon, 
            animatedIcon = v44.animatedIcon, 
            buttonState = v44.buttonState, 
            LayoutOrder = v44.LayoutOrder, 
            isGrayedOut = v44.isGrayedOut, 
            isBuilderIcon = v44.isBuilderIcon, 
            onActivated = v44.onActivated, 
            onMount = v44.onMount
        }), 
        Text = v53
    });
end;