local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v6 = require(script.Parent.AvatarParts.AvatarPartGrid);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.BasePublishPrompt);
local v11 = require(l_Parent_0.Common.ObjectViewport);
local v12 = require(l_Parent_0.Common.LabeledTextBox);
local v13 = require(l_Parent_0.Common.PublishInfoList);
local v14 = require(l_CorePackages_0.Workspace.Packages.PurchasePrompt);
local l_PublishAssetAnalytics_0 = v14.PublishAssetAnalytics;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v17 = require(l_Actions_0.SetPromptVisibility);
local v18 = UDim.new(0, 20);
local v19 = v2.PureComponent:extend("PublishAvatarPrompt");
v19.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    humanoidModel = v4.optional(v4.instanceOf("Model")), 
    guid = v4.any, 
    scopes = v4.any, 
    SetPromptVisibility = v4.callback
});
v19.init = function(v20) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy), l_PublishAssetAnalytics_0 (copy), v14 (copy), l_mutedError_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    assert(l_LocalPlayer_0, "LocalPlayer must not be nil");
    v20:setState({
        showingPreviewView = false, 
        name = l_LocalPlayer_0.Name .. "'s Body", 
        isNameValid = true, 
        description = l_LocalPlayer_0.Name .. "'s Body", 
        isDescValid = true, 
        showTopScrim = false, 
        purchasePromptReady = true
    });
    v20.openPreviewView = function() --[[ Line: 65 ]]
        -- upvalues: l_PublishAssetAnalytics_0 (ref), v20 (copy)
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Expand);
        v20:setState({
            showingPreviewView = true
        });
    end;
    v20.closePreviewView = function() --[[ Line: 71 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            showingPreviewView = false
        });
    end;
    v20.canSubmit = function() --[[ Line: 78 ]]
        -- upvalues: v20 (copy)
        return v20.state.isNameValid and v20.state.isDescValid and v20.props.humanoidModel ~= nil and v20.state.purchasePromptReady;
    end;
    v20.onSubmit = function() --[[ Line: 85 ]]
        -- upvalues: l_PublishAssetAnalytics_0 (ref), v20 (copy), v14 (ref), l_mutedError_0 (ref)
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Buy);
        local v22 = {
            name = v20.state.name, 
            description = v20.state.description
        };
        if v14.initiateAvatarCreationFeePurchase then
            v14.initiateAvatarCreationFeePurchase(v22, v20.props.guid, v20.props.humanoidModel, v20.props.priceInRobux);
            return;
        else
            l_mutedError_0("PurchasePrompt.initiateAvatarCreationFeePurchase is not available");
            return;
        end;
    end;
    v20.onNameUpdated = function(v23, v24) --[[ Line: 104 ]]
        -- upvalues: v20 (copy), l_PublishAssetAnalytics_0 (ref)
        v20:setState({
            name = v23, 
            isNameValid = v24
        });
        if not v20.sentNameFieldTouched then
            v20.sentNameFieldTouched = true;
            l_PublishAssetAnalytics_0.sendFieldTouched(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Name);
        end;
    end;
    v20.onDescriptionUpdated = function(v25, v26) --[[ Line: 116 ]]
        -- upvalues: v20 (copy), l_PublishAssetAnalytics_0 (ref)
        v20:setState({
            description = v25, 
            isDescValid = v26
        });
        if not v20.sentDescriptionFieldTouched then
            v20.sentDescriptionFieldTouched = true;
            l_PublishAssetAnalytics_0.sendFieldTouched(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Description);
        end;
    end;
    v20.onWindowStateChanged = function(v27) --[[ Line: 128 ]]
        -- upvalues: v20 (copy)
        local l_hasCompletedPurchase_0 = v27.hasCompletedPurchase;
        local l_isShown_0 = v27.isShown;
        if l_hasCompletedPurchase_0 and not l_isShown_0 then
            v20.props.SetPromptVisibility(false);
            return;
        else
            v20:setState({
                showTopScrim = l_isShown_0
            });
            if l_isShown_0 then
                v20:setState({
                    purchasePromptReady = false
                });
            end;
            return;
        end;
    end;
    v20.onPromptStateSetToNone = function() --[[ Line: 153 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            purchasePromptReady = true
        });
    end;
