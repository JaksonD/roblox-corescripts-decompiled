local l_Parent_0 = script:FindFirstAncestor("Groups").Parent;
return require(l_Parent_0.React).createContext({
    navigateTo = {
        webView = function() --[[ Line: 23 ]] --[[ Name: webView ]]

        end, 
        groupDetails = function() --[[ Line: 24 ]] --[[ Name: groupDetails ]]

        end, 
        seeAllGroups = function() --[[ Line: 25 ]] --[[ Name: seeAllGroups ]]

        end, 
        createGroup = function() --[[ Line: 26 ]] --[[ Name: createGroup ]]

        end
    }, 
    userId = ""
});