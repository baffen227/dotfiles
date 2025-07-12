# Dotfiles 改進建議

## 目前分析結果

### 結構優點
- 使用 GNU Stow 管理 dotfiles
- 針對不同主機有獨立配置（crazy-diamond、echoes）
- 有全域共用配置（global）

## 改進建議

### 1. Git 配置改進 (`global/home/bagfen/dot-gitconfig`)
- [x] 新增實用的 Git 別名 (st, co, br, lg 等)
- [x] 新增 `[core]` 配置區塊 (editor, autocrlf, quotepath)
- [x] 新增 `[push]` 和 `[pull]` 安全預設值
- [x] 新增 `[diff]` 和 `[merge]` 工具配置 (vimdiff)
- [x] 新增顏色配置改善可讀性
- [x] 設定 `defaultBranch = main`
- [x] 配置已測試並驗證功能正常

### 2. NixOS 配置清理 (`crazy-diamond/etc/nixos/configuration.nix`)
- [ ] 清理註釋掉的服務配置
- [ ] 將大型配置區塊組織到獨立文件
- [ ] 新增更詳細的註釋說明

### 3. 版本控制改進
- [ ] 新增 `.gitignore` 文件
- [ ] 忽略敏感資訊和暫存檔案
- [ ] 新增 pre-commit hooks

### 4. 自動化改進
- [ ] 新增 `install.sh` 腳本自動化安裝
- [ ] 考慮新增 `Makefile` 簡化操作
- [ ] 新增系統依賴檢查腳本

### 5. 安全性改進
- [ ] 檢查並移除敏感資訊
- [ ] 新增敏感文件的範本版本
- [ ] 考慮使用環境變數管理敏感配置

## 優先級

### 高優先級
1. 新增 `.gitignore` 文件
2. ~~改進 Git 配置的隱私設定~~ ✅ 已完成
3. 新增自動化安裝腳本

### 中優先級
1. 清理 NixOS 配置
2. 新增更多自動化工具

### 低優先級
1. 新增 pre-commit hooks
2. 新增系統依賴檢查
3. 文件重新組織

## 完成記錄
- [ ] 所有改進建議已完成
- [ ] 文件已測試並驗證
- [ ] 文件已更新到最新版本
