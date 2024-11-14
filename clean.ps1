# 현재 경로에서 시작
$startPath = Get-Location

# 'build' 폴더를 재귀적으로 검색하고 삭제
Get-ChildItem -Path $startPath -Directory -Recurse -Force | Where-Object { $_.Name -eq "build" } | ForEach-Object {
    Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Deleted folder:" $_.FullName -ForegroundColor Green
}

Write-Host "Deletion process completed." -ForegroundColor Yellow
