local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_withStyle_0 = v4.Style.withStyle;
local l_WearTimeSelectedOption_0 = v6.Components.WearTimeSelectedOption;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar.useBuyActionBarButtonProps);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v7.CombinedFFlagShouldUseLegacyGamepadFocus;
ActionBarWithTimedOptions = function(v16) --[[ Line: 35 ]] --[[ Name: ActionBarWithTimedOptions ]]
    -- upvalues: l_useTokens_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v2 (copy), l_withStyle_0 (copy), l_View_0 (copy), l_Focusable_0 (copy), l_WearTimeSelectedOption_0 (copy), v8 (copy)
    local v17 = l_useTokens_0();
    local v18 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    local v19 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v16 (copy)
        if v16.timedOptions then
            for _, v21 in v16.timedOptions do
                if v21.selected then
                    if v16.onSelectedDaysChanged then
                        v16.onSelectedDaysChanged(v21.days);
                        return;
                    else
                        break;
                    end;
                end;
            end;
        end;
    end, {
        v16.timedOptions, 
        v16.onSelectedDaysChanged
    });
    local v24 = v2.useCallback(function(v22) --[[ Line: 55 ]]
        -- upvalues: v16 (copy)
        if v16.onSelectedDaysChanged then
            local v23 = if v16.timedOptions[v22] then v16.timedOptions[v22].days else nil;
            if v23 == 0 then
                v16.onSelectedDaysChanged(nil);
                return;
            else
                v16.onSelectedDaysChanged(v23);
            end;
        end;
    end, {
        v16.onSelectedDaysChanged, 
        v16.timedOptions
    });
    return l_withStyle_0(function(v25) --[[ Line: 68 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), v17 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref), l_Focusable_0 (ref), v18 (copy), l_WearTimeSelectedOption_0 (ref), v16 (copy), v24 (copy), v19 (copy), v8 (ref)
        return v2.createElement(l_View_0, {
            tag = "size-full-0", 
            Size = UDim2.new(1, 0, 0, v17.Size.Size_1500)
        }, {
            ActionBarFrame = v2.createElement(l_View_0, {
                tag = "bg-surface-100 padding-top-small padding-x-small", 
                Size = UDim2.new(1, 0, 0, v17.Size.Size_1500), 
                Position = UDim2.new(0, 0, 1, -v17.Size.Size_1500)
            }, {
                FocusableContent = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    defaultChild = v18
                }, {
                    TimedOptions = v2.createElement(l_View_0, {
                        tag = "bg-surface-100", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, v17.Size.Size_2000, 0, v17.Size.Size_1000)
                    }, {
                        OptionMenu = v2.createElement(l_WearTimeSelectedOption_0, {
                            options = v16.timedOptions, 
                            onOptionActivated = v24, 
                            triggerRef = v19
                        })
                    }), 
                    ActionButton = v2.createElement(v8, {
                        Size = UDim2.new(0.5, -v17.Size.Size_250, 1, -v17.Size.Size_250), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, 0, 0, 0), 
                        LayoutOrder = 3, 
                        Font = v25.Font, 
                        buttonProps = v16.buttonProps, 
                        ref = v18, 
                        NextSelectionLeft = v19
                    })
                }) else nil, 
                TimedOptions = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(l_View_0, {
                    tag = "bg-surface-100", 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v17.Size.Size_2000, 0, v17.Size.Size_1000)
                }, {
                    OptionMenu = v2.createElement(l_WearTimeSelectedOption_0, {
                        options = v16.timedOptions, 
                        onOptionActivated = v24
                    })
                }) else nil, 
                ActionButton = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(v8, {
                    Size = UDim2.new(0.5, -v17.Size.Size_250, 1, -v17.Size.Size_250), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 3, 
                    Font = v25.Font, 
                    buttonProps = v16.buttonProps
                }) else nil
            })
        });
    end);
end;
return ActionBarWithTimedOptions;