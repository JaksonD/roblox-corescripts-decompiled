local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withTooltip_0 = v7.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v7.App.Dialog.Enum.TooltipOrientation;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v11 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_clearTimeout_0 = v11.clearTimeout;
local l_setTimeout_0 = v11.setTimeout;
local v16 = {
    showDelay = 1000, 
    dismissDelay = 7000, 
    onDismissed = function(_, _) --[[ Line: 26 ]] --[[ Name: onDismissed ]]

    end
};
return function(v17) --[[ Line: 41 ]]
    -- upvalues: v6 (copy), v16 (copy), v5 (copy), l_setTimeout_0 (copy), l_AppStorageService_0 (copy), l_useLocalization_0 (copy), l_GuiService_0 (copy), l_clearTimeout_0 (copy), l_withTooltip_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy)
    local v18 = v6.Dictionary.union(v16, v17);
    local v19, v20 = v5.useState(false);
    local v21, v22 = v5.useState(false);
    local v23 = v5.useRef(l_setTimeout_0(function() --[[ Line: 45 ]]

    end, v18.showDelay));
    local v24 = v5.useRef(l_setTimeout_0(function() --[[ Line: 46 ]]

    end, v18.dismissDelay));
    local v28 = not (v5.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: v18 (copy), l_AppStorageService_0 (ref)
        local v25 = false;
        if v18.localStorageKey then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 51 ]]
                -- upvalues: l_AppStorageService_0 (ref), v18 (ref)
                return l_AppStorageService_0:GetItem(v18.localStorageKey);
            end);
            if l_status_0 then
                return l_result_0 == "true";
            else
                v25 = true;
            end;
        end;
        return v25;
    end, {
        v18.localStorageKey
    }) or v21);
    local v29 = v19 and v28;
    local v30 = l_useLocalization_0({
        headerText = v18.headerKey, 
        bodyText = v18.bodyKey
    });
    local v32 = v5.useCallback(function(v31) --[[ Line: 66 ]]
        -- upvalues: v18 (copy), v29 (copy), v22 (copy)
        if v18.onDismissed then
            v18.onDismissed(v29, v31);
        end;
        v22(true);
    end, {
        v22, 
        v29
    });
    v5.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: l_GuiService_0 (ref), v28 (copy), v32 (copy), v18 (copy)
        local v33 = {
            l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 77 ]]
                -- upvalues: v28 (ref), v32 (ref)
                if v28 then
                    v32("menuOpened");
                end;
            end), 
            v18.iconClickedSignal:connect(function() --[[ Line: 82 ]]
                -- upvalues: v28 (ref), v32 (ref)
                if v28 then
                    v32("chatIconClicked");
                end;
            end)
        };
        return function() --[[ Line: 89 ]]
            -- upvalues: v33 (copy)
            for _, v35 in v33 do
                if v35.disconnect then
                    v35:disconnect();
                elseif v35.Disconnect then
                    v35:Disconnect();
                end;
            end;
        end;
    end, {
        l_GuiService_0.MenuOpened, 
        v18.iconClickedSignal, 
        v28, 
        v32
    });
    v5.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: l_clearTimeout_0 (ref), v23 (copy), v28 (copy), l_setTimeout_0 (ref), v20 (copy), v18 (copy)
        l_clearTimeout_0(v23.current);
        if v28 then
            v23.current = l_setTimeout_0(function() --[[ Line: 104 ]]
                -- upvalues: v28 (ref), v20 (ref)
                if v28 then
                    v20(true);
                end;
            end, v18.showDelay);
        end;
    end, {
        v28, 
        v23
    });
    v5.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: l_clearTimeout_0 (ref), v24 (copy), v19 (copy), l_setTimeout_0 (ref), v32 (copy), v18 (copy)
        l_clearTimeout_0(v24.current);
        if v19 then
            v24.current = l_setTimeout_0(function() --[[ Line: 116 ]]
                -- upvalues: v32 (ref)
                v32("timeout");
            end, v18.dismissDelay);
        end;
    end, {
        v19, 
        v24
    });
    v5.useEffect(function() --[[ Line: 122 ]]
        -- upvalues: v29 (copy), v18 (copy), l_AppStorageService_0 (ref)
        if v29 and v18.localStorageKey then
            pcall(function() --[[ Line: 124 ]]
                -- upvalues: l_AppStorageService_0 (ref), v18 (ref)
                l_AppStorageService_0:SetItem(v18.localStorageKey, "true");
            end);
        end;
    end, {
        v29, 
        v18.localStorageKey
    });
    return l_withTooltip_0({
        headerText = v30.headerText, 
        bodyText = v30.bodyText
    }, {
        DisplayOrder = 10, 
        active = v29, 
        guiTarget = l_CoreGui_0, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    }, function(v36) --[[ Line: 139 ]]
        -- upvalues: v5 (ref)
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v5.Change.AbsoluteSize] = v36, 
            [v5.Change.AbsolutePosition] = v36
        });
    end);
end;