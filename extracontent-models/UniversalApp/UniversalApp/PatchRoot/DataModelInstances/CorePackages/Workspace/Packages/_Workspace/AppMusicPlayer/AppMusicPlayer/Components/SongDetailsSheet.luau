local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppMusicPlayer");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Parent.Songbird);
local l_AudioPlayer_0 = v5.AudioPlayer;
local l_AudioPlayerActions_0 = v5.AudioPlayerActions;
local l_createNextOrder_0 = v4.createNextOrder;
local v9 = {
    disablePortal = false, 
    hasBackdrop = true
};
return v3.memo(function(v10) --[[ Line: 38 ]] --[[ Name: SongDetailsSheet ]]
    -- upvalues: v1 (copy), v9 (copy), l_createNextOrder_0 (copy), v3 (copy), v2 (copy), l_AudioPlayer_0 (copy), l_AudioPlayerActions_0 (copy)
    local v11 = v1.Dictionary.join(v9, v10);
    local v12 = l_createNextOrder_0();
    local v13 = {
        title = v11.title, 
        artist = v11.artist, 
        assetId = tostring(v11.assetId), 
        thumbnail = v11.albumArt, 
        isLiked = v11.isLiked
    };
    if not v11.isOpen then
        return nil;
    else
        return v3.createElement(v2.Dialog.Root, {
            disablePortal = v11.disablePortal, 
            hasBackdrop = v11.hasBackdrop, 
            onClose = v11.onClose
        }, {
            Title = v3.createElement(v2.Dialog.Title, {
                text = ""
            }), 
            Content = v3.createElement(v2.View, {
                tag = "auto-xy col gap-xxlarge align-x-center"
            }, {
                MusicPlayer = v3.createElement(l_AudioPlayer_0, {
                    audio = v13, 
                    LayoutOrder = v12()
                }), 
                MusicPlayerActions = v3.createElement(l_AudioPlayerActions_0, {
                    audio = v13, 
                    onLike = v11.onLike, 
                    onUnlike = v11.onUnlike, 
                    onReport = v11.onReport, 
                    LayoutOrder = v12()
                })
            })
        });
    end;
end);