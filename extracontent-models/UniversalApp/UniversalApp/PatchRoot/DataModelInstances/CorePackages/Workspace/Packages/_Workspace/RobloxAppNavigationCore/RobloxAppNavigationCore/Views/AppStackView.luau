local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Navigation);
local l_useStackScreens_0 = v2.useStackScreens;
local l_ViewState_0 = v2.ViewState;
local v5 = require(script.Parent.AppStackCard);
local v6 = {
    overlayTransparency = 0.7, 
    overlayColor3 = Color3.new(0, 0, 0)
};
return function(v7) --[[ Line: 30 ]] --[[ Name: AppStackView ]]
    -- upvalues: l_useStackScreens_0 (copy), v1 (copy), v6 (copy), v5 (copy), l_ViewState_0 (copy)
    local v8 = l_useStackScreens_0({
        navigation = v7.navigation, 
        descriptors = v7.descriptors
    });
    local v11 = v1.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v8 (copy)
        for v9 = #v8, 1, -1 do
            local l_descriptor_0 = v8[v9].descriptor;
            if not l_descriptor_0.options.transparent and not l_descriptor_0.options.overlayEnabled then
                return v9;
            end;
        end;
        return 0;
    end, {
        v8
    });
    local v12 = {};
    local v13 = v8[#v8];
    if v13 then
        local l_options_0 = v13.descriptor.options;
        if l_options_0.absorbInput == nil or l_options_0.absorbInput then
            v12.AbsorbInput = v1.createElement("TextButton", {
                Active = true, 
                Selectable = l_options_0.absorbInputSelectable or false, 
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Text = "", 
                ZIndex = #v8 * 2 - 1
            });
        end;
        if l_options_0.overlayEnabled then
            v12.Overlay = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = l_options_0.overlayTransparency or v6.overlayTransparency, 
                BackgroundColor3 = v6.overlayColor3, 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                ZIndex = #v8 * 2 - 1
            });
        end;
    end;
    for v15, v16 in v8 do
        v12[v16.descriptor.key] = v1.createElement(v5, {
            isActive = v15 == #v8, 
            descriptor = v16.descriptor, 
            screenProps = v7.screenProps, 
            isVisible = v11 <= v15, 
            ZIndex = v15 * 2, 
            onAnimationComplete = function() --[[ Line: 85 ]] --[[ Name: onAnimationComplete ]]
                -- upvalues: v16 (copy), l_ViewState_0 (ref)
                if v16.viewState == l_ViewState_0.Opening or v16.viewState == l_ViewState_0.Opened then
                    v16.setOpened();
                    return;
                else
                    if v16.viewState == l_ViewState_0.Closing then
                        v16.setClosed();
                    end;
                    return;
                end;
            end
        });
    end;
    return v1.createElement(v1.Fragment, nil, v12);
end;