local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = v8.Focusable;
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.Looks.LookViewport);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateDraftLook);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.DraftLookFinalPreview);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v24 = require(script.Parent.LookEmotePicker);
local v25 = require(script.Parent.LookBackgroundPicker);
local v26 = require(script.Parent.LookInfoForm);
local l_ActionBar_0 = v9.App.Button.ActionBar;
local l_ButtonStack_0 = v9.App.Button.ButtonStack;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_LoadingSpinner_0 = v9.App.Loading.LoadingSpinner;
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_Images_0 = v9.App.ImageSet.Images;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLookComposerBackgroundsEnabled);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit);
local v37 = game:DefineFastFlag("AXFixLookComposerExitPrompt", false);
local v38 = game:DefineFastFlag("AXLookComposerEmotesPickerEnabled", false);
local v39 = game:DefineFastFlag("AXLookComposerStepsRefactor", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v41 = {
    ApplyEmote = "ApplyEmote", 
    ApplyBackground = "ApplyBackground", 
    EditInfo = "EditInfo"
};
local v42 = {
    [v41.ApplyEmote] = true, 
    [v41.ApplyBackground] = false, 
    [v41.EditInfo] = false
};
local v43 = {};
if v39 then
    if v38 then
        table.insert(v43, v41.ApplyEmote);
    end;
    if v35() then
        table.insert(v43, v41.ApplyBackground);
    end;
    table.insert(v43, v41.EditInfo);
end;
local function v47(v44) --[[ Line: 87 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v11 (copy), v19 (copy)
    local v45 = l_useNavigation_0();
    return v2.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        iconSize = l_IconSize_0.Medium, 
        icon = l_Images_0["icons/navigation/close"], 
        onActivated = function() --[[ Line: 93 ]] --[[ Name: onActivated ]]
            -- upvalues: v44 (copy), v45 (copy), v11 (ref), v19 (ref)
            if v44.onActivated then
                v44.onActivated();
                return;
            else
                local v46 = v45.getParam("prevNavPage") or v11.Home;
                v19.closeLookComposer(v45);
                v45.navigate(v46);
                return;
            end;
        end
    });
end;
local function v49(v48) --[[ Line: 106 ]]
    -- upvalues: v18 (copy)
    return v48.AvatarExperience.AvatarScene.Looks[v18.DraftLookId] and v48.AvatarExperience.AvatarScene.Looks[v18.DraftLookId].displayProperties and v48.AvatarExperience.AvatarScene.Looks[v18.DraftLookId].displayProperties.emoteAssetId ~= nil;
end;
trimWhitespaceFromString = function(v50) --[[ Line: 113 ]] --[[ Name: trimWhitespaceFromString ]]
    return v50:match("^%s*(.-)%s*$");
end;
return function() --[[ Line: 117 ]] --[[ Name: LookComposerPage ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), v8 (copy), v39 (copy), v43 (copy), v41 (copy), l_useDesignTokens_0 (copy), v36 (copy), v15 (copy), l_useSelector_0 (copy), v18 (copy), v49 (copy), l_PeekViewState_0 (copy), v14 (copy), v13 (copy), v20 (copy), v21 (copy), v19 (copy), v17 (copy), v35 (copy), v22 (copy), l_ButtonType_0 (copy), v11 (copy), v37 (copy), l_AvatarScreen_0 (copy), v47 (copy), l_Focusable_0 (copy), v16 (copy), v12 (copy), v42 (copy), l_LoadingSpinner_0 (copy), v24 (copy), v25 (copy), v26 (copy), l_ActionBar_0 (copy), l_ButtonStack_0 (copy)
    local v51 = l_useDispatch_0();
    local v52 = l_useNavigation_0();
    local v53 = l_useStyle_0();
    local v54 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useRef(v8.createFocusController()).current;
    local v55, v56 = v2.useState(Vector2.new());
    local v57 = if v39 then v43[1] else v41.ApplyEmote;
    local v58, v59 = v2.useState(v57);
    local v60, v61 = v2.useState(true);
    local v62, v63 = v2.useState(true);
    local v64 = l_useDesignTokens_0();
    local v65 = if v36() then v15({
        goBack = "Feature.Avatar.Action.GoBack", 
        next = "Feature.Avatar.Action.Next", 
        previewAndPost = "Feature.Avatar.Action.ComposerPreviewAndPost", 
        postHeader = "Feature.Avatar.Header.Post"
    }) else nil;
    local v67 = l_useSelector_0(function(v66) --[[ Line: 140 ]]
        -- upvalues: v18 (ref)
        return v66.AvatarExperience.AvatarScene.Looks[v18.DraftLookId];
    end);
    local v68 = l_useSelector_0(v49);
    local v69, v70 = v2.useState(false);
    local v71, v72 = v2.useState(false);
    local v74 = l_useSelector_0(function(v73) --[[ Line: 147 ]]
        return v73.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
    end) ~= l_PeekViewState_0.Closed;
    local v75 = v14(v13);
    v2.useEffect(function() --[[ Line: 153 ]]
        -- upvalues: v51 (copy), v20 (ref), l_PeekViewState_0 (ref), v21 (ref), v75 (copy), v61 (copy), v19 (ref), v52 (copy)
        v51(v20(l_PeekViewState_0.Closed));
        v51(v21(v75)):andThen(function(v76) --[[ Line: 155 ]]
            -- upvalues: v61 (ref), v19 (ref), v52 (ref)
            if v76 then
                v61(false);
                return;
            else
                v19.closeLookComposer(v52);
                return;
            end;
        end);
    end, {});
    local v77 = if v67 and v67.displayProperties and v67.displayProperties.backgroundType == "Hex" then Color3.fromHex(v67.displayProperties.backgroundValue) else v53.Theme.PlaceHolder.Color;
    local v78 = v2.useMemo(function() --[[ Line: 170 ]]
        -- upvalues: v2 (ref), v53 (copy), v77 (copy), v67 (copy), v17 (ref)
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 1, 
            BorderColor3 = v53.Theme.BackgroundDefault.Color, 
            BackgroundColor3 = v53.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = 0
        }, {
            ThumbnailBackground = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BorderSizePixel = 1, 
                BorderColor3 = v77, 
                BackgroundColor3 = v77, 
                BackgroundTransparency = v53.Theme.PlaceHolder.Transparency
            }, {
                LookViewport = if v67 then v2.createElement(v17, {
                    lookDetails = v67
                }) else nil
            })
        });
    end, {
        v77, 
        v67
    });
    local v81 = v2.useCallback(function() --[[ Line: 202 ]]
        -- upvalues: v39 (ref), v59 (copy), v43 (ref), v58 (copy), v41 (ref), v35 (ref)
        if v39 then
            v59(function(v79) --[[ Line: 204 ]]
                -- upvalues: v43 (ref)
                local v80 = table.find(v43, v79);
                return v43[if v80 then v80 - 1 else 1];
            end);
            return;
        elseif v58 == v41.ApplyBackground then
            v59(v41.ApplyEmote);
            return;
        else
            if v58 == v41.EditInfo then
                if v35() then
                    v59(v41.ApplyBackground);
                    return;
                else
                    v59(v41.ApplyEmote);
                end;
            end;
            return;
        end;
    end, if v39 then {} else {
        v58
    });
    local v82 = v2.useMemo(function() --[[ Line: 221 ]]
        -- upvalues: v81 (copy), v36 (ref), v65 (copy)
        return {
            props = {
                onActivated = v81, 
                text = if v36() then v65.goBack else "Go Back"
            }
        };
    end, {
        v81
    });
    local v85 = v2.useCallback(function() --[[ Line: 230 ]]
        -- upvalues: v39 (ref), v58 (copy), v43 (ref), v51 (copy), v22 (ref), v52 (copy), v59 (copy), v41 (ref), v35 (ref)
        if v39 then
            if v58 == v43[#v43] then
                v51(v22(v52));
                return;
            else
                v59(function(v83) --[[ Line: 235 ]]
                    -- upvalues: v43 (ref)
                    local v84 = table.find(v43, v83);
                    return v43[if v84 then v84 + 1 else 1];
                end);
                return;
            end;
        elseif v58 == v41.ApplyEmote then
            if v35() then
                v59(v41.ApplyBackground);
                return;
            else
                v59(v41.EditInfo);
                return;
            end;
        elseif v58 == v41.ApplyBackground then
            v59(v41.EditInfo);
            return;
        else
            if v58 == v41.EditInfo then
                v51(v22(v52));
            end;
            return;
        end;
    end, {
        v58
    });
    local v86 = v2.useMemo(function() --[[ Line: 255 ]]
        -- upvalues: l_ButtonType_0 (ref), v85 (copy), v39 (ref), v58 (copy), v43 (ref), v65 (copy), v36 (ref), v41 (ref), v62 (copy)
        return {
            buttonType = l_ButtonType_0.PrimarySystem, 
            isDefaultChild = true, 
            props = {
                onActivated = v85, 
                text = if v39 then if v58 == v43[#v43] then v65.previewAndPost else v65.next else if v36() then if v58 == v41.EditInfo then v65.previewAndPost else v65.next else v58 == v41.EditInfo and "Preview & Share" or "Next", 
                isDisabled = if v58 == v41.EditInfo then v62 else nil
            }
        };
    end, {
        v85, 
        v62
    });
    local v88 = v2.useCallback(function() --[[ Line: 272 ]]
        -- upvalues: v52 (copy), v11 (ref), v37 (ref), v19 (ref)
        local v87 = v52.getParam("prevNavPage") or v11.Home;
        if v37 then
            v19.closeFocusedScreen(v52);
        end;
        v19.closeLookComposer(v52);
        v52.navigate(v87);
    end, {
        v52
    });
    local v89 = v68 or v69 or v71;
    local v90 = v2.useCallback(function() --[[ Line: 283 ]]
        -- upvalues: v89 (copy), v52 (copy), l_AvatarScreen_0 (ref), v88 (copy)
        if v89 then
            v52.navigate(l_AvatarScreen_0.LooksConfirmationPrompt, {
                onOverlayClosed = v88
            });
            return;
        else
            if v88 then
                v88();
            end;
            return;
        end;
    end, {
        v52, 
        v89, 
        v88
    });
    local v91 = v2.useCallback(function() --[[ Line: 295 ]]
        -- upvalues: v47 (ref), v90 (copy)
        return v47({
            onActivated = v90
        });
    end, {
        v90
    });
    local l_createElement_0 = v2.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v94 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v54
    };
    local v95 = {};
    local l_createElement_1 = v2.createElement;
    local l_v16_0 = v16;
    local v98 = {
        bottomBarEnabled = false, 
        allowAdaptiveScrolling = false, 
        topBar = v2.createElement(v12.Container, {
            titleText = if v36() then v65.postHeader else "Post", 
            transparentBackground = false, 
            leftItem = v91
        }), 
        sceneUi = v78, 
        isSceneFullView = false, 
        isUIFullView = false, 
        showRobuxBalance = v42[v58]
    };
    local v99 = {
        Overlay = v74 and v2.createElement("Frame", {
            BackgroundTransparency = v53.Theme.Overlay.Transparency, 
            BackgroundColor3 = v53.Theme.Overlay.Color, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        })
    };
    local l_createElement_2 = v2.createElement;
    local v101 = "Frame";
    local v102 = {
        Size = UDim2.new(1, 0, 1, -v55.Y), 
        BackgroundTransparency = 1
    };
    local v103 = {
        LoadingFrame = v60 and v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v53.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, {
            LoadingSpinner = v2.createElement(l_LoadingSpinner_0, {
                position = UDim2.fromScale(0.5, 0.5), 
                size = UDim2.fromOffset(v64.Global.Size_600, v64.Global.Size_600), 
                anchorPoint = Vector2.new(0.5, 0.5)
            })
        })
    };
    local v104 = not v60;
    if v104 then
        v104 = v2.createElement;
        local l_Fragment_0 = v2.Fragment;
        local v106 = {};
        local v107 = {};
        local v108 = false;
        if v58 == v41.ApplyEmote then
            v108 = v2.createElement(v24);
        end;
        v107.EmotePicker = v108;
        v108 = false;
        if v58 == v41.ApplyBackground then
            v108 = v2.createElement(v25);
        end;
        v107.BackgroundPicker = v108;
        v108 = false;
        if v58 == v41.EditInfo then
            v108 = v2.createElement(v26, {
                interactable = not v74, 
                disableNextButton = function(v109) --[[ Line: 347 ]] --[[ Name: disableNextButton ]]
                    -- upvalues: v63 (copy)
                    v63(v109);
                end, 
                onTitleChange = function(v110) --[[ Line: 350 ]] --[[ Name: onTitleChange ]]
                    -- upvalues: v70 (copy)
                    local v111 = string.len((trimWhitespaceFromString(v110))) ~= 0;
                    v70(v111);
                end, 
                onSubtitleChange = function(v112) --[[ Line: 354 ]] --[[ Name: onSubtitleChange ]]
                    -- upvalues: v72 (copy)
                    local v113 = string.len((trimWhitespaceFromString(v112))) ~= 0;
                    v72(v113);
                end
            });
        end;
        v107.InfoForm = v108;
        v104 = v104(l_Fragment_0, v106, v107);
    end;
    v103.Content = v104;
    v99.Content = l_createElement_2(v101, v102, v103);
    v99.ActionBarBackground = v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        Size = UDim2.new(1, 0, 0, v55.Y), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v53.Theme.BackgroundDefault.Color, 
        ZIndex = 0
    });
    v99.ActionBar = not v60 and not v74 and v2.createElement(l_ActionBar_0, {
        onAbsoluteSizeChanged = function(v114) --[[ Line: 372 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v56 (copy)
            v56(v114 + Vector2.new(0, 12));
        end
    }, {
        ButtonStack = v2.createElement(l_ButtonStack_0, {
            buttons = if v58 == v57 then {
                v86
            } else {
                v82, 
                v86
            }
        })
    });
    v95.AvatarExperienceView = l_createElement_1(l_v16_0, v98, v99);
    return l_createElement_0(l_Frame_0, v94, v95);
end;