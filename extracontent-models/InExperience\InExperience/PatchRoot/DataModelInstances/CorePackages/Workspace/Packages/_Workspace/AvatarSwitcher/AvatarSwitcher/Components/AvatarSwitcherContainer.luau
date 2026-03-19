local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local v6 = require(l_Parent_0.SignalsReact);
local l_useSignalState_0 = v6.useSignalState;
local l_useUnifiedEventListenerInExperience_0 = require(l_Parent_0.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience;
local v9 = require(l_script_FirstAncestor_0.Components.EmptyState);
local v10 = require(l_script_FirstAncestor_0.Components.VerticalLayout);
local v11 = require(l_script_FirstAncestor_0.Components.HorizontalLayout);
local v12 = require(l_script_FirstAncestor_0.Components.SingleItemLayout);
local v13 = require(l_script_FirstAncestor_0.Components.TopBar);
local v14 = require(l_script_FirstAncestor_0.Components.OutfitsGridWithMessage);
local v15 = require(l_script_FirstAncestor_0.Components.PreviewPanel);
local v16 = require(l_script_FirstAncestor_0.Components.Modals.RespawnDialogContainer);
local v17 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
local v18 = require(l_script_FirstAncestor_0.Enums.ExperienceAvatarSupportType);
local v19 = require(l_Parent_0.AvatarExperienceCommon);
local v20 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAvatarSwitcherUiFixes_0 = v20.FFlagAvatarSwitcherUiFixes;
local l_FFlagAXAvatarTimeoutFlowIE_0 = v20.FFlagAXAvatarTimeoutFlowIE;
local l_TimeoutBanner_0 = v19.Components.TimeoutBanner;
return function(v24) --[[ Line: 43 ]] --[[ Name: AvatarSwitcherContainer ]]
    -- upvalues: l_useTokens_0 (copy), l_useSignalState_0 (copy), v17 (copy), v6 (copy), v18 (copy), l_useUnifiedEventListenerInExperience_0 (copy), v3 (copy), v13 (copy), l_FFlagAXAvatarTimeoutFlowIE_0 (copy), v4 (copy), l_TimeoutBanner_0 (copy), v14 (copy), v15 (copy), l_FFlagAvatarSwitcherUiFixes_0 (copy), l_GuiService_0 (copy), v9 (copy), v12 (copy), v10 (copy), v11 (copy), v16 (copy)
    local v25 = l_useTokens_0();
    local v26 = l_useSignalState_0(v17);
    local v27 = l_useSignalState_0(v26.getIsEmpty);
    local v28 = v6.useSignalState(v26.getExperienceAvatarSupportType) == v18.NoSupport;
    l_useUnifiedEventListenerInExperience_0();
    v3.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v26 (copy)
        task.spawn(function() --[[ Line: 53 ]]
            -- upvalues: v26 (ref)
            v26.fetchExperienceAvatarSupportType();
        end);
    end, {});
    local v29 = v3.createElement(v13, {
        onClose = v24.toggleWindow
    });
    local v30 = if l_FFlagAXAvatarTimeoutFlowIE_0 then v3.createElement(v4.View, {
        tag = "auto-y size-full-0 col gap-0"
    }, {
        TopBar = v29, 
        TimeoutBanner = v3.createElement(v4.View, {
            tag = "auto-y size-full-0 bg-surface-200"
        }, {
            Banner = v3.createElement(l_TimeoutBanner_0, {
                shouldFetch = true, 
                shouldNavigateOnClick = false
            })
        })
    }) else v29;
    local v31 = v3.createElement(v14);
    local v32 = v3.createElement(v15, {
        compactLayout = v24.verticalLayout
    });
    return (v3.createElement("Frame", {
        Active = true, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v25.Color.OverMedia.OverMedia_0.Color3, 
        BackgroundTransparency = if l_FFlagAvatarSwitcherUiFixes_0 then v25.Color.OverMedia.OverMedia_0.Transparency * l_GuiService_0.PreferredTransparency else v25.Color.OverMedia.OverMedia_0.Transparency
    }, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v25.Radius.Medium)
        }), 
        Layout = if v27 then v3.createElement(v9, {
            headerSlot = if l_FFlagAXAvatarTimeoutFlowIE_0 then v30 else v29
        }) else if v28 then v3.createElement(v12, {
            headerHeight = if l_FFlagAXAvatarTimeoutFlowIE_0 then nil else v25.Size.Size_1200, 
            headerSlot = if l_FFlagAXAvatarTimeoutFlowIE_0 then v30 else v29, 
            contentSlot = v3.createElement(v4.View, {
                tag = "size-full-full padding-x-xlarge col gap-medium"
            }, {
                OutfitsGrid = v31
            })
        }, {}) else if v24.verticalLayout then v3.createElement(v10, {
            headerHeight = if l_FFlagAXAvatarTimeoutFlowIE_0 then nil else v25.Size.Size_1200, 
            headerSlot = if l_FFlagAXAvatarTimeoutFlowIE_0 then v30 else v29, 
            topItemSlot = v32, 
            bottomItemSlot = v3.createElement(v4.View, {
                tag = "size-full-full padding-x-xlarge padding-top-xlarge"
            }, {
                OutfitsGrid = v31
            })
        }) else v3.createElement(v11, {
            headerHeight = if l_FFlagAXAvatarTimeoutFlowIE_0 then nil else v25.Size.Size_1200, 
            headerSlot = if l_FFlagAXAvatarTimeoutFlowIE_0 then v30 else v29, 
            leftItemSlot = v3.createElement(v4.View, {
                tag = "size-full-full padding-x-xlarge"
            }, {
                OutfitsGrid = v31
            }), 
            rightItemSlot = v32
        }), 
        RespawnDialogContainer = v3.createElement(v16, {
            toggleWindow = v24.toggleWindow, 
            getRespawnBehaviour = v24.getRespawnBehaviour, 
            respawnBehaviorChangedEvent = v24.respawnBehaviorChangedEvent
        })
    }));
end;