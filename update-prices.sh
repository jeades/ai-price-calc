#!/bin/bash
# update-prices.sh — Scrape official pricing pages and flag changes
# Run via cron weekly. Outputs diff if prices changed.
set -euo pipefail

cd "$(dirname "$0")"
MODELS_FILE="models.json"
BACKUP="models.json.bak"

cp "$MODELS_FILE" "$BACKUP"

echo "🔍 Checking official pricing pages..."
echo ""
echo "Sources to verify:"
echo "  1. https://openai.com/api/pricing/"
echo "  2. https://platform.claude.com/docs/en/about-claude/pricing"
echo "  3. https://ai.google.dev/gemini-api/docs/pricing"
echo ""
echo "This script is meant to be run by the Jeeves agent, which will:"
echo "  1. Fetch each pricing page via web_fetch"
echo "  2. Parse current prices"
echo "  3. Compare against models.json"
echo "  4. Update models.json if changes found"
echo "  5. Commit and push to GitHub"
echo ""
echo "To run manually: have Jeeves execute the 'Price Check' cron job"
