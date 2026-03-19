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
local _ = function(v10) --[[ Line: 54 ]] --[[ Name: getPermanentPrice ]]
    for _, v12 in v10 do
        if v12.days == 0 then
            return v12.price;
        end;
    end;
    return 0;
end;
return function(v14) --[[ Line: 64 ]] --[[ Name: useWearTimeSelectedOptionViewModel ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_useLocalization_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy)
    local v15 = false;
    local v16 = l_useTokens_0();
    local v17 = v3.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: l_Localization_0 (ref), l_LocalizationService_0 (ref)
        return l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    end, {});
    local v18, v19 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v14 (copy), v19 (copy)
        for v20, v21 in v14.options do
            if v21.selected then
                v19(v20);
                return;
            end;
        end;
    end, {
        v14.options
    });
    local v22 = if v18 then v14.options[v18] else nil;
    local v23 = if v22 then v22.days else 0;
    local v24 = l_useLocalization_0({
        infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite", 
        xDay = {
            "Feature.Durables.BottomBar.RentalDuration"; 
            num = v23
        }, 
        xDays = {
            "Feature.Durables.BottomBar.RentalDurationPlural"; 
            num = v23
        }, 
        xDayList = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay"; 
            num = v23
        }, 
        xDaysList = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays"; 
            num = v23
        }
    });
    local v25, v26 = v3.useState(false);
    local v27 = v3.useRef(nil);
    if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v14.triggerRef then
        v27 = v14.triggerRef;
    end;
    local v28;
    if v22 then
        v28 = v22.price;
    else
        for _, v30 in v14.options do
            if v30.days == 0 then
                v28 = v30.price;
                v15 = true;
            end;
            if v15 then
                break;
            end;
        end;
        if not v15 then
            v28 = 0;
        end;
    end;
    v15 = false;
    local v31 = nil;
    local v32 = nil;
    if v23 == 0 then
        v31 = v24.infinite;
        v32 = v24.infinite;
    elseif v23 == 1 then
        v31 = v24.xDay;
        v32 = v24.xDayList;
    else
        v31 = v24.xDays;
        v32 = v24.xDaysList;
    end;
    local v34 = v3.useCallback(function(v33) --[[ Line: 114 ]]
        -- upvalues: v19 (copy), v14 (copy), v26 (copy)
        v19(v33);
        if v14.onOptionActivated then
            v14.onOptionActivated(v33);
        end;
        v26(false);
    end, {
        v14.onOptionActivated
    });
    local v38 = v3.useMemo(function() --[[ Line: 122 ]]
        -- upvalues: v14 (copy), v18 (copy)
        local v35 = {};
        for v36, v37 in v14.options do
            v35[v36] = {
                days = v37.days, 
                price = v37.price, 
                selected = v36 == v18
            };
        end;
        return v35;
    end, {
        v14.options, 
        v18
    });
    return {
        tokens = v16, 
        localization = v17, 
        selectedIndex = v18, 
        setSelectedIndex = v19, 
        selectedOption = v22, 
        days = v23, 
        localizedText = v24, 
        isOpen = v25, 
        setIsOpen = v26, 
        anchorRef = v27, 
        price = v28, 
        subLabelText = v31, 
        listLabelText = v32, 
        handleOptionActivated = v34, 
        updatedOptions = v38, 
        disableOptionSelection = v14.disableOptionSelection
    };
end;