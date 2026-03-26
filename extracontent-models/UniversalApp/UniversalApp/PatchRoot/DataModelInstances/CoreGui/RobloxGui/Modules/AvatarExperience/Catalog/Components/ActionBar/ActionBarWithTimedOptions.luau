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
local l_FFlagAXDurablesForMIS_0 = v7.FFlagAXDurablesForMIS;
ActionBarWithTimedOptions = function(v17) --[[ Line: 37 ]] --[[ Name: ActionBarWithTimedOptions ]]
    -- upvalues: l_useTokens_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v2 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_withStyle_0 (copy), l_View_0 (copy), l_Focusable_0 (copy), l_WearTimeSelectedOption_0 (copy), v8 (copy)
    local v18 = l_useTokens_0();
    local v19 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    local v20 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v17 (copy), l_FFlagAXDurablesForMIS_0 (ref)
        local v21 = false;
        if v17.timedOptions then
            if l_FFlagAXDurablesForMIS_0 then
                if v17.selectedTimedOptionIndexInReducer ~= nil then
                    local v22 = v17.timedOptions[v17.selectedTimedOptionIndexInReducer];
                    if v22 and v17.onSelectedDaysChanged then
                        v17.onSelectedDaysChanged(v22.days);
                        return;
                    end;
                else
                    for _, v24 in v17.timedOptions do
                        if v24.selected then
                            if v17.onSelectedDaysChanged then
                                v17.onSelectedDaysChanged(v24.days);
                                return;
                            else
                                v21 = true;
                            end;
                        end;
                        if v21 then
                            break;
                        end;
                    end;
                    if not v21 then
                        return;
                    end;
                end;
            else
                for _, v26 in v17.timedOptions do
                    if v26.selected then
                        if v17.onSelectedDaysChanged then
                            v17.onSelectedDaysChanged(v26.days);
                            return;
                        else
                            break;
                        end;
                    end;
                end;
            end;
        end;
        v21 = false;
    end, {
        v17.timedOptions, 
        v17.onSelectedDaysChanged, 
        if l_FFlagAXDurablesForMIS_0 then v17.selectedTimedOptionIndexInReducer else nil
    });
    local v29 = v2.useCallback(function(v27) --[[ Line: 82 ]]
        -- upvalues: v17 (copy)
        if v17.onSelectedDaysChanged then
            local v28 = if v17.timedOptions[v27] then v17.timedOptions[v27].days else nil;
            if v28 == 0 then
                v17.onSelectedDaysChanged(nil);
                return;
            else
                v17.onSelectedDaysChanged(v28);
            end;
        end;
    end, {
        v17.onSelectedDaysChanged, 
        v17.timedOptions
    });
    return l_withStyle_0(function(v30) --[[ Line: 95 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), v18 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref), l_Focusable_0 (ref), v19 (copy), l_WearTimeSelectedOption_0 (ref), v17 (copy), v29 (copy), v20 (copy), l_FFlagAXDurablesForMIS_0 (ref), v8 (ref)
        return v2.createElement(l_View_0, {
            tag = "size-full-0", 
            Size = UDim2.new(1, 0, 0, v18.Size.Size_1500)
        }, {
            ActionBarFrame = v2.createElement(l_View_0, {
                tag = "bg-surface-100 padding-top-small padding-x-small", 
                Size = UDim2.new(1, 0, 0, v18.Size.Size_1500), 
                Position = UDim2.new(0, 0, 1, -v18.Size.Size_1500)
            }, {
                FocusableContent = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    defaultChild = v19
                }, {
                    TimedOptions = v2.createElement(l_View_0, {
                        tag = "bg-surface-100", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, v18.Size.Size_2000, 0, v18.Size.Size_1000)
                    }, {
                        OptionMenu = v2.createElement(l_WearTimeSelectedOption_0, {
                            options = v17.timedOptions, 
                            onOptionActivated = v29, 
                            triggerRef = v20, 
                            selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v17.selectedTimedOptionIndexInReducer else nil
                        })
                    }), 
                    ActionButton = v2.createElement(v8, {
                        Size = UDim2.new(0.5, -v18.Size.Size_250, 1, -v18.Size.Size_250), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, 0, 0, 0), 
                        LayoutOrder = 3, 
                        Font = v30.Font, 
                        buttonProps = v17.buttonProps, 
                        ref = v19, 
                        NextSelectionLeft = v20
                    })
                }) else nil, 
                TimedOptions = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(l_View_0, {
                    tag = "bg-surface-100", 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v18.Size.Size_2000, 0, v18.Size.Size_1000)
                }, {
                    OptionMenu = v2.createElement(l_WearTimeSelectedOption_0, {
                        options = v17.timedOptions, 
                        selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v17.selectedTimedOptionIndexInReducer else nil, 
                        onOptionActivated = v29
                    })
                }) else nil, 
                ActionButton = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(v8, {
                    Size = UDim2.new(0.5, -v18.Size.Size_250, 1, -v18.Size.Size_250), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 3, 
                    Font = v30.Font, 
                    buttonProps = v17.buttonProps
                }) else nil
            })
        });
    end);
end;
return ActionBarWithTimedOptions;