local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Actions.SetScreenSize);
local v8 = require(l_Parent_0.Components.ReportMenu);
local v9 = require(l_Parent_0.Components.ReportDialog);
local v10 = require(l_Parent_0.Components.ReportCategoryDialog);
local v11 = require(l_Parent_0.Components.ReportSentDialog);
local v12 = require(l_Parent_0.Components.Toast);
local v13 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v14 = v2.PureComponent:extend("TrustAndSafetyApp");
v14.validateProps = v4.strictInterface({
    setScreenSize = v4.callback, 
    visible = v4.boolean
});
v14.init = function(_) --[[ Line: 30 ]] --[[ Name: init ]]

end;
v14.render = function(v16) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v13 (copy), v10 (copy), v8 (copy), v9 (copy), v11 (copy), v12 (copy), v5 (copy)
    local v17 = v2.createElement(v13.Provider, {}, {
        Gui = v2.createElement("ScreenGui", {
            AutoLocalize = false, 
            DisplayOrder = 8, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            [v2.Change.AbsoluteSize] = v16.props.setScreenSize
        }, {
            Content = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Visible = v16.props.visible
            }, {
                ReportCategoryDialog = v2.createElement(v10), 
                ReportMenu = v2.createElement(v8), 
                ReportDialog = v2.createElement(v9), 
                ReportSentDialog = v2.createElement(v11), 
                Toast = v2.createElement(v12)
            })
        })
    });
    return v5({
        VoiceStateContextProvider = v17
    });
end;
return v3.UNSTABLE_connect2(function(v18, _) --[[ Line: 60 ]]
    return {
        visible = v18.displayOptions.visible
    };
end, function(v20) --[[ Line: 64 ]]
    -- upvalues: v7 (copy)
    return {
        setScreenSize = function(v21) --[[ Line: 66 ]] --[[ Name: setScreenSize ]]
            -- upvalues: v20 (copy), v7 (ref)
            v20(v7(v21.AbsoluteSize));
        end
    };
end)(v14);