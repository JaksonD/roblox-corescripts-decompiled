local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v5 = require(l_Modules_0.LuaApp.Components.Common.AppDropdownMenu);
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local l_TimeUnit_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeUnit;
local v8 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_DateTypeOrder_0 = l_DateHelper_0.DateTypeOrder;
local v11 = {
    [Enum.HorizontalAlignment.Left] = Vector2.new(0, 0), 
    [Enum.HorizontalAlignment.Center] = Vector2.new(0.5, 0), 
    [Enum.HorizontalAlignment.Right] = Vector2.new(1, 0)
};
local v12 = {
    [Enum.HorizontalAlignment.Left] = UDim2.fromScale(0, 0), 
    [Enum.HorizontalAlignment.Center] = UDim2.fromScale(0.5, 0), 
    [Enum.HorizontalAlignment.Right] = UDim2.fromScale(1, 0)
};
return function(v13) --[[ Line: 56 ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), l_useSelector_0 (copy), v3 (copy), l_TimeUnit_0 (copy), l_DateHelper_0 (copy), l_LocalizationService_0 (copy), l_DateTypeOrder_0 (copy), v11 (copy), v12 (copy), v5 (copy)
    local v14 = l_useStyle_0();
    local v15 = v8({
        titleText = v13.titleKey, 
        subTitleText = v13.subTitleKey, 
        errorText = v13.errorTextKey, 
        yearText = "CommonUI.Controls.Label.Year", 
        monthText = "CommonUI.Controls.Label.Month", 
        dayText = "CommonUI.Controls.Label.Day"
    });
    local v17 = l_useSelector_0(function(v16) --[[ Line: 66 ]]
        return v16.ScreenSize or Vector2.new(1920, 1080);
    end);
    local v18, v19 = v3.useState(0);
    local v20, v21 = v3.useState(0);
    local v22, v23 = v3.useState(0);
    local v26 = v3.useCallback(function(v24) --[[ Line: 74 ]]
        -- upvalues: v19 (copy), v13 (copy), l_TimeUnit_0 (ref), v20 (copy), v22 (copy)
        local v25 = tonumber(v24);
        if v25 then
            v19(v25);
        end;
        v13.onDateSelected({
            [l_TimeUnit_0.Years] = v25, 
            [l_TimeUnit_0.Months] = v20, 
            [l_TimeUnit_0.Days] = v22
        });
    end, {
        v13.onDateSelected, 
        v20, 
        v22
    });
    local v29 = v3.useCallback(function(v27) --[[ Line: 87 ]]
        -- upvalues: v21 (copy), v13 (copy), l_TimeUnit_0 (ref), v18 (copy), v22 (copy)
        local v28 = tonumber(v27);
        if v28 then
            v21(v28);
        end;
        v13.onDateSelected({
            [l_TimeUnit_0.Years] = v18, 
            [l_TimeUnit_0.Months] = v28, 
            [l_TimeUnit_0.Days] = v22
        });
    end, {
        v13.onDateSelected, 
        v18, 
        v22
    });
    local v32 = v3.useCallback(function(v30) --[[ Line: 100 ]]
        -- upvalues: v23 (copy), v13 (copy), l_TimeUnit_0 (ref), v18 (copy), v20 (copy)
        local v31 = tonumber(v30);
        if v31 then
            v23(v31);
        end;
        v13.onDateSelected({
            [l_TimeUnit_0.Years] = v18, 
            [l_TimeUnit_0.Months] = v20, 
            [l_TimeUnit_0.Days] = v31
        });
    end, {
        v13.onDateSelected, 
        v18, 
        v20
    });
    local v38 = v3.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: l_DateHelper_0 (ref), v13 (copy), l_TimeUnit_0 (ref)
        local v33 = l_DateHelper_0:getCurrentDate();
        local v34 = {};
        local v35 = v13.maxYear or v33[l_TimeUnit_0.Years];
        local v36 = v13.minYear or v35 - 100;
        for v37 = v35, v36, -1 do
            table.insert(v34, {
                key = tostring(v37), 
                text = tostring(v37)
            });
        end;
        return v34;
    end, {
        v13.minYear, 
        v13.maxYear
    });
    local v41 = v3.useMemo(function() --[[ Line: 128 ]]
        local v39 = {};
        for v40 = 1, 12 do
            table.insert(v39, {
                key = tostring(v40), 
                text = tostring(v40)
            });
        end;
        return v39;
    end);
    local v44 = v3.useMemo(function() --[[ Line: 139 ]]
        local v42 = {};
        for v43 = 1, 31 do
            table.insert(v42, {
                key = tostring(v43), 
                text = tostring(v43)
            });
        end;
        return v42;
    end);
    local v45 = l_DateTypeOrder_0[l_LocalizationService_0.RobloxLocaleId];
    local v46 = if v13.designTokens then v13.designTokens else {
        textCaptionHeaderSize = v14.Font.BaseSize * v14.Font.CaptionHeader.RelativeSize, 
        textBodySize = v14.Font.BaseSize * v14.Font.Body.RelativeSize, 
        dropdownHeight = 72, 
        dropdownHorizontalPadding = 36, 
        dropdownVerticalPadding = 24, 
        dateDropdownWidth = 156
    };
    local v47 = v13.alignment or Enum.HorizontalAlignment.Left;
    local v48 = if v13.horizontalInnerPadding then v13.horizontalInnerPadding else UDim.new(0, v46.dropdownHorizontalPadding);
    return v3.createElement("Frame", {
        Size = v13.size, 
        AnchorPoint = v11[v47], 
        Position = v12[v47], 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v13.layoutOrder
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v46.dropdownVerticalPadding)
        }), 
        Title = if v13.titleKey then v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v14.Font.CaptionHeader.Font, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0), 
            Text = v15.titleText, 
            TextColor3 = v14.Theme.TextEmphasis.Color, 
            TextSize = v46.textCaptionHeaderSize, 
            TextTransparency = v14.Theme.TextEmphasis.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        }) else nil, 
        BirthdayPicker = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v46.dropdownHeight), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            ZIndex = 2
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = v48
            }), 
            YearPicker = v3.createElement("Frame", {
                Size = UDim2.new(0.25, 0, 0, v46.dropdownHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v45[l_TimeUnit_0.Years], 
                ZIndex = 2
            }, {
                YearDropdownMenu = v3.createElement(v5, {
                    height = UDim.new(0, v46.dropdownHeight), 
                    placeholder = v15.yearText, 
                    screenSize = v17, 
                    showDropShadow = true, 
                    fixedListHeight = v13.fixedListHeight, 
                    onChange = v26, 
                    cellDatas = v38, 
                    analyticsContext = "YearDropdownMenu", 
                    selectionGroupName = "YearDropdownMenu"
                })
            }), 
            MonthPicker = v3.createElement("Frame", {
                Size = UDim2.new(0.25, 0, 0, v46.dropdownHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v45[l_TimeUnit_0.Months], 
                ZIndex = 2
            }, {
                MonthDropdownMenu = v3.createElement(v5, {
                    height = UDim.new(0, v46.dropdownHeight), 
                    placeholder = v15.monthText, 
                    screenSize = v17, 
                    showDropShadow = true, 
                    fixedListHeight = v13.fixedListHeight, 
                    onChange = v29, 
                    cellDatas = v41, 
                    analyticsContext = "MonthDropdownMenu", 
                    selectionGroupName = "MonthDropdownMenu"
                })
            }), 
            DayPicker = v3.createElement("Frame", {
                Size = UDim2.new(0.25, 0, 0, v46.dropdownHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v45[l_TimeUnit_0.Days], 
                ZIndex = 2
            }, {
                DayDropdownMenu = v3.createElement(v5, {
                    height = UDim.new(0, v46.dropdownHeight), 
                    placeholder = v15.dayText, 
                    screenSize = v17, 
                    showDropShadow = true, 
                    fixedListHeight = v13.fixedListHeight, 
                    onChange = v32, 
                    cellDatas = v44, 
                    analyticsContext = "DayDropdownMenu", 
                    selectionGroupName = "DayDropdownMenu"
                })
            })
        }), 
        OptionalTitle = if v13.subTitleKey then v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v14.Font.CaptionHeader.Font, 
            LayoutOrder = 3, 
            Size = UDim2.fromScale(1, 0), 
            Text = v15.subTitleText, 
            TextColor3 = v14.Theme.TextDefault.Color, 
            TextSize = v46.textBodySize, 
            TextTransparency = v14.Theme.TextDefault.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        }) else nil, 
        ErrorTitle = if v13.errorTextKey then v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v14.Font.CaptionHeader.Font, 
            LayoutOrder = 4, 
            Size = UDim2.fromScale(1, 0), 
            Text = v15.errorText, 
            TextColor3 = v14.Theme.Alert.Color, 
            TextSize = v46.textBodySize, 
            TextTransparency = v14.Theme.Alert.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        }) else nil
    });
end;