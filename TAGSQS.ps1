###powershell script to tag all the SQSQ queue
param (
    [parameter(Mandatory=$true)][string]$AwsCredentialProfile,
    [parameter(Mandatory=$true)][string]$AwsRegion,
	[parameter(Mandatory=$true)][string]$CostLevel,
	[parameter(Mandatory=$true)][string]$CostCenter
		
)
$SQSlist = Get-SQSQueue -Region $AwsRegion -ProfileName $AwsCredentialProfile 

foreach ($sqs in $SQSlist){

Add-SQSResourceTag -QueueUrl $sqs -Region $AwsRegion -ProfileName $AwsCredentialProfile -Tag @{"CostLevel"="$CostLevel" ; "CostCenter"="$CostCenter"}

write-Host $sqs

Get-SQSResourceTag -QueueUrl $sqs -Region $AwsRegion -ProfileName $AwsCredentialProfile

}

Write-Host ***