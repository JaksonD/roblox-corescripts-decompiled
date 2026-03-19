local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_ButtonType_0 = require(l_CorePackages_0.Packages.UIBlox).App.Button.Enum.ButtonType;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v10 = require(l_Parent_0.Prompts.PromptWithTextField);
local v11 = require(l_Parent_1.Thunks.SignalCreateOutfitPermissionDenied);
local v12 = require(l_Parent_1.Thunks.PerformCreateOutfit);
local v13 = v2.PureComponent:extend("EnterOutfitNamePrompt");
v13.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    signalCreateOutfitPermissionDenied = v4.callback, 
    performCreateOutfit = v4.callback
});
v13.init = function(v14) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v14:setState({
        outfitName = "", 
        alertPosition = UDim2.fromScale(0.5, 0.5)
    });
    v14.textBoxRef = v2.createRef();
    v14.confirmCreateOutfit = function() --[[ Line: 41 ]]
        -- upvalues: v14 (copy)
        v14.props.performCreateOutfit(v14.state.outfitName);
    end;
    v14.textUpdated = function(v15) --[[ Line: 45 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            outfitName = v15
        });
    end;
end;
v13.render = function(v16) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v10 (copy), v7 (copy), l_ButtonType_0 (copy)
    return v2.createElement(v10, {
        fieldText = v16.state.outfitName, 
        onFieldTextUpdated = v16.textUpdated, 
        title = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptTitle"), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v16.props.signalCreateOutfitPermissionDenied, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = v16.state.outfitName == "", 
                        onActivated = v16.confirmCreateOutfit, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }
    });
end;
return v3.connect(function(v17) --[[ Line: 82 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v17.screenSize
    };
end, function(v18) --[[ Line: 88 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy)
    return {
        signalCreateOutfitPermissionDenied = function() --[[ Line: 90 ]] --[[ Name: signalCreateOutfitPermissionDenied ]]
            -- upvalues: v18 (copy), v11 (ref)
            return v18(v11);
        end, 
        performCreateOutfit = function(v19) --[[ Line: 94 ]] --[[ Name: performCreateOutfit ]]
            -- upvalues: v18 (copy), v12 (ref)
            return v18(v12(v19));
        end
    };
end)(v13);