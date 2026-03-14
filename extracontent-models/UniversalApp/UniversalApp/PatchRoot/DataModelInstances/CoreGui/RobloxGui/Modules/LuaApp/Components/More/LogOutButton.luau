local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.ArgCheck);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v5.Button;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_ButtonSize_0 = v5.Enums.ButtonSize;
local v9 = require(l_Modules_0.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant);
return function(v10) --[[ Line: 23 ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), l_Button_0 (copy), v9 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local l_onActivated_0 = v10.onActivated;
    v3.isType(l_onActivated_0, "function", "onActivated");
    return v4({
        logOutText = "Application.Logout.Action.Logout"
    })(function(v12) --[[ Line: 30 ]]
        -- upvalues: v1 (ref), l_Button_0 (ref), v9 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), l_onActivated_0 (copy)
        return v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIPadding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            UISizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(688, 1e999)
            }), 
            LogOutButtonFrame = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                LogOutButton = v1.createElement(l_Button_0, {
                    variant = if v9 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                    size = l_ButtonSize_0.Large, 
                    text = v12.logOutText, 
                    onActivated = l_onActivated_0, 
                    isLoading = false, 
                    isDisabled = false, 
                    width = UDim.new(1, 0)
                })
            })
        });
    end);
end;