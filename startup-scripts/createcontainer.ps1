$url = Get-BCArtifactUrl -Select Latest -Type OnPrem -Country de
$cred = Get-Credential
New-BcContainer -accept_eula -artifactUrl $url -Credential $cred -auth UserPassword -PublishPorts @(443,8080,80,7048,7047,7049)
