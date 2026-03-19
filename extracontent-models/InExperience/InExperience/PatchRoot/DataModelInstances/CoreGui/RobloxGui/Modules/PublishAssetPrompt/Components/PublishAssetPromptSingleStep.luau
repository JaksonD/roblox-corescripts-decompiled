local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_IconButton_0 = v7.App.Button.IconButton;
local v12 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v14 = require(script.Parent.Common.NameTextBox);
local v15 = require(script.Parent.AssetDescriptionTextBox);
local v16 = require(script.Parent.ObjectViewport);
local v17 = require(script.Parent.Common.PreviewViewport);
local v18 = require(script.Parent.EmoteThumbnailView);
local v19 = require(script.Parent.EmoteThumbnailEditor);
local v20 = require(script.Parent.EmoteThumbnailParameters);
local v21 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
local l_Images_0 = v7.App.ImageSet.Images;
local v23 = l_Images_0["icons/actions/previewExpand"];
local v24 = l_Images_0["icons/actions/edit/edit"];
local v25 = {
    [Enum.AssetType.TShirtAccessory] = true, 
    [Enum.AssetType.ShirtAccessory] = true, 
    [Enum.AssetType.PantsAccessory] = true, 
    [Enum.AssetType.JacketAccessory] = true, 
    [Enum.AssetType.SweaterAccessory] = true, 
    [Enum.AssetType.ShortsAccessory] = true, 
    [Enum.AssetType.LeftShoeAccessory] = true, 
    [Enum.AssetType.RightShoeAccessory] = true, 
    [Enum.AssetType.DressSkirtAccessory] = true, 
    [Enum.AssetType.HairAccessory] = true
};
local l_Parent_0 = script.Parent.Parent;
local v27 = require(l_Parent_0.GetFFlagValidateDescription);
local v28 = game:DefineFastFlag("SendConsentDeniedOnCancel", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableEmotePublish");
local v30 = v3.PureComponent:extend("PublishAssetPromptSingleStep");
v30.validateProps = v5.strictInterface({
    screenSize = v5.Vector2, 
    assetInstance = v5.Instance, 
    assetType = v5.enum(Enum.AssetType), 
    guid = v5.any, 
    scopes = v5.any, 
    closePrompt = v5.callback
});
v30.getDefaultText = function(v31) --[[ Line: 92 ]] --[[ Name: getDefaultText ]]
    -- upvalues: v6 (copy), l_LocalPlayer_0 (copy)
    if v31.props.assetType == Enum.AssetType.Model then
        return v6:FormatByKey("CoreScripts.PublishAssetPrompt.PackagesDefaultName", {
            RBX_NAME = l_LocalPlayer_0 and l_LocalPlayer_0.Name or ""
        });
    else
        return "";
    end;
end;
v30.init = function(v32) --[[ Line: 102 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), l_ExperienceAuthService_0 (copy), v27 (copy), l_game_EngineFeature_0 (copy), v3 (copy)
    v32.assetName = v32:getDefaultText();
    v32.assetDescription = v32:getDefaultText();
    v32.isNameValid = true;
    v32.isDescriptionValid = true;
    v32:setState({
        thumbnailParameters = v20.defaultParameters, 
        showingThumbnailEditor = false, 
        showingAssetPreview = false
    });
    v32.closePrompt = function() --[[ Line: 114 ]]
        -- upvalues: v32 (copy)
        v32.props.closePrompt();
    end;
    v32.openThumbnailEditor = function() --[[ Line: 118 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            showingThumbnailEditor = true
        });
    end;
    v32.closeThumbnailEditor = function() --[[ Line: 124 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            showingThumbnailEditor = false
        });
    end;
    v32.openAssetPreview = function() --[[ Line: 130 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            showingAssetPreview = true
        });
    end;
    v32.closeAssetPreview = function() --[[ Line: 136 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            showingAssetPreview = false
        });
    end;
    v32.updateThumbnailParameters = function(v33) --[[ Line: 142 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            thumbnailParameters = v33
        });
    end;
    v32.denyAndClose = function() --[[ Line: 148 ]]
        -- upvalues: l_ExperienceAuthService_0 (ref), v32 (copy)
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v32.props.guid, v32.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {});
        v32.closePrompt();
    end;
    v32.confirmAndUpload = function() --[[ Line: 158 ]]
        -- upvalues: v32 (copy), v27 (ref), l_game_EngineFeature_0 (ref), v20 (ref), l_ExperienceAuthService_0 (ref)
        if not v32.isNameValid then
            return;
        elseif v27() and not v32.isDescriptionValid then
            return;
        else
            local v34 = {
                assetName = v32.assetName, 
                assetDescription = v32.assetDescription
            };
            if l_game_EngineFeature_0 and v32.props.assetType == Enum.AssetType.EmoteAnimation then
                v34.emoteThumbnailParameters = v20.encodeAsATable(v32.state.thumbnailParameters);
            end;
            l_ExperienceAuthService_0:ScopeCheckUIComplete(v32.props.guid, v32.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, v34);
            v32.closePrompt();
            return;
        end;
    end;
    v32.onAssetNameUpdated = function(v35, v36) --[[ Line: 188 ]]
        -- upvalues: v32 (copy)
        if v36 then
            v32.assetName = v35;
            v32.isNameValid = true;
            return;
        else
            v32.isNameValid = false;
            return;
        end;
    end;
    v32.onAssetDescriptionUpdated = function(v37, v38) --[[ Line: 197 ]]
        -- upvalues: v32 (copy)
        v32.assetDescription = v37;
        v32.isDescriptionValid = v38;
    end;
    v32.nameTextBoxRef = v3.createRef();
    v32.descriptionTextBoxRef = v3.createRef();
end;
v30.renderMiddle = function(v39, v40) --[[ Line: 206 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), l_game_EngineFeature_0 (copy), v3 (copy), v12 (copy), v16 (copy), v18 (copy), l_IconButton_0 (copy), v23 (copy), v24 (copy), v14 (copy), v15 (copy)
    return l_withStyle_0(function(v41) --[[ Line: 207 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v39 (copy), v3 (ref), v12 (ref), v16 (ref), v18 (ref), l_IconButton_0 (ref), v23 (ref), v24 (ref), v40 (copy), v14 (ref), v15 (ref)
        local l_Font_0 = v41.Font;
        local l_Theme_0 = v41.Theme;
        local v44 = l_game_EngineFeature_0 and v39.props.assetType == Enum.AssetType.EmoteAnimation and v39.props.assetInstance:IsA("AnimationClip");
        return v3.createElement(v12.Focusable.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 150), 
            defaultChild = v39.nameTextBoxRef, 
            [v3.Ref] = v39.middleContentRef
        }, {
            UISizeConstraint = v3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(200, 200)
            }), 
            TopSection = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -50), 
                BackgroundTransparency = 1
            }, {
                ViewportParent = v3.createElement("Frame", {
                    Size = UDim2.new(0.4, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ObjectViewport = not v44 and v3.createElement(v16, {
                        model = v39.props.assetInstance
                    }) or nil, 
                    EmoteThumbnailParent = v44 and v3.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1
                    }, {
                        AspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.FitWithinMaxSize, 
                            DominantAxis = Enum.DominantAxis.Width
                        }), 
                        EmoteThumbnailView = v3.createElement(v18, {
                            animationClip = v39.props.assetInstance, 
                            thumbnailParameters = v39.state.thumbnailParameters
                        }), 
                        PreviewButton = v3.createElement(l_IconButton_0, {
                            position = UDim2.new(1, -2, 1, -2), 
                            anchorPoint = Vector2.new(1, 1), 
                            icon = v23, 
                            size = UDim2.new(0, 30, 0, 30), 
                            showBackground = true, 
                            onActivated = v39.openAssetPreview
                        }), 
                        EditButton = v3.createElement(l_IconButton_0, {
                            position = UDim2.new(0, 2, 1, -2), 
                            anchorPoint = Vector2.new(0, 1), 
                            icon = v24, 
                            size = UDim2.new(0, 30, 0, 30), 
                            showBackground = true, 
                            onActivated = v39.openThumbnailEditor
                        })
                    }) or nil
                }), 
                NameDescriptionFields = v3.createElement("Frame", {
                    Size = UDim2.new(0.6, -10, 1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    NameLabel = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 15), 
                        Font = l_Font_0.Body.Font, 
                        Text = v40.name, 
                        TextSize = 12, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    NameInput = v3.createElement(v14, {
                        Size = UDim2.new(1, 0, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 15), 
                        onNameUpdated = v39.onAssetNameUpdated, 
                        nameTextBoxRef = v39.nameTextBoxRef, 
                        NextSelectionDown = v39.descriptionTextBoxRef, 
                        defaultName = v39.assetName
                    }), 
                    DescriptionLabel = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 15), 
                        Position = UDim2.new(0, 0, 0, 60), 
                        Font = l_Font_0.Body.Font, 
                        TextSize = 12, 
                        Text = v40.description, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    DescriptionInput = v3.createElement(v15, {
                        Size = UDim2.new(1, 0, 0, 80), 
                        Position = UDim2.new(0, 0, 0, 75), 
                        onAssetDescriptionUpdated = v39.onAssetDescriptionUpdated, 
                        descriptionTextBoxRef = v39.descriptionTextBoxRef, 
                        NextSelectionUp = v39.nameTextBoxRef, 
                        defaultDescription = v39.assetDescription
                    })
                })
            }), 
            Disclaimer = v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 50), 
                Text = v40.disclaimer, 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                TextWrapped = true
            })
        });
    end);
