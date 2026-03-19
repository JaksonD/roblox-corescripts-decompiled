local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_script_FirstAncestor_0.constants);
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local v6 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v7 = require(l_script_FirstAncestor_0.Parent.Localization);
local v8 = require(l_script_FirstAncestor_0.Components.ChromeWindowFrame);
local v9 = require(l_script_FirstAncestor_0.Components.MarqueeScroller);
local v10 = require(l_script_FirstAncestor_0.Components.MusicIcon);
local v11 = require(l_script_FirstAncestor_0.Components.LikeButton);
local v12 = require(l_script_FirstAncestor_0.Components.TrackingAudioIcon);
local v13 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v14 = require(l_script_FirstAncestor_0.Analytics.sendChromeWindowAnalytics);
local v15 = require(l_script_FirstAncestor_0.Internal.isInputInsideObject);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdPopoverSubmenu);
local l_useLocalization_0 = v7.Hooks.useLocalization;
local l_createNextOrder_0 = v6.createNextOrder;
local l_useEventConnection_0 = v6.useEventConnection;
local l_useCallback_0 = v5.useCallback;
local l_useMemo_0 = v5.useMemo;
local l_useRef_0 = v5.useRef;
local l_useState_0 = v5.useState;
local v24 = {
    Loading = "Loading", 
    Unverified = "Unverified", 
    MeetsCriteria = "MeetsCriteria"
};
local v25 = {
    isLoading = false, 
    maxSize = Vector2.new(300, 1e999)
};
return function(v26) --[[ Line: 63 ]] --[[ Name: ChromeWindow ]]
    -- upvalues: v3 (copy), v25 (copy), l_createNextOrder_0 (copy), l_useMemo_0 (copy), v24 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), l_useState_0 (copy), v14 (copy), v13 (copy), v16 (copy), l_useRef_0 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), v15 (copy), v4 (copy), v5 (copy), v11 (copy), v2 (copy), v8 (copy), v12 (copy), v10 (copy), v9 (copy)
    local v27 = v3.Dictionary.join(v25, v26);
    local v28 = l_createNextOrder_0();
    local v29 = l_useMemo_0(function() --[[ Line: 67 ]]
        -- upvalues: v27 (copy), v24 (ref)
        if v27.isLoading then
            return v24.Loading;
        elseif v27.song then
            if v27.song.meetsCriteria then
                return v24.MeetsCriteria;
            else
                return v24.Unverified;
            end;
        else
            return v24.Loading;
        end;
    end, {
        v27.isLoading, 
        v27.song
    });
    local v30 = v29 ~= v24.MeetsCriteria;
    local v31 = l_useLocalization_0({
        windowTitle = "CoreScripts.TopBar.Music", 
        musicLoading = "CoreScripts.TopBar.MusicLoading", 
        musicUnverified = "CoreScripts.TopBar.MusicNotVerified", 
        report = "CoreScripts.TopBar.Label.Report"
    });
    local v32 = l_useCallback_0(function() --[[ Line: 92 ]]
        -- upvalues: v27 (copy)
        if v27.onToggleLike then
            v27.onToggleLike();
        end;
    end, {
        v27.onToggleLike
    });
    local v33 = l_useMemo_0(function() --[[ Line: 98 ]]
        -- upvalues: v27 (copy)
        if v27.song then
            return table.concat(v27.song.artists, ", ");
        else
            return nil;
        end;
    end, {
        v27.song
    });
    local v34, v35 = l_useState_0(false);
    local v37 = l_useCallback_0(function() --[[ Line: 106 ]]
        -- upvalues: v35 (copy), v14 (ref), v13 (ref)
        v35(function(v36) --[[ Line: 107 ]]
            return not v36;
        end);
        v14({
            action = v13.SeeMore
        });
    end, {});
    local v38 = nil;
    if not v16() then
        v38 = l_useRef_0(nil);
        l_useEventConnection_0(l_UserInputService_0.InputBegan, function(v39) --[[ Line: 116 ]]
            -- upvalues: v34 (copy), v15 (ref), v38 (ref), v35 (copy)
            if v34 and not v15(v39.Position, v38.current) then
                v35(false);
            end;
        end, {
            v34
        });
    end;
    local v41 = l_useCallback_0(function(v40) --[[ Line: 125 ]]
        -- upvalues: v4 (ref), v27 (copy), v37 (copy)
        if v40 == v4.Enums.ControlState.Pressed then
            if v27.onReport then
                v27.onReport();
            end;
            v37();
        end;
    end, {
        v27.onReport
    });
    local v42 = if not v30 then {
        LikeButton = v5.createElement(v11, {
            isFavorited = if v27.song then v27.song.isLiked else false, 
            onFavorite = v32
        })
    } else {};
    local v43 = if v16() then nil else {
        Menu = v5.createElement(v4.View, {
            tag = "auto-y col gap-small", 
            Size = UDim2.fromOffset(v2.SUBMENU_WIDTH, 0), 
            sizeConstraint = {
                MaxSize = Vector2.new(v2.SUBMENU_WIDTH, 1e999)
            }
        }, {
            ReportButton = v5.createElement(v4.View, {
                tag = "size-full-0 auto-y row gap-small align-y-center radius-medium", 
                onStateChanged = v41
            }, {
                Icon = v5.createElement(v4.Icon, {
                    name = "icons/actions/feedback", 
                    LayoutOrder = v28()
                }), 
                Label = v5.createElement(v4.Text, {
                    tag = "auto-xy text-title-medium content-emphasis", 
                    Text = v31.report, 
                    LayoutOrder = v28()
                })
            })
        })
    };
    local v44 = if v16() then {
        {
            id = "report", 
            text = v31.report, 
            icon = "icons/actions/feedback", 
            onActivated = function() --[[ Line: 179 ]] --[[ Name: onActivated ]]
                -- upvalues: v27 (copy), v35 (copy)
                if v27.onReport then
                    v27.onReport();
                end;
                v35(false);
            end
        }
    } else nil;
    local l_createElement_0 = v5.createElement;
    local l_v8_0 = v8;
    local v47 = {
        title = v31.windowTitle, 
        maxSize = v27.maxSize, 
        actions = v42, 
        menuItems = if v16() then if not (v29 ~= "MeetsCriteria") or v29 == "Unverified" then v44 else nil else nil, 
        submenu = if v16() then nil else if not (v29 ~= "MeetsCriteria") or v29 == "Unverified" then v43 else nil, 
        isSubMenuOpen = v34, 
        isFocused = v27.isFocused, 
        onToggleSubMenu = v37, 
        onClose = v27.onClose, 
        onUnfocus = v27.onUnfocus, 
        overflowButtonRef = if v16() then nil else v38
    };
    local v48 = {};
    local l_createElement_1 = v5.createElement;
    local l_View_0 = v4.View;
    local v51 = {
        Size = UDim2.new(1, 0, 0, v2.WINDOW_HEIGHT), 
        tag = "col auto-x align-y-center"
    };
    local v52 = {
        InvalidAudio = if v29 ~= v24.MeetsCriteria then v5.createElement(v4.View, {
            tag = "auto-x size-0-full gap-medium row align-y-center"
        }, {
            Icon = v5.createElement(v12, {
                isMoving = v29 == v24.Unverified
            }), 
            Alert = v5.createElement(v4.Text, {
                tag = "auto-xy text-body-medium content-emphasis shrink text-wrap text-align-x-left text-align-y-center", 
                Text = if v29 == v24.Unverified then v31.musicUnverified else v31.musicLoading, 
                LayoutOrder = v28()
            })
        }) else nil
    };
    local v53 = false;
    if v29 == v24.MeetsCriteria then
        v53 = v5.createElement(v4.View, {
            tag = "auto-xy row gap-medium flex-between align-y-center"
        }, {
            Icon = v5.createElement(v10, {
                layoutOrder = v28()
            }), 
            SongInfo = v5.createElement(v4.View, {
                tag = "auto-xy col gap-xsmall shrink clip", 
                LayoutOrder = v28()
            }, {
                Title = v5.createElement(v9, {
                    speed = v30 and 0 or nil, 
                    LayoutOrder = v28()
                }, {
                    Label = v5.createElement(v4.Text, {
                        tag = "auto-xy shrink text-title-medium content-emphasis", 
                        Text = if v27.song then v27.song.title else ""
                    })
                }), 
                Artists = v5.createElement(v4.Text, {
                    tag = "auto-xy shrink text-body-small content-default", 
                    Text = v33, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = v28()
                })
            })
        });
    end;
    v52.NowPlaying = v53;
    v48.Body = l_createElement_1(l_View_0, v51, v52);
    return l_createElement_0(l_v8_0, v47, v48);
end;