local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_InteractiveAlert_0 = require(l_Parent_0.UIBlox).App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useScreenSize;
local v4 = require(script.Parent.Scrim);
return function(v5) --[[ Line: 18 ]] --[[ Name: AlertPrompt ]]
    -- upvalues: l_useScreenSize_0 (copy), v1 (copy), v4 (copy), l_InteractiveAlert_0 (copy)
    local v6 = l_useScreenSize_0();
    return v1.createElement(v4, {}, v1.createElement(l_InteractiveAlert_0, {
        title = v5.title, 
        bodyText = v5.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v5.onDismiss, 
                        text = v5.dismissCTA
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v6, 
        middleContent = v5.middleContent
    }));
end;