# TAG ALL THE SQSs 
This project will help you to tag all the sqs with costCenter/costlevel tags or that instance any tag. 


###scritp starts from below 
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
###scritp ENDs here
