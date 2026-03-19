local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.CrossExperienceVoice);
local l_CrossExperienceVoiceManager_0 = v3.CrossExperienceVoiceManager;
local v5 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v5.Cryo;
local v7 = require(l_Parent_0.React);
local l_useParticipant_0 = v3.Hooks.useParticipant;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useNavigation_0 = v5.useNavigation;
local v11 = require(l_Parent_0.BuilderIcons);
local v12 = require(script.Parent.VoicePackButton);
local l_Enums_0 = v2.Enums;
local l_IconSize_0 = l_Enums_0.IconSize;
local l_InputSize_0 = l_Enums_0.InputSize;
local v16 = {
    enableTestingTheme = false, 
    closeCentralOverlayThunk = function() --[[ Line: 32 ]] --[[ Name: closeCentralOverlayThunk ]]
        return {
            type = "CloseCentralOverlay"
        };
    end
};
return function(v17) --[[ Line: 39 ]] --[[ Name: SquadVoiceChangers ]]
    -- upvalues: l_Cryo_0 (copy), v16 (copy), l_useNavigation_0 (copy), l_useLocalUserId_0 (copy), l_useParticipant_0 (copy), v7 (copy), v12 (copy), l_CrossExperienceVoiceManager_0 (copy), v2 (copy), v11 (copy), l_IconSize_0 (copy), l_Enums_0 (copy), l_InputSize_0 (copy)
    local v18 = l_Cryo_0.Dictionary.join(v16, v17);
    local v19 = l_useNavigation_0();
    local v20 = tonumber(l_useLocalUserId_0()) or -1;
    local v21 = l_useParticipant_0(v20);
    local v22 = if v21 then v21.selectedVoicePack else nil;
    local v23 = if v21 then v21.isVoiceChangerActive else nil;
    local v24 = if v21 then v21.isVoiceChangerHearMyselfActive else nil;
    local v25 = v19.getScreenProps("wideMode", false);
    local v26 = "bg-surface-0";
    local v27 = "bg-surface-0";
    if v18.enableTestingTheme then
        v26 = "bg-system-alert";
        v27 = "bg-system-warning";
    end;
    local v28 = {};
    local v29 = {
        {
            name = "None"
        }, 
        {
            name = "Basic"
        }, 
        {
            name = "Chipmunk"
        }, 
        {
            name = "Robot"
        }, 
        {
            name = "HighPitchRobot"
        }, 
        {
            name = "Monster"
        }, 
        {
            name = "Dreamy"
        }, 
        {
            name = "Powerful"
        }, 
        {
            name = "Ghost"
        }
    };
    local v30 = #v29 + (v18.fillListWithExtraVoicePacks and 25 or 0);
    local function v35(v31, v32) --[[ Line: 75 ]] --[[ Name: makeButton ]]
        -- upvalues: v29 (copy), v18 (copy), v7 (ref), v12 (ref), v23 (copy), v22 (copy), l_CrossExperienceVoiceManager_0 (ref), v20 (copy)
        local v33 = v29[v31] or {
            name = "Voicepack " .. v31
        };
        local v34 = if v18.fillListWithExtraVoicePacks then v33.name or "Voicepack " .. v31 else v33.name;
        return v7.createElement(v12, {
            LayoutOrder = v32, 
            voicePackName = v34, 
            isVoiceChangerActive = v23, 
            isSelected = if v22 then v34 == v22 else false, 
            onActivated = function() --[[ Line: 86 ]] --[[ Name: onActivated ]]
                -- upvalues: l_CrossExperienceVoiceManager_0 (ref), v34 (copy), v23 (ref), v20 (ref)
                l_CrossExperienceVoiceManager_0.default:setVoicePack(v34);
                if v34 == "None" and v23 then
                    l_CrossExperienceVoiceManager_0.default:disableVoiceChanger(v20);
                    return;
                else
                    if v34 ~= "None" and not v23 then
                        l_CrossExperienceVoiceManager_0.default:enableVoiceChanger(v20);
                    end;
                    return;
                end;
            end
        });
    end;
    for v36 = 1, v30 do
        v28["VoicePackButton_" .. v36] = v35(v36, v36);
    end;
    local v37 = nil;
    v37 = if v25 then v7.createElement(v2.View, {
        tag = "size-full-0 auto-y", 
        LayoutOrder = 1
    }, {
        Title = v7.createElement(v2.Text, {
            tag = "position-center-center anchor-center-center text-align-x-center text-align-y-center size-full-0 auto-xy text-heading-small radius-medium " .. v27, 
            Text = "Choose voice pack", 
            LayoutOrder = 1
        }), 
        CloseButton = v7.createElement(v2.View, {
            tag = "position-center-left anchor-center-left auto-xy radius-circle bg-action-subtle padding-xsmall", 
            ZIndex = 2, 
            onActivated = v18.closeSquadVoiceChangers
        }, {
            Icon = v7.createElement(v2.Icon, {
                tag = "position-center-center anchor-center-center auto-xy", 
                name = v11.Icon.ArrowLargeLeft, 
                size = l_IconSize_0.Large
            })
        }), 
        DoneButton = v7.createElement(v2.Text, {
            Text = "Done", 
            tag = "position-center-right anchor-center-right text-align-x-center text-align-y-center size-2200-0 auto-y text-label-large radius-medium padding-small text-wrap bg-action-subtle", 
            LayoutOrder = 2, 
            onActivated = v18.closeSquadVoiceChangers
        })
    }) else v7.createElement(v2.View, {
        tag = "size-full-0 auto-y", 
        LayoutOrder = 1
    }, {
        Title = v7.createElement(v2.Text, {
            tag = "position-center-left anchor-center-left text-align-x-left text-align-y-center size-full-0 auto-xy text-heading-small radius-medium " .. v27, 
            Text = "Choose voice pack", 
            LayoutOrder = 1
        }), 
        CloseButton = v7.createElement(v2.View, {
            tag = "position-center-right anchor-center-right auto-xy radius-circle bg-action-subtle padding-xsmall", 
            LayoutOrder = 2, 
            ZIndex = 2, 
            onActivated = v18.closeSquadVoiceChangers
        }, {
            Icon = v7.createElement(v2.Icon, {
                tag = "position-center-center anchor-center-center auto-xy", 
                name = v11.Icon.X, 
                size = l_IconSize_0.Large
            })
        })
    });
    return v7.createElement(v2.View, {
        tag = "size-full-full col align-x-center align-y-top gap-large padding-large radius-medium stroke-emphasis " .. v26
    }, {
        TopBar = v37, 
        Divider = v7.createElement(v2.Divider, {
            variant = l_Enums_0.DividerVariant.Default, 
            LayoutOrder = 2
        }), 
        HearMyselfBar = v7.createElement(v2.View, {
            tag = {
                ["size-full-0 auto-y row align-x-left align-y-center padding-left-xxlarge padding-right-xxlarge"] = true, 
                ["bg-system-warning"] = v18.enableTestingTheme
            }, 
            LayoutOrder = 3
        }, {
            HearMyselfLabel = v7.createElement(v2.Text, {
                Text = "Hear myself", 
                tag = "text-align-x-left text-align-y-center size-0-0 auto-xy fill text-label-medium padding-left-large radius-medium text-wrap bg-action-subtle", 
                LayoutOrder = 1
            }), 
            HearMyselfToggleHolder = v7.createElement(v2.View, {
                tag = "row align-x-center align-y-center size-0-0 auto-xy padding-right-large", 
                LayoutOrder = 2
            }, {
                HearMyselfToggle = v7.createElement(v2.Toggle, {
                    size = l_InputSize_0.Medium, 
                    label = "", 
                    onActivated = function(_) --[[ Line: 191 ]] --[[ Name: onActivated ]]
                        -- upvalues: v24 (copy), l_CrossExperienceVoiceManager_0 (ref), v20 (copy)
                        if v24 then
                            l_CrossExperienceVoiceManager_0.default:disableHearMyself(v20);
                            return;
                        else
                            l_CrossExperienceVoiceManager_0.default:enableHearMyself(v20);
                            return;
                        end;
                    end, 
                    isChecked = v24
                })
            })
        }), 
        ButtonsView = v7.createElement(v2.View, {
            tag = "fill padding-left-medium padding-right-medium padding-bottom-medium radius-medium size-full-full auto-y col align-x-center align-y-top " .. v27, 
            LayoutOrder = 4
        }, {
            ButtonsScroller = v7.createElement(v2.ScrollView, {
                tag = "size-full-0 fill bg-action-subtle", 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new()
                }, 
                BorderSizePixel = 0
            }, {
                Buttons = v7.createElement(v2.View, {
                    tag = "size-full-0 auto-y col align-x-center align-y-top padding-medium fill"
                }, v28)
            })
        }), 
        BottomDoneButton = if not v25 then v7.createElement(v2.Text, {
            Text = "Done", 
            tag = "position-center-center anchor-center-center text-align-x-center text-align-y-center size-full-0 auto-y text-label-large radius-medium padding-small text-wrap bg-action-subtle", 
            LayoutOrder = 5, 
            onActivated = v18.closeSquadVoiceChangers
        }) else nil
    });
end;