local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.Localization);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useTokens_0 = v5.Hooks.useTokens;
local _ = require(l_script_FirstAncestor_0.Types.TimedOptionType);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v3.CombinedFFlagShouldUseLegacyGamepadFocus;
local l_FFlagAXDurablesForMIS_0 = v3.FFlagAXDurablesForMIS;
local l_FFlagAXBlackbirdRoot_0 = v3.FFlagAXBlackbirdRoot;
local _ = function(v14) --[[ Line: 55 ]] --[[ Name: getPermanentPrice ]]
    for _, v16 in v14 do
        if v16.days == 0 then
            return v16.price;
        end;
    end;
    return 0;
end;
return function(v18) --[[ Line: 65 ]] --[[ Name: useWearTimeSelectedOptionViewModel ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_useLocalization_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), l_FFlagAXBlackbirdRoot_0 (copy)
    local v19 = false;
    local v20 = l_useTokens_0();
    local v21 = v4.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: l_Localization_0 (ref), l_LocalizationService_0 (ref)
        return l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    end, {});
    local v22, v23 = v4.useState(nil);
    v4.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: l_FFlagAXDurablesForMIS_0 (ref), v18 (copy), v23 (copy)
        if l_FFlagAXDurablesForMIS_0 and v18.selectedTimedOptionIndexInReducer ~= nil then
            v23(v18.selectedTimedOptionIndexInReducer);
            return;
        else
            for v24, v25 in v18.options do
                if v25.selected then
                    v23(v24);
                    return;
                end;
            end;
            return;
        end;
    end, {
        v18.options, 
        if l_FFlagAXDurablesForMIS_0 then v18.selectedTimedOptionIndexInReducer else nil
    });
    local v26 = if v22 then v18.options[v22] else nil;
    local v27 = if v26 then v26.days else 0;
    local v28 = l_useLocalization_0({
        infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite", 
        xDay = {
            "Feature.Durables.BottomBar.RentalDuration"; 
            num = v27
        }, 
        xDays = {
            "Feature.Durables.BottomBar.RentalDurationPlural"; 
            num = v27
        }, 
        xDayList = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay"; 
            num = v27
        }, 
        xDaysList = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays"; 
            num = v27
        }
    });
    local v29, v30 = v4.useState(false);
    local v31 = v4.useRef(nil);
    if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v18.triggerRef then
        v31 = v18.triggerRef;
    end;
    local v32;
    if v26 then
        v32 = v26.price;
    else
        for _, v34 in v18.options do
            if v34.days == 0 then
                v32 = v34.price;
                v19 = true;
            end;
            if v19 then
                break;
            end;
        end;
        if not v19 then
            v32 = 0;
        end;
    end;
    v19 = false;
    local v35 = nil;
    local v36 = nil;
    if v27 == 0 then
        v35 = v28.infinite;
        v36 = v28.infinite;
    elseif v27 == 1 then
        v35 = v28.xDay;
        v36 = v28.xDayList;
    else
        v35 = v28.xDays;
        v36 = v28.xDaysList;
    end;
    local v38 = v4.useCallback(function(v37) --[[ Line: 119 ]]
        -- upvalues: v23 (copy), v18 (copy), v30 (copy)
        v23(v37);
        if v18.onOptionActivated then
            v18.onOptionActivated(v37);
        end;
        v30(false);
    end, {
        v18.onOptionActivated
    });
    local v42 = v4.useMemo(function() --[[ Line: 127 ]]
        -- upvalues: v18 (copy), v22 (copy), l_FFlagAXBlackbirdRoot_0 (ref)
        local v39 = {};
        for v40, v41 in v18.options do
            v39[v40] = {
                days = v41.days, 
                price = v41.price, 
                selected = v40 == v22, 
                discountInformation = if l_FFlagAXBlackbirdRoot_0 then v41.discountInformation else nil
            };
        end;
        return v39;
    end, {
        v18.options, 
        v22
    });
    return {
        tokens = v20, 
        localization = v21, 
        selectedIndex = v22, 
        setSelectedIndex = v23, 
        selectedOption = v26, 
        days = v27, 
        localizedText = v28, 
        isOpen = v29, 
        setIsOpen = v30, 
        anchorRef = v31, 
        price = v32, 
        subLabelText = v35, 
        listLabelText = v36, 
        handleOptionActivated = v38, 
        updatedOptions = v42, 
        disableOptionSelection = v18.disableOptionSelection
    };
end;