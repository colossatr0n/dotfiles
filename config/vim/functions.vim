" Not picked up by vscodevimrc since I haven't imported this file
command -range PyToJson <line1>,<line2> !python -c "import sys; import json; import ast; d = ast.literal_eval(sys.stdin.read().strip()); print(json.dumps(d))"
command -range JsonToPy <line1>,<line2> !python -c "import sys; import json; print(json.loads(sys.stdin.read().strip()))"
