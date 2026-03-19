local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v12 = require(l_Parent_0.HumanoidViewport);
local v13 = require(l_Parent_0.ItemsList);
local v14 = require(l_Parent_1.Thunks.SignalSaveAvatarPermissionDenied);
local v15 = require(l_Parent_1.Thunks.PerformSaveAvatar);
local v16 = require(l_Parent_1.GetConformedHumanoidDescription);
local v17 = v2.PureComponent:extend("SaveAvatarPrompt");
v17.validateProps = v4.strictInterface({
    gameName = v4.string, 
    screenSize = v4.Vector2, 
    humanoidDescription = v4.instanceOf("HumanoidDescription"), 
    rigType = v4.enum(Enum.HumanoidRigType), 
    performSaveAvatar = v4.callback, 
    signalSaveAvatarPermissionDenied = v4.callback
});
v17.init = function(v18) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v13 (copy), v12 (copy)
    v18.mounted = false;
    v18:setState({
        conformedHumanoidDescription = nil, 
        getConformedDescriptionFailed = false, 
        itemListScrollable = false
    });
    v18.middleContentRef = v2.createRef();
    local v19, v20 = v2.createBinding(UDim2.new(1, 0, 0, 200));
    v18.contentSize = v19;
    v18.updateContentSize = v20;
    v18.onAlertSizeChanged = function(v21) --[[ Line: 59 ]]
        -- upvalues: v18 (copy)
        local l_AbsoluteSize_0 = v21.AbsoluteSize;
        if not v18.middleContentRef:getValue() then
            return;
        else
            local l_Y_0 = v18.middleContentRef:getValue().AbsoluteSize.Y;
            local v24 = l_AbsoluteSize_0.Y - l_Y_0;
            local v25 = v18.props.screenSize.Y - 60 - v24;
            local v26 = v18.middleContentRef:getValue().AbsoluteSize.X / 2 - 10 + 80;
            if v26 < v25 then
                v25 = v26;
            end;
            if l_Y_0 ~= v25 then
                v18.updateContentSize(UDim2.new(1, 0, 0, v25));
            end;
            return;
        end;
    end;
    v18.itemListScrollableUpdated = function(v27, v28) --[[ Line: 82 ]]
        -- upvalues: v18 (copy)
        if v28 == v18.contentSize:getValue().Y.Offset then
            v18:setState({
                itemListScrollable = v27
            });
        end;
    end;
    v18.retryLoadDescription = function() --[[ Line: 90 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            getConformedDescriptionFailed = false
        });
        v18:getConformedHumanoidDescription();
    end;
    v18.renderAlertMiddleContent = function() --[[ Line: 98 ]]
        -- upvalues: v18 (copy), v2 (ref), v13 (ref), v12 (ref)
        local l_conformedHumanoidDescription_0 = v18.state.conformedHumanoidDescription;
        local l_getConformedDescriptionFailed_0 = v18.state.getConformedDescriptionFailed;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v18.contentSize, 
            [v2.Ref] = v18.middleContentRef
        }, {
            ItemsListFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.45, 1)
            }, {
                ItemsList = v2.createElement(v13, {
                    humanoidDescription = l_conformedHumanoidDescription_0, 
                    retryLoadDescription = v18.retryLoadDescription, 
                    loadingFailed = l_getConformedDescriptionFailed_0, 
                    itemListScrollableUpdated = v18.itemListScrollableUpdated
                })
            }), 
            HumanoidViewportFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.55, 1), 
                Position = UDim2.fromScale(0.45, 0), 
                LayoutOrder = 2
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 5), 
                    PaddingRight = UDim.new(0, 5)
                }), 
                HumanoidViewport = v2.createElement(v12, {
                    humanoidDescription = l_conformedHumanoidDescription_0, 
                    loadingFailed = l_getConformedDescriptionFailed_0, 
                    retryLoadDescription = v18.retryLoadDescription, 
                    rigType = v18.props.rigType
                })
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = v18.contentMaxSize
            })
        });
    end;
end;
v17.render = function(v31) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), v9 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptTitle"), 
        bodyText = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptText", {
            RBX_NAME = v31.props.gameName
        }), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v31.props.signalSaveAvatarPermissionDenied, 
                        text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v31.props.performSaveAvatar, 
                        text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v31.props.screenSize, 
        middleContent = v31.renderAlertMiddleContent, 
        onAbsoluteSizeChanged = v31.onAlertSizeChanged, 
        isMiddleContentFocusable = v31.state.itemListScrollable
    });
end;
v17.getConformedHumanoidDescription = function(v32, v33) --[[ Line: 179 ]] --[[ Name: getConformedHumanoidDescription ]]
    -- upvalues: v16 (copy)
    v16(v33, true):andThen(function(v34) --[[ Line: 181 ]]
        -- upvalues: v32 (copy)
        if not v32.mounted then
            return;
        else
            v32:setState({
                conformedHumanoidDescription = v34
            });
            return;
        end;
    end, function(_) --[[ Line: 189 ]]
        -- upvalues: v32 (copy)
        if not v32.mounted then
            return;
        else
            v32:setState({
                getConformedDescriptionFailed = true
            });
            return;
        end;
    end);
end;
v17.didMount = function(v36) --[[ Line: 200 ]] --[[ Name: didMount ]]
    v36.mounted = true;
    v36:getConformedHumanoidDescription(v36.props.humanoidDescription);
end;
v17.didUpdate = function(v37, v38, _) --[[ Line: 206 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    if v37.props.humanoidDescription ~= v38.humanoidDescription then
        v37:setState({
            conformedHumanoidDescription = v2.None, 
            getConformedDescriptionFailed = false
        });
        v37:getConformedHumanoidDescription(v37.props.humanoidDescription);
    end;
end;
v17.willUnmount = function(v40) --[[ Line: 217 ]] --[[ Name: willUnmount ]]
    v40.mounted = false;
end;
return v3.connect(function(v41) --[[ Line: 221 ]] --[[ Name: mapStateToProps ]]
    return {
        gameName = v41.gameName, 
        screenSize = v41.screenSize, 
        humanoidDescription = v41.promptInfo.humanoidDescription, 
        rigType = v41.promptInfo.rigType
    };
end, function(v42) --[[ Line: 230 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy), v15 (copy)
    return {
        signalSaveAvatarPermissionDenied = function() --[[ Line: 232 ]] --[[ Name: signalSaveAvatarPermissionDenied ]]
            -- upvalues: v42 (copy), v14 (ref)
            return v42(v14);
        end, 
        performSaveAvatar = function() --[[ Line: 236 ]] --[[ Name: performSaveAvatar ]]
            -- upvalues: v42 (copy), v15 (ref)
            return v42(v15);
        end
    };
end)(v17);