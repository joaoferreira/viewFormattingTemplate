#Variables

$siteURL = "https://contoso.sharepoint.com/sites/ViewTemplates"
$user = "user@contoso.onmicrosoft.com"

Connect-PnPOnline -Url $siteURL 

#Apply template without content

Apply-PnPProvisioningTemplate -path litsFormating.xml 


#Add user fields to the lists

Add-PnPListItem -List "Current User's Rows" -Values @{"Title"="Lazers"; "AssignedTo"=$user}
Add-PnPListItem -List "Current User's Rows" -Values @{"Title"="Horse Bycicles"}

Add-PnPListItem -List "Planner Inspired Task Cards" -Values @{"Title"="Build a template with all list formatting"; "AssignedTo"=$user; "Status"="In Progress"; "DueDate"="9/6/2019"}

Add-PnPListItem -List "Resource Catalog Sample" -Values @{"Title"="Modern SharePoint Lists are here"; "ResourcePillar"="Bussiness Apps"; "ResourceTechnology"="Lists"; "ResourceStatus"="Final"; "ResourcePublic"="True"; "ResourceOwner"=$user}
Add-PnPListItem -List "Resource Catalog Sample" -Values @{"Title"="SharePoint Forms FAQ"; "ResourcePillar"="Bussiness Apps"; "ResourceTechnology"="PowerApps, Flow, InfoPath, SharePoint Designer"; "ResourceStatus"="Draft"; "ResourcePublic"="True"; "ResourceOwner"=""}

Add-PnPListItem -List "Retail Account Sample" -Values @{"Title"="Northwind Capitol Hill"; "AccountManager"=$user; "SalesTarget"="1000"; "HolidayDisplayRead"="True"; "Location"="{'EntityType':'LocalBusiness','LocationSource':'Bing','LocationUri':'https://www.bingapis.com/api/v6/localbusinesses/YN873x784109806045158534?setLang=en','UniqueId':'https://www.bingapis.com/api/v6/localbusinesses/YN873x784109806045158534?setLang=en','DisplayName':'Seattle Art Museum','Address':{'Street':'1300 1st Ave','City':'Seattle','State':'WA','CountryOrRegion':'US','PostalCode':'98101'},'Coordinates':{'Latitude':47.60729217529297,'Longitude':-122.33785247802734}}"}
Add-PnPListItem -List "Retail Account Sample" -Values @{"Title"="Northwind downtown"; "AccountManager"=$user; "SalesTarget"="12000"; "HolidayDisplayRead"="False"; "Location"="{'LocationSource':'Bing','LocationUri':'https://www.bingapis.com/api/v6/addresses/QWRkcmVzcy8tMjk5OTM2MDA4MCU3YzQwMD9hbHRRdWVyeT1hbCU1ZTQwMCsxOXRoK0F2ZStFJTdjbGMlNWVTZWF0dGxlJTdjYTIlNWVLaW5nK0NvdW50eSU3Y2ExJTVlV2FzaGluZ3RvbiU3Y2NyJTVlVW5pdGVkK1N0YXRlcyU3Y2lzbyU1ZVVT?setLang=en','UniqueId':'https://www.bingapis.com/api/v6/addresses/QWRkcmVzcy8tMjk5OTM2MDA4MCU3YzQwMD9hbHRRdWVyeT1hbCU1ZTQwMCsxOXRoK0F2ZStFJTdjbGMlNWVTZWF0dGxlJTdjYTIlNWVLaW5nK0NvdW50eSU3Y2ExJTVlV2FzaGluZ3RvbiU3Y2NyJTVlVW5pdGVkK1N0YXRlcyU3Y2lzbyU1ZVVT?setLang=en','DisplayName':'400 19th Ave E, Seattle, WA 98112, Estados Unidos','Address':{'Street':'400 19th Ave E','City':'Seattle','State':'WA','CountryOrRegion':'Estados Unidos','PostalCode':'98112'},'Coordinates':{'Latitude':47.622100830078125,'Longitude':-122.30712127685547}}"}

Add-PnPListItem -List "Small Card" -Values @{"Title"="João Ferreira"; "Linkedin"="https://www.linkedin.com/in/joao12ferreira/"; "JobTitle"="Technical Lead"; "PhoneNumber"="+1 995-4738-343"; "Person"=$user}

Add-PnPListItem -List "User Profile Card" -Values @{"Title"="João Ferreira"; "User"=$user; "Picture"="https://pbs.twimg.com/profile_images/1117701442167554048/btg98Wqo_400x400.jpg"; "LinkedIn"="https://www.linkedin.com/in/joao12ferreira/"; "Twitter"="https://www.twitter.com//joao12ferreira/";}


function applyListFormating($listName, $viewName){
  
    # Update File Reference to the JSON file you would like to deploy
    $jsonDefinitionFile = '.\JSON Definitions\{0}.json' -f $listName    
    
	# Get the raw content for the JSON Definition
	$listViewFormattingJSON = Get-Content -Raw -Path $jsonDefinitionFile;

	# Update the List View Formatting Definition
	Set-PnPView	-List $listName -Identity $viewName -Values @{CustomFormatter = $listViewFormattingJSON.ToString()}

	Write-Host ('{0} - List View Formatting Definition has been updated' -f $listName) -ForegroundColor Green

}

#Apply view formating from JSON file

applyListFormating 'Alternating Rows' 'All Items'
#applyListFormating 'Birthday Row Format' 'All Items'
applyListFormating 'Bulletin Board' 'All Items'
applyListFormating 'Choice Conditional Formatting' 'All Items'
applyListFormating 'Column Graph format' 'All Items'
#applyListFormating 'Conditional formatting based on date' 'All Items'
#applyListFormating 'Contact Card Row Format' 'All Items'
#applyListFormating "Current User's Rows", 'All Items'
applyListFormating 'Document Library Items in Tiles Format' 'All Documents'
applyListFormating 'Fruit' 'All Items'
applyListFormating 'Generic Tile Format' 'All Items'
applyListFormating 'Multi-line view' 'All Items'
applyListFormating 'Numeric Average Comparison' 'All Items'
#applyListFormating 'Planner Inspired Task Cards' 'All Items'
applyListFormating 'Project Indicator - Risk Score Indicator' 'All Items'
#applyListFormating 'Resource Catalog Sample' 'All Items'
#applyListFormating 'Retail Account Sample' 'All Items'
#applyListFormating 'Small Card' 'All Items'
applyListFormating 'Staff Rota Shifts View Format' 'All Items'
applyListFormating 'Text Conditional Format' 'All Items'
applyListFormating 'Twitter Format' 'All Items'
#applyListFormating 'User Profile Card' 'All Items'