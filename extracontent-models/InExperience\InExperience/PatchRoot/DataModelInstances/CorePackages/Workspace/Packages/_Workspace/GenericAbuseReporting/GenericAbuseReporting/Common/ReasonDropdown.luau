local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_DropdownMenu_0 = v3.App.Menu.DropdownMenu;
return function(v6) --[[ Line: 30 ]] --[[ Name: ReasonDropdown ]]
    -- upvalues: v2 (copy), v1 (copy), l_useLocalization_0 (copy), l_DropdownMenu_0 (copy)
    local v9 = v2.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v1 (ref), v6 (copy)
        local v8 = v1.Dictionary.map(v6.options, function(v7) --[[ Line: 32 ]]
            return v7.localizationKey, v7.value;
        end);
        return v1.Dictionary.union(v8, {
            ChooseOne = "Feature.ReportAbuse.Label.ChooseOne"
        });
    end, {
        v6.options
    });
    local v11 = v2.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), v6 (copy)
        return (v1.Dictionary.map(v6.options, function(v10) --[[ Line: 42 ]]
            return v10.descriptionLocalizationKey, v10.value;
        end));
    end, {
        v6.options
    });
    local v12 = l_useLocalization_0(v9);
    local v13 = l_useLocalization_0(v11);
    local v15 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v1 (ref), v6 (copy), v12 (copy)
        return v1.List.map(v6.options, function(v14) --[[ Line: 52 ]]
            -- upvalues: v12 (ref)
            return {
                text = v12[v14.value] or "", 
                key = v14.value
            };
        end);
    end, {
        v6.options, 
        v12
    });
    local v17 = v2.useCallback(function(v16) --[[ Line: 60 ]]
        -- upvalues: v6 (copy), v13 (copy)
        v6.setDropdownError(false);
        v6.onSelectedAbuseType(v16);
        if v6.setDescription then
            v6.setDescription(v13[v16] or "");
        end;
    end, {
        v6.setDropdownError, 
        v6.onSelectedAbuseType
    });
    return v2.createElement(l_DropdownMenu_0, {
        placeholder = v12.ChooseOne, 
        onChange = v17, 
        screenSize = v6.screenSize, 
        height = UDim.new(0, v6.menuItemHeight), 
        fixedListHeight = math.min(v6.menuItemHeight * #v6.options, v6.maxHeight), 
        errorState = v6.isDropdownError, 
        showDropShadow = true, 
        dropdownMenuListPositionFixed = true, 
        cellDatas = v15, 
        defaultKey = v6.reportCategoryDefaultKey, 
        isDisabled = v6.isDisabled
    });
end;