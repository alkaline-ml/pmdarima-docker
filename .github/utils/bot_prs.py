"""
Simple script that checks ALL bot PRs in this repo (open and closed) to
see if we have already opened one with the target version
"""
import json
import sys

import requests

if len(sys.argv) != 2:
    raise RuntimeError("Must pass exactly one target PR title")

target_title = sys.argv[1]

prs = json.loads(requests.get('https://api.github.com/repos/alkaline-ml/pmdarima-docker/pulls?state=all').text)

bot_prs = [pr['title'] for pr in prs if pr['user']['login'] == 'github-actions[bot]']

print(any(title == target_title for title in bot_prs))
