local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_withTooltip_0 = require(l_CorePackages_0.Packages.UIBlox).App.Dialog.TooltipV2.withTooltip;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
return function(v5) --[[ Line: 15 ]]
    -- upvalues: l_useLocalization_0 (copy), l_CoreGui_0 (copy), l_withTooltip_0 (copy), v2 (copy)
    local l_isActive_0 = v5.isActive;
    local l_preferredOrientation_0 = v5.preferredOrientation;
    local v8 = l_useLocalization_0({
        TooltipText = "Feature.GameFollows.TooltipNotificationsButtonDescription"
    });
    local v9 = {
        active = l_isActive_0, 
        guiTarget = l_CoreGui_0, 
        DisplayOrder = 1, 
        preferredOrientation = l_preferredOrientation_0
    };
    local v10 = {
        bodyText = v8.TooltipText, 
        textAlignment = Enum.TextXAlignment.Left, 
        useLargeDropShadow = false
    };
    return l_withTooltip_0(v10, v9, function(v11) --[[ Line: 36 ]]
        -- upvalues: v5 (copy), v2 (ref)
        local function v13(v12) --[[ Line: 37 ]]
            -- upvalues: v5 (ref), v11 (copy)
            if v5.onPositionChanged then
                v5.onPositionChanged(v12);
            end;
            v11(v12);
        end;
        return v2.createElement("Frame", {
            Visible = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v2.Change.AbsolutePosition] = v13, 
            [v2.Change.AbsoluteSize] = v13
        });
    end);
end;