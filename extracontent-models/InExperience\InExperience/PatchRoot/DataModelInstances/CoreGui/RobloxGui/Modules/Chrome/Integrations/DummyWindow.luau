local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v5 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v6 = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations;
local v11 = l_Images_0["icons/navigation/cycleUp"];
local v12 = false;
local v13 = v6.new(v5.DEFAULT_WIDTH, v5.DEFAULT_HEIGHT);
local v14 = UDim2.new(1, -95, 0, 165);
return (v3:register({
    initialAvailability = if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then v3.AvailabilitySignal.Available else v3.AvailabilitySignal.Unavailable, 
    id = "dummy_window", 
    label = "CoreScripts.TopBar.Menu", 
    draggable = true, 
    cachePosition = true, 
    startingWindowPosition = v14, 
    windowSize = v13, 
    persistWindowState = true, 
    components = {
        Icon = function(_) --[[ Line: 35 ]] --[[ Name: Icon ]]
            -- upvalues: v4 (copy)
            return v4("icons/menu/avatar_on");
        end, 
        Window = function(_) --[[ Line: 38 ]] --[[ Name: Window ]]
            -- upvalues: v2 (copy), v5 (copy), l_IconButton_0 (copy), v11 (copy), v12 (ref), v13 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = v5.CORNER_RADIUS
                }), 
                SizeIcon = v2.createElement(l_IconButton_0, {
                    icon = v11, 
                    iconSize = v5.CLOSE_ICON_SIZE, 
                    anchorPoint = Vector2.new(0.5, 1), 
                    position = UDim2.new(0.5, 0, 1, 0), 
                    backgroundTransparency = 0.5, 
                    onActivated = function() --[[ Line: 52 ]] --[[ Name: onActivated ]]
                        -- upvalues: v12 (ref), v13 (ref), v5 (ref)
                        if v12 then
                            v13:requestSize(v5.DEFAULT_WIDTH, v5.DEFAULT_HEIGHT);
                            v12 = false;
                            return;
                        else
                            v13:requestSize(v5.DEFAULT_WIDTH_LARGE, v5.DEFAULT_HEIGHT_LARGE);
                            v12 = true;
                            return;
                        end;
                    end
                })
            });
        end
    }
}));