local l_Parent_0 = script:FindFirstAncestor("PaymentsProtocol").Parent;
return require(l_Parent_0.enumerate)(script.Name, {
    BrowseProductStart = "BrowseProductStart", 
    BrowseProductEnd = "BrowseProductEnd", 
    ProductNotAvailable = "ProductNotAvailable"
});