end;
v19.didMount = function(v30) --[[ Line: 160 ]] --[[ Name: didMount ]]
    -- upvalues: v14 (copy), l_mutedError_0 (copy), l_PublishAssetAnalytics_0 (copy)
    v30.sentNameFieldTouched = false;
    v30.sentDescriptionFieldTouched = false;
    local l_windowStateChangedEvent_0 = v14.windowStateChangedEvent;
    local l_promptStateSetToNoneEvent_0 = v14.promptStateSetToNoneEvent;
    if l_windowStateChangedEvent_0 and l_promptStateSetToNoneEvent_0 then
        v30.windowStateChangedConnection = l_windowStateChangedEvent_0:Connect(v30.onWindowStateChanged);
        v30.promptStateSetToNoneConnection = l_promptStateSetToNoneEvent_0:Connect(v30.onPromptStateSetToNone);
    else
        l_mutedError_0("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available");
    end;
    l_PublishAssetAnalytics_0.sendPageLoad(l_PublishAssetAnalytics_0.Section.BuyCreationPage);
end;
v19.willUnmount = function(v33) --[[ Line: 179 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_mutedError_0 (copy)
    if v33.windowStateChangedConnection then
        v33.windowStateChangedConnection:Disconnect();
    else
        l_mutedError_0("windowStateChangedConnection was not established");
    end;
    if v33.promptStateSetToNoneConnection then
        v33.promptStateSetToNoneConnection:Disconnect();
        return;
    else
        l_mutedError_0("promptStateSetToNoneConnection was not established");
        return;
    end;
end;
v19.renderPromptBody = function(v34) --[[ Line: 193 ]] --[[ Name: renderPromptBody ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v18 (copy), v11 (copy), v12 (copy), v5 (copy), v13 (copy), v6 (copy)
    local v35 = v34.props.humanoidModel == nil;
    return l_withStyle_0(function(_) --[[ Line: 195 ]]
        -- upvalues: v2 (ref), v18 (ref), v11 (ref), v34 (copy), v35 (copy), v12 (ref), v5 (ref), v13 (ref), v6 (ref)
        return v2.createFragment({
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = v18, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = v18, 
                PaddingTop = v18
            }), 
            EmbeddedPreview = v2.createElement(v11, {
                openPreviewView = v34.openPreviewView, 
                model = v34.props.humanoidModel, 
                isLoading = v35, 
                useFullBodyCameraSettings = true, 
                fieldOfView = 30, 
                LayoutOrder = 1, 
                isHumanoidModel = true
            }), 
            DescriptionInput = v2.createElement(v12, {
                LayoutOrder = 2, 
                labelText = v5:FormatByKey("CoreScripts.PublishAssetPrompt.Description"), 
                centerText = false, 
                defaultText = v34.state.description, 
                maxLength = 1000, 
                onTextUpdated = v34.onDescriptionUpdated, 
                textBoxHeight = 104, 
                invalidInputText = v5:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
            }), 
            InfoList = v2.createElement(v13, {
                typeName = v5:FormatByKey("Feature.Catalog.Label.Body"), 
                LayoutOrder = 3
            }), 
            AvatarPartGrid = v2.createElement(v6, {
                humanoidModel = v34.props.humanoidModel, 
                name = v34.state.name, 
                LayoutOrder = 4, 
                screenSize = v34.props.screenSize
            })
        });
    end);
end;
v19.render = function(v37) --[[ Line: 240 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v2 (copy), v10 (copy), v5 (copy)
    assert(l_Players_0, "Players must not be nil");
    return v2.createElement(v10, {
        promptBody = v37:renderPromptBody(), 
        screenSize = v37.props.screenSize, 
        showingPreviewView = v37.state.showingPreviewView, 
        closePreviewView = v37.closePreviewView, 
        asset = v37.props.humanoidModel, 
        nameLabel = v5:FormatByKey("CoreScripts.PublishAvatarPrompt.BodyName"), 
        defaultName = v37.state.name, 
        titleText = v5:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"), 
        onNameUpdated = v37.onNameUpdated, 
        canSubmit = v37.canSubmit, 
        onSubmit = v37.onSubmit, 
        delayInputSeconds = 3, 
        priceInRobux = v37.props.priceInRobux, 
        showTopScrim = v37.state.showTopScrim
    });
end;
return v3.connect(function(v38) --[[ Line: 261 ]] --[[ Name: mapStateToProps ]]
    return {
        humanoidModel = v38.promptRequest.promptInfo.humanoidModel, 
        guid = v38.promptRequest.promptInfo.guid, 
        scopes = v38.promptRequest.promptInfo.scopes, 
        priceInRobux = v38.promptRequest.promptInfo.priceInRobux
    };
end, function(v39) --[[ Line: 270 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v17 (copy)
    return {
        SetPromptVisibility = function(v40) --[[ Line: 272 ]] --[[ Name: SetPromptVisibility ]]
            -- upvalues: v39 (copy), v17 (ref)
            v39(v17(v40));
        end
    };
end)(v19);