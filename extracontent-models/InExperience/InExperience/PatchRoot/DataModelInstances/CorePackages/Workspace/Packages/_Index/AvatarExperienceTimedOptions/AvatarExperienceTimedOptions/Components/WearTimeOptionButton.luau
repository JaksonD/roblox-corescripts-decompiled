local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local _ = require(l_script_FirstAncestor_0.Types.TimedOptionType);
local v4 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v6.Hooks.useTokens;
local l_Text_0 = v6.Text;
local l_Enums_0 = v6.Enums;
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v2.CombinedFFlagShouldUseLegacyGamepadFocus;
return (v4.forwardRef(function(v11, v12) --[[ Line: 23 ]]
    -- upvalues: l_useTokens_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v4 (copy), l_useLocalization_0 (copy), v6 (copy), l_Enums_0 (copy), l_Text_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = nil;
    local v15 = nil;
    if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then
        v14 = v4.useRef(nil);
        v4.useEffect(function() --[[ Line: 31 ]]
            -- upvalues: v14 (ref), v11 (copy)
            local v16 = v14 and v14.current;
            if not v16 then
                return;
            else
                local v17 = if v11.nextSelectionDownRef then v11.nextSelectionDownRef.current else nil;
                if v17 then
                    v16.NextSelectionDown = v17;
                end;
                if not v11.nextSelectionDownRef then
                    return;
                else
                    local v26 = v16.SelectionGained:Connect(function() --[[ Line: 46 ]]
                        -- upvalues: v16 (copy)
                        local l_Parent_1 = v16.Parent;
                        while l_Parent_1 and not l_Parent_1:IsA("ScrollingFrame") do
                            l_Parent_1 = l_Parent_1.Parent;
                        end;
                        if l_Parent_1 and l_Parent_1:IsA("ScrollingFrame") then
                            local l_l_Parent_1_0 = l_Parent_1;
                            local l_Y_0 = v16.AbsolutePosition.Y;
                            local l_Y_1 = l_l_Parent_1_0.AbsolutePosition.Y;
                            local l_Y_2 = l_l_Parent_1_0.AbsoluteWindowSize.Y;
                            local l_Y_3 = v16.AbsoluteSize.Y;
                            local v24 = l_Y_0 - (l_Y_2 * 0.5 - l_Y_3 * 0.5 + l_Y_1);
                            local v25 = l_l_Parent_1_0.CanvasPosition.Y + v24;
                            l_l_Parent_1_0.CanvasPosition = Vector2.new(0, (math.max(0, v25)));
                        end;
                    end);
                    return function() --[[ Line: 63 ]]
                        -- upvalues: v26 (copy)
                        v26:Disconnect();
                    end;
                end;
            end;
        end, {
            v11.nextSelectionDownRef
        });
        v15 = v4.useCallback(function(v27) --[[ Line: 68 ]]
            -- upvalues: v14 (ref), v12 (copy)
            if v14 then
                v14.current = v27;
            end;
            if typeof(v12) == "function" then
                v12(v27);
                return;
            else
                if v12 then
                    v12.current = v27;
                end;
                return;
            end;
        end, {
            v12
        });
    end;
    local v28 = l_useLocalization_0({
        infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite", 
        xDay = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay"; 
            num = v11.option.days
        }, 
        xDays = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays"; 
            num = v11.option.days
        }
    });
    local v29 = nil;
    v29 = if v11.option.days == 0 then v28.infinite else if v11.option.days == 1 then v28.xDay else v28.xDays;
    return v4.createElement(v6.View, {
        tag = {
            ["row align-y-center gap-small padding-medium radius-medium stroke-standard"] = true, 
            ["stroke-thick"] = v11.option.selected, 
            ["stroke-system-contrast"] = v11.option.selected, 
            ["stroke-emphasis"] = not v11.option.selected
        }, 
        ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v15 else v12, 
        onActivated = v11.onActivated, 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.new(0, 0, 0, v13.Size.Size_1000), 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }, 
        selection = {
            Selectable = true
        }
    }, {
        DaysLabel = v4.createElement(l_Text_0, {
            tag = "auto-xy text-title-small content-emphasis", 
            Text = v29, 
            LayoutOrder = 1, 
            selection = {
                Selectable = false
            }
        }), 
        PriceTag = v4.createElement(v6.View, {
            tag = "row align-y-center gap-xsmall auto-xy", 
            LayoutOrder = 2
        }, {
            RobuxIcon = v4.createElement(v6.Icon, {
                name = l_Enums_0.IconName.Robux, 
                variant = l_Enums_0.IconVariant.Filled, 
                size = l_Enums_0.IconSize.XSmall, 
                LayoutOrder = 1
            }), 
            PriceLabel = v4.createElement(l_Text_0, {
                tag = "auto-xy text-body-small", 
                Text = tostring(v11.option.price), 
                LayoutOrder = 2, 
                selection = {
                    Selectable = false
                }
            })
        })
    });
end));