local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Localization);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v2.CombinedFFlagShouldUseLegacyGamepadFocus;
local l_FFlagAXDurablesForMIS_0 = v2.FFlagAXDurablesForMIS;
local _ = function(v11) --[[ Line: 56 ]] --[[ Name: getPermanentPrice ]]
    for _, v13 in v11 do
        if v13.days == 0 then
            return v13.price;
        end;
    end;
    return 0;
end;
return function(v15) --[[ Line: 66 ]] --[[ Name: useWearTimeSelectedOptionViewModel ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_useLocalization_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy)
    local v16 = false;
    local v17 = l_useTokens_0();
    local v18 = v3.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: l_Localization_0 (ref), l_LocalizationService_0 (ref)
        return l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    end, {});
    local v19, v20 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: l_FFlagAXDurablesForMIS_0 (ref), v15 (copy), v20 (copy)
        if l_FFlagAXDurablesForMIS_0 and v15.selectedTimedOptionIndexInReducer ~= nil then
            v20(v15.selectedTimedOptionIndexInReducer);
            return;
        else
            for v21, v22 in v15.options do
                if v22.selected then
                    v20(v21);
                    return;
                end;
            end;
            return;
        end;
    end, {
        v15.options, 
        if l_FFlagAXDurablesForMIS_0 then v15.selectedTimedOptionIndexInReducer else nil
    });
    local v23 = if v19 then v15.options[v19] else nil;
    local v24 = if v23 then v23.days else 0;
    local v25 = l_useLocalization_0({
        infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite", 
        xDay = {
            "Feature.Durables.BottomBar.RentalDuration"; 
            num = v24
        }, 
        xDays = {
            "Feature.Durables.BottomBar.RentalDurationPlural"; 
            num = v24
        }, 
        xDayList = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay"; 
            num = v24
        }, 
        xDaysList = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays"; 
            num = v24
        }
    });
    local v26, v27 = v3.useState(false);
    local v28 = v3.useRef(nil);
    if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v15.triggerRef then
        v28 = v15.triggerRef;
    end;
    local v29;
    if v23 then
        v29 = v23.price;
    else
        for _, v31 in v15.options do
            if v31.days == 0 then
                v29 = v31.price;
                v16 = true;
            end;
            if v16 then
                break;
            end;
        end;
        if not v16 then
            v29 = 0;
        end;
    end;
    v16 = false;
    local v32 = nil;
    local v33 = nil;
    if v24 == 0 then
        v32 = v25.infinite;
        v33 = v25.infinite;
    elseif v24 == 1 then
        v32 = v25.xDay;
        v33 = v25.xDayList;
    else
        v32 = v25.xDays;
        v33 = v25.xDaysList;
    end;
    local v35 = v3.useCallback(function(v34) --[[ Line: 120 ]]
        -- upvalues: v20 (copy), v15 (copy), v27 (copy)
        v20(v34);
        if v15.onOptionActivated then
            v15.onOptionActivated(v34);
        end;
        v27(false);
    end, {
        v15.onOptionActivated
    });
    local v39 = v3.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: v15 (copy), v19 (copy)
        local v36 = {};
        for v37, v38 in v15.options do
            v36[v37] = {
                days = v38.days, 
                price = v38.price, 
                selected = v37 == v19
            };
        end;
        return v36;
    end, {
        v15.options, 
        v19
    });
    return {
        tokens = v17, 
        localization = v18, 
        selectedIndex = v19, 
        setSelectedIndex = v20, 
        selectedOption = v23, 
        days = v24, 
        localizedText = v25, 
        isOpen = v26, 
        setIsOpen = v27, 
        anchorRef = v28, 
        price = v29, 
        subLabelText = v32, 
        listLabelText = v33, 
        handleOptionActivated = v35, 
        updatedOptions = v39, 
        disableOptionSelection = v15.disableOptionSelection
    };
end;