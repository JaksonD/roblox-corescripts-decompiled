local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.TopBar.Constants);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
local l_Dark_0 = v5.App.Style.Constants.ThemeName.Dark;
local v8 = require(l_CorePackages_0.Packages.Promise);
local v9 = require(script.Parent.SelfViewTooltipFTUX);
return function(v10) --[[ Line: 15 ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy), v1 (copy), l_AppStyleProvider_0 (copy), l_Dark_0 (copy), v9 (copy), v8 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "SelfViewTooltipOnCloseGui";
    l_ScreenGui_0.DisplayOrder = -1;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v12 = v4.useDisplayScaleState(v4.TopBarButtonHeight);
    local v13 = v4.useDisplayScaleState(v4.ScreenSideOffset);
    local v14 = v1.createElement(l_AppStyleProvider_0, {
        style = {
            themeName = l_Dark_0
        }
    }, {
        frame = v1.createElement("Frame", {
            Position = UDim2.fromOffset(v13, -v12), 
            Size = UDim2.fromOffset(v12, v12), 
            BackgroundTransparency = 0, 
            Visible = false
        }, {
            tooltip = v1.createElement(v9, {
                fallbackText = v10.fallbackText, 
                translationKey = v10.translationKey, 
                tooltipLifetime = v10.tooltipLifetime
            })
        })
    });
    local v15 = v1.mount(v14, l_ScreenGui_0, "SelfViewTooltipOnClose");
    v8.delay(v10.tooltipLifetime + 5):andThen(function() --[[ Line: 46 ]]
        -- upvalues: v1 (ref), v15 (copy)
        pcall(function() --[[ Line: 47 ]]
            -- upvalues: v1 (ref), v15 (ref)
            v1.unmount(v15);
        end);
    end);
end;