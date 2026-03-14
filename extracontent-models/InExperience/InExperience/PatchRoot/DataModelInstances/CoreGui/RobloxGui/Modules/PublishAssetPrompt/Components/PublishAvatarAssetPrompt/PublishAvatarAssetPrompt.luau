local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.BasePublishPrompt);
local v7 = require(l_Parent_0.Common.ObjectViewport);
local v8 = require(l_Parent_0.Common.LabeledTextBox);
local v9 = require(l_Parent_0.Common.PublishInfoList);
local v10 = require(l_CorePackages_0.Workspace.Packages.PurchasePrompt);
local l_PublishAssetAnalytics_0 = v10.PublishAssetAnalytics;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_1.Actions;
local v14 = require(l_Actions_0.SetPromptVisibility);
local v15 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v15.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v15.Hooks.RoactRodux.useSelector;
local v18 = require(l_Parent_1.Constants);
local v19 = UDim.new(0, 20);
return function(v20) --[[ Line: 43 ]] --[[ Name: PublishAvatarAssetPrompt ]]
    -- upvalues: l_Players_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), v18 (copy), v2 (copy), l_PublishAssetAnalytics_0 (copy), v10 (copy), l_mutedError_0 (copy), v14 (copy), v3 (copy), v19 (copy), v7 (copy), v8 (copy), v9 (copy), v6 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    assert(l_LocalPlayer_0, "LocalPlayer must not be nil");
    local v23 = l_useSelector_0(function(v22) --[[ Line: 48 ]]
        return v22.promptRequest.promptInfo;
    end);
    local v24 = l_useDispatch_0();
    local v25 = v18.AvatarAssetTypeDefaultName[v23.accessoryType];
    local v26 = l_LocalPlayer_0.Name .. "'s " .. v25;
    local v27, v28 = v2.useState(false);
    local v29, v30 = v2.useState(v26);
    local v31, v32 = v2.useState(true);
    local v33, v34 = v2.useState(v26);
    local v35, v36 = v2.useState(true);
    local v37, v38 = v2.useState(false);
    local v39, v40 = v2.useState(true);
    local v41 = v2.useRef(false);
    local v42 = v2.useRef(false);
    local v43 = v2.useRef(nil);
    local v44 = v2.useRef(nil);
    local v45 = v2.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: l_PublishAssetAnalytics_0 (ref), v28 (copy)
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Expand);
        v28(true);
    end, {});
    local v46 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v28 (copy)
        v28(false);
    end, {});
    local v47 = v2.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: v31 (copy), v35 (copy), v23 (copy), v39 (copy)
        return v31 and v35 and v23.accessoryInstance ~= nil and v39;
    end, {
        v31, 
        v35, 
        v23.accessoryInstance, 
        v39
    });
    local v49 = v2.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: l_PublishAssetAnalytics_0 (ref), v29 (copy), v33 (copy), v10 (ref), v23 (copy), l_mutedError_0 (ref)
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Buy);
        local v48 = {
            name = v29, 
            description = v33
        };
        if v10.initiateAvatarCreationFeePurchase then
            v10.initiateAvatarCreationFeePurchase(v48, v23.guid, v23.accessoryInstance, v23.priceInRobux);
            return;
        else
            l_mutedError_0("PurchasePrompt.initiateAvatarCreationFeePurchase is not available");
            return;
        end;
    end, {
        v29, 
        v33, 
        v23.guid, 
        v23.accessoryInstance, 
        v23.priceInRobux
    });
    local v52 = v2.useCallback(function(v50, v51) --[[ Line: 107 ]]
        -- upvalues: v30 (copy), v32 (copy), v41 (copy), l_PublishAssetAnalytics_0 (ref)
        v30(v50);
        v32(v51);
        if not v41.current then
            v41.current = true;
            l_PublishAssetAnalytics_0.sendFieldTouched(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Name);
        end;
    end, {});
    local v55 = v2.useCallback(function(v53, v54) --[[ Line: 117 ]]
        -- upvalues: v34 (copy), v36 (copy), v42 (copy), l_PublishAssetAnalytics_0 (ref)
        v34(v53);
        v36(v54);
        if not v42.current then
            v42.current = true;
            l_PublishAssetAnalytics_0.sendFieldTouched(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Description);
        end;
    end, {});
    local function v59(v56) --[[ Line: 127 ]]
        -- upvalues: v24 (copy), v14 (ref), v38 (copy), v40 (copy)
        local l_hasCompletedPurchase_0 = v56.hasCompletedPurchase;
        local l_isShown_0 = v56.isShown;
        if l_hasCompletedPurchase_0 and not l_isShown_0 then
            v24(v14(false));
            return;
        else
            v38(l_isShown_0);
            if l_isShown_0 then
                v40(false);
            end;
            return;
        end;
    end;
    local function v60() --[[ Line: 141 ]]
        -- upvalues: v40 (copy)
        v40(true);
    end;
    v2.useEffect(function() --[[ Line: 146 ]]
        -- upvalues: v10 (ref), v43 (copy), v59 (copy), v44 (copy), v60 (copy), l_mutedError_0 (ref), l_PublishAssetAnalytics_0 (ref)
        local l_windowStateChangedEvent_0 = v10.windowStateChangedEvent;
        local l_promptStateSetToNoneEvent_0 = v10.promptStateSetToNoneEvent;
        if l_windowStateChangedEvent_0 and l_promptStateSetToNoneEvent_0 then
            v43.current = l_windowStateChangedEvent_0:Connect(v59);
            v44.current = l_promptStateSetToNoneEvent_0:Connect(v60);
        else
            l_mutedError_0("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available");
        end;
        l_PublishAssetAnalytics_0.sendPageLoad(l_PublishAssetAnalytics_0.Section.BuyCreationPage);
        return function() --[[ Line: 160 ]]
            -- upvalues: v43 (ref), l_mutedError_0 (ref), v44 (ref)
            if v43.current then
                v43.current:Disconnect();
                v43.current = nil;
            else
                l_mutedError_0("windowStateChangedConnection was not established");
            end;
            if v44.current then
                v44.current:Disconnect();
                v44.current = nil;
                return;
            else
                l_mutedError_0("promptStateSetToNoneConnection was not established");
                return;
            end;
        end;
    end, {});
    local v63 = v3:FormatByKey("Feature.Avatar.Label.Accessory") .. " | " .. v3:FormatByKey(v18.AvatarAssetTypeLocalized[v23.accessoryType]);
    local v65 = v2.useCallback(function() --[[ Line: 181 ]]
        -- upvalues: v23 (copy), v2 (ref), v19 (ref), v7 (ref), v45 (copy), v8 (ref), v3 (ref), v33 (copy), v55 (copy), v9 (ref), v63 (copy)
        local v64 = v23.accessoryInstance == nil;
        return v2.createElement(v2.Fragment, nil, {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = v19, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = v19, 
                PaddingTop = v19
            }), 
            EmbeddedPreview = v2.createElement(v7, {
                openPreviewView = v45, 
                model = v23.accessoryInstance, 
                isLoading = v64, 
                useFullBodyCameraSettings = true, 
                fieldOfView = 30, 
                LayoutOrder = 1
            }), 
            DescriptionInput = v2.createElement(v8, {
                LayoutOrder = 2, 
                labelText = v3:FormatByKey("CoreScripts.PublishAssetPrompt.Description"), 
                centerText = false, 
                defaultText = v33, 
                maxLength = 1000, 
                onTextUpdated = v55, 
                textBoxHeight = 104, 
                invalidInputText = v3:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
            }), 
            InfoList = v2.createElement(v9, {
                typeName = v63, 
                LayoutOrder = 3
            })
        });
    end, {
        v23.accessoryInstance, 
        v23.accessoryType, 
        v33
    });
    return v2.createElement(v6, {
        promptBody = v65(), 
        screenSize = v20.screenSize, 
        showingPreviewView = v27, 
        closePreviewView = v46, 
        asset = v23.accessoryInstance, 
        nameLabel = v3:FormatByKey("CoreScripts.PublishAssetPrompt.Name"), 
        defaultName = v29, 
        titleText = v3:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"), 
        onNameUpdated = v52, 
        canSubmit = v47, 
        onSubmit = v49, 
        delayInputSeconds = 3, 
        priceInRobux = v23.priceInRobux, 
        showTopScrim = v37
    });
end;