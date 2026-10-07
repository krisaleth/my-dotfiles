Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Import-Module Terminal-Icons

oh-my-posh init pwsh --config "$HOME\dotfiles\oh-my-posh\theme.omp.json" | Invoke-Expression