end;
v30.renderAlertLocalized = function(v45, v46) --[[ Line: 332 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v3 (copy), l_InteractiveAlert_0 (copy), v28 (copy), l_ButtonType_0 (copy), l_game_EngineFeature_0 (copy), v19 (copy), v17 (copy)
    local v47 = v3.createElement(l_InteractiveAlert_0, {
        title = v46.title, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = if v28 then v45.denyAndClose else v45.closePrompt, 
                        text = v46.cancel
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v45.confirmAndUpload, 
                        text = v46.submit, 
                        isDelayedInput = true, 
                        enableInputDelayed = true, 
                        delayInputSeconds = 3
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        middleContent = function() --[[ Line: 357 ]] --[[ Name: middleContent ]]
            -- upvalues: v45 (copy), v46 (copy)
            return v45:renderMiddle(v46);
        end, 
        screenSize = v45.props.screenSize, 
        defaultChildRef = v45.props.defaultChildRef, 
        isMiddleContentFocusable = true
    });
    if l_game_EngineFeature_0 then
        return v3.createFragment({
            Prompt = v47, 
            ThumbnailEditor = v45.state.showingThumbnailEditor and v3.createElement(v19, {
                animationClip = v45.props.assetInstance, 
                initialThumbnailParameters = v45.state.thumbnailParameters, 
                screenSize = v45.props.screenSize, 
                updateThumbnailCallback = v45.updateThumbnailParameters, 
                closePromptCallback = v45.closeThumbnailEditor
            }) or nil, 
            PreviewFrame = v45.state.showingAssetPreview and v3.createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 0
            }, {
                PreviewViewport = v3.createElement(v17, {
                    asset = v45.props.assetInstance, 
                    closePreviewView = v45.closeAssetPreview
                })
            }) or nil
        });
    else
        return v47;
    end;
