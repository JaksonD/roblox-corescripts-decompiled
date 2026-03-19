local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.AvatarExperienceFlags);
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_Text_0 = v4.Text;
local l_Enums_0 = v4.Enums;
local _ = require(script.Parent.WearTimeList);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v1.CombinedFFlagShouldUseLegacyGamepadFocus;
return (v2.forwardRef(function(v10, v11) --[[ Line: 25 ]]
    -- upvalues: l_useTokens_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v2 (copy), l_useLocalization_0 (copy), v4 (copy), l_Enums_0 (copy), l_Text_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = nil;
    local v14 = nil;
    if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then
        v13 = v2.useRef(nil);
        v2.useEffect(function() --[[ Line: 33 ]]
            -- upvalues: v13 (ref), v10 (copy)
            local v15 = v13 and v13.current;
            if not v15 then
                return;
            else
                local v16 = if v10.nextSelectionDownRef then v10.nextSelectionDownRef.current else nil;
                if v16 then
                    v15.NextSelectionDown = v16;
                end;
                if not v10.nextSelectionDownRef then
                    return;
                else
                    local v25 = v15.SelectionGained:Connect(function() --[[ Line: 48 ]]
                        -- upvalues: v15 (copy)
                        local l_Parent_1 = v15.Parent;
                        while l_Parent_1 and not l_Parent_1:IsA("ScrollingFrame") do
                            l_Parent_1 = l_Parent_1.Parent;
                        end;
                        if l_Parent_1 and l_Parent_1:IsA("ScrollingFrame") then
                            local l_l_Parent_1_0 = l_Parent_1;
                            local l_Y_0 = v15.AbsolutePosition.Y;
                            local l_Y_1 = l_l_Parent_1_0.AbsolutePosition.Y;
                            local l_Y_2 = l_l_Parent_1_0.AbsoluteWindowSize.Y;
                            local l_Y_3 = v15.AbsoluteSize.Y;
                            local v23 = l_Y_0 - (l_Y_2 * 0.5 - l_Y_3 * 0.5 + l_Y_1);
                            local v24 = l_l_Parent_1_0.CanvasPosition.Y + v23;
                            l_l_Parent_1_0.CanvasPosition = Vector2.new(0, (math.max(0, v24)));
                        end;
                    end);
                    return function() --[[ Line: 65 ]]
                        -- upvalues: v25 (copy)
                        v25:Disconnect();
                    end;
                end;
            end;
        end, {
            v10.nextSelectionDownRef
        });
        v14 = v2.useCallback(function(v26) --[[ Line: 70 ]]
            -- upvalues: v13 (ref), v11 (copy)
            if v13 then
                v13.current = v26;
            end;
            if typeof(v11) == "function" then
                v11(v26);
                return;
            else
                if v11 then
                    v11.current = v26;
                end;
                return;
            end;
        end, {
            v11
        });
    end;
    local v27 = l_useLocalization_0({
        infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite", 
        xDay = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay"; 
            num = v10.option.days
        }, 
        xDays = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays"; 
            num = v10.option.days
        }
    });
    local v28 = nil;
    v28 = if v10.option.days == 0 then v27.infinite else if v10.option.days == 1 then v27.xDay else v27.xDays;
    return v2.createElement(v4.View, {
        tag = {
            ["row align-y-center gap-small padding-medium radius-medium stroke-standard"] = true, 
            ["stroke-thick"] = v10.option.selected, 
            ["stroke-system-contrast"] = v10.option.selected, 
            ["stroke-emphasis"] = not v10.option.selected
        }, 
        ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v14 else v11, 
        onActivated = v10.onActivated, 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.new(0, 0, 0, v12.Size.Size_1000), 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }, 
        selection = {
            Selectable = true
        }
    }, {
        DaysLabel = v2.createElement(l_Text_0, {
            tag = "auto-xy text-title-small content-emphasis", 
            Text = v28, 
            LayoutOrder = 1, 
            selection = {
                Selectable = false
            }
        }), 
        PriceTag = v2.createElement(v4.View, {
            tag = "row align-y-center gap-xsmall auto-xy", 
            LayoutOrder = 2
        }, {
            RobuxIcon = v2.createElement(v4.Icon, {
                name = l_Enums_0.IconName.Robux, 
                variant = l_Enums_0.IconVariant.Filled, 
                size = l_Enums_0.IconSize.XSmall, 
                LayoutOrder = 1
            }), 
            PriceLabel = v2.createElement(l_Text_0, {
                tag = "auto-xy text-body-small", 
                Text = tostring(v10.option.price), 
                LayoutOrder = 2, 
                selection = {
                    Selectable = false
                }
            })
        })
    });
end));