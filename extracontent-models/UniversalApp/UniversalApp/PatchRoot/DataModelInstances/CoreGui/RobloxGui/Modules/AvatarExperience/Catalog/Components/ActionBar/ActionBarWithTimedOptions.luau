local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTimedOptions);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_withStyle_0 = v4.Style.withStyle;
local l_WearTimeSelectedOption_0 = v8.WearTimeSelectedOption;
local l_SetSelectedTimedOption_0 = v9.State.Actions.SetSelectedTimedOption;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar.useBuyActionBarButtonProps);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v10.CombinedFFlagShouldUseLegacyGamepadFocus;
local l_FFlagAXDurablesForMIS_0 = v10.FFlagAXDurablesForMIS;
ActionBarWithTimedOptions = function(v21) --[[ Line: 42 ]] --[[ Name: ActionBarWithTimedOptions ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_useDispatch_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v2 (copy), l_SetSelectedTimedOption_0 (copy), l_withStyle_0 (copy), l_View_0 (copy), l_Focusable_0 (copy), l_WearTimeSelectedOption_0 (copy), v11 (copy)
    local v22 = l_useTokens_0();
    local v23 = if l_FFlagAXDurablesForMIS_0 then l_useDispatch_0() else nil;
    local v24 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    local v25 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v21 (copy), l_FFlagAXDurablesForMIS_0 (ref)
        local v26 = false;
        if v21.timedOptions then
            if l_FFlagAXDurablesForMIS_0 then
                if v21.selectedTimedOptionIndexInReducer ~= nil then
                    local v27 = v21.timedOptions[v21.selectedTimedOptionIndexInReducer];
                    if v27 and v21.onSelectedDaysChanged then
                        v21.onSelectedDaysChanged(v27.days);
                        return;
                    end;
                else
                    for _, v29 in v21.timedOptions do
                        if v29.selected then
                            if v21.onSelectedDaysChanged then
                                v21.onSelectedDaysChanged(v29.days);
                                return;
                            else
                                v26 = true;
                            end;
                        end;
                        if v26 then
                            break;
                        end;
                    end;
                    if not v26 then
                        return;
                    end;
                end;
            else
                for _, v31 in v21.timedOptions do
                    if v31.selected then
                        if v21.onSelectedDaysChanged then
                            v21.onSelectedDaysChanged(v31.days);
                            return;
                        else
                            break;
                        end;
                    end;
                end;
            end;
        end;
        v26 = false;
    end, {
        v21.timedOptions, 
        v21.onSelectedDaysChanged, 
        if l_FFlagAXDurablesForMIS_0 then v21.selectedTimedOptionIndexInReducer else nil
    });
    local v34 = v2.useCallback(function(v32) --[[ Line: 89 ]]
        -- upvalues: v21 (copy), l_FFlagAXDurablesForMIS_0 (ref), v23 (copy), l_SetSelectedTimedOption_0 (ref)
        if v21.onSelectedDaysChanged then
            local v33 = if v21.timedOptions[v32] then v21.timedOptions[v32].days else nil;
            if v33 == 0 then
                v21.onSelectedDaysChanged(nil);
            else
                v21.onSelectedDaysChanged(v33);
            end;
            if l_FFlagAXDurablesForMIS_0 and v23 and v21.itemId and v21.itemType then
                v23(l_SetSelectedTimedOption_0({
                    itemId = v21.itemId, 
                    itemType = v21.itemType, 
                    selectedTimedOptionIndex = v32
                }));
            end;
        end;
    end, {
        v21.onSelectedDaysChanged, 
        v21.timedOptions, 
        if l_FFlagAXDurablesForMIS_0 then v21.itemId else nil, 
        if l_FFlagAXDurablesForMIS_0 then v21.itemType else nil, 
        if l_FFlagAXDurablesForMIS_0 then v23 else nil
    });
    return l_withStyle_0(function(v35) --[[ Line: 118 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), v22 (copy), l_FFlagAXDurablesForMIS_0 (ref), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref), l_Focusable_0 (ref), v24 (copy), l_WearTimeSelectedOption_0 (ref), v21 (copy), v34 (copy), v25 (copy), v11 (ref)
        return v2.createElement(l_View_0, {
            tag = "size-full-0", 
            Size = UDim2.new(1, 0, 0, v22.Size.Size_1500)
        }, {
            ActionBarFrame = v2.createElement(l_View_0, {
                tag = l_FFlagAXDurablesForMIS_0 and "padding-x-xlarge padding-top-large bg-surface-0" or "padding-left-large padding-right-large padding-top-small bg-surface-0", 
                Size = if l_FFlagAXDurablesForMIS_0 then UDim2.new(1, 0, 0, v22.Size.Size_1800) else UDim2.new(1, 0, 0, v22.Size.Size_1500), 
                Position = if l_FFlagAXDurablesForMIS_0 then UDim2.new(0, 0, 1, -v22.Size.Size_1800) else UDim2.new(0, 0, 1, -v22.Size.Size_1500)
            }, {
                FocusableContent = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    defaultChild = v24
                }, {
                    TimedOptions = v2.createElement(l_View_0, {
                        tag = l_FFlagAXDurablesForMIS_0 and "bg-surface-0" or "bg-surface-100", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, v22.Size.Size_2000, 0, v22.Size.Size_1000), 
                        Position = if l_FFlagAXDurablesForMIS_0 then UDim2.new(0, 0, 0, -v22.Size.Size_200) else nil
                    }, {
                        OptionMenu = v2.createElement(l_WearTimeSelectedOption_0, {
                            options = v21.timedOptions, 
                            onOptionActivated = v34, 
                            triggerRef = v25, 
                            selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v21.selectedTimedOptionIndexInReducer else nil
                        })
                    }), 
                    ActionButton = v2.createElement(v11, {
                        Size = if l_FFlagAXDurablesForMIS_0 then UDim2.new(0.5, -v22.Size.Size_250, 0, v22.Size.Size_1000) else UDim2.new(0.5, -v22.Size.Size_250, 1, -v22.Size.Size_250), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, 0, 0, 0), 
                        LayoutOrder = 3, 
                        Font = v35.Font, 
                        buttonProps = v21.buttonProps, 
                        ref = v24, 
                        NextSelectionLeft = v25
                    })
                }) else nil, 
                TimedOptions = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(l_View_0, {
                    tag = "bg-surface-0", 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v22.Size.Size_2000, 0, v22.Size.Size_1000), 
                    Position = if l_FFlagAXDurablesForMIS_0 then UDim2.new(0, 0, 0, -v22.Size.Size_200) else nil
                }, {
                    OptionMenu = v2.createElement(l_WearTimeSelectedOption_0, {
                        options = v21.timedOptions, 
                        selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v21.selectedTimedOptionIndexInReducer else nil, 
                        onOptionActivated = v34
                    })
                }) else nil, 
                ActionButton = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(v11, {
                    Size = if l_FFlagAXDurablesForMIS_0 then UDim2.new(0.5, -v22.Size.Size_250, 0, v22.Size.Size_1000) else UDim2.new(0.5, -v22.Size.Size_250, 1, -v22.Size.Size_250), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 3, 
                    Font = v35.Font, 
                    buttonProps = v21.buttonProps
                }) else nil
            })
        });
    end);
end;
return ActionBarWithTimedOptions;