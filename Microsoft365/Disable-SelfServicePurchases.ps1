<#
	.DESCRIPTION
	This script disables all user self-service purchases in M365
#>

#Requires -Modules MSCommerce

Import-Module -Name MSCommerce

Connect-MSCommerce

$products = Get-MSCommerceProductPolicies -PolicyId AllowSelfServicePurchase

foreach ($product in $products) {
    Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId $product.ProductId -Enabled $false
}

