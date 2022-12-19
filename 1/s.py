from pathlib import Path
import json
import re

DICTT = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz',
}

def phone_number_to_regex(s: str) -> re.Pattern:
    """
    >>> phone_number_to_regex('123')
    re.compile('[abc][def]$')
    """
    # Why 10? I kept incrementing it until I got just one result. 🤷
    return re.compile("".join([
        f"[{DICTT[c]}]"
        for c in s[-10:]
        if c in DICTT
    ]) + "$")

if __name__ == "__main__":
    customers = [json.loads(l) for l in open(Path(__file__).parent.parent / 'data/noahs-customers.jsonl')]
    print([c['phone'] for c in customers if phone_number_to_regex(c['phone']).search(c['name'].split(' ')[-1])])

