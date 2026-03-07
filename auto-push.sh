#!/bin/bash
# 自动推送脚本
# 用法：./auto-push.sh [提交信息]

cd "/Users/geth/Documents/我的双肩包/G/new_sijunsi_web"

# 检查是否有更改
if [ -z "$(git status --porcelain)" ]; then
    echo "没有需要提交的更改"
    exit 0
fi

# 显示更改
echo "=== 即将提交的更改 ==="
git status

# 添加所有文件
echo ""
echo "=== 添加文件 ==="
git add .

# 提交
COMMIT_MSG="${1:-Auto commit: $(date '+%Y-%m-%d %H:%M:%S')}"
echo "=== 提交：$COMMIT_MSG ==="
git commit -m "$COMMIT_MSG"

# 推送
echo ""
echo "=== 推送到 GitHub ==="
git push -u origin main

echo ""
echo "✅ 推送完成！"
