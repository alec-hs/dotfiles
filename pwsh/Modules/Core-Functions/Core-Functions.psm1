Function Remove-ItemSafely {
  param([Parameter(Mandatory = $true)][string]$path)

  if (Test-Path $path) {
      Remove-Item $path -Force -Recurse -ErrorAction SilentlyContinue
  }
}

Function grep($regex, $dir) {
  if ( $dir ) {
    Get-ChildItem $dir | select-string $regex
    return
  }
  $input | select-string $regex
}

Function touch($file) {
  "" | Out-File $file -Encoding ASCII
}

Function wgs([string]$searchTerm) {
  winget search $searchTerm
}

Export-ModuleMember -Function Remove-ItemSafely
Export-ModuleMember -Function grep
Export-ModuleMember -Function touch
Export-ModuleMember -Function wgs