end;
local function _(v48) --[[ Line: 395 ]] --[[ Name: IsLayeredClothingType ]]
    -- upvalues: v25 (copy)
    if v25[v48] == true then
        return true;
    else
        return false;
    end;
end;
local function v52(v50) --[[ Line: 403 ]] --[[ Name: GetLocalizedStringsForAssetType ]]
    -- upvalues: v6 (copy), v25 (copy)
    local v51 = {
        name = v6:FormatByKey("CoreScripts.PublishAssetPrompt.Name"), 
        description = v6:FormatByKey("CoreScripts.PublishAssetPrompt.Description"), 
        invalidName = v6:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"), 
        invalidDescription = v6:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"), 
        cancel = v6:FormatByKey("CoreScripts.PublishAssetPrompt.Cancel"), 
        submit = v6:FormatByKey("CoreScripts.PublishAssetPrompt.Submit")
    };
    if v25[v50] == true then
        v51.title = v6:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextClothing");
        v51.disclaimer = v6:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerAvatar");
        return v51;
    elseif v50 == Enum.AssetType.EmoteAnimation then
        v51.title = v6:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextEmote");
        v51.disclaimer = v6:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerEmote");
        return v51;
    elseif v50 == Enum.AssetType.Model then
        v51.title = v6:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextModel");
        v51.disclaimer = v6:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel");
        return v51;
    else
        if v50 == Enum.AssetType.Package then
            v51.title = v6:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextPackage");
            v51.disclaimer = v6:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel");
        end;
        return v51;
    end;
end;
v30.render = function(v53) --[[ Line: 432 ]] --[[ Name: render ]]
    -- upvalues: v52 (copy)
    return v53:renderAlertLocalized((v52(v53.props.assetType)));
end;
return v4.connect(function(v54) --[[ Line: 437 ]] --[[ Name: mapStateToProps ]]
    return {
        assetInstance = v54.promptRequest.promptInfo.assetInstance, 
        assetType = v54.promptRequest.promptInfo.assetType, 
        guid = v54.promptRequest.promptInfo.guid, 
        scopes = v54.promptRequest.promptInfo.scopes
    };
end, function(v55) --[[ Line: 446 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy)
    return {
        closePrompt = function() --[[ Line: 448 ]] --[[ Name: closePrompt ]]
            -- upvalues: v55 (copy), v21 (ref)
            return v55(v21());
        end
    };
end)(v30);